# ANG — Checkpoint pré-lançamento — 2026-09-12 10:05 BRT

## WordPress / Site
- Home pública permanece em manutenção: HTTP 503 confirmado em `https://angtravelsolutions.com.br/`.
- Páginas internas liberadas e respondendo HTTP 200: Quem Somos, Serviços & Outsourcing, Luxury Brazil, Conteúdo Global, Sustentabilidade, Fale Conosco, Área Restrita e Acesso ANG.
- `/area-restrita/` redireciona visitante não autenticado para login WordPress; área permanece protegida.
- `/acesso-ang/` contém formulário, campo de senha e link para `/area-restrita/`.
- `Fale Conosco` contém formulário real, consentimento LGPD, nonce, `admin-post.php`, campo honeypot `ang_website` e controle temporal `ang_started_at`.
- Pendente: teste ponta a ponta sucesso/erro real dos formulários; smoke visual mobile/desktop; módulos internos/treinamentos/console.

## Google Business
- Fichas conectadas via Windsor.ai: ANG TRAVEL | Americana (`locations/9303824683971440569`) e ANG TRAVEL SOLUTIONS | Campinas (`locations/13216142187597837770`).
- Ambas OPEN, Voice of Merchant=true, sem duplicidade detectada.
- Posts institucionais publicados e confirmados LIVE em ambas.
- Não desativar, excluir ou duplicar fichas. Alterações de endereço que possam disparar reverificação permanecem bloqueadas sem ação humana.
- Demais localidades homologadas ainda não aparecem conectadas no Windsor.ai.

## Social / Marketing
- Regra absoluta: mídia final somente real/licenciada; zero imagem gerada por IA; somente logos oficiais; zero duplicidade de mídia/tema/copy.
- Todos os visuais IA gerados nesta sessão permanecem REJECTED_DO_NOT_USE.
- Master oficial Canva Luxury Brazil localizado: `DAHT5P7g1tI`.
- Matriz social setembro recuperada em `ops/social/ANG_SOCIAL_READY_REVIEW_MASTER_2026-09-11.md`.
- Pendente: materializar e classificar mídia real; aplicar masters oficiais; anti-duplicação; COPY_QA; programar Meta.

## Hotmart / mídia adquirida
- Compra do produto RD MÍDIAS TUR confirmada por email Hotmart.
- Página do produto aberta na máquina autorizada para sessão autenticada.
- Nenhum arquivo do pacote localizado ainda em Downloads; não declarar os vídeos materializados até o download existir.
- Após download: catalogar tema/formato/origem/licença/hash e aplicar somente ativos compatíveis com padrão ANG.

## Desktop / n8n
- Desktop Commander online em `DESKTOP-VF281R7`.
- Repositório local sincronizado em `staging`.
- `N8N_API_KEY` não presente localmente; auditoria autenticada do n8n segue bloqueada por credencial.
- Workflow social estabelecido: `FzQQYBrgzo2wU8bm`; NÃO usar `n5MIoBQbV5DpWp7H`.
- Não reutilizar payload proibido `CURADORIA_ANG_AGOSTO`.

## Gate 23h
- GO-LIVE ainda NÃO está PASS.
- Principais pendências: smoke visual completo; formulários ponta a ponta; Área Restrita/Console/treinamentos; Concierge inbound/outbound real; fila social setembro com mídia real + logo oficial + anti-duplicação; demais fichas Google não conectadas; curadoria massiva e reconciliação canônica.
- Fail-closed: nenhum PUBLISHED/GO-LIVE/100% sem evidência objetiva.