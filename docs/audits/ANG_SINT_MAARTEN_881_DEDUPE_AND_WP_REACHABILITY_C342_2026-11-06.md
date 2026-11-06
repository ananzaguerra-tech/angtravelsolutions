# ANG Sint Maarten — auditoria de identidade, deduplicação e alcance WordPress — C342

- **checked_at:** 2026-11-06T06:57:59-03:00
- **baseline:** relatório mestre da Biblioteca v53
- **escopo:** Sint Maarten, país constituinte do Reino dos Países Baixos (lado neerlandês)
- **separação obrigatória:** não confundir nem fundir com Saint-Martin, coletividade francesa conciliada no C341
- **resultado:** HOLD — nenhuma publicação, promoção de gate ou mutação externa

## EXECUTADO

1. Releitura do mestre v53 e do STATUS LIVE disponível.
2. Conciliação do Bloco 12, seção **04 — Sint Maarten**.
3. Oito buscas exatas na planilha canônica:
   - aliases: `Sint Maarten`, `Country of Sint Maarten`, `Dutch Saint Martin`, `SXM`;
   - abas/faixas: `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900`.
4. Verificação pública do WordPress, Área Restrita, canal WPWriter, Gmail de parcerias e Drive STATUS LIVE.

## EVIDÊNCIA

- Bloco 12: Drive ID `1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU`.
- Planilha canônica: ID `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`.
- Resultado das 8 buscas: **0 correspondências**.
- Classificação: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Recibo: `ops/control/ANG_SINT_MAARTEN_881_OFFLINE_DEDUPE_RECEIPT_C342_2026-11-06.json`.
- Commit do recibo: `81de3c44f6790f7b8d7ee45ceb1e0372e605e23c`.

## ESTADO DO CONTEÚDO

- editorial histórico: `REVIEW_REQUIRED`;
- CMS: `UPLOAD_PENDING_CHANNEL`;
- fatos de entrada históricos: `DEGRADED`, checked_at 2026-09-09;
- mídia rastreável: 0/10;
- IDs canônicos: 0/10.

Nenhum fato dinâmico histórico foi promovido como atual.

## BLOQUEIOS E SOLUÇÕES TENTADAS

- WordPress público: HTTP 502.
- `/area-restrita/`: inacessível.
- WPWriter: conectado, mas sem leitura confiável de posts/páginas.
- Gmail: nenhuma nova resposta das parcerias na janela de 1 dia.
- Drive: nenhuma ocorrência para `ANG STATUS LIVE C342`.

Paliativo seguro aplicado: deduplicação offline nas duas abas canônicas, separação explícita de identidade e registro fail-closed. O zero-match offline não é PASS e não prova ausência no CMS vivo.

## GATES

| Gate | Estado |
|---|---|
| LIVE_CMS_VERIFIED | false |
| EXTERNAL_ID_VERIFIED | false |
| OFFICIAL_DYNAMIC_FACTS_CURRENT | false |
| REAL_MEDIA_VERIFIED | false |
| VISUAL_HASH_VERIFIED | false |
| IMMIGRATION_CURRENT | false |
| PUBLISHED | false |

## AÇÃO HUMANA MÍNIMA

Restabelecer acesso verificável ao WordPress/Área Restrita e fornecer canal capaz de consultar IDs vivos; depois validar fatos oficiais dinâmicos e mídia real/licenciada antes de qualquer publicação.

## ROLLBACK

Reverter apenas os commits GitHub do C342. Nenhum conteúdo externo foi publicado, editado ou excluído.
