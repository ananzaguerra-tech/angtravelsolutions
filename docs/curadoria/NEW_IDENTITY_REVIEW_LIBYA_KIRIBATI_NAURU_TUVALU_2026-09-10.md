# ANG Curadoria — NEW_IDENTITY_REVIEW — Líbia, Kiribati, Nauru, Tuvalu

Data de checagem: 2026-09-10
Branch: staging
Status: NEW_IDENTITY_REVIEW / NÃO PUBLICADO

## Gate canônico

- Busca nominal direta na planilha `ANG_WP_IDENTITY_MAP_881_FINAL_2026-08-17`: 0 matches para Líbia, Kiribati, Nauru e Tuvalu.
- Busca preliminar consolidada no Drive não localizou lote/documento explícito para estes quatro nomes.
- Nenhum `external_id`, `post_id`, slug final ou publicação foi criado nesta etapa.
- Antes de CMS: validar WORLD/aliases/territories e executar deduplicação final.

## 1. LÍBIA — RESTRICTED_QA

Linha editorial preliminar: patrimônio arqueológico e histórico, Mediterrâneo, Saara, artesanato e cultura; NÃO converter em campanha comercial automática enquanto alertas de segurança permanecerem restritivos.

Fonte oficial de turismo:
- Ministério do Turismo e Artesanato da Líbia — https://tourism.gov.ly/
- Sobre o Ministério — https://tourism.gov.ly/about/

Segurança dinâmica:
- FCDO Libya travel advice — https://www.gov.uk/foreign-travel-advice/libya
- checked_at: 2026-09-10
- Estado observado: há áreas com recomendação contra toda viagem e áreas com recomendação contra viagens não essenciais. Manter `RESTRICTED_QA`; validar mapa/zonas imediatamente antes de qualquer uso operacional.

Conteúdo permitido agora: estrutura editorial e patrimônio. Conteúdo bloqueado: promessa comercial, roteiro operacional ativo, segurança/entrada sem revalidação, mídia sem licença.

## 2. KIRIBATI — READY_FACT_QA

Linha editorial preliminar: Tarawa, Kiritimati, cultura I-Kiribati, pesca, história da Segunda Guerra, patrimônio marinho e experiências remotas.

Fontes oficiais:
- Tourism Authority / Kiribati Tourism — https://kiribatitourism.gov.ki/
- Things to do — https://kiribatitourism.gov.ki/things-to-do
- Ministry of Foreign Affairs & Immigration — https://www.mfa.gov.ki/immigration/
- Visa — https://www.mfa.gov.ki/visa/

Segurança/entrada de apoio:
- FCDO Kiribati — https://www.gov.uk/foreign-travel-advice/kiribati
- checked_at: 2026-09-10

Nota editorial validada: o órgão oficial destaca pesca, sítios históricos da Segunda Guerra, grupos Gilbert/Phoenix e experiências de baixa densidade. Regras de visto variam por nacionalidade; não publicar regra genérica para passageiro brasileiro sem fonte consular específica.

## 3. NAURU — READY_FACT_QA

Linha editorial preliminar: ilha remota do Pacífico, história local, costa, paisagem insular, experiência de baixa densidade e logística especializada.

Fonte oficial governamental:
- Government of the Republic of Nauru — Visiting Naoero — https://www.nauru.gov.nr/about-naoero/visiting-naoero.aspx

Informações operacionais oficiais atualmente expostas: oferta de hospedagem limitada, ausência de transporte público e recomendação de carro alugado; clima geralmente quente. Tudo deve ser revalidado na data da cotação.

Segurança/entrada de apoio:
- FCDO Nauru — https://www.gov.uk/foreign-travel-advice/nauru
- Entry requirements — https://www.gov.uk/foreign-travel-advice/nauru/entry-requirements
- checked_at: 2026-09-10

Regra: requisitos de visto/passaporte do FCDO citados são para passaporte britânico; para conteúdo ANG voltado a brasileiros/estrangeiros, usar autoridade competente da nacionalidade do passageiro antes de publicar orientação específica.

## 4. TUVALU — READY_FACT_QA

Linha editorial preliminar: Funafuti, ambiente marinho, lagoas, recifes, ilhas remotas, cultura e dança tradicional, conservação e turismo de baixa densidade.

Fonte oficial de turismo:
- Timeless Tuvalu — https://www.timelesstuvalu.com/
- O próprio site declara ser de propriedade e operação do Governo de Tuvalu e gerido pelo ministério responsável por turismo.

Segurança dinâmica:
- FCDO Tuvalu — https://www.gov.uk/foreign-travel-advice/tuvalu
- checked_at: 2026-09-10

Conteúdo editorial validável agora: conservação marinha, diving/snorkeling, cultura/dança, touring the islands, história/arqueologia. Entrada e conectividade aérea devem receber fonte oficial específica e checked_at antes de uso operacional.

## Gates comuns antes de READY_QA

1. Confirmar ausência em WORLD/aliases e resolver identidade canônica.
2. Definir cidades/ilhas prioritárias e slugs apenas após dedupe.
3. Revalidar entrada por nacionalidade-alvo e segurança com fonte oficial.
4. Criar manifesto de mídia real/licenciada: origem, autor, licença, SHA-256/perceptual hash e alt text.
5. Preparar SEO title/meta/canonical/schema/breadcrumb sem publicar.
6. WordPress somente após `WORDPRESS_AUTH_OK`, backup/restore testado e rollback.
7. Nenhum social derivado até existir peça específica em READY_REVIEW e aprovação final da proprietária.

## Estado desta execução

- CMS_MUTATION_EXECUTED=false
- SOCIAL_PUBLICATION_EXECUTED=false
- NEW_EXTERNAL_ID_CREATED=false
- PRODUCTION_CHANGED=false

## Rollback

Reverter somente este arquivo de staging. Nenhum sistema externo foi alterado.
