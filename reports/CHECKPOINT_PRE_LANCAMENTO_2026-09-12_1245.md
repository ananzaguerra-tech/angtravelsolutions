# ANG / Curadoria — Checkpoint pré-lançamento — 2026-09-12 12:45 BRT

## Evidências novas deste ciclo
- Instagram orgânico `angtravelbr`: post publicado via Windsor.ai com mídia real/licenciada. Media ID `18384008782231598`; permalink `https://www.instagram.com/p/DdMXueNF7lb/`.
- Mídia usada: `Private-Jet-Interior-Paris_Air_Show_20192C_Le_Bourget_28SIAE109729-scaled.jpg`, já hospedada no WordPress; metadados indicam crédito Matti Blume e licença CC BY-SA 4.0.
- Facebook Organic Windsor.ai: tentativa de publicação na página ANG Travel Solutions recusada pela Meta por ausência de `pages_manage_posts`; nenhuma publicação foi criada.
- Private Collections (page ID 67208) enriquecida com a mesma mídia real/licenciada e crédito explícito; conteúdo existente preservado.
- WordPress ANG Enterprise expõe rotas `marketing/status` e `marketing/queue/next`, porém o usuário WPVibe conectado recebe 403 para `marketing/status`; não houve elevação de privilégio.
- Secure Forms: correção server-side permanece pronta no draft do tema, ainda não promovida por exigir confirmação explícita de publicação do draft após preview.
- Drive `00_COMANDO_CENTRAL`: atualização direta continua bloqueada por `storageQuotaExceeded`; nada foi apagado para liberar espaço.

## Estado pré-lançamento
- Home: manutenção somente na Home.
- Páginas internas principais: públicas e acessíveis.
- Revista ANG / Blog & Tendências: ampliados e publicados.
- Google Business: Campinas e Americana OPEN; posts publicados e LIVE; sem desativar fichas.
- Instagram: canal orgânico operacional e primeira peça deste ciclo PUBLISHED com permalink real.
- Facebook orgânico: leitura/conexão existe, escrita bloqueada por permissão Meta.
- n8n: base HTTP 200; API autenticada ainda sem `N8N_API_KEY` local; workflow social conhecido `FzQQYBrgzo2wU8bm`; não reutilizar payload agosto.

## Pendências / bloqueios
1. Publicar draft do tema somente após comando explícito da titular; depois repetir testes Secure Forms (válido, honeypot, e-mail/consentimento inválidos).
2. Corrigir permissão Meta `pages_manage_posts` ou usar outro canal autorizado para Facebook orgânico.
3. Mapear/publicar os demais perfis Instagram/FB por unidade de negócio; apenas `angtravelbr` e duas Pages FB estão conectados no Windsor.
4. Finalizar mídia real/licenciada + anti-duplicidade para fila social de setembro; IA final proibida.
5. Área do Agente/treinamentos: mapear conteúdo dinâmico e permissões; evitar preencher shells que já renderizam via shortcode.
6. Curadoria mundial: continuar reconciliação 881/WORLD e expansão por país/cidade com fontes/checked_at/media manifest.
7. Drive: liberar cota ou usar GitHub como espelho até o bloqueio ser resolvido.

## Regras de rollback
- Não apagar menu antigo, fichas Google, conteúdo aprovado ou mídia original.
- Toda alteração WordPress deve preservar revisão/rollback quando aplicável.
- Não elevar capabilities do usuário WPVibe sem autorização específica.
