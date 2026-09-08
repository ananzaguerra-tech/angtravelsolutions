# ANG CURADORIA — BLOCO GIGANTE 10 PAÍSES 02

**Data:** 2026-09-08  
**Status:** READY_QA_TEXT / UPLOAD_PENDING_CHANNEL  
**Países:** Espanha, Türkiye, Tailândia, Indonésia, Vietnã, Singapura, Malásia, Filipinas, Coreia do Sul e Índia.

## Regra do bloco
Conteúdo preparado para Curadoria ANG em estrutura país→destino, com visão editorial, sazonalidade, logística, cultura, gastronomia, hotelaria, experiências, CTA, SEO/schema, fontes e gates dinâmicos. Regras consulares, saúde, seguro, menores, preços, horários, disponibilidade e requisitos de entrada permanecem parametrizados por nacionalidade e checked_at antes de publicação. Mídia final deve ser real, licenciada, não repetida e submetida a hash/deduplicação.

## 1. Espanha
Destinos prioritários: Madrid, Barcelona, Sevilha, Málaga/Costa del Sol, Valência, Bilbao/San Sebastián, Santiago de Compostela, Baleares e Canárias. Forte densidade cultural, gastronômica e urbana. Madrid e Barcelona como gateways; AVE favorece circuitos multicidade. Cultura: museus, modernismo, legado andaluz, Caminho de Santiago e patrimônio histórico. Gastronomia: tapas, pintxos, vinhos, mercados e experiências enogastronômicas. Hotelaria: urbanos de luxo, hotéis históricos, resorts de ilhas e propriedades vinícolas. SEO: `/curadoria/espanha/`. Fonte oficial: Spain.info, checked_at 2026-09-08.

## 2. Türkiye
Destinos: İstanbul, Cappadocia, Bodrum, Antalya/Turkish Riviera, İzmir/Egeu, Pamukkale e Éfeso. Combinação de patrimônio, costa, gastronomia e hotelaria. Gate específico para balão, mar, yachting e eventos. SEO: `/curadoria/turkiye/`. Fonte oficial: GoTürkiye/TGA, checked_at 2026-09-08.

## 3. Tailândia
Destinos: Bangkok, Chiang Mai, Phuket, Koh Samui, Krabi, Chiang Rai. Clima tropical regionalmente variável; tratar monções e diferença Andaman/Golfo por destino. Cultura, templos, gastronomia, ilhas, wellness e hotelaria de luxo. Gate para transfers marítimos, clima e projetos com animais. SEO: `/curadoria/tailandia/`. Fonte oficial: Tourism Authority of Thailand, checked_at 2026-09-08.

## 4. Indonésia
Destinos: Bali/Ubud/Nusa Dua, Java/Yogyakarta/Borobudur, Komodo/Labuan Bajo, Lombok/Gili, Raja Ampat, Lake Toba. Conteúdo por ilha e região; forte eixo natureza, cultura, wellness, aventura e mar. Gate para parques, vulcões, liveaboards e regras de Bali. SEO: `/curadoria/indonesia/`. Fonte oficial: Wonderful Indonesia / Ministry of Tourism, checked_at 2026-09-08.

## 5. Vietnã
Destinos: Hanoi, Ha Long/Lan Ha, Hoi An/Da Nang, Ho Chi Minh City, Hue, Ninh Binh, Phu Quoc. Sazonalidade precisa ser regional (norte/centro/sul). Gastronomia, patrimônio, cruzeiros boutique, resorts e roteiros privados. SEO: `/curadoria/vietna/`. Fonte oficial: Vietnam.travel / Viet Nam National Authority of Tourism, checked_at 2026-09-08. Regimes de visa/e-visa devem ser revalidados por nacionalidade.

## 6. Singapura
Destinos/bairros: Marina Bay, Orchard, Singapore River, Chinatown, Little India, Kampong Gelam, Sentosa, Mandai. City-break premium, gastronomia, design, shopping e conectividade. SEO: `/curadoria/singapura/`. Fonte oficial: VisitSingapore / Singapore Tourism Board, checked_at 2026-09-08.

## 7. Malásia
Destinos: Kuala Lumpur, Penang/George Town, Langkawi, Malacca, Sabah/Kota Kinabalu, Sarawak/Kuching. Cultura multicultural, ilhas, Borneo, gastronomia e natureza. SEO: `/curadoria/malasia/`. Fonte oficial principal: Tourism Malaysia / malaysia.travel. **SOURCE_QA_PARTIAL** neste ciclo porque a homepage não respondeu integralmente ao fetch.

## 8. Filipinas
Destinos: Manila, Palawan/El Nido/Coron, Boracay, Cebu, Bohol, Siargao, Banaue/norte. Arquipélago com forte dependência de clima, voos domésticos e barcos. Hotelaria de ilha, mergulho, expedições privadas e wellness. SEO: `/curadoria/filipinas/`. Fonte oficial: Philippines.travel, checked_at 2026-09-08.

## 9. Coreia do Sul
Destinos: Seoul, Busan, Jeju, Gyeongju, Incheon, Gangwon e Daegu/Gyeongbuk. Quatro estações marcadas, KTX, cultura contemporânea, patrimônio, gastronomia, wellness/K-beauty e shopping. SEO: `/curadoria/coreia-do-sul/`. Fonte oficial: VISITKOREA / Korea Tourism Organization, checked_at 2026-09-08.

## 10. Índia
Destinos: Delhi, Agra, Jaipur/Rajasthan, Mumbai, Varanasi, Kerala, Goa, Udaipur/Jodhpur, Himalaias e sul cultural. Escala nacional exige planejamento por rota e mês. Hotelaria palaciana, Ayurveda/wellness, backwaters, patrimônio, safáris quando aplicável e gastronomia regional. SEO: `/curadoria/india/`. Fonte oficial: Incredible India, checked_at 2026-09-08. Gate para visto/entrada, saúde, parques, trens, safáris e acessos religiosos.

## Manifesto obrigatório de mídia
Por país: 1 hero horizontal; 3–5 imagens editoriais por destinos prioritários; 1 gastronomia; 1 hotelaria/experiência; 1 vídeo/reel vertical; 1 feed 4:5; 1 story 9:16. Campos: source_url, author, license, rights_scope, width, height, captured_at, downloaded_at, SHA-1 quando houver, SHA-256 local, perceptual hash, alt text, crop policy, brand_fit, destination_scope e duplicate_check.

## Gates
- Consular/documentação: PARAMETRIZED_DRAFT até nacionalidade + data.
- Saúde/vacinas/seguro: DYNAMIC_QA.
- Clima/eventos/horários/preços/disponibilidade: DYNAMIC_QA.
- Hotelaria/experiências: sem inferir parceria ANG; tarifas/disponibilidade somente por cotação real.
- CMS: UPLOAD_PENDING_CHANNEL até sessão autenticada, backup e staging.
- Publicação: não marcar PUBLISHED sem URL/permalink/ID e teste pós-reload.
- Social: READY_FOR_CREATIVE apenas com master oficial e mídia real.

## Fontes oficiais base
Spain.info; GoTürkiye/TGA; Tourism Authority of Thailand; Wonderful Indonesia/Ministry of Tourism; Vietnam.travel; VisitSingapore/STB; Tourism Malaysia; Philippines.travel; VISITKOREA/KTO; Incredible India.

## Status
READY_QA_TEXT para estrutura editorial; SOURCE_QA_PARTIAL para Malásia; MEDIA_PENDING_LICENSE_HASH para os dez países; UPLOAD_PENDING_CHANNEL para CMS. Nenhum item publicado neste ciclo.
