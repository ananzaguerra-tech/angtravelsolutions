# ANG Curadoria — Bloco 06 — QA Matrix

- checked_at: 2026-09-09
- escopo: exatamente 10 países
- pacote Drive: https://docs.google.com/document/d/1tcEeJRvr_kIPgkANkMzaij42DYTnbLVD2Du0fJBnjVI/edit
- volume: 227 parágrafos; 31.612 caracteres
- estado de publicação: UPLOAD_PENDING_CHANNEL
- CMS/social/GBP mutation: false

## Resultado quantitativo

- cobertura estrutural: 160/160 eixos presentes (10 países × 16 eixos)
- CTAs: 10/10
- SEO/canonical/schema: 10/10
- fontes oficiais declaradas: 10/10
- checked_at declarado: 10/10
- mídia materializada com licença e SHA-256: 0/10
- reconciliação destino→slug→post_id→external_id: 0/10
- países liberados para publicação: 0/10

## Matriz

| País | Estrutura | Fontes/checked_at | QA dinâmico | Mídia | IDs 881/WORLD | Estado |
|---|---:|---:|---|---|---|---|
| Canadá | 16/16 | PRESENTE | PARTIAL — IRCC aberto; portal turístico não acessível pelo verificador | PENDING | PENDING | REVIEW_REQUIRED |
| Costa Rica | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| Panamá | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| Equador | 16/16 | PRESENTE | DEGRADED — turismo HTTP 429; chancelaria HTTP 502 | PENDING | PENDING | REVIEW_REQUIRED |
| Bolívia | 16/16 | PRESENTE | DEGRADED — migração HTTP 502; turismo não acessível pelo verificador | PENDING | PENDING | REVIEW_REQUIRED |
| Paraguai | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| Austrália | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| Nova Zelândia | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| África do Sul | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |
| Qatar | 16/16 | PRESENTE | SOURCE_OPENED | PENDING | PENDING | REVIEW_REQUIRED |

## Correção executada

O portal IRCC do Canadá foi revalidado em 2026-09-09:
https://www.canada.ca/en/immigration-refugees-citizenship/services/visit-canada.html

A página oficial exige determinação parametrizada de visto ou eTA e contempla trânsito; não autoriza regra universal. A própria página registra atualização em 2026-08-28.

## Gates fail-closed

1. Não promover fatos dinâmicos sem validação por nacionalidade, origem, trânsito e perfil.
2. Revalidar Equador e Bolívia sem retry cego ou fontes não oficiais.
3. Materializar mídia real/licenciada, registrar autor, licença, dimensões e SHA-256 e deduplicar mundialmente.
4. Reconciliar destinos com slug, post_id e external_id canônicos.
5. Exigir canal autenticado, backup, dry-run e QA antes de qualquer mutação CMS.
6. Nunca declarar publicação sem URL/ID/permalink.

## Rollback

Reverter o commit deste arquivo. Nenhuma produção, draft 881/WORLD, social, GBP, n8n ou CMS foi alterado.
