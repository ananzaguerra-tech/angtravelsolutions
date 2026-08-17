param(
  [Parameter(Mandatory=$true)][string]$ApprovedTextFile,
  [switch]$Apply
)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path $ApprovedTextFile)) { throw "Approved text source not found: $ApprovedTextFile" }

$source = Get-Content -Raw -Encoding UTF8 $ApprovedTextFile
if ($source.Length -lt 5000) { throw 'Approved text source is unexpectedly short. Aborting.' }

function Get-Wp([string[]]$Args) {
  $wp = Get-Command wp -ErrorAction SilentlyContinue
  if ($wp) { return (& wp @Args) }
  $containers = docker ps --format '{{.Names}}' 2>$null
  foreach ($c in $containers) {
    $probe = docker exec $c sh -lc 'command -v wp >/dev/null 2>&1 && echo WP_OK' 2>$null
    if ($probe -match 'WP_OK') { return (& docker exec $c wp @Args --allow-root) }
  }
  throw 'No wp-cli context found.'
}

$frontId = [int](Get-Wp @('option','get','page_on_front','--quiet') | Select-Object -First 1)
if (-not $frontId) { throw 'Cannot resolve page_on_front; aborting to protect Home.' }

# Canonical approved source headings. HOME is intentionally excluded from writes.
$sections = @(
  @{ Key='QUEM SOMOS'; Titles=@('Quem Somos','Quem somos') },
  @{ Key='SERVICOS'; Titles=@('Serviços','Serviços & Outsourcing','Servicos') }
)

function Slice-Section([string]$text,[string]$start,[string[]]$nextMarkers) {
  $i = $text.IndexOf($start,[StringComparison]::OrdinalIgnoreCase)
  if ($i -lt 0) { return $null }
  $end = $text.Length
  foreach ($m in $nextMarkers) {
    $j = $text.IndexOf($m,$i + $start.Length,[StringComparison]::OrdinalIgnoreCase)
    if ($j -ge 0 -and $j -lt $end) { $end = $j }
  }
  $text.Substring($i,$end-$i).Trim()
}

$allMarkers = @('HOME','QUEM SOMOS','SERVICOS','CONTATO','SUSTENTABILIDADE','BLOG','FALE CONOSCO','AREA RESTRITA','ÁREA RESTRITA')
$plan = @()
foreach ($s in $sections) {
  $next = $allMarkers | Where-Object { $_ -ne $s.Key }
  $body = Slice-Section $source $s.Key $next
  if (-not $body) { continue }

  $page = $null
  foreach ($title in $s.Titles) {
    $json = Get-Wp @('post','list','--post_type=page',"--title=$title",'--fields=ID,post_title,post_status','--format=json')
    if ($json) {
      $rows = $json | ConvertFrom-Json
      if ($rows) { $page = @($rows)[0]; break }
    }
  }
  if (-not $page) {
    $plan += [pscustomobject]@{section=$s.Key; status='PAGE_NOT_FOUND'; page_id=$null; title=$null; chars=$body.Length}
    continue
  }
  if ([int]$page.ID -eq $frontId) { throw "Resolved internal section $($s.Key) to Home/front page. Aborting." }

  $tmp = [IO.Path]::GetTempFileName()
  try {
    Set-Content -Path $tmp -Value $body -Encoding UTF8
    $plan += [pscustomobject]@{section=$s.Key; status=($(if($Apply){'APPLY'}else{'DRY_RUN'})); page_id=$page.ID; title=$page.post_title; chars=$body.Length}
    if ($Apply) {
      $escaped = $body.Replace('"','\"')
      Get-Wp @('post','update',[string]$page.ID,"--post_content=$escaped") | Out-Null
      Write-Host "UPDATED_PAGE:$($page.ID):$($page.post_title)"
    }
  } finally { Remove-Item $tmp -Force -ErrorAction SilentlyContinue }
}

$plan | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 '.\build\approved-site-text-plan.json'
Write-Host "HOME_PROTECTED:$frontId"
Write-Host "MODE:$(if($Apply){'APPLY'}else{'DRY_RUN'})"
Write-Host 'PLAN:build/approved-site-text-plan.json'
Write-Host 'NOTE: Approved editorial is preserved verbatim by section; dynamic facts must be revalidated separately before public claims are relied upon.'
