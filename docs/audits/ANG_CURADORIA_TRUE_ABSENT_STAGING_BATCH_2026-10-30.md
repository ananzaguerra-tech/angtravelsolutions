# ANG Curadoria — True-absent staging batch — 2026-10-30

Status: `STAGING_STATIC_QA_PASS / CANONICAL_DEDUPE_PARTIAL / NO_PUBLISH`

## Executado

- Criado `content/destinations/batch-002-true-absent-staging.json` para Kiribati, Naoero, Tuvalu e Líbia.
- Naoero é a única identidade candidata; Nauru, Republic of Nauru e NRU permanecem aliases, sem segundo registro.
- Estruturados 7 destinos/cidades, SEO title/meta, slugs candidatos, tipos Schema.org, fontes, holds dinâmicos e estados de mídia.
- Todos os registros permanecem `draft_for_staging`, `noindex,nofollow`, sem `post_id` e sem `external_id`.
- Líbia permanece `BLOCK_RESTRICTED_QA`, com conteúdo exclusivamente histórico/patrimonial e nenhuma experiência comercial autorizada.
- Readback do arquivo na branch `staging`: JSON válido; 4/4 países; 7 cidades; 0 erros no conjunto de regras estáticas equivalente ao validador de conteúdo.
- O push deveria acionar `.github/workflows/validate.yml`; no primeiro readback, zero runs foram retornados. CI remoto não é declarado PASS.

## Evidência

- Commit: `1aacfc334bcfa46890bb9dd43edfaf8ccf294d8d`.
- Blob do batch: `eb861de2b66f6dc62b838bd82cdca290e9526f39`.
- Arquivo: `content/destinations/batch-002-true-absent-staging.json`.
- Fontes de controle:
  - `docs/curadoria/CURADORIA_CANONICAL_REMEDIATION_KIRIBATI_NAURU_TUVALU_LIBYA_2026-09-12.md`
  - `docs/audit/ANG_CURADORIA_OFFLINE_DEDUPE_4_COUNTRIES_2026-09-13_0201.json`
  - `ops/control/CURADORIA_TRUE_ABSENT_FACT_QA_2026-09-12.md`

## Gates

### Concluído neste artefato

- `SEO_SCHEMA_STATIC_PASS`
- `STAGING_JSON_STATIC_PASS`
- `NO_CMS_ID_CREATED`
- `NOINDEX_FAIL_CLOSED`
- `NAOERO_ALIAS_COLLAPSE_PASS`

### Ainda bloqueado

- `CANONICAL_IDENTITY_DEDUPE_PASS`: buscas textuais/slugs anteriores retornaram zero, mas lookup completo de metadados opacos `external_id/aliases` no universo live ainda não foi provado.
- `REAL_MEDIA_VERIFIED`
- `LICENSE_OR_PERMISSION_RECORDED`
- `DYNAMIC_FACTS_CHECKED_AT_CURRENT` para entrada/logística.
- `REMOTE_CI_RUN_NOT_PROVEN`
- `CMS_ID_EXTERNAL_ID_RECONCILED`

## Não feito

- Nenhum ID CMS, post WordPress, publicação, mídia, Google Business, Meta ou n8n.
- Nenhum PASS global e nenhuma autorização de publicação.

## Próxima ação

1. Quando a leitura WordPress voltar, consultar metadados `external_id/aliases` dos CPTs completos.
2. Executar CI remoto e registrar run/job.
3. Materializar somente mídia real/licenciada com manifesto, SHA-256 e visual hash.
4. Promover um candidato apenas após todos os gates aplicáveis.

## Rollback

Reverter o commit `1aacfc334bcfa46890bb9dd43edfaf8ccf294d8d`; nenhum estado externo foi alterado.
