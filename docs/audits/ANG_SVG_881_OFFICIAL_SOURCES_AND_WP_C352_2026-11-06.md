# ANG São Vicente e Granadinas — auditoria 881/WORLD, fontes oficiais e WordPress — C352

- checked_at: 2026-11-06T17:02:32-03:00
- bloco: 11
- unidade: 04 — São Vicente e Granadinas
- estado final: HOLD
- publicação: NÃO REALIZADA

## Escopo reconciliado

A seção existente do Bloco 11 foi relida sem recriação. Permanecem `REVIEW_REQUIRED`, `UPLOAD_PENDING_CHANNEL`, `MEDIA_PENDING`, SEO/schema/CTA em rascunho e a expansão para Kingstown, Bequia, Mustique, Canouan, Tobago Cays e Union Island.

## Reconciliação canônica 881

Oito buscas foram executadas nas abas `Item Register` e `WP Export Identity 24-07`, usando `São Vicente e Granadinas`, `Saint Vincent and the Grenadines`, `St Vincent and the Grenadines` e `VCT`. Todas retornaram zero linhas.

Resultado: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`. Isto não comprova ausência no CMS vivo, não cria `external_id` e não autoriza upload ou publicação.

## Fontes oficiais

### Turismo e logística

- https://discoversvg.com/
- https://discoversvg.com/travel/getting-to-svg/
- https://discoversvg.com/travel/ferry-schedules/
- status: `PASS_DATED`

As fontes sustentam St. Vincent/Kingstown, Bequia, Mustique, Canouan, Tobago Cays, Union Island e a necessidade de planejar voos/ferries interilhas com horários e condições reconfirmados.

### Entrada e saúde

- https://foreign.gov.vc/foreign/index.php/diplomatic-relations/3-foreign-affairs-section/visas
- https://svg-airport.com/immigration
- status: `PASS_DATED_RECHECK`

Brasil não aparece nas listas atuais de nacionalidades que exigem visto prévio. As fontes exigem passaporte válido, retorno ou continuação, endereço/hospedagem e recursos suficientes; para outros visitantes internacionais, a permanência pode chegar a três meses, mas a decisão e o período efetivo pertencem ao oficial de imigração.

A fonte aeroportuária também exige prova de vacinação contra febre amarela para viajantes acima de um ano que cheguem de país de risco ou tenham trânsito superior a 12 horas em país de risco. Para brasileiros, origem, região, conexões e exceções precisam ser revalidadas no caso concreto.

Nenhuma regra foi transformada em garantia de admissão ou orientação médica individual.

## WordPress / Console

- Home pública: HTTP 502 Bad Gateway.
- `/area-restrita/`: inacessível.
- WPWriter: conexão cadastrada como ativa, mas sem leitura de posts ou páginas.
- Erro: `No such host is known`.
- Página 2109 não alterada; nenhum backup/readback possível.
- Nenhum `post_id`, `external_id`, permalink ou `publication_id`.

## Gmail / parcerias

Não houve nova resposta positiva qualificável de Accor, Club Med, Guilherme Valle/TTW Group ou Simone Pampaloni/Il Borro. Nenhuma autorização de co-marketing, mídia ou logos foi inferida.

## Branding, mídia e social

- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

Nenhuma imagem gerada por IA, foto, vídeo, logo ou post foi criado ou publicado. A página Facebook permitida continua exclusivamente ANG TRAVEL `353450855530042`; a página `1214700205067389` não foi usada.

## Bloqueios e ação mínima

Bloqueios: origin WordPress indisponível, dedupe de CMS vivo não executável, ausência de `external_id`, mídia/licença/master/visual hash/copy QA pendentes e regra sanitária dependente do itinerário.

Ação humana mínima: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção. Antes de viagem concreta, confirmar com imigração/companhia aérea os dados do brasileiro e os requisitos sanitários da origem e conexões.

## Próxima ação

Repetir diagnóstico WordPress; pesquisar São Vicente e Granadinas no CMS vivo quando o origin retornar; revalidar entrada e febre amarela; avançar para Martinica sem liberar mídia ou publicação antes dos gates.

## Rollback

Reverter o commit desta auditoria e o receipt `eb919914bc3d5fed4a46d3f7bd0f6317a6d79da9`. Nenhuma mutação de produção requer rollback.
