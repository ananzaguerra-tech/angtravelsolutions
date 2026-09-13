# ANG Curadoria — deduplicação REST de metadados (4 países)

checked_at: 2026-09-13T09:05:00-03:00  
site: https://angtravelsolutions.com.br  
mode: READ_ONLY / NO_PUBLISH

## EXECUTADO

- Confirmada exposição permitida do metadado `ang_external_id` pelo endpoint autenticado `/wp/v2/ang_curated` com `context=edit&status=any`.
- Lidas 10 páginas, em ordem crescente de ID: 9 × 100 + 1 × 20 = 920 registros retornados.
- Identificados 844 registros com `ang_external_id` preenchido e 844 valores únicos.
- Pesquisados por correspondência nominal inequívoca: Kiribati, Republic of Kiribati, Nauru, Republic of Nauru, Tuvalu, Libya, Líbia, Libia e State of Libya.
- Resultado nominal em título/slug/metadados: zero correspondências.
- Falsos positivos de código curto foram descartados: `KI` ocorria dentro de “Ski”, não como código de país.

## EVIDÊNCIA

- Registro-modelo: post ID 141581, draft, `ang_external_id` exposto.
- Paginação: [100,100,100,100,100,100,100,100,100,20].
- Total REST ativo/não-lixeira observado: 920.
- Canônicos com identificador: 844/844 não vazios e únicos.
- Correspondências nominais inequívocas dos quatro países: 0.

## STATUS

`LIVE_TITLE_SLUG_META_NAME_ZERO_MATCH_PASS`

O resultado global permanece `HOLD_EXTERNAL_ID_DERIVATION_NOT_PROVEN`. Os identificadores são hashes opacos; sem a regra/fonte que deriva o hash dos candidatos, a simples unicidade dos 844 valores não comprova ausência por ISO. Nenhum país foi promovido a `NEW_CANONICAL_CANDIDATE`.

## NÃO FEITO

- Não criado `post_id`, slug, `external_id` ou conteúdo.
- Não publicado nem alterado qualquer registro.
- Não consultado banco/CLI administrativo.
- Não inferida equivalência de hashes.

## MOTIVO / BLOQUEIO

A conta conectada não possui `manage_options`, e a regra determinística que gera `ang_external_id` a partir da fonte 881 não está comprovada no canal atual.

## SOLUÇÃO TENTADA

Uso da REST autenticada autorizada para inspecionar integralmente títulos, slugs e metadados expostos, evitando WP-CLI e qualquer escrita.

## AÇÃO HUMANA MÍNIMA

Disponibilizar somente a regra/documentação de geração de `ang_external_id` ou uma exportação read-only da chave fonte→hash. Não é necessário conceder acesso de escrita.

## PRÓXIMA AÇÃO

Reproduzir os hashes candidatos de Kiribati, Nauru, Tuvalu e Líbia pela regra aprovada e comparar contra o conjunto dos 844 IDs. Somente zero-match integral permitirá classificar os países como novos candidatos canônicos.

## ROLLBACK

Não aplicável: ciclo estritamente de leitura; nenhuma mutação foi realizada.
