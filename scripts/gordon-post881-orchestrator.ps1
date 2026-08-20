param(
  [Parameter(Mandatory=$true)][string]$ApprovedTextFile,
  [Parameter(Mandatory=$true)][string]$HotelCsv,
  [Parameter(Mandatory=$true)][string]$AirlineCsv,
  [switch]$ApplyApprovedText,
  [switch]$PrepareSuppliers,
  [switch]$PublishInternal,
  [string]$EvidenceDir = '.\build\post881'
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path $EvidenceDir | Out-Null
$started = Get-Date
$steps = New-Object System.Collections.Generic.List[object]

function Add-Step([string]$name,[string]$status,[string]$detail) {
  $steps.Add([pscustomobject]@{
    step = $name
    status = $status
    detail = $detail
    at = (Get-Date).ToString('o')
  })
}

function Run-Step([string]$name,[scriptblock]$block) {
  try {
    & $block
    Add-Step $name 'SUCCESS' 'completed'
  } catch {
    Add-Step $name 'FAILED' $_.Exception.Message
    throw
  }
}

# Invariant: identity reconciliation is complete and MUST NOT be rewritten here.
Add-Step 'identity-register' 'SKIPPED_LOCKED' '881/881 complete; do not rewrite Item Register D:G/P.'

# Keep public Home protected. Publication runner independently resolves page_on_front and aborts if it cannot protect it.
if ($PrepareSuppliers) {
  Run-Step 'suppliers-staging' {
    & "$PSScriptRoot\gordon-prepare-suppliers.ps1" -HotelCsv $HotelCsv -AirlineCsv $AirlineCsv -OutDir (Join-Path $EvidenceDir 'suppliers')
  }
} else {
  Add-Step 'suppliers-staging' 'SKIPPED' 'flag -PrepareSuppliers not supplied'
}

if ($ApplyApprovedText) {
  Run-Step 'approved-site-text' {
    & "$PSScriptRoot\gordon-apply-approved-site-text.ps1" -ApprovedTextFile $ApprovedTextFile -Apply
  }
} else {
  Run-Step 'approved-site-text-dry-run' {
    & "$PSScriptRoot\gordon-apply-approved-site-text.ps1" -ApprovedTextFile $ApprovedTextFile
  }
}

if ($PublishInternal) {
  Run-Step 'publish-internal-excluding-home' {
    & "$PSScriptRoot\gordon-publish-internal-content.ps1"
  }
} else {
  Add-Step 'publish-internal-excluding-home' 'SKIPPED' 'flag -PublishInternal not supplied'
}

$evidence = [pscustomobject]@{
  started_at = $started.ToString('o')
  finished_at = (Get-Date).ToString('o')
  branch = 'recovery/v13-staging-2026-08-17'
  identity_register = '881/881 LOCKED'
  home_policy = 'EXCLUDED_FROM_AUTOMATED_PUBLICATION'
  destructive_actions = $false
  steps = $steps
  next_external_tracks = @(
    'META: use authenticated desktop session; record asset IDs and publication URLs only after real publish.',
    'GOOGLE BUSINESS: complete exact contracted addresses and publish/verify only through authenticated account; never invent address.',
    'N8N/CONCIERGE/ZEUS: use existing instance and credential vault; do not print secrets; verify webhooks and error workflow in staging.',
    'CURADORIA: enrich content/source/media/SEO/schema in large geographic batches; identity layer remains locked.'
  )
}
$evidence | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 (Join-Path $EvidenceDir 'execution-evidence.json')
Write-Host "POST881_EVIDENCE:$(Join-Path $EvidenceDir 'execution-evidence.json')"
Write-Host 'IDENTITY_REGISTER:881/881_LOCKED'
Write-Host 'HOME:EXCLUDED'
