# ANG Curadoria — Anguilla — C359

checked_at: 2026-11-07T00:04:11-03:00  
status: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING

## EXECUTADO
- Relatório mestre v70 e Bloco 12 relidos; Anguilla confirmada como unidade 01.
- Gmail consultado para Accor, Club Med, TTW/Guilherme Valle e Il Borro/Simone Pampaloni: nenhuma nova resposta positiva qualificável.
- Planilha 881 pesquisada nas abas Item Register e WP Export Identity 24-07.
- Anguilla, Anguila e AIA: zero correspondências em ambas as abas.
- AI retornou colisões de substring não relacionadas; alias curto classificado não diagnóstico.
- Turismo e entrada revalidados em fontes oficiais.
- WordPress e Área Restrita testados; origin permanece indisponível.

## EVIDÊNCIA / URL / ID / COMMIT
- Bloco 12: https://docs.google.com/document/d/1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo: https://ivisitanguilla.com/explore-our-island/
- Entrada: https://ivisitanguilla.com/entry-requirements/
- Governo/visas: https://gov.ai/service/immigration-labour-visas-travel
- eVisa countries: https://evisa.gov.ai/Countries
- Logística: https://ivisitanguilla.com/getting-to-anguilla/
- WordPress: https://angtravelsolutions.com.br/
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## CURADORIA OFICIAL
- Destinos reconciliados: The Valley, West End, Blowing Point, Sandy Ground, East End, Island Harbour e offshore cays; praias prioritárias incluem Meads Bay, Rendezvous Bay e Shoal Bay.
- Visitantes precisam de passaporte válido além da saída e bilhete de retorno/continuação.
- Portal oficial eVisa lista Brazil/BRA como Visa Not Required. Classificação: PASS_DATED_RECHECK, sem garantia de admissão.
- Entrada exige inspeção de Customs & Immigration; logística via AXA/SJU/SXM e ferries depende de operação, imigração, clima e disponibilidade.
- Horários, tarifas, taxas e transportadores permanecem HOLD_RECHECK.

## NÃO FEITO / MOTIVO
- CMS vivo e external_id não reconciliados: origin indisponível.
- Nenhuma mídia, logo, visual_hash ou copy promovida; não há gates completos.
- Nenhuma publicação WordPress, Meta, Facebook, Instagram ou Google Business.
- Página 2109 não corrigida.

## BLOQUEIO
- WORDPRESS_ORIGIN_UNREACHABLE / PUBLIC_HOME_HTTP_502.
- LIVE_CMS_DEDUPE_PASS=false; EXTERNAL_ID_DERIVATION_PASS=false.
- SHORT_ALIAS_AI_COLLISION=true.
- REAL_MEDIA_VERIFIED=false; MASTER_LOGO_VERIFIED=false; VISUAL_HASH_DEDUPE_PASS=false; COPY_QA_PASS=false; PUBLISHED=false.

## SOLUÇÃO TENTADA
- Releitura do mestre/Drive/Gmail, busca 881 nominal e por códigos, separação explícita de colisões, consulta a fontes oficiais, teste público e diagnóstico WPWriter.
- Conteúdo existente e manutenção preservados, sem bypass destrutivo.

## AÇÃO HUMANA MÍNIMA
- Hospedagem: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção.
- Antes da viagem: reconfirmar passaporte brasileiro, trânsito, finalidade, duração, retorno e regras do transportador com Immigration/companhia.

## PRÓXIMA AÇÃO
- Repetir WordPress, reconciliar Anguilla no CMS vivo por título/slug/external_id e avançar para Montserrat.
- Quando o origin voltar, fazer backup da página 2109, corrigir o callout e confirmar readback.

## ROLLBACK
- Reverter os commits deste ciclo; nenhuma mutação de produção requer rollback.
