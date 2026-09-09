# ANG Curadoria — Bloco 07 — QA Matrix e Fontes

- checked_at: 2026-09-09
- escopo: exatamente 10 países
- pacote Drive: https://docs.google.com/document/d/1gnin-eb-TnqQ-n4qAZQqmGM3IuWpQ-DIxtJGDbF1p78/edit
- volume confirmado: 232 parágrafos; 30.047 caracteres
- estado: REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL

## Resultado quantitativo

- cobertura estrutural: 160/160 eixos presentes
- CTA: 10/10
- SEO, slug, canonical e schema hints: 10/10
- fontes oficiais declaradas: 10/10
- portais oficiais de turismo acessíveis na revalidação: 9/10
- acesso degradado: China 1/10
- mídia materializada com licença e SHA-256: 0/10
- reconciliação destino→slug→post_id→external_id: 0/10
- países autorizados para publicação: 0/10

## Matriz de fontes turísticas

| País | Fonte | Estado em 2026-09-09 | Uso seguro |
|---|---|---|---|
| Reino Unido | https://www.visitbritain.com/ | PASS | destinos, regiões, cultura e planejamento |
| Luxemburgo | https://www.visitluxembourg.com/ | PASS | destinos e planejamento |
| China | https://www.travelchina.org.cn/en/ | DEGRADED | não incorporar fatos até nova validação |
| Camboja | https://www.tourismcambodia.org/ | PASS | destinos e planejamento |
| Laos | https://www.tourismlaos.org/ | PASS | regiões, eventos e cultura |
| Nepal | https://ntb.gov.np/ | PASS | destinos e planejamento |
| Butão | https://bhutan.travel/ | PASS | destinos e planejamento |
| Jordânia | https://international.visitjordan.com/ | PASS | destinos e experiências |
| Omã | https://experienceoman.om/ | PASS | regiões, atividades, clima e planejamento |
| Arábia Saudita | https://www.visitsaudi.com/ | PASS | destinos e planejamento |

## QA editorial

Os 10 países contêm visão geral, dados essenciais, clima, destinos, documentação parametrizada, saúde/seguro/menores, logística, cultura, gastronomia, hotelaria, experiências, etiqueta, CTA, SEO/canonical, schema e fontes.

Acessibilidade do portal turístico não valida automaticamente visto, trânsito, saúde, segurança, horários, tarifas, abertura de hotéis ou operação de experiências. Essas camadas permanecem em CONSULAR_DYNAMIC_QA/OPERATIONAL_QA.

## Gates fail-closed

- China permanece SOURCE_REACHABILITY_DEGRADED.
- Mídia/licença/dimensões/SHA-256/deduplicação: pendente em 10/10.
- Reconciliação canônica: pendente em 10/10.
- CI e canal CMS: sem evidência.
- Nenhuma mutação 881/WORLD, WordPress, social, GBP ou n8n.
- Social antigo CURADORIA_ANG_AGOSTO continua proibido.

## Rollback

Reverter este commit. Nenhuma produção ou ID canônico foi alterado.
