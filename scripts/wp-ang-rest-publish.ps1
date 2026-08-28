param(
  [Parameter(Mandatory=$true)][string]$BaseUrl,
  [Parameter(Mandatory=$true)][string]$Username,
  [Parameter(Mandatory=$true)][string]$ApplicationPassword,
  [ValidateSet('audit','page108-cleanup','publish-blog')][string]$Mode='audit'
)

$ErrorActionPreference='Stop'
$BaseUrl=$BaseUrl.TrimEnd('/')
$pair = "$Username`:$ApplicationPassword"
$bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
$auth = [Convert]::ToBase64String($bytes)
$headers = @{ Authorization = "Basic $auth"; 'Content-Type'='application/json' }

function Get-Wp([string]$path){ Invoke-RestMethod -Uri "$BaseUrl$path" -Headers $headers -Method Get }
function Post-Wp([string]$path,[object]$body){ Invoke-RestMethod -Uri "$BaseUrl$path" -Headers $headers -Method Post -Body ($body | ConvertTo-Json -Depth 20) }

if($Mode -eq 'audit'){
  $me = Get-Wp '/wp-json/wp/v2/users/me?context=edit'
  $page = Get-Wp '/wp-json/wp/v2/pages/108?context=edit'
  [pscustomobject]@{ user=$me.name; page_id=$page.id; slug=$page.slug; status=$page.status; link=$page.link }
  exit
}

if($Mode -eq 'page108-cleanup'){
  $page = Get-Wp '/wp-json/wp/v2/pages/108?context=edit'
  $backup = Join-Path $env:USERPROFILE ("Desktop\wp-page108-backup-" + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.html')
  $page.content.raw | Set-Content $backup -Encoding UTF8

  $html = [string]$page.content.raw
  $patterns = @(
    'Local de referência',
    'Endereço institucional',
    'Cidade de atendimento Business &amp; MICE',
    'Cidade de atendimento Business & MICE',
    'Cidade de atendimento'
  )
  foreach($p in $patterns){ $html = $html.Replace($p,'') }

  $html = [regex]::Replace($html,'Campinas é o endereço institucional publicado\.[^<]*','')
  $html = [regex]::Replace($html,'\s+·\s+·',' · ')
  $html = [regex]::Replace($html,'>\s*·\s*<','><')

  $result = Post-Wp '/wp-json/wp/v2/pages/108' @{ content=$html }
  Write-Host "UPDATED page 108: $($result.link)"
  Write-Host "Backup: $backup"
  exit
}

if($Mode -eq 'publish-blog'){
  $manifestPath = Join-Path $PSScriptRoot '..\content\blog\ANG_BLOG_READY_2026-08-28.md'
  if(!(Test-Path $manifestPath)){ throw "Manifest not found: $manifestPath" }
  Write-Host 'Blog manifest present. Publication must be executed by Work or a parser that maps each article to title/content/category. No automatic blind parsing is performed by this helper.'
  exit
}
