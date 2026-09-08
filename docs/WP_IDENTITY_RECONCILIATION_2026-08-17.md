# WordPress Identity Reconciliation — 2026-08-17

## Fontes
- Export: `angtravelsolutions.WordPress.2026-07-24.xml`
- Dataset mestre: `ANG_V10_02_CURADORIA_CONTEUDO_IMPORTACAO.csv` — 881 registros
- Controle oficial: `ANG_CONTROLE_IMPORTACAO_AMPLIADA_881_2026-08-14`

## Resultado final
- Dataset fonte: 881 registros.
- 844 registros correspondem canonicamente ao CPT `ang_curated`.
- 37 registros da categoria `Salas VIP` correspondem ao CPT `ang_lounge`.
- Cobertura de identidade do dataset: **881/881 contabilizados**.
- Todos os 881 registros-fonte possuem correspondência por `ang_seo_title` exato + CPT esperado no export de 24/07.
- O export contém 851 linhas `ang_curated` porque existem 7 pares duplicados adicionais; esses pares permanecem HOLD/quarentena e não aumentam a cobertura do dataset fonte.

## Duplicidades `ang_curated` em HOLD
1. Four Seasons | Lisboa — posts 142135 / 142136
2. Rosewood | Lisboa — posts 142137 / 142138
3. Belmond | Lisboa — posts 142139 / 142140
4. Aman | Lisboa — posts 142141 / 142142
5. Six Senses | Lisboa — posts 142143 / 142144
6. Relais & Châteaux | Lisboa — posts 142145 / 142146
7. The Leading Hotels of the World | Lisboa — posts 142147 / 142148

## Explicação do gap anteriormente estimado
O cálculo inicial tratou apenas `ang_curated` e, por isso, inferiu incorretamente uma lacuna restante. A inspeção do dataset mestre mostrou que os 37 registros fora de `ang_curated` são exatamente `Salas VIP`. No export WordPress, todos os 37 aparecem como `ang_lounge`, com Post ID e External ID próprios. Logo não existem 30 registros órfãos nesta reconciliação; o gap de identidade foi fechado.

## Regra de associação usada
- Chave editorial de reconciliação: `ang_seo_title` exato do export contra `seo_title` do dataset mestre.
- Tipo esperado: `ang_lounge` quando a categoria é `Salas VIP`; `ang_curated` nos demais 844 registros.
- Não usar apenas título simples para escrita/importação.
- Para qualquer mutação futura, manter `ang_external_id` + Post ID canônico como identidade operacional.

## Evidência no Drive
- `ANG_WP_IDENTITY_MAP_881_FINAL_2026-08-17` — mapa final dos 881 registros, com Post ID, External ID, CPT, status e duplicidades.
- A planilha oficial `ANG_CONTROLE_IMPORTACAO_AMPLIADA_881_2026-08-14` foi atualizada na aba `WP Export Identity 24-07` para registrar 881/881 contabilizados.

## Estado de publicação
Esta reconciliação fecha somente o gate de identidade. QA de texto, fontes, mídia/licença, duplicidade, SEO, staging, rollback e aprovação editorial continuam obrigatórios. Nenhuma publicação em massa em produção é autorizada por este documento.