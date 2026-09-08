# Curadoria Piloto 5 — SEO, Schema e Media Gate — 2026-08-17

## Escopo
Rio de Janeiro, Paris, Milão, Nova York e Lisboa. Documento de staging/QA. Não autoriza publicação em produção.

## SEO candidato por destino

### Rio de Janeiro
- Slug candidato: `/conteudo-global/destinos/rio-de-janeiro/`
- SEO title: `Rio de Janeiro | Curadoria Premium ANG Travel Solutions`
- Meta description: `Curadoria premium do Rio de Janeiro com hotelaria, gastronomia, experiências, cultura, mobilidade, MICE e dicas práticas para venda consultiva.`
- H1: `Rio de Janeiro — Curadoria Premium ANG`
- Schema principal: `TouristDestination`
- Schema complementar: `BreadcrumbList`, `Organization`, `WebPage`

### Paris
- Slug candidato: `/conteudo-global/destinos/paris/`
- SEO title: `Paris | Curadoria Premium ANG Travel Solutions`
- Meta description: `Curadoria premium de Paris com hotelaria, gastronomia, cultura, luxo, mobilidade, experiências, MICE e informação prática para venda consultiva.`
- H1: `Paris — Curadoria Premium ANG`
- Schema principal: `TouristDestination`
- Schema complementar: `BreadcrumbList`, `Organization`, `WebPage`

### Milão
- Slug candidato: `/conteudo-global/destinos/milao/`
- SEO title: `Milão | Curadoria Premium ANG Travel Solutions`
- Meta description: `Curadoria premium de Milão com design, moda, hotelaria, gastronomia, cultura, business travel, MICE, mobilidade e experiências exclusivas.`
- H1: `Milão — Curadoria Premium ANG`
- Schema principal: `TouristDestination`
- Schema complementar: `BreadcrumbList`, `Organization`, `WebPage`

### Nova York
- Slug candidato: `/conteudo-global/destinos/nova-york/`
- SEO title: `Nova York | Curadoria Premium ANG Travel Solutions`
- Meta description: `Curadoria premium de Nova York com hotelaria, gastronomia, cultura, compras, mobilidade, experiências VIP, MICE e dicas práticas atualizadas.`
- H1: `Nova York — Curadoria Premium ANG`
- Schema principal: `TouristDestination`
- Schema complementar: `BreadcrumbList`, `Organization`, `WebPage`

### Lisboa
- Slug candidato: `/conteudo-global/destinos/lisboa/`
- SEO title: `Lisboa | Curadoria Premium ANG Travel Solutions`
- Meta description: `Curadoria premium de Lisboa com hotelaria, gastronomia, cultura, bairros, mobilidade, experiências, MICE e informação prática para venda consultiva.`
- H1: `Lisboa — Curadoria Premium ANG`
- Schema principal: `TouristDestination`
- Schema complementar: `BreadcrumbList`, `Organization`, `WebPage`

## JSON-LD base de staging
O JSON-LD por destino deve usar `TouristDestination` com `name`, `description`, `url`, `touristType`, `addressCountry` e `mainEntityOfPage`. Só inserir `image` depois que o ativo final tiver URL estável e licença/proveniência registrada. Não inventar `geo`, avaliações, ofertas, preços ou horários.

Exemplo estrutural:
```json
{
  "@context": "https://schema.org",
  "@type": "TouristDestination",
  "name": "Paris",
  "description": "Curadoria premium ANG para Paris, com informação factual, hotelaria, gastronomia, cultura, mobilidade, MICE e experiências.",
  "url": "https://angtravelsolutions.com.br/conteudo-global/destinos/paris/",
  "touristType": ["Luxury travel", "Business travel", "MICE", "Culture"],
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "FR"
  },
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://angtravelsolutions.com.br/conteudo-global/destinos/paris/"
  }
}
```

## Media gate — fontes institucionais encontradas

### Paris
- Fonte: Paris je t'aime — Professional Media Library.
- Uso: biblioteca para profissionais de imprensa e trade; cada visual tem copyright próprio e exige observância estrita do crédito/direito indicado.
- Gate: `SOURCE_PASS / LICENSE_PER_ASSET_REQUIRED`.

### Milão
- Fonte: YesMilano Media Hub.
- Uso: press kit e imagens oficiais mediante cadastro; acesso inclui CAPTCHA.
- Gate: `SOURCE_PASS / HUMAN_ACCESS_REQUIRED / LICENSE_PER_ASSET_REQUIRED`.

### Nova York
- Fonte: NYC Tourism + Conventions — Media Library.
- Gate: `SOURCE_PASS / LICENSE_PER_ASSET_REQUIRED`.

### Lisboa
- Fonte: Visit Lisboa — Photo Gallery.
- Gate: `SOURCE_PASS / TERMS_PER_ASSET_TO_VERIFY`.

### Rio de Janeiro
- Diretriz: usar acervo institucional de turismo/prefeitura quando houver condição de uso explícita; na ausência de termo inequívoco, usar somente imagem de fonte com licença aberta documentalmente verificável e registrar autor, licença, URL original, data de consulta e crédito.
- Gate: `SOURCE_SEARCH_CONTINUES / LICENSE_PER_ASSET_REQUIRED`.

## Regra de mídia para todos os destinos
Nenhum ativo entra em staging final sem:
1. URL/arquivo de origem rastreável;
2. autor ou titular;
3. licença/termo de uso;
4. crédito obrigatório;
5. data de consulta;
6. correspondência factual com o destino/item;
7. arquivo estável em mídia própria do WordPress, sem hotlink dinâmico;
8. alt text específico;
9. indicação de uso permitido (site, blog, social, apresentação) quando o termo restringir canais.

`source.unsplash.com` e bancos sem comprovação por ativo permanecem bloqueados como solução final.

## Resultado dos gates
- Identidade: PASS 5/5.
- Fonte factual oficial: PASS 5/5.
- Conteúdo editorial: ENRICHED_DRAFT 5/5.
- SEO title/meta/H1: READY_FOR_STAGING 5/5.
- Schema base: READY_FOR_STAGING 5/5.
- Canonical final: PENDING_ROUTE_CONFIRMATION 5/5.
- Media source discovery: PASS 4/5, SEARCH_CONTINUES Rio.
- Media license por ativo: BLOCK 5/5 até seleção e documentação do arquivo final.
- Renderização responsiva: NOT_TESTED.
- Produção: HOLD.

## Próxima ação
Selecionar ativos finais com licença verificável, registrar media manifest e só então inserir `image` no schema, renderizar em staging e aplicar score de QA.