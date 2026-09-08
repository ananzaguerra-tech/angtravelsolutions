# QA estrutural — Bloco Gigante 10 Países 01

- checked_at: 2026-09-08
- fonte canônica: Google Drive `1rbK2Gx-erJGv1i06Ob5_qx-7QNfRk3te-418IuiyhY0`
- documento: https://docs.google.com/document/d/1rbK2Gx-erJGv1i06Ob5_qx-7QNfRk3te-418IuiyhY0/edit
- revisão auditada: `ANLCKQl4v2yUpTPZtNYNxUkuGjwS8nuBa-_QBuzVpE08uzB27E6BfSIzYWoE42CBhlnfM5Jw59mweaEERxjmmtVuVu1E2azhTvRsLAzaNw`
- branch alvo: `staging`
- modo CMS: `execute=false`
- publicação: `UPLOAD_PENDING_CHANNEL`

## Resultado

O pacote contém exatamente 10 países e 27.908 caracteres em 307 parágrafos. CTAs por unidade ANG foram integrados em 10/10 segmentos. Esta auditoria verifica presença estrutural; não converte conteúdo em `FACT_CHECK_PASS`, não aprova mídia e não autoriza publicação.

| país | caracteres | URLs no segmento | cobertura estrutural | estado |
|---|---:|---:|---|---|
| Brasil | 4995 | 2 | 15/15 eixos presentes | PASS_STRUCTURAL |
| Estados Unidos | 3475 | 1 | 15/15 eixos presentes | PASS_STRUCTURAL |
| França | 2246 | 1 | lacunas: documentação, sazonalidade, logística | REVIEW_REQUIRED |
| Itália | 2047 | 1 | lacunas: documentação, compras/etiqueta | REVIEW_REQUIRED |
| Portugal | 1700 | 1 | lacunas: visão geral, documentação, sazonalidade, logística, hotelaria, compras/etiqueta | REVIEW_REQUIRED |
| Suíça | 1474 | 1 | lacunas: visão geral, documentação, sazonalidade, logística, hotelaria, compras/etiqueta | REVIEW_REQUIRED |
| Japão | 2091 | 1 | lacunas: documentação, sazonalidade, logística, hotelaria, compras/etiqueta | REVIEW_REQUIRED |
| Grécia | 1780 | 1 | lacunas: visão geral, documentação, sazonalidade, hotelaria, compras/etiqueta | REVIEW_REQUIRED |
| Emirados Árabes Unidos | 2268 | 2 | lacunas: visão geral, sazonalidade, hotelaria | REVIEW_REQUIRED |
| Maldivas | 3050 | 1 | lacunas: documentação, sazonalidade, compras/etiqueta | REVIEW_REQUIRED |

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

## Gate CTA

- 10/10 países: CTA ANG Travel.
- 10/10 países: CTA ANG Travel Solutions B2B.
- 10/10 países: CTA ANG Business Travel & MICE.
- Brasil: CTA adicional ANG Luxury Brazil.
- Nenhum CTA promete preço, disponibilidade, benefício, operador ou parceria.

## Gates preservados

- `post_id` e `external_id` não foram alterados.
- Nenhuma deduplicação por título foi autorizada.
- Matching exigido: país → cidade/destino → slug → `external_id`.
- Fatos consulares, sanitários, horários, tarifas, disponibilidade e fornecedores continuam dinâmicos.
- Mídia exige origem, autor, licença, dimensões, SHA-256 e perceptual hash após materialização.
- Nenhuma mutação em WordPress, Canva ou redes sociais foi executada.
- Antes de qualquer carga: backup → staging autenticado → QA → smoke test → aprovação → rollback verificável.

## Próxima ação

Resolver as lacunas remanescentes marcadas `REVIEW_REQUIRED`; depois gerar matriz cidade/destino e payload CSV/JSON vinculados ao mapa 881/WORLD.
