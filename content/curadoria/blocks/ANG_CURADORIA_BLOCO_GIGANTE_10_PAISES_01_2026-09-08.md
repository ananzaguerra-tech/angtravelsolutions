# ANG Curadoria — Bloco Gigante 10 Países 01

**Data:** 2026-09-08  
**Status:** READY_QA_TEXT / MEDIA_QA_PENDING / UPLOAD_PENDING_CHANNEL  
**Drive source:** `1rbK2Gx-erJGv1i06Ob5_qx-7QNfRk3te-418IuiyhY0`

## Países
1. Brasil
2. Estados Unidos
3. França
4. Itália
5. Portugal
6. Suíça
7. Japão
8. Grécia
9. Emirados Árabes Unidos
10. Maldivas

## Conteúdo estruturado no pacote Drive
Para cada país: visão geral editorial; dados estruturais; moeda/idioma/fuso/eletricidade; sazonalidade; entrada/documentação parametrizada; logística; destinos e cidades prioritários; atrações/cultura; gastronomia; hotelaria; experiências privadas; wellness/ski/cruzeiros/yachts quando aplicável; compras/etiqueta; CTA por unidade ANG; SEO title/meta/slug/canonical; schema hints; links internos; fontes oficiais com checked_at 2026-09-08; manifesto de mídia real/licenciada e regras de deduplicação.

## Destinos prioritários
- **Brasil:** Rio de Janeiro, São Paulo, Amazônia, Pantanal, Foz do Iguaçu, Salvador/Trancoso, Fernando de Noronha, Lençóis Maranhenses, Florianópolis.
- **Estados Unidos:** New York, Miami, Orlando, Los Angeles, San Francisco/Napa, Las Vegas, Hawaii, Alaska, Colorado/Utah/Wyoming, Washington DC/Boston/Chicago/New Orleans.
- **França:** Paris, Côte d’Azur, Provence, Bordeaux, Loire, Alpes, Normandia/Bretanha, Lyon/Borgonha/Alsácia.
- **Itália:** Roma, Florença/Toscana, Milão/Lagos, Veneza, Amalfi/Capri/Nápoles, Puglia, Sicília, Sardenha, Dolomitas/Cortina, Piemonte/Emilia-Romagna.
- **Portugal:** Lisboa, Porto/Douro, Alentejo, Algarve, Madeira, Açores, Centro/Norte.
- **Suíça:** Zurique, Lucerna, Interlaken/Jungfrau, Zermatt, St. Moritz/Engadin, Genebra/Lausanne/Montreux, Bern, Ticino, Gstaad/Verbier/Crans-Montana/Davos.
- **Japão:** Tokyo, Kyoto, Osaka, Nara/Kobe/Himeji, Hakone/Fuji, Kanazawa/Takayama, Hokkaido/Niseko, Setouchi, Hiroshima/Miyajima, Kyushu, Okinawa.
- **Grécia:** Atenas/Attica, Santorini, Mykonos, Creta, Cyclades alternativas, Dodecaneso, Ionian, Peloponeso, Thessaloniki/Macedônia.
- **EAU:** Dubai, Abu Dhabi, Al Ain, Ras Al Khaimah, Sharjah.
- **Maldivas:** Malé City, Hulhumalé/Hulhulé, North & South Malé Atoll, Baa Atoll, Ari Atolls, Addu Atoll e ilhas/resorts apenas com produto/transfer validado.

## Fontes oficiais verificadas
- Brasil: https://www.visitbrasil.com/
- Estados Unidos / Visa Waiver Program: https://travel.state.gov/content/travel/en/us-visas/tourism-visit/visa-waiver-program.html
- França: https://www.france.fr/
- Itália: https://www.italia.it/en
- Portugal: https://www.visitportugal.com/en
- Suíça: https://www.myswitzerland.com/
- Japão: https://www.japan.travel/en/
- Grécia: https://www.visitgreece.gr/
- Dubai: https://www.visitdubai.com/en
- Abu Dhabi: https://visitabudhabi.ae/en
- Maldivas: https://visitmaldives.com/en/

## Import gates
- Preserve `post_id` / `external_id` canônicos quando existentes.
- Não deduplicar somente por título.
- Matching obrigatório: país → cidade/destino → slug → external_id.
- `execute=false` até backup + staging + QA + smoke test + rollback.
- Regras consulares continuam parametrizadas por nacionalidade.
- Mídia precisa de origem, autor, licença, dimensões, SHA-256 e perceptual hash.
- Nenhum item deste bloco está publicado.

## Próxima ação
Quebrar estes 10 países nas páginas/cidades do mapa 881/WORLD, produzir módulos aprofundados por destino, gerar payload CSV/JSON de ingestão canônica e avançar para o bloco seguinte de 10 países sem interromper as demais frentes.
