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

function Index-Any([string]$text,[string[]]$markers,[int]$startAt=0) {
  $best = -1
  foreach ($m in $markers) {
    $i = $text.IndexOf($m,$startAt,[StringComparison]::OrdinalIgnoreCase)
    if ($i -ge 0 -and ($best -lt 0 -or $i -lt $best)) { $best = $i }
  }
  return $best
}

function Slice-Any([string]$text,[string[]]$starts,[string[]]$ends) {
  $i = Index-Any $text $starts 0
  if ($i -lt 0) { return $null }
  $j = if ($ends.Count) { Index-Any $text $ends ($i + 1) } else { -1 }
  if ($j -lt 0) { $j = $text.Length }
  return $text.Substring($i,$j-$i).Trim()
}

function Find-Page([string[]]$titles,[int]$frontId) {
  foreach ($title in $titles) {
    $json = Get-Wp @('post','list','--post_type=page',"--title=$title",'--fields=ID,post_title,post_status','--format=json')
    if (-not $json) { continue }
    $rows = $json | ConvertFrom-Json
    if (-not $rows) { continue }
    foreach ($page in @($rows)) {
      if ([int]$page.ID -eq $frontId) { continue }
      return $page
    }
  }
  return $null
}

$frontId = [int](Get-Wp @('option','get','page_on_front','--quiet') | Select-Object -First 1)
if (-not $frontId) { throw 'Cannot resolve page_on_front; aborting to protect Home.' }

# HOME is deliberately excluded. These mappings follow the real headings/tabs in the approved source.
$sections = @(
  @{ key='QUEM_SOMOS'; starts=@('2. Página: Quem Somos','2. Quem Somos'); ends=@('serviço 1','servico 1','🌴 Viagens de Lazer'); titles=@('Quem Somos','Quem somos') },
  @{ key='LAZER_CELEBRATIONS'; starts=@('serviço 1','servico 1','🌴 Viagens de Lazer'); ends=@('serviço 2','servico 2','👑 ANG Prime'); titles=@('Serviços & Outsourcing','Serviços','Viagens de Lazer') },
  @{ key='LUXURY_PRIVATE'; starts=@('serviço 2','servico 2','👑 ANG Prime'); ends=@('serviço 3','servico 3','💼 Corporativo'); titles=@('Luxury Brazil','Private Collections','Luxury','ANG Prime') },
  @{ key='BUSINESS_TRAVEL'; starts=@('serviço 3','servico 3','💼 Corporativo'); ends=@('serviço 4','servico 4','🎉 Eventos & Incentivo'); titles=@('Business Travel','ANG Business Travel','Corporativo','Soluções para Viagens Corporativas') },
  @{ key='MICE'; starts=@('serviço 4','servico 4','🎉 Eventos & Incentivo'); ends=@('🌱 4. SUSTENTABILIDADE','4. Sustentabilidade'); titles=@('MICE','MICE & Celebrations Outsourcing','Eventos & Incentivo','Eventos') },
  @{ key='SUSTENTABILIDADE'; starts=@('🌱 4. SUSTENTABILIDADE','4. Sustentabilidade'); ends=@('💸 5. OFERTAS E PROMOÇÕES','5. Ofertas e Promoções'); titles=@('Sustentabilidade') },
  @{ key='OFERTAS'; starts=@('💸 5. OFERTAS E PROMOÇÕES','5. Ofertas e Promoções'); ends=@('✈️ 6. ARTIGOS E DICAS','6. Artigos e Dicas'); titles=@('Ofertas e Promoções','Promoções','Ofertas') },
  @{ key='BLOG'; starts=@('✈️ 6. ARTIGOS E DICAS','6. Artigos e Dicas'); ends=@('📞 Suporte & Contato ANG Travel','7. Atendimento'); titles=@('Blog & Tendências','Blog','Conteúdo Global') },
  @{ key='ATENDIMENTO_CONTATO'; starts=@('📞 Suporte & Contato ANG Travel','7. Atendimento'); ends=@(); titles=@('Fale Conosco','Contato','Atendimento') }
)

$plan = @()
New-Item -ItemType Directory -Force -Path '.\build' | Out-Null
foreach ($s in $sections) {
  $body = Slice-Any $source $s.starts $s.ends
  if (-not $body -or $body.Length -lt 40) {
    $plan += [pscustomobject]@{section=$s.key; status='SOURCE_SECTION_NOT_FOUND'; page_id=$null; title=$null; chars=0}
    continue
  }

  $page = Find-Page $s.titles $frontId
  if (-not $page) {
    $plan += [pscustomobject]@{section=$s.key; status='PAGE_NOT_FOUND'; page_id=$null; title=$null; chars=$body.Length}
    continue
  }
  if ([int]$page.ID -eq $frontId) { throw "Resolved $($s.key) to Home/front page. Aborting." }

  $status = if ($Apply) { 'APPLY' } else { 'DRY_RUN' }
  $plan += [pscustomobject]@{section=$s.key; status=$status; page_id=$page.ID; title=$page.post_title; chars=$body.Length}

  if ($Apply) {
    $tmp = Join-Path ([IO.Path]::GetTempPath()) ("ang-approved-{0}.txt" -f ([guid]::NewGuid().ToString('N')))
    try {
      Set-Content -Path $tmp -Value $body -Encoding UTF8
      # Use --post_content with file contents through eval-file-safe shell redirection when possible.
      $escaped = $body.Replace('"','\"')
      Get-Wp @('post','update',[string]$page.ID,"--post_content=$escaped") | Out-Null
      Write-Host "UPDATED_PAGE:$($page.ID):$($page.post_title):$($s.key)"
    } finally {
      Remove-Item $tmp -Force -ErrorAction SilentlyContinue
    }
  }
}

$plan | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 '.\build\approved-site-text-plan.json'
$summary = [pscustomobject]@{
  generated_at=(Get-Date).ToString('o')
  home_protected=$frontId
  mode=if($Apply){'APPLY'}else{'DRY_RUN'}
  sections_total=$sections.Count
  sections_resolved=@($plan | Where-Object {$_.page_id}).Count
  source_missing=@($plan | Where-Object {$_.status -eq 'SOURCE_SECTION_NOT_FOUND'}).Count
  page_missing=@($plan | Where-Object {$_.status -eq 'PAGE_NOT_FOUND'}).Count
  dynamic_fact_gate=@('anos/IATA','Virtuoso/Primetour','24x7/SLA','Carbon Free/Iniciativa Verde','Livelo','benefícios comerciais','endereços/telefones','apps/OBT/ERP')
}
$summary | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 '.\build\approved-site-text-summary.json'
Write-Host "HOME_PROTECTED:$frontId"
Write-Host "MODE:$($summary.mode)"
Write-Host "SECTIONS_RESOLVED:$($summary.sections_resolved)/$($summary.sections_total)"
Write-Host 'PLAN:build/approved-site-text-plan.json'
Write-Host 'SUMMARY:build/approved-site-text-summary.json'
Write-Host 'NOTE: Approved editorial is preserved by source section. Dynamic/contractual facts remain gated for revalidation.'
