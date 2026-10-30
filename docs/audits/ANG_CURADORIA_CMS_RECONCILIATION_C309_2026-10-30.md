# ANG Curadoria/CMS — reconciliação fail-closed C309

**checked_at:** 2026-10-30 UTC  
**branch:** `staging`  
**baseline tree reviewed:** `535cfc92f36b624e3108d046a186e4002adb18a6`  
**mode:** reconciliation / dedupe / staging QA only  
**publication_allowed:** `false`

## Decisão executiva

Nenhum item recebeu novo `post_id`, `external_id`, slug CMS ou publicação. A reconciliação preserva todos os IDs existentes e separa PASS de estrutura em staging de autorização de release.

- 4 países: zero correspondência nominal live já documentada, porém ausência canônica ainda não provada porque a derivação dos hashes opacos `ang_external_id` não está disponível.
- Base 881: 552 índices já versionados como `MERGE_REVIEW`; 329 índices não aparecem nos dois mapas versionados. O próximo bloco contíguo 836–858 foi aberto em manifesto fail-closed, sem inventar identidades.
- Miami Beach 12: 0/12 com autorização de reutilização; todos permanecem em HOLD.
- Il Borro: copy/fatos podem seguir em revisão; os dois vídeos permanecem sem autorização e QA técnica, logo 0 publicação.

## 1. Quatro países true-absent

Evidência consolidada:

- A leitura REST autenticada documentada em `docs/audits/ANG_CURADORIA_4_COUNTRIES_LIVE_META_DEDUPE_2026-09-13_0901.md` percorreu 920 registros ativos/não-lixeira.
- 844 registros tinham `ang_external_id`; os 844 valores eram únicos.
- Kiribati, Nauru/Naoero, Tuvalu e Libya/Líbia/Libia tiveram zero correspondência inequívoca em título, slug e metadados nominais.
- A regra fonte→hash não foi provada. Portanto, o fechamento correto é `LIVE_TITLE_SLUG_META_NAME_ZERO_MATCH_PASS / HOLD_EXTERNAL_ID_DERIVATION_NOT_PROVEN`, e não `NEW_CANONICAL_CANDIDATE`.
- Naoero/Nauru/Republic of Nauru/NRU deve permanecer uma única identidade candidata.
- A verificação live é histórica (2026-09-13) e deve ser repetida imediatamente antes de qualquer criação.

| País | Dedupe nominal | Dedupe external_id | Fact QA | Release |
|---|---|---|---|---|
| Kiribati | PASS histórico | HOLD | PASS de escopo; nacionalidade brasileira HOLD | BLOCK |
| Naoero (Nauru) | PASS histórico | HOLD | PASS de escopo; elegibilidade nacional HOLD | BLOCK |
| Tuvalu | PASS histórico | HOLD | ENTRY_FACT_HOLD | BLOCK |
| Líbia | PASS histórico | HOLD | RESTRICTED_QA | BLOCK |

### Ação mínima para fechar o dedupe canônico

Fornecer uma exportação read-only `source_key -> ang_external_id` ou a regra determinística aprovada. Reproduzir os quatro hashes candidatos e compará-los com o conjunto live. Qualquer match vira `MERGE_REVIEW`; somente zero-match integral e revalidação live atual permitem `NEW_CANONICAL_CANDIDATE`.

## 2. SEO/schema e staging QA

QA executada sobre o pacote versionado, sem escrita no CMS:

| País | Slug candidato | Tipos autorizados para preparação | Resultado de staging |
|---|---|---|---|
| Kiribati | `/curadoria/kiribati/` | TouristDestination, Place, FAQPage, BreadcrumbList | `STRUCTURE_PASS / RELEASE_HOLD` |
| Naoero | `/curadoria/naoero/` | TouristDestination, Place, FAQPage, BreadcrumbList | `STRUCTURE_PASS / RELEASE_HOLD` |
| Tuvalu | `/curadoria/tuvalu/` | TouristDestination, Place, FAQPage, BreadcrumbList | `STRUCTURE_PASS / ENTRY_RELEASE_HOLD` |
| Líbia | `/curadoria/libia/` | Place, BreadcrumbList | `RESTRICTED_STRUCTURE_PASS / DESTINATION_SCHEMA_HOLD` |

Regras de QA preservadas:

