# C337 — Ilhas Cook: dedupe 881 offline e alcance WordPress

- **checked_at:** 2026-11-06 02:00 BRT
- **baseline do relatório mestre:** Biblioteca v48
- **território:** Ilhas Cook / Cook Islands / Kūki 'Āirani / COK
- **modo:** fail-closed

## EXECUTADO

1. Gmail verificado para novas respostas nas últimas 24 horas de Accor, Club Med, Guilherme Valle/TTW Group e Simone Pampaloni/Il Borro: zero mensagens.
2. Drive pesquisado por `ANG STATUS LIVE C337`: nenhum checkpoint mais recente localizado.
3. O contexto histórico preserva Ilhas Cook no Bloco 13 como `REVIEW_REQUIRED`, com mídia e IDs canônicos ainda não atribuídos.
4. Planilha canônica 881 consultada nas abas `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900`.
5. Aliases pesquisados: `Cook Islands`, `Kūki 'Āirani`, `Hervey Islands`, `COK`.
6. As oito buscas retornaram zero correspondências.
7. WordPress revalidado: home pública retornou HTTP 502; `/area-restrita/` não ficou acessível; WPWriter continuou sem conseguir buscar posts/páginas.
8. Nenhuma escrita ou publicação foi forçada.

## EVIDÊNCIA

- Planilha: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Recibo estruturado: `ops/control/ANG_COOK_ISLANDS_881_OFFLINE_DEDUPE_RECEIPT_C337_2026-11-06.json`
- Resultado: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`
- Contexto anterior: Bloco 13 `REVIEW_REQUIRED`; mídia/IDs não atribuídos.
- CMS vivo: não verificado.
- Publicação: não realizada.

## BLOQUEIOS E LIMITES

- `WORDPRESS_ORIGIN_UNREACHABLE`
- `PUBLIC_HOME_HTTP_502`
- `LIVE_CMS_DEDUPE_PASS=false`
- `EXTERNAL_ID_DERIVATION_PASS=false`
- `VISUAL_HASH_DEDUPE_PASS=false`
- `IMMIGRATION_NATIONALITY_PASS=false`
- `PUBLISHED=false`

O zero-match offline não autoriza PASS canônico. A presença editorial histórica não equivale a identidade reconciliada, mídia licenciada ou publicação.

## SOLUÇÃO TENTADA

- Releitura do relatório mestre e reconciliação com o contexto histórico do Bloco 13.
- Verificação pela origem pública e pelo conector WPWriter.
- Continuidade segura pela fonte canônica no Drive.
- Registro separado de zero-match offline versus PASS CMS real.
- Preservação da manutenção e do conteúdo existente.

## AÇÃO HUMANA MÍNIMA

Administrador da hospedagem: restaurar o origin/PHP/banco/upstream do site existente, preservando manutenção e conteúdo. Nenhuma ação humana é necessária para manter Ilhas Cook em HOLD.

## PRÓXIMA AÇÃO

Quando o origin voltar: fazer backup da página 2109, corrigir o callout, confirmar readback e pesquisar Ilhas Cook/aliases no CMS vivo por título, slug e `external_id`. Somente depois avaliar `CANONICAL_IDENTITY_DEDUPE_PASS`.

## ROLLBACK

Reverter os commits deste recibo e desta auditoria. Não há mutação externa a desfazer.
