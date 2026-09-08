# MEDIA GAP CANDIDATES — KEEP/SPLIT Malé v1

- checked_at: 2026-09-08
- scope: 8 módulos KEEP/SPLIT ainda sem mídia vinculada
- state: CANDIDATE_REVIEW_ONLY
- publication: UPLOAD_PENDING_CHANNEL
- canva: NOT_SENT
- wordpress: NOT_SENT
- social: NOT_SENT

## Resultado do ciclo

Sete módulos receberam pelo menos um candidato com licença explícita na página de origem. Wellness recebeu um candidato em HOLD por falta de autoria recuperada e inadequação geográfica ainda não resolvida. Experiências VIP passou a ter candidato georreferenciado em Malé, ainda sujeito a QA de atualidade e de produto. Nenhum candidato foi promovido a ativo aprovado.

## Candidatos

| módulo | ativo | página de origem | autor | licença explícita | dimensões | hash do provedor | decisão |
|---|---|---|---|---|---|---|---|
| Hotelaria Global — Malé | Male Waterfront (32822673711).jpg | https://commons.wikimedia.org/wiki/File:Male_Waterfront_(32822673711).jpg | David Stanley | CC BY 2.0 | 1024×768 | PROVIDER_SHA1_PENDING | LICENSE_VERIFIED_CANDIDATE_CONTEXT_ONLY; mostra o waterfront com hotéis, sem validar propriedade específica; CURRENTNESS_QA_REQUIRED |
| Experiências — Malé | Parasailing (380754397).jpg | https://commons.wikimedia.org/wiki/File:Parasailing_(380754397).jpg | Badr Naseem | CC BY-SA 2.0 | 1024×1024 | PROVIDER_SHA1_PENDING | LICENSE_VERIFIED_CANDIDATE; CURRENTNESS_QA_REQUIRED; OPERATOR_QA_REQUIRED; não reutilizar no módulo VIP |
| Fornecedores — Malé | Buiobuione Porto di Malé.jpg | https://commons.wikimedia.org/wiki/File:Buiobuione_Porto_di_Mal%C3%A9.jpg | Buiobuione | CC BY-SA 4.0 | 5120×3413 | 6e53cccded49afff52c171b1c0e1980626b5d3e4 | LICENSE_VERIFIED_CANDIDATE_CONTEXT_ONLY; NO_PARTNERSHIP_INFERENCE |
| Sustentabilidade — Malé | A view of the breakwall on the Western side of Malé.jpg | https://commons.wikimedia.org/wiki/File:A_view_of_the_breakwall_on_the_Western_side_of_Mal%C3%A9.jpg | Mark Fischer | CC BY-SA 2.0 | 3980×2985 | 05f099fa0aa9bffeb4895b8603104caa47d11a4b | LICENSE_VERIFIED_CANDIDATE_CONTEXT_ONLY; LOCAL_IMPLEMENTATION_QA_REQUIRED |
| Rooftops — Malé | Dusk (408488457).jpg | https://commons.wikimedia.org/wiki/File:Dusk_(408488457).jpg | ╚ DD╔ | CC BY-SA 2.0 | 1280×960 | 78885a18923976f1a54ab85fa279884527e25263 | AMBIENCE_CONTEXT_ONLY; VENUE_QA_REQUIRED; CURRENTNESS_QA_REQUIRED |
| Shopping & Lifestyle — Malé | Fruit and vagetable markets. Maldives 2005. Photo- AusAID (10696967365).jpg | https://commons.wikimedia.org/wiki/File:Fruit_and_vagetable_markets._Maldives_2005._Photo-_AusAID_(10696967365).jpg | Department of Foreign Affairs and Trade / Australian Aid Photolibrary | CC BY 2.0 | 1944×2592 | 5fb3f4f09eb89a7c8a956c377e79e62a4c7f83f5 | HOLD_CURRENTNESS_AND_GEO_QA; não declarar mercado atual de Malé |
| Wellness urbano — Malé | Entspannung Malediven (170994141).jpeg | https://commons.wikimedia.org/wiki/File:Entspannung_Malediven_(170994141).jpeg | AUTHOR_METADATA_PENDING | CC BY 3.0 | 2048×1365 | PROVIDER_SHA1_PENDING | HOLD_GEO_SCOPE_AND_AUTHOR_METADATA; imagem genérica de Maldivas, não comprovada como Malé City |
| Experiências VIP — Malé | Arumaazu (5092280315).jpg | https://commons.wikimedia.org/wiki/File:Arumaazu_(5092280315).jpg | ╚ DD╔ (Hussain Didi) | CC BY-SA 2.0 | 4320×3240 | SHA-1 743ac5dc924a813464208de9c3ee01ff2cb05f8a; SHA-256 3b1c6c53d726e303990ee6806796b8091466925d79d096e5c9540ce377798bca | MATERIALIZED_QA_VISUAL_PASS_CONTEXT_ONLY; georreferenciado em Malé (4.171115, 73.497505); sem texto sobreposto ou marca-d’água aparente; CURRENTNESS_QA_REQUIRED; PRODUCT_AND_OPERATOR_QA_REQUIRED; não inferir disponibilidade ou parceria; Drive ID 1Ln8JSkoI1gKrnYeHSU_xo-HE_jCFyeKt |

