# Checkpoint pré-lançamento — 2026-09-12

## Smoke externo páginas internas
Validação executada a partir da máquina autorizada. As seguintes rotas responderam HTTP 200 com conteúdo substancial renderizado:
- /quem-somos/ — 31.907 caracteres visíveis
- /servicos-outsourcing/ — 41.181
- /luxury-brazil/ — 31.711
- /conteudo-global/ — 30.976
- /sustentabilidade/ — 31.232
- /blog-tendencias/ — 30.966
- /private-collections/ — 27.476
- /revista-ang/ — 31.358
- /fale-conosco/ — 30.494
- /acesso-ang/ — 30.328

Conclusão: páginas internas críticas não estão vazias; o problema de indisponibilidade global foi removido anteriormente e a Home permanece sob manutenção conforme regra operacional.

## Secure Forms
Patch server-side foi preparado em draft de tema anteriormente, mas ainda não promovido. Motivo atual: WPVibe atingiu o limite diário do plano Free e a promoção segura via draft ficou indisponível dentro do deadline. O handler do plugin instalado não existe no repositório local e não será alterado por extração de cookies/sessão ou elevação de privilégio.

## Social
Instagram angtravelbr: publicação verificada media_id 18384008782231598, permalink https://www.instagram.com/p/DdMXueNF7lb/ usando mídia real/licenciada. Segunda publicação Quiet Luxury retornou media_id 17976651516103593; permalink ainda sem propagação no conector no momento do checkpoint.
Facebook Organic via Windsor: tentativa bloqueada pela Meta por ausência de pages_manage_posts; nenhuma publicação foi reivindicada como concluída.

## Conteúdo
Private Collections enriquecida com mídia real/licenciada de aviação privada e crédito explícito.
Revista ANG e Blog & Tendências ampliados com categorias editoriais aprovadas.

## Treinamentos
CPT ang_training identificado. Existem módulos publicados e drafts genéricos sem ang_video_url/quiz/metadados completos. Biblioteca ang_resource retornou vazia; drafts incompletos não devem ser publicados apenas para aumentar contagem.

## Bloqueios correntes
- WPVibe daily fair-use limit até ~2026-09-13 10:00 UTC.
- Secure Forms ainda falha nos testes negativos em produção até promoção do patch.
- Facebook Organic sem pages_manage_posts.
- n8n API local sem N8N_API_KEY.
- Google Drive com storageQuotaExceeded.

## Gate 23h
Manter fail-closed: só marcar GO-LIVE total se P0 crítico tiver evidência. Um bloqueio não paralisa frentes independentes.