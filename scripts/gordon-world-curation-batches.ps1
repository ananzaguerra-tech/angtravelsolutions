param(
  [int]$BatchSize = 25,
  [string]$Backbone = '.\docs\control\CURADORIA_WORLD_BACKBONE_ISO249_2026-08-17.json',
  [string]$OutDir = '.\build\world-curation'
)

$ErrorActionPreference='Stop'
if ($BatchSize -lt 5 -or $BatchSize -gt 50) { throw 'BatchSize must be between 5 and 50.' }
if (-not (Test-Path $Backbone)) { throw "Backbone not found: $Backbone" }
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$data = Get-Content -Raw -Encoding UTF8 $Backbone | ConvertFrom-Json
$records = @($data.records)
if ($records.Count -ne 249) { throw "Expected 249 ISO records, found $($records.Count)." }

$queue = @()
for ($i=0; $i -lt $records.Count; $i++) {
  $r = $records[$i]
  $batch = [math]::Floor($i / $BatchSize) + 1
  $queue += [pscustomobject]@{
    queue_index = $i + 1
    mega_batch = $batch
    iso2 = $r.a2
    iso3 = $r.a3
    country_territory = $r.name
    existing_seed_check = 'PENDING'
    official_tourism_source = ''
    government_entry_source = ''
    destination_discovery = 'PENDING_OFFICIAL_SOURCE'
    discovered_destination_count = 0
    destination_manifest = ''
    content_gate = 'PENDING'
    source_gate = 'PENDING'
    media_gate = 'PENDING'
    seo_schema_gate = 'PENDING'
    staging_gate = 'NOT_TESTED'
    publication_gate = 'BLOCK'
    notes = 'Do not invent cities/attractions. Discover destinations from official/primary sources before creating 23-module records.'
  }
}

$queue | Export-Csv -NoTypeInformation -Encoding UTF8 (Join-Path $OutDir 'world-country-discovery-queue.csv')

$batchCount = [math]::Ceiling($records.Count / $BatchSize)
$manifest = @()
for ($b=1; $b -le $batchCount; $b++) {
  $rows = @($queue | Where-Object mega_batch -eq $b)
  $manifest += [pscustomobject]@{
    mega_batch = $b
    countries_territories = $rows.Count
    first = $rows[0].country_territory
    last = $rows[-1].country_territory
    status = 'READY_FOR_OFFICIAL_SOURCE_DISCOVERY'
    output_expected = "batch-{0:D2}-destinations.csv" -f $b
  }
}
$manifest | Export-Csv -NoTypeInformation -Encoding UTF8 (Join-Path $OutDir 'mega-batch-manifest.csv')

$meta = [pscustomobject]@{
  generated_at = (Get-Date).ToString('o')
  iso_records = $records.Count
  batch_size = $BatchSize
  mega_batches = $batchCount
  existing_881 = 'LOCKED_SEED_DO_NOT_OVERWRITE'
  destination_modules = 23
  discovery_rule = 'Official/primary tourism and government sources required before destination creation.'
  publication_rule = 'BLOCK until content/source/media/SEO-schema/staging QA pass.'
}
$meta | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $OutDir 'manifest.json')

Write-Host "WORLD_ISO_RECORDS:$($records.Count)"
Write-Host "MEGA_BATCHES:$batchCount"
Write-Host "BATCH_SIZE:$BatchSize"
Write-Host "QUEUE:$(Join-Path $OutDir 'world-country-discovery-queue.csv')"
Write-Host "MANIFEST:$(Join-Path $OutDir 'mega-batch-manifest.csv')"
