# QA rastreável — Malé, Maldivas — dossiê editorial V1

- qa_checked_at: 2026-09-07
- dossier_path: content/curadoria/maldivas/male/DOSSIER_MALE_PTBR_V1_2026-09-07.md
- dossier_blob_sha: a176774a159a3453fe4bd1c33134864a1d3011d9
- dossier_sha256: 70c653cc4aa32ac481939900c497f18563a9aba4faf719ffa9aad03e8fa524ba
- word_count: 1013
- required_sections_present: 16/16
- official_sources_declared: 9
- urls_declared: 10
- publication_allowed: false

## Resultado dos gates

| gate | resultado | evidência |
|---|---|---|
| Integridade do artefato | PASS | blob SHA e SHA-256 registrados acima |
| Cobertura estrutural | PASS | 16/16 seções obrigatórias presentes |
| Fontes oficiais | REVIEW_REQUIRED | 9 fontes declaradas; 8 abriram em verificação direta e MTCC exigiu nova tentativa controlada |
| Imigração/documentação | PASS_CURRENT_SOURCE | Tourist Visa atualizado em 2026-09-06 e Traveller Declaration em 2026-08-17, conferidos em 2026-09-07 |
| SEO/schema | READY_REVIEW | slug, title, meta description, keywords, canonical, hreflang e schema hints presentes; validação de render não executada |
| Mídia/licença/hash/dedup | HOLD | cinco slots sem ativo aprovado, licença ou hash |
| Staging/render/mobile | NOT_TESTED | não há URL de staging nem log pós-reload |
| Publicação WordPress | UPLOAD_PENDING_CHANNEL | nenhum post ID/permalink novo foi gerado |
| Aprovação editorial | PENDING | não houve liberação da titular |

## Verificação das fontes

1. Maldives Immigration — Tourist Visa — REACHABLE; requisitos de entrada e atualização 2026-09-06 conferidos.
2. Maldives Immigration — Traveller Declaration — REACHABLE; envio gratuito via IMUGA e janela de 96 horas conferidos.
3. Visit Maldives — Malé City — REACHABLE; papel da capital e composição de Greater Malé conferidos.
4. Visit Maldives — Hukuru Miskiy — REACHABLE; patrimônio e materialidade em coral conferidos.
5. Visit Maldives — Bleisure — REACHABLE; Malé, Villimalé e Hulhumalé conferidos.
6. Maldives Meteorological Service — Climate — REACHABLE; referência climática oficial conferida.
7. Velana International Airport — Transport — REACHABLE; página oficial de transporte conferida.
8. MTCC — Transport schedules — FETCH_PARTIAL_RETRY_REQUIRED; endpoint apresentou erro de leitura nesta verificação, sem validar horários.
9. Malé City Council — Council — REACHABLE; wards administrativos conferidos.

## Achados editoriais

- O texto diferencia corretamente Malé Island, Hulhumalé, Villimalé e resort-ilha.
- A redação migratória permanece condicionada à decisão oficial e exige revalidação antes da emissão/embarque.
- Horários e tarifas de transporte estão explicitamente tratados como dinâmicos.
- A página Visit Maldives de Hukuru Miskiy apresenta uma formulação sobre UNESCO que não foi reproduzida como status definitivo no dossiê; manter essa cautela até confirmação em fonte UNESCO.
- Nenhuma recomendação transacional de hotelaria, restaurante ou transfer foi promovida sem checagem atual.

## Próximas verificações obrigatórias

1. Revalidar a fonte MTCC uma única vez, sem retry cego, e registrar resposta/horário.
2. Selecionar ativos apenas com licença inequívoca; registrar origem, autor, dimensões, data de acesso e SHA-256.
3. Executar revisão humana factual/editorial e validar SEO/schema.
4. Renderizar em staging, testar desktop/mobile e registrar URL/log pós-reload.
5. Publicar somente após aprovação e canal WordPress autenticado, preservando os external IDs canônicos.

## Rollback

Nenhuma alteração de produção foi feita. Se este artefato precisar ser revertido, remover somente o arquivo de QA e o commit correspondente; não alterar os 23 external IDs nem criar nova identidade WordPress.
