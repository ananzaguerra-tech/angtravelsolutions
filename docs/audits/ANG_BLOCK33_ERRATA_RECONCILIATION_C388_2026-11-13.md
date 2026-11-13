# ANG Bloco 33 — Errata e reconciliação C388 — 2026-11-13

## Erro identificado

O recibo C387 declarou zero duplicatas canônicas, mas a auditoria ampliada por headings encontrou quatro módulos já existentes: Guadeloupe (Bloco 11/C354), Saara Ocidental, Réunion e Mayotte (Bloco 20, unidades 04–06). A declaração anterior fica revogada.

## Correção aplicada

- Documento C387 `16PG6xksxoSx8S0XKLTAFPg340P1CFBJUMhElBjQwt9Q`: `SUPERSEDED_BY_C388_V2`; não usar como base de publicação.
- Documento reconciliado: https://docs.google.com/document/d/1VXn9S0gGGeBJgjY7x0iLQ8WJcZ5QFhBHSea3kgKrTKM/edit
- Substituições: Guadeloupe→Açores; Réunion→Madeira/Porto Santo; Mayotte→Ilhas Canárias; Saara Ocidental→Rapa Nui.
- Resultado v2: 10 unidades, 160 eixos, 12 `PUBLISHED=false`, zero `PUBLISHED=true`.

## WordPress e integrações

- Home HTTP 503; rotas críticas públicas inacessíveis.
- Runs CI anteriores falharam em `Validate WordPress REST secrets`; o passo de autenticação REST foi `SKIPPED`. Portanto não é correto afirmar falha da autenticação executada: o gate ausente/inválido impediu o teste.
- WPWriter lê conteúdo, settings retorna `403 rest_forbidden`; Jetpack `site_disconnected`; Backup `unavailable/no_site_found`.
- Planilha 881: 881 registros = 844 canônicos `ang_curated` + 37 `ang_lounge`; sete pares duplicados em HOLD; 851 itens do export permanecem drafts.

## Gmail/parcerias

Zero respostas novas de Accor, Club Med, Guilherme Valle/TTW e Simone Pampaloni/Il Borro; nenhuma autorização de mídia/co-marketing.

## Gates

`PUBLISHED=false`; `PUBLIC_P0=false`; `BACKUP_STAGING=false`; `CONSOLE_E2E=false`; `CONCIERGE_E2E=false`.

## Rollback

Excluir apenas o documento v2 e reverter o commit desta errata se a reconciliação for invalidada. Nenhuma superfície pública foi alterada.
