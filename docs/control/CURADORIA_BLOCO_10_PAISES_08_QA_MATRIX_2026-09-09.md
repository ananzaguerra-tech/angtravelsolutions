# QA estrutural — Bloco Gigante 10 Países 08

- checked_at: 2026-09-09
- fonte canônica Drive: `1t38Xr2b-D0RtfR-ntCO-YfRaGvs7qS2Um8Br9QzkfNg`
- documento: https://docs.google.com/document/d/1t38Xr2b-D0RtfR-ntCO-YfRaGvs7qS2Um8Br9QzkfNg/edit
- revisão auditada: `ANLCKQlfFTqUGFAb2mOgGjiphjsWWjEE9sQhRIqBYd2Jh72vBO6u_PEA-MmX_Jx6olXGzAM3K7bxPdbVpBTpnzWBJZBmZO07kPfDqRO9Zg`
- países: exatamente 10
- tamanho: 34.210 caracteres no GitHub; 234 parágrafos e 34.196 caracteres no Drive
- modo CMS: `execute=false`
- publicação: `UPLOAD_PENDING_CHANNEL`

## Resultado

A auditoria confirmou presença de 160/160 eixos estruturais, 10/10 CTAs, 10/10 conjuntos SEO/canonical/schema e 10/10 manifestos de mídia em estado pendente. Presença estrutural não é aprovação factual, consular, operacional, comercial, visual ou de segurança.

Legenda: P = campo presente. Nenhuma célula P representa `FACT_CHECK_PASS`.

| País | Visão | Essenciais | Docs | Saúde | Sazon. | Destinos | Logística | Cultura | Gastro | Hotel | Exper. | Wellness | Compras | SEO/schema | CTA | Fonte | Caracteres | Gate de fonte/operação | Estado |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| BAHRAIN | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3414 | TURISMO_DEGRADED_TIMEOUT / CONSULAR_PASS | REVIEW_REQUIRED |
| KUWAIT | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3361 | TURISMO_DEGRADED_SAFE_OPEN / CONSULAR_DEGRADED_SAFE_OPEN | REVIEW_REQUIRED |
| ISRAEL | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3531 | TURISMO_PASS / CONSULAR_DEGRADED_SAFE_OPEN / SECURITY_DYNAMIC_QA | REVIEW_REQUIRED |
| LÍBANO | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3398 | TURISMO_PASS / CONSULAR_PASS / SECURITY_DYNAMIC_QA | REVIEW_REQUIRED |
| GEÓRGIA | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3258 | TURISMO_PASS / CONSULAR_PASS | REVIEW_REQUIRED |
| ARMÊNIA | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3160 | TURISMO_PASS / CONSULAR_DEGRADED_FETCH | REVIEW_REQUIRED |
| AZERBAIJÃO | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3152 | TURISMO_PASS / CONSULAR_DEGRADED_FETCH | REVIEW_REQUIRED |
| CAZAQUISTÃO | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3305 | TURISMO_PASS / CONSULAR_DEGRADED_FETCH | REVIEW_REQUIRED |
| UZBEQUISTÃO | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3175 | TURISMO_PASS / CONSULAR_PASS_EMPTY_CONTENT | REVIEW_REQUIRED |
| MONGÓLIA | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | P | 3805 | TURISMO_PASS_MINIMAL / CONSULAR_DEGRADED_FETCH | REVIEW_REQUIRED |

## Contagem de acessibilidade

- Turismo: 7 PASS, 1 PASS_MINIMAL e 2 DEGRADED.
- Consular: 3 PASS, 1 PASS_EMPTY_CONTENT e 6 DEGRADED.
- Israel e Líbano: `SECURITY_DYNAMIC_QA`; checar alertas oficiais, fronteiras e malha aérea imediatamente antes de cotar e novamente antes da viagem.
- Mídia materializada/SHA-256: 0/10.
- Reconciliação destino→slug→post_id→external_id: 0/10.
- CI: sem status/run observado no commit de conteúdo.

## Gates preservados

- `post_id`, `external_id`, drafts e mapa 881/WORLD não foram alterados.
- Nenhuma publicação WordPress, social, GBP, Meta ou n8n.
- Nenhuma mídia foi considerada aprovada apenas por constar no manifesto.
- Sites degradados não autorizam inferência de regra de visto, saúde, segurança, horário, preço ou disponibilidade.
- Antes de carga: fonte atual → mídia/licença/hash → ID canônico → backup → dry-run → staging → QA → smoke → aprovação → rollback verificável.

## Ação corretiva paralela

Foi detectado um segundo artefato nomeado “Bloco 06” criado em 2026-09-09. Cinco países repetem o Bloco 06 canônico de 2026-09-08. O artefato foi colocado em `HOLD_RENUMBER_RECONCILE` sem exclusão; os cinco países inéditos permanecerão candidatos a bloco futuro.

## Próxima ação

Revalidar fontes degradadas, aprofundar fatos dinâmicos por nacionalidade/data, materializar mídia licenciada e deduplicada, e reconciliar IDs antes de gerar payload CMS.
