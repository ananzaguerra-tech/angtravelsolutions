# ANG Bonaire — auditoria de identidade, fontes oficiais e alcance WordPress — C343

- **checked_at:** 2026-11-06T07:56:34-03:00
- **baseline:** relatório mestre da Biblioteca v54
- **escopo:** Bonaire, corpo público/município especial neerlandês no Caribe
- **separação obrigatória:** não fundir com Saba, Sint Eustatius ou o agregado estatístico “Bonaire, Sint Eustatius and Saba”
- **resultado:** HOLD — nenhuma publicação, promoção integral de gate ou mutação externa

## EXECUTADO

1. Releitura do mestre v54 e do STATUS LIVE disponível.
2. Conciliação do Bloco 12, seção **05 — Bonaire**.
3. Oito buscas exatas na planilha canônica:
   - aliases: `Bonaire`, `Caribbean Netherlands Bonaire`, `Island Territory of Bonaire`, `BON`;
   - abas/faixas: `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900`.
4. Verificação da origem WordPress, Área Restrita, WPWriter, Gmail de parcerias e Drive STATUS LIVE.
5. Rechecagem das fontes oficiais históricas de turismo e imigração.

## EVIDÊNCIA

- Bloco 12: Drive ID `1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU`.
- Planilha canônica: ID `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`.
- Resultado das 8 buscas: **0 correspondências**.
- Classificação: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Turismo oficial: `https://bonaireisland.com/`, acessível em 2026-11-06 07:56 BRT.
- A página oficial observada informa taxa de entrada de visitante de USD 75 por pessoa/visita; o dado foi registrado com checked_at, mas não publicado.
- Imigração Rijksdienst CN: `https://english.rijksdienstcn.com/immigration-naturalisation-and-border-control`, não acessível pelo canal atual.
- Recibo: `ops/control/ANG_BONAIRE_881_OFFLINE_DEDUPE_RECEIPT_C343_2026-11-06.json`.
- Commit do recibo: `443e55040fef16eb14d088e81bb48d4f57415307`.

## ESTADO DO CONTEÚDO

- editorial histórico: `REVIEW_REQUIRED`;
- CMS: `UPLOAD_PENDING_CHANNEL`;
- entrada histórica: `DEGRADED`, checked_at 2026-09-09;
- mídia rastreável: 0/10;
- IDs canônicos: 0/10.

A rechecagem parcial de turismo não libera imigração, CMS, mídia, copy QA nem publicação.

## BLOQUEIOS E SOLUÇÕES TENTADAS

- WordPress público: HTTP 502.
- `/area-restrita/`: inacessível.
- WPWriter: conexão cadastrada, mas posts e páginas indisponíveis.
- Gmail: nenhuma nova resposta das parcerias na janela de 1 dia.
- Drive: nenhuma ocorrência para `ANG STATUS LIVE C343`.
- Fonte migratória: inacessível no canal atual.

Paliativo seguro: deduplicação offline nas duas abas, delimitação de identidade e registro do turismo oficial com checked_at. O zero-match offline não é PASS e a fonte turística isolada não autoriza publicação.

## GATES

| Gate | Estado |
|---|---|
| LIVE_CMS_VERIFIED | false |
| EXTERNAL_ID_VERIFIED | false |
| OFFICIAL_DYNAMIC_FACTS_CURRENT | false |
| IMMIGRATION_CURRENT | false |
| REAL_MEDIA_VERIFIED | false |
| MASTER_LOGO_VERIFIED | false |
| VISUAL_HASH_VERIFIED | false |
| COPY_QA_PASS | false |
| PUBLISHED | false |

## AÇÃO HUMANA MÍNIMA

Restabelecer acesso verificável ao WordPress/Área Restrita e ao canal migratório oficial. Depois, validar identidade viva, requisitos por nacionalidade, mídia real/licenciada e master de marca antes de qualquer publicação.

## PRÓXIMA AÇÃO

1. Repetir alcance do WordPress e do Rijksdienst CN.
2. Pesquisar Bonaire no CMS vivo por título, slug e `external_id`.
3. Revalidar requisitos aplicáveis a brasileiros, taxa, natureza, parques e demais fatos dinâmicos em fontes oficiais.
4. Só então executar copy QA, mídia/licença, deduplicação visual e eventual publicação.

## ROLLBACK

Reverter apenas os commits GitHub do C343. Nenhum conteúdo externo foi publicado, editado ou excluído.
