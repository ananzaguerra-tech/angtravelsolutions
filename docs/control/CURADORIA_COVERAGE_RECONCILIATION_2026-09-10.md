# ANG Curadoria — Reconciliação de cobertura antes do próximo macro-lote

Data: 2026-09-10
Branch: staging
Status: CONTROL / FAIL-CLOSED / SEM PUBLICAÇÃO

## Objetivo

Evitar novos lotes duplicados. Esta reconciliação cruza os países/territórios explicitamente registrados nos lotes históricos de 30 países (03–08/08M) e nos Blocos Gigantes 01–13. Não altera 881/WORLD, WordPress, slugs, post_ids ou external_ids.

## Fontes de controle

- ANG_CURADORIA_RELATORIO_MESTRE_ATUALIZADO_2026-09-01 e checkpoints posteriores.
- ANG_CURADORIA_LOTE_30_PAISES_2026-09-02_03 a _08 e lote 08M.
- ANG_CURADORIA_BLOCO_GIGANTE_10_PAISES_01 a _13.
- Mapa canônico 881/WORLD e matrizes de reconciliação existentes.

## Resultado operacional

A leitura das listas explícitas mostra cobertura muito mais ampla do que somente os Blocos Gigantes 01–13. Países já presentes em lotes antigos — como Sérvia, Montenegro, Bósnia e Herzegovina, Albânia, Macedônia do Norte, Romênia, Bulgária, Estônia, Letônia, Lituânia, Eslováquia, Chipre, Malta, Moldávia, Ucrânia, Belarus e Kosovo — NÃO devem ser abertos como novos países.

Após normalização lexical preliminar das listas explicitamente documentadas, os únicos candidatos soberanos ainda não encontrados na cobertura consolidada são:

1. Líbia
2. Kiribati
3. Nauru
4. Tuvalu

Estes quatro são **CANDIDATE_ABSENT**, não `NEW_CANONICAL_ID`. Antes de criar conteúdo, cada um deve ser comparado ao inventário 881/WORLD por título, país, slug, external_id/source_index e checksum quando disponível.

## Territórios/dependências que exigem revisão separada

Existem territórios ISO/dependências que não aparecem de forma inequívoca nas listas consolidadas ou aparecem agregados sob outra identidade. Exemplos para `TERRITORY_SCOPE_REVIEW`, sem abertura automática de identidade: Åland, American Samoa, Christmas Island, Cocos (Keeling), Faroe Islands, Gibraltar, Greenland, Guernsey, Isle of Man, Jersey, Macao, Mayotte, Northern Mariana Islands, Norfolk Island, Pitcairn, Réunion, Saint Helena/Ascension/Tristan da Cunha, Saint Pierre and Miquelon, Tokelau, Wallis and Futuna e territórios antárticos/remotos. `Bonaire/Saba/Sint Eustatius`, Saint-Martin, Sint Maarten, BVI, USVI, French Guiana e outros já possuem cobertura explícita nos Blocos 11–13 e não devem ser duplicados.

## Gates antes do próximo macro-lote

- `CANDIDATE_ABSENT` → consultar inventário canônico 881/WORLD.
- Se match inequívoco → `MERGE_REVIEW`, preservando external_id/post_id.
- Se não houver identidade canônica e o escopo editorial justificar → preparar `NEW_IDENTITY_REVIEW`, sem publicar.
- Fatos dinâmicos (entrada, segurança, saúde, eventos, clima operacional) → fonte oficial + `checked_at`.
- Mídia → real/licenciada, origem/autor/licença, SHA-256 e deduplicação.
- WordPress → somente DRAFT/READY_QA em staging após backup, autenticação e rollback.

## O que NÃO foi feito

Nenhum país foi publicado, nenhum novo external_id foi criado, nenhum draft WordPress foi alterado e nenhum payload de mass publish foi disparado. Esta etapa é somente reconciliação preventiva.

## Próxima ação

Validar Líbia, Kiribati, Nauru e Tuvalu contra 881/WORLD; depois compor o próximo macro-lote somente com ausências comprovadas e, se necessário, territórios cuja inclusão editorial tenha sido aprovada pelo inventário canônico.

## Rollback

Remover/reverter apenas este arquivo de controle. Nenhum estado externo ou de produção foi alterado.
