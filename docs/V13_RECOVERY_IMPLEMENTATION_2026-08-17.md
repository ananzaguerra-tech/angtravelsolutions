# ANG Travel Solutions — V13 Recovery Implementation

Data: 2026-08-17
Branch: recovery/v13-staging-2026-08-17
Base: staging

## Objetivo

Consolidar uma trilha segura e reversível para recuperar e homologar o layout V13 sem tocar diretamente em produção.

## Regras

- Produção permanece em manutenção até homologação P0.
- Nenhum downgrade de tema/plugin.
- Nenhuma publicação massiva da Curadoria.
- Nenhuma logo improvisada ou reconstruída por inferência.
- Imagens reais e específicas, com rastreabilidade/licença.
- Alterações visuais entram primeiro em staging e devem ter rollback simples.

## P0 visual

1. Unificar o HTML do buscador da Home com o CSS/JS V13.
2. Preservar e aplicar apenas logos oficiais aprovadas.
3. Substituir imagens demonstrativas/repetidas por mídia editorial real.
4. Validar Home nos breakpoints 360, 390, 768, 1024, 1366, 1440 e 1920 px.
5. Manter os 881 registros de Curadoria fora da publicação até novo quality gate.
6. Validar menu, Login Área do Agente, WhatsApp, foco, teclado e contraste.

## P1 editorial

- Padronizar CTA para Área Restrita / Login Área do Agente.
- Implementar seletor de idiomas somente para rotas realmente disponíveis.
- Hero próprio por página institucional.
- Privilege com capas, artigos, datas, categorias e CTA reais.
- Estados hover/focus/active/disabled consistentes.
- SEO, schema, breadcrumb, canonical e hreflang por página.

## P2 robustez

- Remover CSS crítico duplicado após homologação.
- Substituir dependência de nth-of-type por classes editoriais explícitas.
- Consolidar tokens de layout, espaçamento, raio, sombra e foco.
- prefers-reduced-motion e fallback sem backdrop-filter.
- WebP/AVIF por breakpoint e lazy loading abaixo da dobra.

## Gate para promoção

Só promover staging quando houver:

- screenshots antes/depois;
- zero overflow/sobreposição nos breakpoints definidos;
- links e formulários testados;
- logos oficiais corretas;
- mídia real validada;
- navegação por teclado;
- contraste AA;
- rollback documentado;
- nenhum conteúdo bloqueado publicado.
