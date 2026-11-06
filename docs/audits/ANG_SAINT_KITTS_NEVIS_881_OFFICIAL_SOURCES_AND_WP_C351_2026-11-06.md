# ANG Saint Kitts e Nevis — auditoria 881/WORLD, fontes oficiais e WordPress — C351

- checked_at: 2026-11-06T15:59:17-03:00
- bloco: 11
- unidade: 03 — Saint Kitts e Nevis
- estado final: HOLD
- publicação: NÃO REALIZADA

## Escopo reconciliado

A seção existente do Bloco 11 foi relida sem recriação. Permanecem preservados `REVIEW_REQUIRED`, `UPLOAD_PENDING_CHANNEL`, `MEDIA_PENDING`, SEO/schema/CTA em rascunho e a expansão editorial para Basseterre, Frigate Bay, Christophe Harbour, Charlestown, Pinney's Beach e Nevis Peak.

## Reconciliação canônica 881

Oito buscas foram executadas nas abas `Item Register` e `WP Export Identity 24-07`, usando `Saint Kitts e Nevis`, `Saint Kitts and Nevis`, `St Kitts and Nevis` e `KNA`. Todas retornaram zero linhas correspondentes.

Resultado: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`. Isto não comprova ausência no CMS vivo, não cria `external_id` e não autoriza upload ou publicação.

## Fontes oficiais

### St. Kitts

- https://visitstkitts.kn/about/explore
- status: `PASS_DATED`

A fonte sustenta Mount Liamuiga, Brimstone Hill Fortress, Scenic Railway e conexão náutica para Nevis/Pinney's Beach.

### Nevis

- https://www.nevisisland.com/discover/about
- https://www.nevisisland.com/discover/experiences
- status: `PASS_DATED`

A fonte sustenta Charlestown, Nevis Peak, praias, floresta, patrimônio e hotelaria histórica.

### Entrada, visto e eTA

- https://www.stkittsnevishcuk.gov.kn/visa-immigration/
- https://www.knatravelform.kn/en
- https://technology.gov.kn/launch-of-electronic-travel-authorization-eta-enhanced-form/
- https://visitstkitts.kn/about/travel-requirements

A página oficial da High Commission lista o Brasil no grupo OAS do Visa Exemption Order. Desde 26/05/2025, o governo informa eTA obrigatória para portadores de passaporte não SKN; a referência turística oficial informa taxa atual de US$17 e envio até três meses antes da viagem. O portal oficial é `knatravelform.kn`.

Classificação: `PASS_DATED_RECHECK`. Não foi criada garantia de admissão. Nacionalidade, residência, conexões, finalidade, duração, validade do passaporte, taxa, documentos de suporte e estado do eTA devem ser reconfirmados imediatamente antes da viagem.

## WordPress / Console

- Home pública: HTTP 502 Bad Gateway.
- `/area-restrita/`: inacessível.
- WPWriter: conexão cadastrada como ativa, porém incapaz de ler posts e páginas.
- Erro: `No such host is known`.
- Página 2109 não alterada; backup/readback não executáveis.
- Nenhum `post_id`, `external_id`, permalink ou `publication_id`.

## Gmail / parcerias

Não houve nova resposta positiva qualificável de Accor, Club Med, Guilherme Valle/TTW Group ou Simone Pampaloni/Il Borro. O retorno TTW de 30/10 permanece negativo e não autoriza parceria ou co-marketing.

## Branding, mídia e social

- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

Nenhuma imagem gerada por IA, foto, vídeo, logo ou post foi criado/publicado. A página Facebook permitida continua exclusivamente ANG TRAVEL `353450855530042`; a página `1214700205067389` não foi usada.

## Bloqueios e ação mínima

Bloqueios: origin WordPress indisponível, dedupe de CMS vivo não executável, ausência de `external_id`, mídia/licença/master/visual hash/copy QA pendentes.

Ação humana mínima: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção. Antes de viagem concreta, revalidar os dados do brasileiro e concluir o eTA somente no canal oficial.

## Próxima ação

Repetir diagnóstico WordPress; pesquisar Saint Kitts e Nevis no CMS vivo quando o origin retornar; revalidar eTA e condições de entrada; avançar para São Vicente e Granadinas sem liberar mídia ou publicação antes dos gates.

## Rollback

Reverter o commit desta auditoria e o receipt `f712a6a8b02c27783259f7f69ac9ccebb8cc2597`. Nenhuma mutação de produção requer rollback.
