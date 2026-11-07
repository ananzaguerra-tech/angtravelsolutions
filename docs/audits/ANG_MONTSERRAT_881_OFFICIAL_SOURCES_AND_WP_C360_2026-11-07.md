# ANG Curadoria — Montserrat — C360

checked_at: 2026-11-07T01:02:12-03:00  
status: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING

## EXECUTADO
- Relatório mestre v71 e Bloco 12 relidos; Montserrat confirmada como unidade 02.
- Gmail consultado: nenhuma nova resposta positiva qualificável de Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Oito buscas 881 por Montserrat, Monserrate, MS e MSR nas duas abas canônicas: zero matches.
- Turismo, imigração, acesso aéreo, formulário e operação marítima revalidados em fontes oficiais.
- WordPress e Área Restrita testados; origin permanece indisponível.

## EVIDÊNCIA / URL / ID / COMMIT
- Bloco 12: https://docs.google.com/document/d/1UG-jyMfT0PZUMyLgg18EMgoxF-_Mfe7sGHDv6Kg5FuU/edit
- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Turismo: https://www.visitmontserrat.com/
- Atrações: https://www.visitmontserrat.com/places-to-see/
- Acesso aéreo: https://www.visitmontserrat.com/air/
- Acesso marítimo: https://www.visitmontserrat.com/sea/
- Imigração: https://www.immigration.ms/countries/visa_not_required
- Lei migratória: https://www.gov.ms/wp-content/uploads/2026/02/13.01-Immigration-Act.pdf
- Formulário: https://www.travelmontserrat.gov.ms
- WordPress: https://angtravelsolutions.com.br/
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/

## CURADORIA OFICIAL
- Destinos reconciliados: Little Bay, Brades, Salem, Plymouth, Soufrière Hills, Montserrat Volcano Observatory, National Museum e St. George's Hill.
- Plymouth está na Exclusion Zone e só pode ser acessada com guia certificado; St. George's Hill exige aplicação à DMCA por guia certificado.
- Brasil consta nominalmente na lista oficial Visa Not Required; a lei revisada até 01/01/2025 também inclui Brazil na classe isenta. Classificação PASS_DATED_RECHECK, sem garantia de admissão.
- Fonte aérea exige passaporte válido por seis meses após a data planejada de retorno e formulário Immigration/Customs online.
- A página dedicada ao mar informa ferry discontinued until further notice / out of service. A home genérica ainda descreve ferry como opção; prevaleceu HOLD_SOURCE_CONFLICT e nenhuma operação marítima foi prometida.
- Voos, horários, tarifas, taxas e transportadores permanecem HOLD_RECHECK.

## NÃO FEITO / MOTIVO
- CMS vivo/external_id não reconciliados: origin indisponível.
- Nenhuma mídia, logo, visual_hash ou copy promovida.
- Página 2109 não corrigida.
- Nenhuma publicação WordPress, Meta, Facebook, Instagram ou Google Business.

## BLOQUEIO
- WORDPRESS_ORIGIN_UNREACHABLE / PUBLIC_HOME_HTTP_502.
- LIVE_CMS_DEDUPE_PASS=false; EXTERNAL_ID_DERIVATION_PASS=false.
- SEA_ACCESS=HOLD_SOURCE_CONFLICT; FERRY_OUT_OF_SERVICE.
- REAL_MEDIA_VERIFIED=false; MASTER_LOGO_VERIFIED=false; VISUAL_HASH_DEDUPE_PASS=false; COPY_QA_PASS=false; PUBLISHED=false.

## SOLUÇÃO TENTADA
- Releitura mestre/Drive/Gmail, oito buscas 881, consulta a turismo, atrações, imigração, lei, transporte aéreo e marítimo oficiais, teste público e diagnóstico WPWriter.
- Conflito de fontes marítimas isolado e resolvido de forma conservadora pela página operacional dedicada, sem prometer ferry.

## AÇÃO HUMANA MÍNIMA
- Hospedagem: restaurar origin/PHP/banco/upstream preservando conteúdo e manutenção.
- Antes da viagem: confirmar com Immigration/transportador passaporte, trânsito via Antigua/Sint Maarten, finalidade, duração, retorno, formulário e operação aérea atual.

## PRÓXIMA AÇÃO
- Repetir WordPress, reconciliar Montserrat no CMS vivo por título/slug/external_id e avançar para Saint-Martin.
- Quando o origin voltar, fazer backup da página 2109, corrigir o callout e confirmar readback.

## ROLLBACK
- Reverter os commits deste ciclo; nenhuma mutação de produção requer rollback.
