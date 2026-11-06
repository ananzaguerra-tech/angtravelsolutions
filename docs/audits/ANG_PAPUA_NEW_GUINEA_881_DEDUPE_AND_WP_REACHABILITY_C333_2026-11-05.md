# C333 — Papua-Nova Guiné: dedupe 881 offline e alcance WordPress

- **checked_at:** 2026-11-05 22:00 BRT
- **baseline do relatório mestre:** Biblioteca v44
- **território:** Papua-Nova Guiné / Papua New Guinea / PNG
- **modo:** fail-closed

## EXECUTADO

1. Gmail verificado para novas respostas nas últimas 24 horas de Accor, Club Med, Guilherme Valle/TTW Group e Simone Pampaloni/Il Borro: zero mensagens.
2. Drive pesquisado por `ANG STATUS LIVE C333`: nenhum checkpoint mais recente localizado.
3. Planilha canônica 881 consultada nas abas `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900`.
4. Aliases pesquisados: `Papua New Guinea`, `Independent State of Papua New Guinea`, `Territory of Papua and New Guinea`, `PNG`.
5. As oito buscas retornaram zero correspondências.
6. WordPress revalidado: home pública retornou HTTP 502; `/area-restrita/` não ficou acessível; WPWriter continuou sem conseguir buscar posts/páginas.
7. WPVibe rejeitou as duas formas seguras do domínio com `INVALID_ARGUMENT`; o conector não produziu evidência de alcance e não foi tratado como PASS.
8. Nenhuma escrita ou publicação foi forçada.

## EVIDÊNCIA

- Planilha: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Recibo estruturado: `ops/control/ANG_PAPUA_NEW_GUINEA_881_OFFLINE_DEDUPE_RECEIPT_C333_2026-11-05.json`
- Resultado: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`
- CMS vivo: não verificado.
- Publicação: não realizada.

## BLOQUEIOS E LIMITES

- `WORDPRESS_ORIGIN_UNREACHABLE`
- `PUBLIC_HOME_HTTP_502`
- `WPVIBE_INVALID_ARGUMENT`
- `LIVE_CMS_DEDUPE_PASS=false`
- `EXTERNAL_ID_DERIVATION_PASS=false`
- `VISUAL_HASH_DEDUPE_PASS=false`
- `IMMIGRATION_NATIONALITY_PASS=false`
- `PUBLISHED=false`

O zero-match offline não autoriza PASS canônico. Não houve seleção de mídia, prova de licença, `visual_hash`, schema/SEO publicável nem validação migratória específica para brasileiros.

## SOLUÇÃO TENTADA

- Verificação pública, WPWriter e duas formas de domínio no WPVibe.
- Continuidade segura pela fonte canônica no Drive.
- Registro separado de zero-match offline versus PASS CMS real.
- Preservação da manutenção e do conteúdo existente.

## AÇÃO HUMANA MÍNIMA

Administrador da hospedagem: restaurar o origin/PHP/banco/upstream do site existente, preservando manutenção e conteúdo. Nenhuma ação humana é necessária para manter Papua-Nova Guiné em HOLD.

## PRÓXIMA AÇÃO

Quando o origin voltar: fazer backup da página 2109, corrigir o callout, confirmar readback e pesquisar Papua-Nova Guiné/aliases no CMS vivo por título, slug e `external_id`. Somente depois avaliar `CANONICAL_IDENTITY_DEDUPE_PASS`.

## ROLLBACK

Reverter os commits deste recibo e desta auditoria. Não há mutação externa a desfazer.
