# QA estrutural — Bloco Gigante 10 Países 02

- checked_at: 2026-09-08
- fonte canônica: Google Drive `1ivtXOg6L39cptcQGSe4SL3S_drYv8c-Yfo3s4nzvAak`
- documento: https://docs.google.com/document/d/1ivtXOg6L39cptcQGSe4SL3S_drYv8c-Yfo3s4nzvAak/edit
- revisão auditada: `ANLCKQkN35NTxohAg6raWPk_AXMBzWsg99ySFYk1-QQZ4yNgVSsgJ7zN4BrMAJ0UvxcIhV5CfsVFIoNiWSU-Qlu73YOJ5gZmUgDdaOalDw`
- países: exatamente 10
- modo CMS: `execute=false`
- publicação: `UPLOAD_PENDING_CHANNEL`

## Resultado

O pacote contém 17.296 caracteres e 147 parágrafos. Esta auditoria é estrutural e não substitui QA factual, consular, comercial ou visual.

| país | caracteres | URLs no segmento | lacunas detectadas | estado |
|---|---:|---:|---|---|
| Espanha | 1821 | 0 | dados essenciais, saúde/seguro/menores, wellness/especialidades | REVIEW_REQUIRED |
| Türkiye | 1552 | 0 | dados essenciais, documentação, saúde/seguro/menores | REVIEW_REQUIRED |
| Tailândia | 1460 | 0 | dados essenciais, documentação, saúde/seguro/menores, compras/etiqueta | REVIEW_REQUIRED |
| Indonésia | 1488 | 0 | dados essenciais, documentação, saúde/seguro/menores, compras/etiqueta | REVIEW_REQUIRED |
| Vietnã | 1508 | 0 | dados essenciais, saúde/seguro/menores, compras/etiqueta | REVIEW_REQUIRED |
| Singapura | 1336 | 0 | dados essenciais, documentação, saúde/seguro/menores, destinos/cidades, wellness/especialidades, compras/etiqueta | REVIEW_REQUIRED |
| Malásia | 1392 | 0 | dados essenciais, documentação, saúde/seguro/menores, wellness/especialidades, compras/etiqueta | REVIEW_REQUIRED |
| Filipinas | 1260 | 0 | dados essenciais, documentação, saúde/seguro/menores, compras/etiqueta | REVIEW_REQUIRED |
| Coreia do Sul | 1307 | 0 | dados essenciais, documentação, saúde/seguro/menores | REVIEW_REQUIRED |
| Índia | 1602 | 0 | dados essenciais, compras/etiqueta | REVIEW_REQUIRED |

## Eixos auditados

- visão/posicionamento
- dados essenciais
- documentação
- saúde/seguro/menores
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

## Correções prioritárias

- Adicionar URLs oficiais diretamente em cada segmento; menções agregadas no rodapé não bastam para rastreabilidade por país.
- Completar dados essenciais e os eixos ausentes antes de marcar `PASS_STRUCTURAL`.
- Malásia permanece `SOURCE_QA_PARTIAL` até resposta verificável da fonte oficial ou fonte governamental alternativa.
- Fatos consulares e sanitários permanecem parametrizados por nacionalidade e data da viagem.
- Mídia permanece `MEDIA_PENDING_LICENSE_HASH` até materialização, SHA-256, perceptual hash e QA visual/geográfico.

## Gates preservados

- `post_id`, `external_id`, drafts e mapa 881/WORLD não foram alterados.
- Nenhuma mutação WordPress, Canva ou social.
- Sem status `PUBLISHED` sem URL/ID/permalink e teste pós-reload.
