# ANG Ilhas Virgens Americanas — auditoria 881, fontes oficiais e WordPress — C346

- **checked_at:** 2026-11-06T11:00:37-03:00
- **baseline:** mestre v57
- **escopo:** United States Virgin Islands / USVI
- **separação:** não fundir com British Virgin Islands nem rótulo genérico Virgin Islands
- **resultado:** HOLD; nenhuma publicação ou mutação

## EXECUTADO

- Mestre, Gmail e STATUS LIVE relidos.
- Bloco 12, seção `08 — Ilhas Virgens Americanas`, conciliado.
- Oito buscas por `U.S. Virgin Islands`, `United States Virgin Islands`, `Ilhas Virgens Americanas` e `USVI` nas duas abas 881.
- Turismo oficial, CBP, WordPress, Área Restrita e WPWriter testados.

## EVIDÊNCIA

- Bloco 12: `1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU`.
- Planilha 881: `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`.
- Oito buscas, zero matches: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Turismo oficial acessível: `https://www.visitusvi.com/`; escopo atual observado: St. Croix, St. John e St. Thomas.
- Admissão CBP: `https://www.cbp.gov/travel/international-visitors`, HTTP 403 no canal atual.
- WordPress: HTTP 502; Área Restrita inacessível; WPWriter sem páginas/posts.
- Recibo: `ops/control/ANG_US_VIRGIN_ISLANDS_881_OFFLINE_DEDUPE_RECEIPT_C346_2026-11-06.json`.
- Commit do recibo: `872fdbcadec9778e14b8f16fc80bb1ea1c156621`.

## NÃO FEITO / MOTIVO

- Fonte turística isolada não libera admissão, conteúdo, mídia ou publicação.
- Fatos migratórios históricos não promovidos devido ao 403 do CBP.
- CMS vivo, `external_id`, mídia/licença, marca, `visual_hash` e copy QA não provados.
- Nenhuma escrita por bypass, SQL ou arquivo.

## BLOQUEIO

`WORDPRESS_ORIGIN_UNREACHABLE`; `PUBLIC_HOME_HTTP_502`; `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`; `OFFICIAL_DYNAMIC_FACTS_RECHECKED=false`; `IMMIGRATION_NATIONALITY_PASS=false`; `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

## SOLUÇÃO TENTADA

Releitura de Drive/Gmail, oito buscas 881, separação USVI/BVI, verificação oficial parcial e testes WordPress/WPWriter. Tudo preservado em modo fail-closed.

## AÇÃO HUMANA MÍNIMA

Hospedagem deve restaurar origin/PHP/banco/upstream sem remover manutenção. Nenhuma ação humana é necessária apenas para manter USVI em HOLD.

## PRÓXIMA AÇÃO

Repetir WordPress e CBP; pesquisar título/slug/`external_id` no CMS vivo; revalidar admissão para brasileiros, conexões, ferries, parques, clima e operadores antes de mídia, copy QA e publicação.

## ROLLBACK

Reverter apenas commits C346; não houve mutação externa.
