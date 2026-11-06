# ANG Dominica — auditoria 881/WORLD, fontes oficiais e WordPress — C350

- checked_at: 2026-11-06T15:02:05-03:00
- bloco: 11
- unidade: 02 — Dominica
- estado final: HOLD
- publicação: NÃO REALIZADA

## Escopo reconciliado

A seção existente do Bloco 11 foi relida sem recriação. Permanecem preservados `REVIEW_REQUIRED`, `UPLOAD_PENDING_CHANNEL`, `MEDIA_PENDING`, SEO/schema/CTA em rascunho e a expansão editorial para Roseau, Portsmouth, Soufrière, Morne Trois Pitons, Cabrits e Kalinago Territory.

## Reconciliação canônica 881

Foram executadas oito buscas, quatro aliases em cada uma das abas `Item Register` e `WP Export Identity 24-07`:

- Dominica
- Commonwealth of Dominica
- Dominique
- DMA

Resultado: zero linhas correspondentes nas oito buscas. A conclusão é estritamente `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`. Isto não prova ausência no CMS vivo, não cria `external_id` e não autoriza upload ou publicação.

## Fontes oficiais

### Turismo

- https://discoverdominica.com/
- https://discoverdominica.com/travel-dominica-by-sea/
- https://legacy.discoverdominica.com/en/lists/25/sightseeing
- https://legacy.discoverdominica.com/en/lists/31/national-parks

As fontes sustentam o escopo editorial de Roseau, Portsmouth, Soufrière, Morne Trois Pitons, Cabrits/Fort Shirley e Kalinago Territory. Status: `PASS_DATED`; fatos operacionais continuam sujeitos a revalidação.

### Entrada e imigração

- https://dominica.gov.dm/services/passports-and-travel-documents-non-nationals/do-i-need-a-visa-to-enter-into-dominica
- https://dominica.gov.dm/services/passports-and-travel-documents-non-nationals/what-are-the-entry-requirements-for-the-commonwealth-of-dominica
- https://edcard.dominica.gov.dm/

A página oficial consultada não inclui Brasil nas listas nominativas de isenção por seis ou três meses. Ela também afirma, separadamente, que um turista bona fide com passagem de retorno pode ficar sem visto por até 21 dias, sujeito a convencer o oficial de imigração. Os requisitos gerais incluem passaporte válido, passagem de retorno, recursos suficientes e endereço local. O ED card oficial deve ser enviado no máximo três dias antes da viagem.

Classificação: `PASS_CONDITIONAL_RECHECK`, sem generalizar isenção para brasileiros. Publicação, cotação e orientação ao cliente permanecem em HOLD até confirmação direta do perfil concreto (nacionalidade, residência, conexões, finalidade e duração).

## WordPress / Console

- Home pública: HTTP 502 Bad Gateway.
- `/area-restrita/`: inacessível no teste.
- WPWriter: conexão cadastrada como ativa, mas sem leitura de posts ou páginas.
- Erro de leitura: `No such host is known`.
- Página 2109 não alterada; nenhum backup/readback possível neste ciclo.
- Nenhum `post_id`, `external_id`, permalink ou `publication_id` criado.

## Gmail / parcerias

Não houve nova resposta positiva qualificável de Accor, Club Med, Guilherme Valle/TTW Group ou Simone Pampaloni/Il Borro. O retorno TTW de 30/10 permanece negativo e não autoriza parceria, co-marketing, mídia ou logos. Nenhuma publicação institucional foi preparada ou disparada.

## Branding, mídia e social

- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

Nenhuma imagem gerada por IA, foto, vídeo, logo ou post foi criado ou publicado. A página Facebook permitida continua sendo exclusivamente ANG TRAVEL `353450855530042`; a página `1214700205067389` não foi usada.

## Bloqueios e ação mínima

Bloqueios: origin WordPress indisponível, dedupe de CMS vivo não executável, ausência de `external_id`, regra migratória brasileira não demonstrada como isenção nominativa, mídia/licença/master/visual hash/copy QA pendentes.

Ação humana mínima: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção. Para uso operacional de imigração, confirmar diretamente com Passport and Immigration Department os detalhes do viajante brasileiro e do itinerário.

## Próxima ação

Repetir o diagnóstico WordPress; pesquisar Dominica no CMS vivo quando o origin retornar; confirmar imigração brasileira no caso concreto; depois avançar a Saint Kitts e Nevis sem liberar mídia ou publicação antes de todos os gates.

## Rollback

Reverter o commit desta auditoria e o receipt `6d67c9b2a6644d45a2b1428038a9b423ecfe2f85`. Nenhuma mutação de produção requer rollback.