## Deduplicação

Os cinco SHA-1 recuperados são distintos entre si e não coincidem com o banco anterior de Malé:
- 5f8a71dc60fc5c95e27973b0e5329ce635604ede
- c8332b1ff54619f2928de166652961b481df218a
- fe2c3ce228cbac26008f1275886351ca1b413f81
- 408563db738f9cfa15f6a08d2919284f6f55f9e7
- ee8ecf5cc599ae0f92ebf068a1428483cce7219c

A deduplicação integral continua pendente para os candidatos sem SHA-1 recuperado e para todos os binários, pois SHA-256 só será calculado após download seguro do original.

## Gates antes de uso

1. baixar o original pelo canal seguro;
2. confirmar página, autor, licença e requisitos de atribuição;
3. calcular SHA-256 e comparar com o manifesto mundial;
4. executar QA visual, geográfico, temporal e de brand fit;
5. gerar crop/derivado e recalcular SHA-256;
6. aprovar vínculo módulo→ativo;
7. somente então preparar staging/WordPress.

## Não executado e rollback

- Candidato VIP materializado no Drive: ID 1Ln8JSkoI1gKrnYeHSU_xo-HE_jCFyeKt; SHA-1 confirmado; SHA-256 calculado; QA visual básico PASS. Os demais binários não foram baixados.
- Nenhum crop ou derivado gerado.
- Nenhum upload para Canva, WordPress ou social.
- Nenhuma mutação CMS.
- Rollback: excluir este manifesto e manter os oito módulos em MEDIA_GAP; o estado publicado permanece inalterado.

## Checkpoint de materialização VIP

- checked_at: 2026-09-08
- drive_id: 1Ln8JSkoI1gKrnYeHSU_xo-HE_jCFyeKt
- drive_url: https://drive.google.com/file/d/1Ln8JSkoI1gKrnYeHSU_xo-HE_jCFyeKt/view?usp=drivesdk
- bytes: 3771161
- mime: image/jpeg
- dimensions: 4320×3240
- provider_sha1_match: PASS
- sha1: 743ac5dc924a813464208de9c3ee01ff2cb05f8a
- sha256: 3b1c6c53d726e303990ee6806796b8091466925d79d096e5c9540ce377798bca
- visual_qa: PASS_CONTEXT_ONLY
- visual_notes: alta resolução; yacht integral e centralizado; céu/mar com espaço negativo; sem texto sobreposto ou marca-d’água aparente; uma pessoa distante sem identificação útil.
- brand_fit: PASS_CANDIDATE_ULTRA_LUXURY
- editorial_gate: CURRENTNESS_QA_REQUIRED; PRODUCT_AND_OPERATOR_QA_REQUIRED
- derivative: NOT_GENERATED
- wordpress: UPLOAD_PENDING_CHANNEL
- social: NOT_SENT
