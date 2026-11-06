# ANG Martinica — fontes oficiais, entrada e WordPress — C353

- checked_at: 2026-11-06T18:02:51-03:00
- state: REVIEW_REQUIRED
- publication: HOLD
- source block: 11 / unit 05

## EXECUTADO

- Oito buscas canônicas nas abas `Item Register` e `WP Export Identity 24-07`, pelos aliases `Martinica`, `Martinique`, `Collectivité Territoriale de Martinique` e `MTQ`: zero correspondências.
- Resultado limitado a `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`; não representa consulta ao CMS vivo.
- Turismo oficial revalidado para Fort-de-France, Les Trois-Îlets, Sainte-Anne, Le Marin, Saint-Pierre e Montagne Pelée, além de praia, náutica, mergulho, trilha, cultura e rum.
- Norma primária francesa consolidada confirma que o Brasil integra a lista de dispensa de visto de curta duração para Martinica, com exceção específica ligada a atividade remunerada sem a autorização de trabalho exigida.
- Condições gerais de entrada registradas: até 90 dias em 180; passaporte válido por pelo menos três meses além da saída prevista, emitido há menos de dez anos e com duas páginas livres. O visto Schengen não é equivalente a eventual visto ultramarino.
- WordPress: home HTTP 502; `/area-restrita/` inacessível; WPWriter ativo no cadastro, mas sem leitura de páginas/posts por `No such host is known`.
- Gmail: nenhuma nova resposta positiva qualificável de Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Nenhuma publicação ou mutação em produção.

## EVIDÊNCIA / URL / ID / COMMIT

- Bloco 11: https://docs.google.com/document/d/19zN94t0ljnvtkOTw78dnBND-aWLkJCEVIOVr5rXis8I/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo oficial: https://www.martinique.org/fr/que-faire
- Fort-de-France: https://www.martinique.org/fr/communes/fort-de-france
- Les Trois-Îlets: https://www.martinique.org/fr/communes/les-trois-ilets
- Norma primária: https://www.legifrance.gouv.fr/loda/id/JORFTEXT000024403998/2026-03-28
- Orientação institucional ultramar: https://www.service-public.gouv.fr/particuliers/vosdroits/F10610
- WordPress: https://angtravelsolutions.com.br
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## NÃO FEITO / MOTIVO

- Página 2109 não corrigida: origin indisponível.
- CMS vivo, `external_id`, mídia/licença, master de marca, `visual_hash` e copy QA não provados.
- Não houve publicação WordPress, Meta, Facebook, Instagram ou Google Business.
- A dispensa de visto não foi convertida em garantia de admissão, nem aplicada a trabalho, trânsito, residência ou documentos diferentes sem nova validação.

## BLOQUEIO

- `WORDPRESS_ORIGIN_UNREACHABLE`; `PUBLIC_HOME_HTTP_502`.
- `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`.
- `IMMIGRATION_NATIONALITY_PASS=PASS_DATED_RECHECK`.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

## SOLUÇÃO TENTADA

- Releitura mestre/Drive/Gmail, oito buscas 881, consulta à norma primária e fontes turísticas oficiais, teste público do origin e diagnóstico WPWriter.
- Regra migratória isolada com `checked_at` e obrigação de recheck antes de cotação ou publicação.
- Conteúdo existente preservado; nenhum bypass destrutivo.

## AÇÃO HUMANA MÍNIMA

- Hospedagem: restaurar origin/PHP/banco/upstream mantendo manutenção e conteúdo.
- Antes de operar: confirmar com companhia aérea/autoridade francesa nacionalidade, tipo e validade do passaporte, finalidade, duração, conexões e prova documental.

## PRÓXIMA AÇÃO

- Repetir diagnóstico WordPress; ao restaurar, fazer backup da página 2109, corrigir callout e confirmar readback.
- Pesquisar Martinica no CMS vivo por título, slug e `external_id`.
- Avançar para Guadeloupe no Bloco 11 sem liberar mídia ou publicação antes dos gates.

## ROLLBACK

- Reverter os commits C353 deste receipt e desta auditoria.
- Nenhuma mutação externa requer rollback.
