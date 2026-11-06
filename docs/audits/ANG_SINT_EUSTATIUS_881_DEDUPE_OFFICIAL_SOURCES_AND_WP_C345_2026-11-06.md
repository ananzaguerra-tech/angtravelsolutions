# ANG Sint Eustatius — auditoria de identidade, fontes oficiais e WordPress — C345

- **checked_at:** 2026-11-06T10:02:39-03:00
- **baseline:** relatório mestre v56
- **escopo:** Sint Eustatius/Statia, corpo público neerlandês no Caribe
- **separação:** não fundir com Bonaire, Saba ou agregado BES
- **resultado:** HOLD; nenhuma publicação ou mutação externa

## EXECUTADO

- Mestre e STATUS LIVE relidos.
- Gmail de Accor, Club Med, TTW e Il Borro verificado.
- Bloco 12, seção `07 — Sint Eustatius`, conciliado.
- Oito buscas por `Sint Eustatius`, `Saint Eustatius`, `Statia` e `EUX` nas abas `Item Register` e `WP Export Identity 24-07`.
- WordPress, Área Restrita, WPWriter, Statia Tourism e Rijksdienst CN testados.

## EVIDÊNCIA

- Bloco 12: `1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU`.
- Planilha 881: `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`.
- Oito buscas e zero correspondências: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Turismo: `https://www.statiatourism.com/`, inacessível no canal atual.
- Imigração: `https://english.rijksdienstcn.com/immigration-naturalisation-and-border-control`, inacessível.
- WordPress: HTTP 502; `/area-restrita/` inacessível; WPWriter sem leitura de posts/páginas.
- Recibo: `ops/control/ANG_SINT_EUSTATIUS_881_OFFLINE_DEDUPE_RECEIPT_C345_2026-11-06.json`.
- Commit do recibo: `7a9f56fce2a7c06eb21d8d4a9ccb8b32116ad48a`.

## NÃO FEITO / MOTIVO

- Fatos históricos `DEGRADED` não promovidos: fontes oficiais indisponíveis.
- CMS vivo e `external_id` não provados: origin indisponível.
- Mídia, licença, master de marca, `visual_hash`, copy QA e publicação não provados.
- Nenhuma escrita por SQL, arquivo ou bypass.

## BLOQUEIO

`WORDPRESS_ORIGIN_UNREACHABLE`; `PUBLIC_HOME_HTTP_502`; `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`; `OFFICIAL_DYNAMIC_FACTS_RECHECKED=false`; `IMMIGRATION_NATIONALITY_PASS=false`; `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

## SOLUÇÃO TENTADA

Releitura do Drive, separação de identidade BES, oito buscas 881, verificação pública/WPWriter e tentativa das duas fontes oficiais. Conteúdo existente e manutenção preservados.

## AÇÃO HUMANA MÍNIMA

Administrador da hospedagem: restaurar origin/PHP/banco/upstream sem recriar conteúdo nem retirar manutenção. Nenhuma ação humana é necessária apenas para manter Sint Eustatius em HOLD.

## PRÓXIMA AÇÃO

Repetir WordPress e fontes oficiais; depois pesquisar título/slug/`external_id` no CMS vivo e revalidar requisitos para brasileiros, voos regionais, parques, trilhas e mergulho antes de qualquer publicação.

## ROLLBACK

Reverter apenas os commits C345; nenhuma mutação externa exige rollback.
