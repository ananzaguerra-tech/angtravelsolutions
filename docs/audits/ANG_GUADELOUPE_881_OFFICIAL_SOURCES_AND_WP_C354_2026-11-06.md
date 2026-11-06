# ANG Guadeloupe — fontes oficiais, entrada e WordPress — C354

- checked_at: 2026-11-06T19:03:46-03:00
- state: REVIEW_REQUIRED
- publication: HOLD
- source block: 11 / unit 06

## EXECUTADO

- Oito buscas canônicas nas abas `Item Register` e `WP Export Identity 24-07`, pelos aliases `Guadeloupe`, `Guadalupe`, `Département de la Guadeloupe` e `GLP`: zero correspondências.
- Resultado limitado a `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`; não representa consulta ao CMS vivo.
- Turismo oficial revalidado para Grande-Terre, Basse-Terre, Marie-Galante, Les Saintes/Terre-de-Haut e Terre-de-Bas, La Désirade, Soufrière, Chutes du Carbet, Réserve Cousteau e Pointe des Châteaux.
- Logística oficial registrada: aeroportuária pelo Guadeloupe–Maryse Condé e conexões marítimas para Marie-Galante, Les Saintes e La Désirade; horários devem ser reconfirmados antes da operação.
- Norma primária francesa vigente em 02/10/2026 confirma o Brasil na lista de dispensa de visto de curta duração para Guadeloupe, com exceção específica ligada a atividade remunerada quando uma autorização de trabalho for exigida e não puder ser apresentada.
- Condições gerais registradas: até 90 dias em 180; documento válido por pelo menos três meses após a saída prevista, com duas páginas livres e emitido há menos de dez anos. A dispensa não equivale a garantia de admissão.
- WordPress: home HTTP 502; `/area-restrita/` inacessível; WPWriter ativo no cadastro, mas páginas/posts falham por `No such host is known`.
- Gmail: nenhuma nova resposta positiva qualificável de Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Nenhuma publicação ou mutação em produção.

## EVIDÊNCIA / URL / ID / COMMIT

- Bloco 11: https://docs.google.com/document/d/19zN94t0ljnvtkOTw78dnBND-aWLkJCEVIOVr5rXis8I/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo oficial CTIG: https://www.lesilesdeguadeloupe.com/
- Experiências: https://www.lesilesdeguadeloupe.com/decouvrir/que-faire-en-guadeloupe/
- Basse-Terre: https://www.lesilesdeguadeloupe.com/iles/basse-terre/que-faire-en-basse-terre/
- Conexões interilhas: https://www.lesilesdeguadeloupe.com/en/plan/move-around/getting-around-the-islands-of-guadeloupe/
- Norma primária: https://www.legifrance.gouv.fr/loda/id/JORFTEXT000024403998/2026-10-02
- WordPress: https://angtravelsolutions.com.br
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## NÃO FEITO / MOTIVO

- Página 2109 não corrigida: origin indisponível.
- CMS vivo, `external_id`, mídia/licença, master de marca, `visual_hash` e copy QA não provados.
- Horários e tarifas de ferries não foram promovidos para conteúdo publicável porque são dinâmicos.
- Não houve publicação WordPress, Meta, Facebook, Instagram ou Google Business.

## BLOQUEIO

- `WORDPRESS_ORIGIN_UNREACHABLE`; `PUBLIC_HOME_HTTP_502`.
- `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`.
- `IMMIGRATION_NATIONALITY_PASS=PASS_DATED_RECHECK`.
- `INTERISLAND_SCHEDULE_PASS=HOLD_RECHECK`.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

## SOLUÇÃO TENTADA

- Releitura mestre/Drive/Gmail, oito buscas 881, consulta à norma primária, turismo e logística oficiais, teste público do origin e diagnóstico WPWriter.
- Dados migratórios e logísticos isolados com `checked_at` e recheck obrigatório.
- Conteúdo e manutenção preservados; nenhum bypass destrutivo.

## AÇÃO HUMANA MÍNIMA

- Hospedagem: restaurar origin/PHP/banco/upstream mantendo manutenção e conteúdo.
- Antes de operar: confirmar com autoridade francesa/companhia aérea nacionalidade, documento, finalidade, duração, conexões e provas exigidas; reconfirmar ferry com a transportadora.

## PRÓXIMA AÇÃO

- Repetir diagnóstico WordPress; quando o origin voltar, fazer backup da página 2109, corrigir callout e confirmar readback.
- Pesquisar Guadeloupe/Guadalupe no CMS vivo por título, slug e `external_id`.
- Avançar para Bermudas no Bloco 11 sem liberar mídia ou publicação antes dos gates.

## ROLLBACK

- Reverter os commits C354 deste receipt e desta auditoria.
- Nenhuma mutação externa requer rollback.
