# ANG Saba — auditoria de identidade, fontes oficiais e alcance WordPress — C344

- **checked_at:** 2026-11-06T09:01:20-03:00
- **baseline:** relatório mestre da Biblioteca v55
- **escopo:** Saba, corpo público/município especial neerlandês no Caribe
- **separação obrigatória:** não fundir com Bonaire, Sint Eustatius ou o agregado BES
- **resultado:** HOLD — nenhuma publicação, promoção de gate ou mutação externa

## EXECUTADO

1. Releitura do mestre v55 e do STATUS LIVE disponível.
2. Conciliação do Bloco 12, seção **06 — Saba**.
3. Oito buscas exatas na planilha canônica:
   - `Saba`, `Caribbean Netherlands Saba`, `Island Territory of Saba`, `SAB`;
   - `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900`.
4. Verificação do WordPress, Área Restrita, WPWriter, Gmail e Drive.
5. Tentativa de rechecagem das fontes oficiais de turismo e imigração.

## EVIDÊNCIA

- Bloco 12: Drive ID `1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU`.
- Planilha canônica: ID `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`.
- Oito buscas, zero correspondências: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Turismo oficial: `https://www.sabatourism.com/`, timeout no canal atual.
- Imigração: `https://english.rijksdienstcn.com/immigration-naturalisation-and-border-control`, inacessível no canal atual.
- Recibo: `ops/control/ANG_SABA_881_OFFLINE_DEDUPE_RECEIPT_C344_2026-11-06.json`.
- Commit do recibo: `449c4fd52ef7e428cdd08c590e2695f949d4275e`.

## ESTADO DO CONTEÚDO

- editorial histórico: `REVIEW_REQUIRED`;
- CMS: `UPLOAD_PENDING_CHANNEL`;
- entrada histórica: `DEGRADED`, checked_at 2026-09-09;
- mídia: `MEDIA_PENDING`;
- IDs canônicos: 0/10.

Nenhum fato dinâmico histórico foi promovido como atual.

## BLOQUEIOS E SOLUÇÕES TENTADAS

- WordPress público: HTTP 502.
- `/area-restrita/`: inacessível.
- WPWriter: posts e páginas indisponíveis.
- Gmail: nenhuma nova resposta das parcerias em 1 dia.
- Drive: nenhuma ocorrência para `ANG STATUS LIVE C344`.
- Turismo oficial: timeout.
- Fonte migratória: inacessível.

Paliativo seguro: deduplicação offline nas duas abas, separação explícita da identidade e recibo fail-closed. Zero-match offline não é PASS.

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

Restabelecer acesso ao WordPress/Área Restrita. Nenhuma ação humana é necessária apenas para manter Saba em HOLD; a rechecagem oficial deve ser repetida quando os canais responderem.

## PRÓXIMA AÇÃO

1. Repetir WordPress, Saba Tourism e Rijksdienst CN.
2. Pesquisar Saba no CMS vivo por título, slug e `external_id`.
3. Revalidar requisitos para brasileiros, pista curta, ferries, clima, parques e demais fatos dinâmicos.
4. Só então executar copy QA, mídia/licença, deduplicação visual e eventual publicação.

## ROLLBACK

Reverter apenas os commits GitHub do C344. Nenhum conteúdo externo foi publicado, editado ou excluído.
