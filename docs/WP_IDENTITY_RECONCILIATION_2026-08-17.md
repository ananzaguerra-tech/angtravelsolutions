# WordPress Identity Reconciliation — 2026-08-17

## Fonte
- Export: `angtravelsolutions.WordPress.2026-07-24.xml`
- Controle oficial: `ANG_CONTROLE_IMPORTACAO_AMPLIADA_881_2026-08-14`

## Resultado extraído do export
- `ang_curated`: 851 registros.
- Todos os 851 estão em `draft` no export.
- Todos os 851 possuem `ang_external_id`/`_ang_external_id` preenchido.
- 844 External IDs distintos.
- 7 External IDs duplicados, correspondendo a 7 pares de posts adicionais.
- 851 Post IDs distintos.

## Duplicidades identificadas
1. Four Seasons | Lisboa — posts 142135 / 142136
2. Rosewood | Lisboa — posts 142137 / 142138
3. Belmond | Lisboa — posts 142139 / 142140
4. Aman | Lisboa — posts 142141 / 142142
5. Six Senses | Lisboa — posts 142143 / 142144
6. Relais & Châteaux | Lisboa — posts 142145 / 142146
7. The Leading Hotels of the World | Lisboa — posts 142147 / 142148

## Coerência com auditoria de 13/08
O estado registrado em 13/08 informa 881/881 processados, 844 `ang_curated` em rascunho e 7 em quarentena. O export de 24/07 contém 851 linhas `ang_curated`, das quais 844 identidades são únicas e 7 são duplicidades extras. Isso é consistente com a hipótese operacional de 844 identidades válidas + 7 instâncias duplicadas/quarentenadas, mas ainda não prova a origem dos 30 registros restantes do dataset de 881.

## Ação segura
- Não preencher o `Item Register` de 881 por posição arbitrária.
- Manter os 7 pares duplicados bloqueados até decisão explícita de qual Post ID é canônico.
- Localizar/recuperar `curadoria-v10.csv` (881 linhas, 18 campos) ou export equivalente do staging atual para fechar os 30 registros restantes.
- Cruzamento final deve usar `ang_external_id`, nunca título isolado.
- Nenhuma publicação em produção é autorizada por esta reconciliação.

## Evidência no Drive
Foi criado `ANG_WP_IDENTITY_MAP_CURADORIA_2026-08-17`, com o mapa extraído do XML. A planilha oficial ganhou a aba `WP Export Identity 24-07` com resumo e duplicidades.