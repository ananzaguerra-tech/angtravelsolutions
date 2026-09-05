param(
  [switch]$Publish,
  [string]$EvidenceDir = '.\build\agent-area'
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path $EvidenceDir | Out-Null

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
$pluginSource = Join-Path $repoRoot 'wp-plugins\ang-agent-access'
if (-not (Test-Path $pluginSource)) { throw "Agent plugin source not found: $pluginSource" }

function Find-WpContainer {
  $containers = docker ps --format '{{.Names}}' 2>$null
  foreach ($c in $containers) {
    try {
      $probe = docker exec $c sh -lc 'command -v wp >/dev/null 2>&1 && echo WP_OK' 2>$null
      if ($probe -match 'WP_OK') { return $c }
    } catch {}
  }
  return $null
}

$container = Find-WpContainer
if (-not $container) { throw 'No running container with wp-cli found. ANG Connect/containers were not modified.' }

$frontId = docker exec $container wp option get page_on_front --allow-root --quiet 2>$null
if (-not $frontId) { throw 'Cannot resolve page_on_front; aborting to protect Home.' }

$pluginDir = docker exec $container wp eval 'echo WP_PLUGIN_DIR;' --allow-root 2>$null
if (-not $pluginDir) { throw 'Cannot resolve WP_PLUGIN_DIR.' }
$pluginDir = ([string]$pluginDir).Trim()

# Copy only the new isolated plugin directory. Never replace the whole plugins folder.
docker exec $container sh -lc "mkdir -p '$pluginDir/ang-agent-access'"
docker cp "$pluginSource\." "${container}:$pluginDir/ang-agent-access/"
docker exec $container wp plugin activate ang-agent-access --allow-root | Out-Null

$status = if ($Publish) { 'publish' } else { 'draft' }

function Ensure-Page([string]$slug,[string]$title,[string]$content) {
  $existing = docker exec $container wp post list --post_type=page --name=$slug --fields=ID,post_title,post_status --format=json --allow-root 2>$null | ConvertFrom-Json
  $id = $null
  if ($existing) { $id = [int](@($existing)[0].ID) }
  if ($id -and $id -eq [int]$frontId) { throw "Target slug $slug resolves to Home/front page. Aborting." }

  $payload = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($content))
  if ($id) {
    docker exec $container wp eval "`$c=base64_decode('$payload'); wp_update_post(['ID'=>$id,'post_title'=>'$title','post_content'=>`$c,'post_status'=>'$status']);" --allow-root | Out-Null
    return [pscustomobject]@{slug=$slug;id=$id;action='UPDATED';status=$status}
  }

  $newId = docker exec $container wp eval "`$c=base64_decode('$payload'); echo wp_insert_post(['post_type'=>'page','post_title'=>'$title','post_name'=>'$slug','post_content'=>`$c,'post_status'=>'$status']);" --allow-root 2>$null
  if (-not $newId) { throw "Failed to create page $slug" }
  return [pscustomobject]@{slug=$slug;id=[int]$newId;action='CREATED';status=$status}
}

$loginContent = @'
[ang_agent_login]
'@

$portalContent = @'
[ang_agent_gate]
<section class="ang-agent-portal-shell">
  <header class="ang-agent-portal-hero">
    <p class="eyebrow">ANG TRAVEL SOLUTIONS</p>
    <h1>Área do Agente</h1>
    <p>Ferramentas, conteúdo, fornecedores, treinamentos e suporte para agências parceiras.</p>
  </header>
  <div class="ang-agent-module-grid">
    <article><h2>Onboarding</h2><p>Cadastro, documentos, regras comerciais e primeiros passos.</p></article>
    <article><h2>Sistemas & Ferramentas</h2><p>Wooba, Infotravel, Sabre, CRM, atendimento e emissores.</p></article>
    <article><h2>Treinamentos</h2><p>Conteúdos técnicos, comerciais e de produto.</p></article>
    <article><h2>Fornecedores</h2><p>Diretório operacional e comercial com validação de vigência.</p></article>
    <article><h2>Hotelaria</h2><p>Benefícios, redes, propriedades e curadoria premium.</p></article>
    <article><h2>Conteúdo Global</h2><p>Curadoria de países, cidades e experiências.</p></article>
    <article><h2>Privilege</h2><p>Revista, artigos e materiais editoriais.</p></article>
    <article><h2>Buscador / White Label</h2><p>Preparado para integração Wooba/XML quando o endpoint for disponibilizado.</p></article>
    <article><h2>Relatórios & BI</h2><p>Indicadores, produção e acompanhamento.</p></article>
    <article><h2>Financeiro</h2><p>Condições, documentos e informações financeiras autorizadas.</p></article>
    <article><h2>Meu Perfil</h2><p>Dados cadastrais e preferências do agente.</p></article>
    <article><h2>Minhas Condições</h2><p>Condições comerciais individualizadas e vigentes.</p></article>
    <article><h2>Intranet</h2><p>Comunicados, processos e materiais internos.</p></article>
    <article><h2>Promoções</h2><p>Ofertas vigentes, datadas e com fonte comercial.</p></article>
    <article><h2>Concierge</h2><p>Fila de solicitações, cotações e acompanhamento.</p></article>
  </div>
</section>
<style>
.ang-agent-portal-shell{width:min(1180px,calc(100% - 2rem));margin:40px auto 80px}.ang-agent-portal-hero{padding:clamp(32px,6vw,72px);border-radius:28px;background:#071018;color:#fff}.ang-agent-portal-hero .eyebrow{color:#e0b85f;font-weight:800;letter-spacing:.14em}.ang-agent-portal-hero h1{font-size:clamp(2.6rem,7vw,6rem);margin:.4rem 0 1rem}.ang-agent-module-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:18px;margin-top:24px}.ang-agent-module-grid article{padding:24px;border:1px solid rgba(184,137,54,.24);border-radius:18px;background:#fff;box-shadow:0 16px 36px rgba(7,16,24,.08)}.ang-agent-module-grid h2{font-size:1.15rem;margin:0 0 .65rem}@media(max-width:900px){.ang-agent-module-grid{grid-template-columns:1fr 1fr}}@media(max-width:620px){.ang-agent-module-grid{grid-template-columns:1fr}}
</style>
[/ang_agent_gate]
'@

$results = @()
$results += Ensure-Page 'login-agente' 'Login Área do Agente' $loginContent
$results += Ensure-Page 'area-do-agente' 'Área do Agente' $portalContent

$evidence = [pscustomobject]@{
  generated_at=(Get-Date).ToString('o')
  container=$container
  home_protected=[int]$frontId
  plugin='ang-agent-access'
  plugin_status='ACTIVE'
  publish_mode=$status
  pages=$results
  xml_wooba_gate='PLACEHOLDER_READY_FOR_XML_ENDPOINT'
  destructive_actions=$false
}
$evidence | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 (Join-Path $EvidenceDir 'agent-area-evidence.json')
$results | Format-Table -AutoSize
Write-Host "AGENT_AREA_EVIDENCE:$(Join-Path $EvidenceDir 'agent-area-evidence.json')"
Write-Host "HOME_PROTECTED:$frontId"
Write-Host "PLUGIN_ACTIVE:ang-agent-access"
