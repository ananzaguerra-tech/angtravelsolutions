$ErrorActionPreference = 'Stop'

Write-Host 'ANG Gordon publish runner — internal content only'
Write-Host 'Home/front page is explicitly excluded.'

function Invoke-WpInContainer {
  param([string[]]$Args)
  $containers = docker ps --format '{{.Names}}' 2>$null
  if (-not $containers) { return $false }
  foreach ($c in $containers) {
    try {
      $probe = docker exec $c sh -lc 'command -v wp >/dev/null 2>&1 && echo WP_OK' 2>$null
      if ($probe -match 'WP_OK') {
        & docker exec $c wp @Args --allow-root
        return $true
      }
    } catch {}
  }
  return $false
}

function Invoke-WpLocal {
  param([string[]]$Args)
  $wp = Get-Command wp -ErrorAction SilentlyContinue
  if ($wp) {
    & wp @Args
    return $true
  }
  return $false
}

$frontId = $null
try {
  $frontIdText = $null
  if (Invoke-WpLocal @('option','get','page_on_front','--quiet')) {
    $frontIdText = (& wp option get page_on_front --quiet 2>$null)
  }
  if (-not $frontIdText) {
    $containers = docker ps --format '{{.Names}}' 2>$null
    foreach ($c in $containers) {
      try {
        $candidate = docker exec $c wp option get page_on_front --allow-root --quiet 2>$null
        if ($candidate) { $frontIdText = $candidate; break }
      } catch {}
    }
  }
  if ($frontIdText) { $frontId = [int]($frontIdText | Select-Object -First 1) }
} catch {}

if (-not $frontId) { throw 'Could not determine WordPress front-page ID. Aborting to protect Home.' }
Write-Host "Front page protected: post ID $frontId"

$script = @"
set -e
FRONT_ID=$frontId
wp post list --post_type=page --post_status=draft,pending,private --format=ids --allow-root | tr ' ' '\n' | while read ID; do
  [ -z \"$ID\" ] && continue
  [ \"$ID\" = \"$FRONT_ID\" ] && continue
  wp post update \"$ID\" --post_status=publish --allow-root >/dev/null
  echo \"PUBLISHED_PAGE:$ID\"
done
wp post list --post_type=post --post_status=draft,pending,private --format=ids --allow-root | tr ' ' '\n' | while read ID; do
  [ -z \"$ID\" ] && continue
  wp post update \"$ID\" --post_status=publish --allow-root >/dev/null
  echo \"PUBLISHED_POST:$ID\"
done
"@

$containers = docker ps --format '{{.Names}}' 2>$null
$done = $false
if ($containers) {
  foreach ($c in $containers) {
    try {
      $probe = docker exec $c sh -lc 'command -v wp >/dev/null 2>&1 && echo WP_OK' 2>$null
      if ($probe -match 'WP_OK') {
        docker exec $c sh -lc $script
        $done = $true
        break
      }
    } catch {}
  }
}

if (-not $done) {
  $wp = Get-Command wp -ErrorAction SilentlyContinue
  if ($wp) {
    $pages = wp post list --post_type=page --post_status=draft,pending,private --fields=ID,post_title,post_status --format=json | ConvertFrom-Json
    foreach ($p in $pages) {
      if ([int]$p.ID -eq $frontId) { continue }
      wp post update $p.ID --post_status=publish | Out-Null
      Write-Host "PUBLISHED_PAGE:$($p.ID) $($p.post_title)"
    }
    $posts = wp post list --post_type=post --post_status=draft,pending,private --fields=ID,post_title,post_status --format=json | ConvertFrom-Json
    foreach ($p in $posts) {
      wp post update $p.ID --post_status=publish | Out-Null
      Write-Host "PUBLISHED_POST:$($p.ID) $($p.post_title)"
    }
    $done = $true
  }
}

if (-not $done) { throw 'No usable wp-cli context found locally or in running containers.' }

Write-Host 'DONE: Internal pages/posts published; Home preserved.'
