# Gap enrichment — Gastronomia Michelin e Fornecedores — Malé

- destination: Malé, Maldives
- locale: pt-BR
- checked_at: 2026-09-07
- editorial_status: READY_QA_TEXT
- publication_status: UPLOAD_PENDING_CHANNEL
- publication_authorized: false
- scope_rule: distinguir seleção de restaurantes, seleção de hotéis e fornecedores operacionais; nenhuma presença em diretório constitui parceria ANG.

## Gastronomia Michelin

### Resultado da auditoria

A lista oficial de territórios com seleção de restaurantes do Guia MICHELIN não apresenta as Maldivas entre os destinos atualmente cobertos. A busca oficial do Guia para as Maldivas exibe uma coleção de hotéis, não uma seleção de restaurantes estrelados, Bib Gourmand ou recomendados em Malé.

Portanto, o módulo não pode chamar restaurantes de Malé de “Michelin”, “selecionados pelo Michelin” ou “estrelados”. A presença de um hotel das Maldivas na plataforma do Guia MICHELIN não transfere distinção Michelin aos restaurantes do hotel.

### Uso editorial permitido

- Explicar que não há cobertura oficial de restaurantes evidenciada para Malé no momento da checagem.
- Manter recomendações gastronômicas locais em módulo separado, com fontes próprias.
- Revalidar a lista oficial de destinos antes de qualquer publicação ou promessa comercial.
- Se surgir cobertura futura, registrar restaurante, distinção, ano da edição, URL oficial e checked_at.

### SEO

- seo_title: Guia Michelin em Malé: o que está oficialmente coberto
- meta_description: Entenda a diferença entre hotéis listados pelo Guia MICHELIN e restaurantes com distinção oficial em Malé.
- primary_keyword: Michelin Malé
- supporting_keywords: restaurantes Michelin Maldivas; Guia Michelin Malé; gastronomia em Malé
- canonical_hint: /curadoria/maldivas/male/gastronomia-michelin/

### Schema hints

- Não emitir `award`, `starRating` ou `review` Michelin para restaurantes sem página oficial correspondente.
- `Restaurant` pode ser usado apenas com dados próprios e verificados, sem associação ao Guia.
- `ItemList` deve permanecer vazio ou suprimido enquanto não houver seleção oficial de restaurantes.

### CTA

Consulte a ANG para uma curadoria gastronômica atualizada, separando reputação local de distinções oficiais verificáveis.

### Reconciliação canônica

- source_index: 851
- post_id: 142474
- external_id: 9bef52250ce4c6aebef012c7dc933cb3b1de37bde6e2d26bbc3ee7d792e261e8
- mapped_section: Gastronomia Michelin
- coverage_status: MICHELIN_RESTAURANT_COVERAGE_NOT_EVIDENCED
- publication_gate: REQUIRES_MICHELIN_DESTINATION_RECHECK

## Fornecedores

### Estrutura verificável

O Ministério do Turismo mantém diretórios oficiais de agências de viagens e instalações turísticas registradas e operacionais. Esses diretórios constituem a base de elegibilidade regulatória, não uma recomendação comercial nem prova de contrato com a ANG.

A MTCC publica serviços e horários de transporte, incluindo rede RTL, ônibus e ferries. Ela pode ser tratada como referência operacional pública para mobilidade, sempre com horário, rota, tarifa e política revalidados no canal oficial.

### Categorias e critérios

1. Agências receptivas e DMCs
   - Exigir presença no registro oficial de agências.
   - Confirmar razão social, licença, contato, escopo, responsabilidade, seguro, termos e atendimento.
   - Não listar como parceiro ANG sem contrato ou aprovação comercial verificável.

2. Hotéis, guesthouses, vessels e marinas
   - Exigir presença no diretório oficial de instalações registradas e operacionais.
   - Confirmar localização exata para não confundir Malé City, Hulhulé, Hulhumalé e resorts-ilha.
   - Validar disponibilidade, tarifas, impostos, transfers e cancelamento por cotação.

