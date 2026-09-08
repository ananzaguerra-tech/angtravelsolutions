param(
  [Parameter(Mandatory=$true)][string]$HotelCsv,
  [Parameter(Mandatory=$true)][string]$AirlineCsv,
  [string]$OutDir = '.\build\suppliers'
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function Slug([string]$value) {
  $s = $value.ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD)
  $sb = New-Object Text.StringBuilder
  foreach ($c in $s.ToCharArray()) {
    $cat = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($c)
    if ($cat -ne [Globalization.UnicodeCategory]::NonSpacingMark) { [void]$sb.Append($c) }
  }
  (($sb.ToString() -replace '[^a-z0-9]+','-').Trim('-'))
}

$hotels = Import-Csv -Path $HotelCsv
$airlines = Import-Csv -Path $AirlineCsv

$hotelOut = foreach ($r in $hotels) {
  $name = $r.'Propriedade'
  $country = $r.'País'
  $city = $r.'Cidade'
  if (-not $name) { continue }
  [pscustomobject]@{
    external_key = "hotel|$(Slug $country)|$(Slug $city)|$(Slug $name)"
    entity_type = 'hotel'
    name = $name
    country = $country
    city = $city
    meal_plan_source = $r.'Regime alimentar'
    amenities_source = $r.'Amenidades fonte'
    payment_terms_source = $r.'Forma pagamento fonte'
    commission_source = $r.'Comissão fonte'
    source_notes = $r.'Observações fonte'
    source_extras = $r.'Complementos fonte'
    validation_status = if ($r.'Status 2026') { $r.'Status 2026' } else { 'REVALIDATE_2026' }
    source_file = $r.'Fonte'
    publish_allowed = $false
  }
}

$airOut = foreach ($r in $airlines) {
  $name = $r.PSObject.Properties.Value | Where-Object { $_ } | Select-Object -First 1
  if (-not $name) { continue }
  [pscustomobject]@{
    external_key = "airline|$(Slug ([string]$name))"
    entity_type = 'airline_contact'
    source_row = $r
    validation_status = 'REVALIDATE_2026'
    publish_allowed = $false
  }
}

$hotelOut | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 (Join-Path $OutDir 'hotels.staging.json')
$airOut | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 (Join-Path $OutDir 'airlines.staging.json')

$manifest = [pscustomobject]@{
  generated_at = (Get-Date).ToString('o')
  mode = 'STAGING_PREP_ONLY'
  hotel_count = @($hotelOut).Count
  airline_count = @($airOut).Count
  key_strategy = 'entity_type + normalized country/city/name'
  rules = @(
    'Do not overwrite a production record without external_key match and diff review.',
    'REVALIDATE_2026 fields must not be advertised as current commercial terms.',
    'No secrets, credentials or private notes may be copied to public fields.',
    'This runner prepares neutral JSON only; it does not invent an ANG Connect storage model.'
  )
}
$manifest | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 (Join-Path $OutDir 'manifest.json')

Write-Host "PREPARED_HOTELS:$(@($hotelOut).Count)"
Write-Host "PREPARED_AIRLINE_CONTACTS:$(@($airOut).Count)"
Write-Host "OUTPUT:$OutDir"
