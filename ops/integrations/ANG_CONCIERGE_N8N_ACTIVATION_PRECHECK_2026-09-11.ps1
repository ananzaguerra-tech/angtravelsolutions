param(
  [string]$N8nBaseUrl = "https://ananza.app.n8n.cloud",
  [string]$WorkflowId = "FzQQYBrgzo2wU8bm"
)

$ErrorActionPreference = 'Stop'

if (-not $env:N8N_API_KEY) {
  Write-Output 'PRECHECK=BLOCKED_N8N_API_KEY_MISSING'
  exit 2
}

$headers = @{ 'X-N8N-API-KEY' = $env:N8N_API_KEY }
$wfUrl = "$N8nBaseUrl/api/v1/workflows/$WorkflowId"

try {
  $wf = Invoke-RestMethod -Method Get -Uri $wfUrl -Headers $headers -TimeoutSec 30
} catch {
  Write-Output 'PRECHECK=BLOCKED_N8N_API_UNREACHABLE_OR_UNAUTHORIZED'
  exit 3
}

if (-not $wf.id -or $wf.id -ne $WorkflowId) {
  Write-Output 'PRECHECK=BLOCKED_WORKFLOW_ID_MISMATCH'
  exit 4
}

$json = $wf | ConvertTo-Json -Depth 100
$checks = [ordered]@{
  workflow_id_ok = ($wf.id -eq $WorkflowId)
  forbidden_workflow_absent = ($json -notmatch 'n5MIoBQbV5DpWp7H')
  phone_number_id_present = ($json -match '2449778815107389')
  expected_e164_present = ($json -match '551940404293')
  meta_credential_alias_present = ($json -match 'meta_whatsapp_auth')
  verify_token_reference_present = ($json -match 'META_VERIFY_TOKEN')
  outbound_node_present = ($json -match 'Send WhatsApp Reply')
  inbound_node_present = ($json -match 'Meta WhatsApp Inbound POST')
}

$failed = @($checks.GetEnumerator() | Where-Object { -not $_.Value })
foreach ($c in $checks.GetEnumerator()) {
  Write-Output ("CHECK_{0}={1}" -f $c.Key.ToUpper(), $c.Value)
}

Write-Output ("WORKFLOW_ACTIVE={0}" -f $wf.active)

if ($failed.Count -gt 0) {
  Write-Output 'PRECHECK=FAIL_CLOSED'
  exit 5
}

Write-Output 'PRECHECK=PASS_READY_FOR_MANUAL_ACTIVATION_AND_REAL_MESSAGE_TEST'
Write-Output 'NEXT=Activate only after confirming credential/variables in n8n UI; then send one real WhatsApp message and require inbound execution plus outbound wamid.'
