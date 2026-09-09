# CURADORIA BLOCO 09 — MATRIZ QA — 2026-09-09

Estado: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL
Escopo: exatamente 10 países × 16 eixos editoriais.
checked_at: 2026-09-09

| País | Turismo oficial | Imigração/entrada | Estrutura | Mídia/SHA-256 | 881/WORLD IDs |
|---|---|---|---:|---|---|
| República Dominicana | PASS | PASS_VIA_DGM | 16/16 | PENDING | PENDING |
| Jamaica | PASS | PASS | 16/16 | PENDING | PENDING |
| Bahamas | PASS | PASS | 16/16 | PENDING | PENDING |
| Barbados | PASS | PASS | 16/16 | PENDING | PENDING |
| Fiji | PASS | PASS | 16/16 | PENDING | PENDING |
| Trinidad e Tobago | PASS | PASS | 16/16 | PENDING | PENDING |
| Cuba | PASS | PASS_VIA_EVISACUBA | 16/16 | PENDING | PENDING |
| Belize | PASS | PASS | 16/16 | PENDING | PENDING |
| Guatemala | DEGRADED | PASS | 16/16 | PENDING | PENDING |
| Honduras | PASS | PASS | 16/16 | PENDING | PENDING |

## Totais
- Países: 10/10.
- Eixos presentes: 160/160.
- CTA: 10/10.
- SEO/slug/canonical/schema: 10/10.
- Turismo: 9 PASS, 1 DEGRADED.
- Entrada: 10 PASS.
- Mídia materializada e deduplicada: 0/10.
- Reconciliação slug→post_id→external_id: 0/10.
- Publicação CMS/social/GBP: 0.
- CI observável: PENDING.

## Gates
Fatos consulares continuam parametrizados por nacionalidade, residência, rota e data. A contagem inicial estava incorreta (5 PASS/5 DEGRADED, não 6/4). Rotas oficiais alternativas elevaram entrada para 10 PASS: DGM dominicana; páginas específicas da Immigration Fiji; eVisaCuba/Minrex; IGM Guatemala; e página de vistos do INM Honduras. Turismo da Guatemala permanece DEGRADED.

## Rollback
Remover esta matriz e reverter o commit associado; nenhum sistema de produção foi alterado.
