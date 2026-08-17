# Curadoria — Piloto QA 5 — 2026-08-17

## Escopo
Piloto editorial controlado com 5 destinos: Rio de Janeiro, Paris, Milão, Nova York e Lisboa. Nenhum item é autorizado para publicação por este documento.

## Identidades WordPress

| Destino | Post ID | External ID | CPT | Status |
|---|---:|---|---|---|
| Rio de Janeiro | 141651 | dc35bd0a5e7254b74d79cb15fa7155441ac2f4dde5aefb7e948b60c4c61593ae | ang_curated | draft |
| Paris | 141905 | cb5bb2a498644135176249c3b5279f9f9fe9e6d254083286c861d1602491f39e | ang_curated | draft |
| Milão | 142020 | c23a01b6439e5d27d4b57429057c9252d928039dc7ecd03521365245e06fcb3b | ang_curated | draft |
| Nova York | 141813 | 38dc753c3b945c6f43baa3f56b7f4c49f3e86f660f1867606855169bd04825bb | ang_curated | draft |
| Lisboa | 142122 | c4e79ed8381c79e6365fcd3482fb96872069d22f6c21ea166522386fa10ec558 | ang_curated | draft |

## Fontes primárias identificadas
- Rio de Janeiro: Portal Turismo RJ / Prefeitura-Riotur.
- Paris: Paris je t’aime — Office de Tourisme.
- Milão: YesMilano / Ufficio Informazioni Turistiche del Comune di Milano.
- Nova York: NYC Tourism + Conventions.
- Lisboa: Turismo de Lisboa / Visit Lisboa.

## Gates atuais
- Identidade: PASS para os 5.
- Fonte institucional primária: PASS para os 5.
- Conteúdo factual/específico: NEEDS_ENRICHMENT.
- Mídia/licença: BLOCK enquanto houver dependência de `source.unsplash.com` ou ativo sem prova de origem/licença.
- SEO: NEEDS_ENRICHMENT.
- Staging/renderização: NOT_TESTED.
- Decisão atual: `needs_enrichment` para os 5.

## Próximas ações seguras
1. Reescrever cada destino com conteúdo factual e específico, sem preço/horário/visas/restaurantes/parcerias no piloto inicial.
2. Registrar fonte primária por bloco factual e data de consulta.
3. Substituir mídia dinâmica por asset estável, real e rastreável/licenciado.
4. Gerar título SEO, meta description, slug/canonical e schema coerentes.
5. Só depois executar renderização e smoke test em staging.
6. Nenhuma promoção para produção sem score >= 90, backup restaurável e aceite do relatório de staging.

## Evidência Drive
Planilha: `ANG_CURADORIA_PILOTO_QA_5_2026-08-17`.
