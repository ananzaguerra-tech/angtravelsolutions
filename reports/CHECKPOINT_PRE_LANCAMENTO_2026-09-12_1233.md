# Checkpoint pré-lançamento — 2026-09-12 12:33 BRT

## WordPress / site
- Home permanece em manutenção via `ang-home-maintenance`; HTTP 503 confirmado.
- Internas críticas públicas com HTTP 200: Quem Somos, Serviços & Outsourcing, Luxury Brazil, Conteúdo Global, Sustentabilidade, Fale Conosco, Área Restrita e Acesso ANG.
- Quem Somos, Private Collections, Curadoria Global, Salas VIP, Fornecedores e Yachts & Cruzeiros recuperados/enriquecidos.
- Menu principal limpo e sem duplicações; menu antigo preservado para rollback.
- `Textos site(2).docx` localizado na Biblioteca e adotado como fonte canônica de conteúdo aprovado, respeitando regras posteriores de branding/governança.
- Secure Forms: teste positivo passou, mas testes negativos falharam em produção (honeypot preenchido e ausência de e-mail/consentimento retornaram `success`). STATUS=P0_BLOCKED.
- Correção server-side preparada em draft theme, validando e-mail, consentimento, honeypot e tempo de preenchimento. Preview: `https://angtravelsolutions.com.br/?wpvibe_preview=xoPBVrIqNia0c3HwMfoL4vNhLBby3RSa`. Falta promoção do draft + reteste negativo antes de PASS.

## Google Business
- ANG Travel Americana: OPEN, Voice of Merchant=true, sem duplicidade detectada; posts publicados e LIVE.
- ANG Travel Solutions Campinas: OPEN, Voice of Merchant=true, sem duplicidade detectada; posts publicados e LIVE.
- Não desativar fichas. Fichas que exigirem verificação ficam para ação manual da titular.

## Social / conteúdo
- Gate REAL_ONLY vigente: IA visual final, logo recriada, mídia repetida ou sem licença = proibidos.
- Todos os visuais de IA gerados em 12/09 marcados REJECTED_DO_NOT_USE.
- Master Canva oficial ANG Luxury Brazil localizado: `DAHT5P7g1tI`.
- Textos Sites, Hotmart, Unsplash, Freepik, acervo próprio e fontes oficiais/fornecedores entram como fontes complementares conforme licença e anti-duplicidade.
- Pacote Hotmart confirmado por compra, porém ainda não materializado em Downloads; não contabilizar vídeos/fotos até arquivo real disponível.

## n8n / Concierge
- n8n base HTTP 200; webhook público `ang-whatsapp-concierge` GET HTTP 200.
- `N8N_API_KEY` local ausente. Não ativar `FzQQYBrgzo2wU8bm` como Concierge sem prova; workflow continua associado ao executor social/operacional histórico.

## Pendências bloqueadoras
1. Publicar correção Secure Forms do draft após preview e retestar sucesso/erro/antispam server-side.
2. Smoke visual desktop/mobile das internas + links + cache.
3. Área Restrita/Console/Treinamentos: validar módulos, permissões, conteúdo e navegação.
4. Concierge: identificar workflow live exato, concluir inbound/outbound real e Meta.
5. Social setembro: converter itens para READY_PUBLISH somente com mídia real/licenciada + master logo + anti-duplicidade + copy QA.
6. Demais fichas Google: conectar/validar/publicar sem duplicidade; verificação manual pela titular quando exigida.
7. Curadoria mundial: continuar canonical crosswalk e conteúdo robusto por destino com fonte oficial, checked_at e manifesto de mídia.

## Bloqueio de Drive
A tentativa de atualizar `ANG_WORK_COMANDO_MESTRE_EXECUCAO_TOTAL_2026-09-10.txt` no Drive falhou com `storageQuotaExceeded`. Nenhum arquivo foi apagado para liberar espaço.

## Regra de status
Nunca marcar PASS/PUBLISHED/CONCLUÍDO/100% sem evidência objetiva (HTTP, ID, permalink, execution ID, teste ou registro verificável).
