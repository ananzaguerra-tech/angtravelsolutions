# ANG C385 — Bloco 31: Territórios Polares e Austrais

Data de checagem: 2026-11-12  
Estado: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publicação: `PUBLISHED=false`

## EXECUTADO

- Curadoria robusta de 10 unidades e 160 eixos: cidades/sítios/módulos, logística, acesso, riscos, SEO, schema, CTA condicionado, fontes oficiais e `checked_at`.
- Dedupe somente leitura da base 881: 883 linhas do `Item Register`, 20 do `WP Export Identity 24-07`, intervalo `A1:Z1900`, 60 aliases.
- Resultado: zero hits brutos, zero matches canônicos, zero falsos positivos e zero erros; `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Documento nativo no Drive criado e relido: 10 unidades, 160 eixos, 11 marcadores `PUBLISHED=false`, zero `PUBLISHED=true`.
- WordPress/Console diagnosticados somente leitura; Gmail de parcerias verificado.

## EVIDÊNCIA | URL/ID

- Drive: https://docs.google.com/document/d/1-Ga_ztJ9p6TVGXXfSBYd2Wh0T4ptLkcdsDoAT9AoFxw/edit
- Planilha 881: `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`
- WPWriter site: `6445b831-8563-4c9a-8f58-fb8bec94af13`
- WordPress: página 108 publicada; Acesso ANG 153423 publicado; Área Restrita 2109 publicada.

## FONTES OFICIAIS E DECISÕES

| Unidade | Decisão fail-closed | Fontes |
|---|---|---|
| Ilhas do Mar de Coral | `HOLD_GENERAL_CTA_MANAGED_ACCESS` | Parks Australia; Coral Sea Management Plan; Australian territories |
| Heard e McDonald | `HOLD_PERMIT_5M_SELF_SUFFICIENT_RARE_TOURISM` | Australian Antarctic Program |
| Território Antártico Australiano | `HOLD_OPERATOR_ENVIRONMENTAL_AUTHORISATION_ANTARCTIC_TREATY` | Australian Antarctic EIA/permits |
| Território Antártico Britânico | `HOLD_TREATY_PARTY_PERMIT_AUTHORISED_OPERATOR` | FCDO permit; UK travel advice |
| TAAF | `HOLD_TAAF_ACCESS_AUTHORISATION_AND_VISA_RECHECK` | TAAF access/mooring; TAAF visa |
| Dependência de Ross | `HOLD_NZ_MFAT_ENVIRONMENTAL_AUTHORISATION_OPERATOR` | Antarctica New Zealand |
| Ilha Bouvet | `HOLD_HELICOPTER_PERMIT_NATURE_RESERVE_NO_TOURISM_CTA` | Norwegian Polar Institute |
| Geórgia do Sul/Sandwich | `CONDITIONAL_READY_PERMITTED_SEA_OPERATOR_RECHECK` | GSGSSI visit/entry/fee pages |
| Ilha Pedro I | `HOLD_NPI_NOTIFICATION_1Y_ENVIRONMENTAL_SAR_INSURANCE` | Norwegian Polar Institute; Norway government |
| Terra da Rainha Maud | `HOLD_NPI_NOTIFICATION_1Y_ENVIRONMENTAL_SAR_INSURANCE` | Norwegian Polar Institute; Norway government |

## WORDPRESS/SITE P0 E CONSOLE

- WPWriter ativo via REST; configurações protegidas com `403 rest_forbidden`.
- Jetpack/backup blog `256300923`: `unavailable/no_site_found`; WordPress.com `NOT_FOUND`.
- Página 108 mantém 14 `data-map-address` com endereços completos e 14 spans ocultos equivalentes.
- `/area-restrita-ang/` reconfirmado em 18 páginas `DRAFT`; zero nas páginas críticas 108, 153423 e 2109.
- Readback de 24 páginas não encontrou termos proibidos nos candidatos publicados inspecionados.
- Sem nova evidência de recuperação do origin; último estado público confirmado: HTTP 503.
- Gates: `PUBLIC_P0_PASS=false`, `BACKUP_STAGING_PASS=false`, `RBAC_PASS=false`, `CONSOLE_E2E_PASS=false`.

## PARCERIAS / GMAIL

- Accor, Club Med, Guilherme Valle/TTW e Simone Pampaloni/Il Borro: zero mensagens novas após C384 e nas últimas duas horas, excluindo spam/lixeira.
- Nenhuma autorização de co-marketing, mídia ou logo; nenhum artigo/post institucional autorizado.

## NÃO FEITO | MOTIVO | BLOQUEIO

- Nenhuma mutação WordPress: backup, staging e rollback não verificáveis; origin ainda sem prova de recuperação.
- Nenhuma publicação social/Google/Blog e nenhum Reel Miami/Il Borro: `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` e `COPY_QA_PASS` não fechados.
- Nenhuma mutação Meta/n8n/Concierge: falta execução inbound/outbound real e evidência; payload proibido não foi usado.
- Nenhuma alteração Google Business: não houve ficha OPEN/verified comprovada neste ciclo.
- Nenhuma derivação de `external_id`: CMS vivo indisponível para dedupe.

## SOLUÇÃO TENTADA

- Diagnóstico WPWriter/WordPress.com/Jetpack; inspeção das páginas críticas e drafts; dedupe offline ampliado; pesquisa em fontes oficiais; criação de documento Drive com readback; verificação Gmail recente.

## AÇÃO HUMANA MÍNIMA

1. Restaurar origin/DNS e reconectar Jetpack; confirmar backup e staging antes da correção da página 108/CTAs.
2. Fornecer/validar masters oficiais e autorizações escritas de mídia/co-marketing.
3. Executar o teste Concierge real de entrada/saída com número autorizado e evidência.

## PRÓXIMA AÇÃO

- Continuar o Bloco 32 sem reiniciar os Blocos 12–31; após backup/staging, corrigir reversivelmente a página 108 e CTAs draft, validar RBAC e cotação E2E.

## ROLLBACK

- Curadoria: remover somente o Google Doc C385 e commits de evidência se defeito de integridade for comprovado; nenhum registro CMS foi criado.
- WordPress/Social/GBP/n8n: não aplicável, pois nenhuma mutação foi feita.