3. Transporte público e interilhas
   - Usar MTCC/RTL como fonte operacional pública quando a rota estiver coberta.
   - Revalidar terminal, frequência, bilhete, bagagem, alteração climática e status da rota.
   - Não apresentar transporte público como transfer privativo.

4. Operadores de experiências
   - Vincular operador/agência licenciada ao produto específico.
   - Registrar embarcação, capacidade, segurança, seguro, inclusões, preço e contingência climática.
   - Bloquear oferta quando a cadeia contratual não estiver completa.

### Ficha mínima por fornecedor

- legal_name
- trade_name
- supplier_category
- registry_or_license_id
- registry_source_url
- registered_location
- service_area
- official_contact
- product_scope
- commercial_terms_checked_at
- safety_and_insurance_status
- contract_status
- ANG_partner_status
- evidence_url
- QA_status

### SEO

- seo_title: Fornecedores em Malé: critérios de registro e validação
- meta_description: Como a ANG valida agências, hospedagem, transporte e experiências em Malé sem confundir registro oficial com parceria comercial.
- primary_keyword: fornecedores de turismo em Malé
- supporting_keywords: DMC Maldivas; agência registrada Maldivas; transporte Malé; fornecedores Maldivas
- canonical_hint: /curadoria/maldivas/male/fornecedores/

### Schema hints

- `Organization` somente com razão social e fonte oficial.
- `Service` somente após produto, área atendida e fornecedor definidos.
- `Offer` somente após preço, moeda, validade e condições.
- `Trip` ou `TouristTrip` somente com operador e itinerário verificáveis.
- Registro oficial não deve preencher automaticamente `memberOf`, `brand` ou `affiliation` da ANG.

### CTA

Solicite à ANG uma seleção sob consulta de fornecedores elegíveis, com registro, escopo e condições revalidados para a viagem.

### Reconciliação canônica

- source_index: 839
- post_id: 142462
- external_id: 2c04b6dbb30f6c868429c497c05f6695215745fa975a6ff0adaed3c869185670
- mapped_section: Fornecedores
- coverage_status: SUPPORTED_REGISTRY_AND_TRANSPORT_FRAMEWORK
- publication_gate: REQUIRES_SUPPLIER_COMMERCIAL_QA

## Fontes oficiais

1. Guia MICHELIN — hotéis nas Maldivas e lista de territórios cobertos: https://guide.michelin.com/en/hotels-stays/maldives
2. Guia MICHELIN — South Malé Atoll, distinguindo coleção de hotéis de seleção de restaurantes: https://guide.michelin.com/en/hotels-stays/south-male-atoll
3. Ministério do Turismo das Maldivas — agências de viagens registradas: https://www.tourism.gov.mv/en/registered/travel_agencies
4. Ministério do Turismo das Maldivas — instalações registradas e operacionais: https://www.tourism.gov.mv/en/registered/facilities
5. Maldives Tourism Act — exigência de licença para serviços de agência: https://www.tourism.gov.mv/dms/document/23d485632704b30cf178db46d41f0bff.pdf
6. MTCC — serviços de transporte: https://mtcc.mv/transport-services/
7. MTCC — horários: https://mtcc.mv/schedules-2/

## QA e gates

- Michelin restaurant QA: PASS_NEGATIVE_EVIDENCE — ausência de cobertura evidenciada; rechecagem obrigatória antes de publicação.
- Supplier registry QA: PASS_FRAMEWORK — fontes canônicas identificadas.
- Named supplier QA: HOLD — nenhum fornecedor privado promovido.
- Commercial QA: REQUIRED — contrato, produto, termos, disponibilidade e responsabilidade.
- Dynamic data QA: REQUIRED — rotas, horários, tarifas, clima e status operacional.
- Media: NOT_SELECTED_IN_THIS_ARTIFACT.
- WordPress: UPLOAD_PENDING_CHANNEL.
- Social/Canva: NOT_AUTHORIZED; nenhum upload ou publicação.
