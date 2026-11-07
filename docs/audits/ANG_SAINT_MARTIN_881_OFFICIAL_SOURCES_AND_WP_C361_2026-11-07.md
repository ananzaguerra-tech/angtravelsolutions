# ANG Curadoria — Saint-Martin — C361

checked_at: 2026-11-07T02:03:40-03:00  
status: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING

## EXECUTADO
- Mestre v72 e Bloco 12 relidos; Saint-Martin confirmada como unidade 03, separada de Sint Maarten.
- Gmail: nenhuma nova resposta positiva qualificável das parcerias monitoradas.
- Oito buscas 881 por Saint-Martin, Saint Martin, St Martin e MAF nas duas abas canônicas: zero matches.
- Turismo e regra migratória oficial revalidados; legislação consolidada consultada.
- WordPress e Área Restrita testados; origin permanece indisponível.

## EVIDÊNCIA / URL / ID / COMMIT
- Bloco 12: https://docs.google.com/document/d/1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo oficial previsto: https://www.st-martin.org/
- Coletividade/turismo: https://www.saintmartin.fr/tourisme/index.html
- France-Visas short stay: https://www.france-visas.gouv.fr/en/web/france-visas/visa-de-court-sejour
- France-Visas Schengen: https://www.france-visas.gouv.fr/en/web/france-visas/la-france-dans-l-espace-schengen
- Legifrance: https://www.legifrance.gouv.fr/loda/id/JORFTEXT000025746952
- WordPress: https://angtravelsolutions.com.br/
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## CURADORIA OFICIAL
- Destinos preservados: Marigot, Grand Case, Orient Bay, Anse Marcel, Friar's Bay, Pic Paradis e Fort Louis.
- Saint-Martin é território francês não europeu e não integra o Espaço Schengen.
- A norma consolidada em vigor lista Brésil como dispensado de visto para permanência de até 90 dias em 180, ressalvada atividade remunerada quando autorização de trabalho é exigida e não apresentada.
- Documento de viagem deve ter validade superior em pelo menos três meses à saída planejada, duas páginas em branco e emissão há menos de dez anos.
- A legislação prevê pontos controlados em Grand Case e Marigot e disposição específica para chegada desde Sint Maarten; isso não funde as jurisdições nem os requisitos.
- Classificação migratória PASS_DATED_RECHECK, sem garantia de admissão.
- O portal turístico oficial st-martin.org retornou 403 neste ciclo; turismo ficou DEGRADED_403 e copy dinâmica não foi promovida.

## NÃO FEITO / MOTIVO
- CMS vivo/external_id não reconciliados: origin indisponível.
- Nenhuma mídia, logo, visual_hash ou copy promovida.
- Saint-Martin não foi confundida com Sint Maarten.
- Página 2109 não corrigida.
- Nenhuma publicação WordPress, Meta, Facebook, Instagram ou Google Business.

## BLOQUEIO
- WORDPRESS_ORIGIN_UNREACHABLE / PUBLIC_HOME_HTTP_502.
- LIVE_CMS_DEDUPE_PASS=false; EXTERNAL_ID_DERIVATION_PASS=false.
- OFFICIAL_TOURISM_GATE=DEGRADED_403.
- REAL_MEDIA_VERIFIED=false; MASTER_LOGO_VERIFIED=false; VISUAL_HASH_DEDUPE_PASS=false; COPY_QA_PASS=false; PUBLISHED=false.

## SOLUÇÃO TENTADA
- Releitura mestre/Drive/Gmail, oito buscas 881, consulta à Coletividade, France-Visas e legislação consolidada, teste do portal oficial, teste público e diagnóstico WPWriter.
- Regra migratória isolada por território; Schengen não foi tratado como equivalente.

## AÇÃO HUMANA MÍNIMA
- Hospedagem: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção.
- Antes da viagem: confirmar com France-Visas/companhia passaporte, trânsito, finalidade, duração, retorno, seguro, hospedagem e requisitos da parte francesa e das conexões.

## PRÓXIMA AÇÃO
- Repetir WordPress, reconciliar Saint-Martin no CMS vivo por título/slug/external_id e avançar para Sint Maarten.
- Quando o origin voltar, fazer backup da página 2109, corrigir o callout e confirmar readback.

## ROLLBACK
- Reverter os commits deste ciclo; nenhuma mutação de produção requer rollback.
