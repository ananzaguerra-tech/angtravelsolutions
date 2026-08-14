# Área Restrita do Agente — Especificação V1

## Objetivo
Criar um ambiente premium, seguro e operacional para agentes, afiliados e franqueados da ANG Travel Solutions, preservando o ANG Connect existente em `http://localhost:8088` como produto paralelo.

## Dashboard principal
- Boas-vindas personalizada
- Indicadores: cotações abertas, propostas enviadas, reservas, pendências, comissões e treinamentos
- Atalhos rápidos para Wooba, Infotravel, Sabre, CRM, Financeiro e Relatórios
- Painel de avisos, promoções, campanhas e comunicados
- Busca global por destino, hotel, fornecedor, treinamento e documento

## Módulos obrigatórios
1. **Conteúdo Global**
   - País → Cidade → Atrações, museus, parques, restaurantes e informações úteis
   - Filtros por perfil, categoria, estação, orçamento e tipo de experiência

2. **Hotelaria**
   - Filtros por país, cidade, rede, selo e perfil
   - Virtuoso, Serandipians, LHW, SLH, Relais & Châteaux, Aman, Rosewood, Six Senses, Green Key e demais parceiros

3. **Fornecedores**
   - Companhias aéreas, receptivos, locadoras, consolidadoras, operadoras e prestadores
   - Contatos, políticas, canais de atendimento, horários e documentos

4. **Console de Cotação**
   - Seleção de viajante, destino e serviços
   - Inclusão de voos, hotéis, traslados, passeios, seguros e experiências
   - Geração de link e PDF com identidade ANG
   - Histórico, versões, observações e aprovação

5. **Marketing Dashboard**
   - Biblioteca de templates por marca
   - Calendário editorial
   - Planejamento, aprovação e agendamento de posts
   - Banco de imagens, vídeos, logos e legendas
   - Geração de campanhas por fornecedor, destino e público
   - Indicadores de alcance, leads, cliques e conversões

6. **Espaços ANG Worldwide**
   - Solicitação de coworking e salas de reunião em destinos internacionais
   - Reserva sujeita à disponibilidade
   - Fluxo: solicitação → análise → confirmação → voucher

7. **Treinamentos**
   - Onboarding, cultura, conduta, política comercial, fluxos e SLA
   - Wooba, Infotravel, Sabre, CRM, vendas, marketing, luxo, MICE e corporativo
   - Certificados e progresso

8. **Financeiro**
   - Faturas, pagamentos, comissões, condições comerciais e documentos

9. **Relatórios e BI**
   - Vendas, destinos, fornecedores, margem, conversão, produtividade e campanhas

10. **Meu Perfil e Segurança**
    - Dados pessoais e empresariais
    - Preferências, permissões, autenticação em dois fatores e dispositivos
    - Integrações por OAuth/tokens; nunca exibir senhas em texto aberto

## Facilities e ferramentas
- Agenda e compromissos
- Central de documentos
- Biblioteca institucional
- Revista Privilege
- Promoções de fornecedores
- Salas VIP
- Private Collections: Ski, Jets, Yachts, Cruzeiros, Villas e Grupos
- Intranet e comunicados
- Suporte 24/7

## Diretriz visual
- Layout internacional premium
- Fundo escuro sofisticado, dourado quente, creme e navy
- Montserrat para interface e Playfair para títulos editoriais
- Cards com respiro, hierarquia clara e sem repetição visual
- Cada módulo deve ter hero, iconografia e imagens próprias
- Responsivo para desktop, tablet e celular

## Segurança e governança
- Perfis: Administrador, Gestor, Agente, Afiliado, Franqueado e Financeiro
- Logs de auditoria
- Aprovação humana para publicação e ações críticas
- Backup e rollback antes de mudanças de produção
- Nenhuma alteração no ANG Connect sem validação específica

## Critérios de aceite
- Todas as rotas funcionais
- Sem páginas vazias
- Sem imagens quebradas
- Sem duplicação de templates
- Contraste e acessibilidade validados
- SEO e desempenho mínimos aprovados
- Conteúdo e integrações marcados como ativo, pendente ou bloqueado
