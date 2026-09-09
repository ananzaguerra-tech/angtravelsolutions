# QA — Bloco Gigante 10 Países 04

- Data de auditoria: 2026-09-08
- Documento-fonte: [Drive — Bloco 04](https://docs.google.com/document/d/1xlvp8EDS-EXqAfwHaIxM7zlyVDWK8n_GAg6ohtVBwCU/edit)
- Escopo exato: Chile, Peru, México, Colômbia, Uruguai, Países Baixos, Bélgica, Alemanha, Áustria e Croácia.
- Estado: `REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL`
- Regra: fail-closed; esta auditoria não autoriza publicação nem mutação de 881/WORLD.

## Resultado quantitativo

O documento contém 82 parágrafos e 9.914 caracteres. Foram avaliados 10 países em 16 eixos, totalizando 160 células:

- PASS: 83/160
- PARTIAL: 13/160
- GAP: 64/160
- Países em PASS integral: 0/10
- Fontes turísticas oficiais com data explícita: 10/10
- CTAs específicos: 0/10
- Manifestos de mídia materializados: 0/10
- SHA-256 de mídia: 0/10

Legenda: P = PASS estrutural; △ = PARTIAL; — = GAP.

| País | Visão | Essenciais | Docs | Saúde | Sazon. | Destinos | Logística | Cultura | Gastro | Hotel | Exper. | Wellness/espec. | Compras/etiqueta | SEO/schema | CTA | Fonte |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Chile | P | — | — | — | P | P | P | P | P | △ | P | △ | — | P | — | P |
| Peru | P | — | — | △ | — | P | P | P | P | △ | P | △ | — | P | — | P |
| México | P | — | — | — | △ | P | — | P | P | △ | P | △ | — | P | — | P |
| Colômbia | P | — | — | — | — | P | — | P | P | — | P | — | — | P | — | P |
| Uruguai | P | — | — | — | P | P | △ | P | P | — | P | — | — | P | — | P |
| Países Baixos | P | — | — | — | — | P | P | P | P | — | P | — | — | P | — | P |
| Bélgica | P | — | — | — | — | P | P | P | P | — | P | — | △ | P | — | P |
| Alemanha | P | — | — | — | △ | P | P | P | P | — | P | P | — | P | — | P |
| Áustria | P | — | — | — | P | P | P | P | P | △ | P | P | — | P | — | P |
| Croácia | P | — | — | — | P | P | P | P | P | △ | P | — | — | P | — | P |

## Fontes registradas no documento-fonte

Todas estão rotuladas com `checked_at 2026-09-08`, mas o rótulo indica apenas verificação da fonte turística, não validação automática de fatos consulares, sanitários ou operacionais.

1. Chile — https://chile.travel/en/
2. Peru — https://www.peru.travel/
3. México — https://visitmexico.com/
4. Colômbia — https://colombia.travel/
5. Uruguai — https://uruguaynatural.com/
6. Países Baixos — https://www.holland.com/
7. Bélgica — https://www.visitflanders.com/ e https://visitwallonia.com/
8. Alemanha — https://www.germany.travel/en/home.html
9. Áustria — https://www.austria.info/
10. Croácia — https://croatia.hr/

## Bloqueios e ações corretivas

1. **Dados essenciais (10/10 GAP):** preencher moeda, idioma, fuso, eletricidade e padrão de tomada com fonte rastreável.
2. **Documentação/consular (10/10 GAP):** parametrizar por nacionalidade e data; não universalizar regra de entrada.
3. **Saúde/seguro/menores:** 9 GAP e 1 PARTIAL; validar fontes sanitárias e requisitos específicos.
4. **CTA (10/10 GAP):** inserir CTA por unidade ANG coerente com B2B/B2C e destino.
5. **Hotelaria:** apenas cobertura nominal/parcial em 5 países; falta segmentação por perfil e confirmação operacional.
6. **Compras/etiqueta:** 9 GAP e 1 PARTIAL.
7. **Mídia:** existe somente a especificação de campos; faltam ativos reais/licenciados, origem, autor, licença, dimensões, QA visual, deduplicação, hash perceptual e SHA-256.
8. **CMS:** sem canal autenticado; manter `UPLOAD_PENDING_CHANNEL`.

## Gate de promoção

Não gerar payload executável nem alterar drafts canônicos até que, por país:

- fatos dinâmicos estejam associados a fonte oficial e `checked_at`;
- destino/cidade esteja reconciliado com slug, `post_id` e `external_id`;
- CTA, SEO/meta/canonical e links internos passem QA;
- mídia selecionada passe licença, brand fit e deduplicação;
- pacote permaneça `execute=false` até staging autenticado, backup, dry-run e rollback verificáveis.

## Rollback

Remover somente este arquivo de controle ou reverter o commit que o criou. Nenhum conteúdo em produção, post, `post_id`, `external_id`, fila social ou ficha Google foi alterado.
