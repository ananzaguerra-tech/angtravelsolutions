# Publication Backlog Audit — 2026-08-27

## Regra de verdade
Nenhum item é tratado como PUBLICADO sem URL, ID, permalink, log, screenshot ou resposta do sistema. Usar somente mídia real/autorizada, logos oficiais e a unidade ANG correta. Destination Wedding pertence a ANG Celebration/Celebrations. ANG Travel Solutions é B2B. Não inventar preço, disponibilidade, endereço ou benefício.

## Publicações recuperadas como pendentes na última semana
- João Pessoa / Bê.Hospitality — campanha pendente; validar oferta/condição atual e mídia real antes de publicar.
- NANNAI Milagres — campanha de novembro pendente; exige pesquisa de disponibilidade/preço real e menor custo válido antes de copy/arte/publicação.
- Livelo / transferência de pontos — refazer criativos sem aparência de IA e comunicar apenas possibilidades comprovadas.
- Vale-viagem — conteúdo/campanha pendente.
- Viagens de incentivo — ANG MICE/Business Travel; conteúdo e publicação pendentes.
- Eventos corporativos — ANG MICE/Business Travel; conteúdo e publicação pendentes.
- Destination Wedding / casamento no destino — somente ANG Celebration/Celebrations; revisar identidade antes de qualquer publicação.
- Benefícios ANG — conteúdo/campanha pendente.
- Cartão de benefícios — conteúdo/campanha pendente; validar regras/elegibilidade antes da divulgação.
- Reembolso — conteúdo informativo pendente.
- Câmbio internacional — conteúdo informativo pendente; validar regras atuais antes de publicar.
- Promoções aéreas — fila contínua; somente tarifas/condições atuais comprovadas.
- Hotelaria — fila contínua de conteúdo/promoções com mídia real e benefícios revalidados.
- Campanhas Prometeu / TTW / TL Portfólio — ingerir somente quando houver mensagem/material real; adaptar sem citar fornecedor ao público quando a regra comercial exigir ocultação.
- Blog & Tendências / Revista — selecionar drafts, deduplicar, imagem destacada real, categorias, SEO/metadescrição, links internos, autoria ANG e diagramação premium antes da publicação.

## Evidência recuperada nesta sessão
- Relatório mestre de 26/08 confirma backlog social de 70 posts e os temas acima como pendências operacionais.
- Canva: busca por `Nannai` retornou 0 designs atuais; busca por `Livelo` retornou 0 designs atuais.
- Canva: busca por `Destination Wedding` retornou apenas peças históricas antigas, portanto nenhuma deve ser tratada automaticamente como campanha atual/aprovada.
- Gmail últimos 7 dias: nenhuma mensagem encontrada com Prometeu/TTW/TL Portfólio pelos termos exatos pesquisados.
- Gmail últimos 7 dias contém oportunidades atuais adicionais para triagem editorial/comercial, incluindo Air France Le Rendez-Vous, Tintswalo Collection 2026, Explora El Chaltén 10% OFF e RailClick; não publicar automaticamente sem validação comercial e enquadramento da unidade correta.
- WordPress MCP: `angtravelsolutions.com.br` está identificado como site Jetpack ativo, porém ferramentas site-scoped estão indisponíveis no conector atual por requisito de plano Jetpack AI/Complete; isso impede publicação direta via este conector nesta sessão, mas não impede preparação/versionamento das filas.

## Estado por trilho
- SOCIAL_META: PENDING_EXECUTION — conexão direta de publicação Meta não disponível neste chat; manter via ZEUS/n8n/Meta Business já existente e exigir permalink/ID como prova.
- CANVA: AUDITED — não existem peças atuais Nannai/Livelo; Destination Wedding encontrado apenas em biblioteca histórica, exige branding review antes de reutilização.
- WORDPRESS_BLOG_REVISTA: BLOCKED_CONNECTOR — site encontrado, porém MCP site-scoped indisponível; usar workflow WordPress/n8n/runner autorizado quando disponível e registrar URL real.
- GOOGLE_BUSINESS: PENDING_EXECUTION — Campinas/Americana somente com dados documentados; evitar duplicidade; demais localidades sem base exata ficam HOLD.
- EMAIL_CAMPAIGNS: INGEST_ACTIVE — oportunidades recentes triadas; Prometeu/TTW/TL não encontrados por termos exatos na janela de 7 dias.

## Ordem de execução
1. Revalidar preço/disponibilidade e mídia para NANNAI/João Pessoa e campanhas de oferta.
2. Produzir/QA de peças com masters oficiais e mídia real.
3. Publicar nas contas/unidades corretas via sessão/API já autorizada e capturar permalink/ID.
4. Atualizar Blog/Revista com SEO + mídia real quando a rota WordPress autenticada estiver disponível.
5. Atualizar fichas Google elegíveis e registrar URL/ID.
6. Repetir a ingestão de campanhas por e-mail a cada ciclo e deduplicar contra o backlog.
