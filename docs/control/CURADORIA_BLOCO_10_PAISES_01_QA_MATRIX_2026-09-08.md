# QA estrutural — Bloco Gigante 10 Países 01

- checked_at: 2026-09-08
- fonte canônica: Google Drive `1rbK2Gx-erJGv1i06Ob5_qx-7QNfRk3te-418IuiyhY0`
- documento: https://docs.google.com/document/d/1rbK2Gx-erJGv1i06Ob5_qx-7QNfRk3te-418IuiyhY0/edit
- revisão auditada: `ANLCKQnCpwUJSBh8_Ff_x3sZ07Yoesa71hUd6KmDf0nq6uNIK_055AX0UmV8FqXwwQGcX4ygAtNooxAzVn7NMv-Lm6Yd1XKqAqPZpCJ69g`
- branch alvo: `staging`
- modo CMS: `execute=false`
- publicação: `UPLOAD_PENDING_CHANNEL`

## Resultado

O pacote contém exatamente 10 países e 24.156 caracteres em 266 parágrafos. Esta auditoria verifica presença estrutural; não converte conteúdo em `FACT_CHECK_PASS`, não aprova mídia e não autoriza publicação.

| país | caracteres | URLs no segmento | cobertura estrutural | estado |
|---|---:|---:|---|---|
| Brasil | 4494 | 2 | lacunas: CTA | REVIEW_REQUIRED |
| Estados Unidos | 3081 | 1 | lacunas: CTA | REVIEW_REQUIRED |
| França | 1902 | 1 | lacunas: documentação, sazonalidade, logística, CTA | REVIEW_REQUIRED |
| Itália | 1692 | 1 | lacunas: documentação, compras/etiqueta, CTA | REVIEW_REQUIRED |
| Portugal | 1356 | 1 | lacunas: visão geral, documentação, sazonalidade, logística, hotelaria, compras/etiqueta, CTA | REVIEW_REQUIRED |
| Suíça | 1138 | 1 | lacunas: visão geral, documentação, sazonalidade, logística, hotelaria, compras/etiqueta, CTA | REVIEW_REQUIRED |
| Japão | 1725 | 1 | lacunas: documentação, sazonalidade, logística, hotelaria, compras/etiqueta, CTA | REVIEW_REQUIRED |
| Grécia | 1434 | 1 | lacunas: visão geral, documentação, sazonalidade, hotelaria, compras/etiqueta, CTA | REVIEW_REQUIRED |
| Emirados Árabes Unidos | 1896 | 2 | lacunas: visão geral, sazonalidade, hotelaria, CTA | REVIEW_REQUIRED |
| Maldivas | 2656 | 1 | lacunas: documentação, sazonalidade, compras/etiqueta, CTA | REVIEW_REQUIRED |

## Eixos auditados

- visão geral
- dados essenciais
- documentação
- sazonalidade
- destinos/cidades
- logística
- cultura/atrações
- gastronomia
- hotelaria
- experiências
- wellness/especialidades
- compras/etiqueta
- SEO/schema
- CTA
- fonte oficial

## Gates preservados

- `post_id` e `external_id` não foram alterados.
- Nenhuma deduplicação por título foi autorizada.
- Matching exigido: país → cidade/destino → slug → `external_id`.
- Fatos consulares, sanitários, horários, tarifas, disponibilidade e fornecedores continuam dinâmicos.
- Mídia exige origem, autor, licença, dimensões, SHA-256 e perceptual hash após materialização.
- Nenhuma mutação em WordPress, Canva ou redes sociais foi executada.
- Antes de qualquer carga: backup → staging autenticado → QA → smoke test → aprovação → rollback verificável.

## Próxima ação

Resolver primeiro as lacunas estruturais marcadas `REVIEW_REQUIRED`; depois gerar matriz cidade/destino e payload CSV/JSON vinculados ao mapa 881/WORLD. Somente itens com fontes verificadas e mídia aprovada podem avançar de `READY_QA_TEXT`.
