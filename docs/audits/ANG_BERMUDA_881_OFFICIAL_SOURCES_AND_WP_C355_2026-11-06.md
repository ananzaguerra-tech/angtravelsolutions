# ANG Bermudas — fontes oficiais, entrada e WordPress — C355

- checked_at: 2026-11-06T19:57:38-03:00
- state: REVIEW_REQUIRED
- publication: HOLD
- source block: 11 / unit 07

## EXECUTADO

- Oito buscas canônicas nas abas `Item Register` e `WP Export Identity 24-07`, pelos aliases `Bermudas`, `Bermuda`, `Islands of Bermuda` e `BMU`: zero correspondências.
- Resultado limitado a `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`; não representa consulta ao CMS vivo.
- Turismo oficial revalidado para Hamilton, Town of St. George, Royal Naval Dockyard, Horseshoe Bay, Tobacco Bay, Warwick Long Bay, Church Bay e Cooper’s Island.
- Governo de Bermuda confirma que nacionalidades constantes da ordem de controle precisam de visto de múltiplas entradas para Reino Unido, Estados Unidos ou Canadá, válido por pelo menos 45 dias após a saída prevista.
- Brasil não aparece nas listas oficiais localizadas, inclusive na atualização anunciada em 03/09/2026; a conclusão foi limitada a `PASS_CONDITIONAL_RECHECK`, não a garantia de isenção ou admissão.
- Bermuda Arrival Card permanece exigido para visitantes não residentes por via aérea ou iate; não há taxa nem aprovação. Passageiros de cruzeiro são dispensados do formulário.
- WordPress: home HTTP 502; `/area-restrita/` inacessível; WPWriter ativo no cadastro, mas páginas/posts falham por `No such host is known`.
- Gmail: nenhuma nova resposta positiva qualificável de Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Nenhuma publicação ou mutação em produção.

## EVIDÊNCIA / URL / ID / COMMIT

- Bloco 11: https://docs.google.com/document/d/19zN94t0ljnvtkOTw78dnBND-aWLkJCEVIOVr5rXis8I/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo oficial: https://www.gotobermuda.com/
- Praias: https://www.gotobermuda.com/plan/inspiration/article/best-beaches-in-bermuda-find-the-right-beach-for-your-day
- Vistos/entrada: https://www.gov.bm/bermuda-entry-visas
- Arrival Card: https://www.gov.bm/coronavirus-travellers-visitors
- Atualização migratória 03/09/2026: https://www2.gov.bm/news/immigration-updates
- WordPress: https://angtravelsolutions.com.br
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## NÃO FEITO / MOTIVO

- Página 2109 não corrigida: origin indisponível.
- CMS vivo, `external_id`, mídia/licença, master de marca, `visual_hash` e copy QA não provados.
- Não foi declarada isenção incondicional para brasileiros porque a regra depende de lista controlada, ordem vigente e possíveis alterações de gateway.
- Não houve publicação WordPress, Meta, Facebook, Instagram ou Google Business.

## BLOQUEIO

- `WORDPRESS_ORIGIN_UNREACHABLE`; `PUBLIC_HOME_HTTP_502`.
- `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`.
- `IMMIGRATION_NATIONALITY_PASS=PASS_CONDITIONAL_RECHECK`.
- `ARRIVAL_CARD_PASS=PASS_DATED_RECHECK`.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

## SOLUÇÃO TENTADA

- Releitura mestre/Drive/Gmail, oito buscas 881, consulta às páginas oficiais de turismo, entrada, Arrival Card e atualização migratória, teste público do origin e diagnóstico WPWriter.
- Requisito migratório isolado por nacionalidade e validade, com recheck obrigatório antes de cotação ou publicação.
- Conteúdo e manutenção preservados; nenhum bypass destrutivo.

## AÇÃO HUMANA MÍNIMA

- Hospedagem: restaurar origin/PHP/banco/upstream mantendo manutenção e conteúdo.
- Antes de operar: confirmar com Department of Immigration/companhia aérea o passaporte brasileiro, rota, trânsito, finalidade, permanência, Arrival Card e eventual MRV de gateway.

## PRÓXIMA AÇÃO

- Repetir diagnóstico WordPress; quando o origin voltar, fazer backup da página 2109, corrigir callout e confirmar readback.
- Pesquisar Bermudas/Bermuda no CMS vivo por título, slug e `external_id`.
- Avançar para Ilhas Cayman no Bloco 11 sem liberar mídia ou publicação antes dos gates.

## ROLLBACK

- Reverter os commits C355 deste receipt e desta auditoria.
- Nenhuma mutação externa requer rollback.
