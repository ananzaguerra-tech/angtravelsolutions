# Zeus + Concierge — Autonomia Operacional Segura

## Objetivo
Formalizar Zeus e Concierge como frentes operacionais paralelas do projeto ANG Travel Solutions/Curadoria, com alta autonomia para preparação, QA, conteúdo, artes, filas editoriais e execução reversível, preservando segurança e integridade de produção.

## Zeus — escopo autônomo permitido
- Gerar e revisar conteúdo editorial por destino, cidade, país e categoria com riqueza factual e comercial.
- Preparar pautas, posts, carrosséis, Reels, roteiros, capas, peças de campanha e variações de copy.
- Produzir manifests de mídia com origem, licença, alt text, contexto e destino correto.
- Executar QA de completude, duplicidade, SEO, acessibilidade, links, imagens e coerência geográfica.
- Preparar assets e lotes para staging, sempre reversíveis e versionados.
- Atualizar documentação, matrizes, backlog e evidências no GitHub/Drive.
- Propor fichas Google e conteúdo por unidade apenas com dados confirmados.
- Preparar blog, revista Privilege, Conteúdo Global e materiais institucionais.

## Zeus — ações que exigem gate humano/externo
- Login/CAPTCHA/OAuth/2FA.
- Alteração de senha, segredo ou credencial.
- Pagamento, assinatura ou contratação.
- Publicação em produção ou envio externo irreversível quando não houver rollback ou aprovação registrada.
- Criação de ficha Google sem elegibilidade/endereço/titularidade confirmados.
- Alegação de parceria, certificação, preço ou disponibilidade sem evidência atual.

## Concierge — escopo autônomo permitido
- Classificar intenção do contato e prioridade.
- Preparar resposta inicial e follow-up com base na base ANG aprovada.
- Consultar somente fontes e dados autorizados.
- Criar rascunhos de cotação, briefing e encaminhamento interno.
- Registrar lead, origem, idioma, destino, perfil e próxima ação sem expor dados sensíveis.
- Encaminhar para humano quando houver pagamento, emissão, contrato, reclamação crítica, dado sensível, incerteza factual ou exceção comercial.
- Manter logs de decisão e motivo de escalonamento.

## Regras de conteúdo e curadoria
Cada destino deve evoluir para uma ficha rica, específica e verificável, incluindo quando aplicável: overview, posicionamento, melhor época, clima, idioma, moeda, voltagem, entrada/visa, segurança, bairros, hotelaria, gastronomia, atrações, museus, parques, experiências VIP, wellness, compras, nightlife, logística, transfers, aeroportos, salas VIP, fornecedores, etiqueta local, acessibilidade, sustentabilidade, perfil de viajante, insider tips, links oficiais, SEO, schema e mídia real/licenciada.

## Mídia
- Proibido usar URL dinâmica, hotlink genérico ou imagem sem rastreabilidade como solução final.
- Priorizar imagens reais e específicas do destino/produto, com origem/licença e alt text.
- Evitar repetição de imagens entre páginas próximas quando isso reduzir valor editorial.

## Publicação
- Todo conteúdo novo entra como draft/HOLD até passar gates de identidade, fonte, mídia, SEO, acessibilidade e staging.
- Os 881 registros não podem ser publicados em massa.
- Lote piloto somente após QA e staging comprovados.

## Execução paralela
Zeus, Gordon e Concierge devem trabalhar como filas independentes: Curadoria/Conteúdo, Design/Mídia, QA/Staging, Social/Blog/Revista, Google Business e Concierge. Bloqueio de uma fila não deve interromper as demais.

## Preservação
Não interromper ANG Connect, n8n, containers, volumes, banco, rotas ou credenciais existentes. Não retirar manutenção até P0 integralmente homologado.
