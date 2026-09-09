# CURADORIA BLOCO 09 — MATRIZ QA — 2026-09-09

Estado: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL
Escopo: exatamente 10 países × 16 eixos editoriais.
checked_at: 2026-09-09

| País | Turismo oficial | Imigração/entrada | Estrutura | Mídia/SHA-256 | 881/WORLD IDs |
|---|---|---|---:|---|---|
| República Dominicana | PASS | DEGRADED_403 | 16/16 | PENDING | PENDING |
| Jamaica | PASS | PASS | 16/16 | PENDING | PENDING |
| Bahamas | PASS | PASS | 16/16 | PENDING | PENDING |
| Barbados | PASS | PASS | 16/16 | PENDING | PENDING |
| Fiji | DEGRADED | DEGRADED | 16/16 | PENDING | PENDING |
| Trinidad e Tobago | PASS | PASS | 16/16 | PENDING | PENDING |
| Cuba | PASS | DEGRADED_TIMEOUT | 16/16 | PENDING | PENDING |
| Belize | PASS | PASS | 16/16 | PENDING | PENDING |
| Guatemala | DEGRADED | DEGRADED | 16/16 | PENDING | PENDING |
| Honduras | PASS | DEGRADED | 16/16 | PENDING | PENDING |

## Totais
- Países: 10/10.
- Eixos presentes: 160/160.
- CTA: 10/10.
- SEO/slug/canonical/schema: 10/10.
- Turismo: 8 PASS, 2 DEGRADED.
- Entrada: 6 PASS, 4 DEGRADED.
- Mídia materializada e deduplicada: 0/10.
- Reconciliação slug→post_id→external_id: 0/10.
- Publicação CMS/social/GBP: 0.
- CI observável: PENDING.

## Gates
Fatos consulares continuam parametrizados por nacionalidade, residência, rota e data. Fiji, Guatemala e Honduras requerem nova tentativa controlada; e-ticket dominicano retornou 403; eVisa Cuba apresentou timeout. Nenhuma fonte degradada foi tratada como PASS.

## Rollback
Remover esta matriz e reverter o commit associado; nenhum sistema de produção foi alterado.