- URLs acima são apenas candidatos; não são rotas live nem IDs.
- FAQ não pode afirmar isenção, taxa, prazo ou elegibilidade de brasileiro enquanto o fato dinâmico estiver em HOLD.
- `TouristDestination` para Líbia permanece proibido até revisão de segurança/release.
- Todo grafo deve usar uma única entidade canônica por país, `inLanguage=pt-BR`, breadcrumb consistente e URLs finais somente após reconciliação de ID.
- `SEO_SCHEMA_PASS` de release continua pendente até dedupe de `external_id`, mídia real/licença, render de staging e checagem de dados estruturados na URL final.

## 3. Base 881 — estado matemático e próximo bloco

Os dois mapas versionados foram recontados:

- `CURADORIA_RECONCILIATION_881_LOTS_EXACT_MATCHES_2026-09-07.csv`: 437 linhas, índices 307–835, todas `MERGE_REVIEW`.
- `CURADORIA_RECONCILIATION_881_LOTS_HIERARCHICAL_MATCHES_2026-09-07.csv`: 115 linhas, índices 330–881, todas `MERGE_REVIEW`.
- União única: 552/881 índices.
- Não representados nos mapas: 329 índices, exatamente `1–306` e `836–858`.
- Os índices 859–881 já estão reconciliados hierarquicamente como Baa Atoll, preservando `post_id` 142482–142504 e seus `external_id`.

### Execução segura feita

Criado `docs/control/CURADORIA_RECONCILIATION_881_NEXT_BLOCK_836_858_2026-10-30.csv` para os 23 índices 836–858, todos com:

- `HOLD_SOURCE_ROW_MISSING`
- ação `SOURCE_EXPORT_READ_ONLY`
- `publication_allowed=false`
- `DO_NOT_ASSIGN_OR_REPLACE_EXISTING_IDS`

Commit do manifesto: `41b5f5a2e18247d09885aaedd4387842891aa2e2`.

O bloco não pode ser reconciliado por título/slug/ID porque as identidades-fonte 836–858 não aparecem nos artefatos versionados consultados. Preencher por inferência seria criar risco de duplicidade.

## 4. Miami Beach — 12 hotéis

Lista controlada: The Miami Beach EDITION, Eden Roc, Nobu, Ritz-Carlton South Beach, Loews, Faena, W South Beach, The Setai, 1 Hotel South Beach, Villa Casa Casuarina, Savoy Hotel & Beach Club e Fontainebleau.

- 7/12 possuem alguma evidência de fonte oficial/partner em `ANG_MIAMI_BEACH_HOTEL_VIDEO_SOURCE_MANIFEST_2026-09-13_0102.json`.
- 5/12 não possuem vídeo individualizado localizado.
- 0/12 possuem autorização de reutilização registrada.
- 0/12 estão READY_REVIEW; 0/12 publicados.

Apenas podem avançar hoje: pedido de press kit/licença, seleção do asset exato, registro de crédito/território/duração e QA técnica/hash. Não substituir por foto genérica, IA ou mídia de outro hotel.

## 5. Il Borro

Copy PT-BR/EN e fatos atuais estão em `READY_REVIEW_NO_PUBLISH`. Dois arquivos Drive são conhecidos:

- `1H1TnajWrbsulWYxcPJEXEnf8UrbIcGFK` — Il Borro - Borgo Medievale.mp4 — 62.766.601 bytes.
- `1uKEziBzy_wG4PMKRQKQbIq5Kanxszw3u` — Dreaming of…Il Borro.mp4 — 58.406.933 bytes.

Bloqueios objetivos: titularidade e autorização comercial não verificadas; crédito, território e duração da permissão ausentes; duração/resolução/codec/hash visual não validados; resposta de parceria pendente. O conteúdo pode avançar apenas em copy QA e coleta de direitos/QA técnica.

## O que pode avançar hoje sem risco

1. Obter a exportação read-only/regra de `ang_external_id` e repetir a busca live dos quatro países.
2. Exportar exatamente as linhas-fonte 836–858 com seus IDs existentes; então preencher o manifesto sem criar IDs.
3. Preparar metadados e grafos JSON-LD em staging, mantendo os estados de release em HOLD.
4. Solicitar autorização escrita e press kits dos 12 hotéis e do Il Borro; executar QA técnica somente nos assets autorizados.
5. Após cada evidência, promover apenas o gate correspondente; nunca promover o item inteiro por inferência.

## Rollback

Os únicos efeitos deste ciclo são dois arquivos de documentação em `staging`. Nenhum CMS, mídia, WordPress, social, Google Business ou automação foi alterado.
