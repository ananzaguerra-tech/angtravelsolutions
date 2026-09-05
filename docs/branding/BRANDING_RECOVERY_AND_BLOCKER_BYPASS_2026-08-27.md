# Branding recovery + blocker bypass — 2026-08-27

## Evidências recuperadas
- Drive `04_BRANDING`: `17EF_h5-gZMlpMtq6w7lcOJAzc-rSHfpJ`.
- Estrutura criada em 27/08/2026:
  - `01_MASTERS_OFICIAIS`: `1NsKAHj2b3wcPsg8EY9dfhzSTR5eCLchD`
  - `02_REFERENCIAS_RECUPERADAS`: `1Hh_7ssXYR322L2eMO9uCddq-k2sf7-fr`
  - `03_HOLD_REVISAO`: `1yFILu8fPilnKndBF6mnJ4Y3OULu-xPed`
- Já existentes em `04_BRANDING`:
  - `INVENTARIO_VARIANTES_LOGOS_ANG_2026-08-25.csv`
  - `FICHA_TECNICA_IDENTIDADE_ANG_GROUP_OFICIAL_2026.md`
- File Library recuperada:
  - `CATALOGO_VISUAL_LOGOS_ANG_28-07-2026.pdf` — catálogo visual 20 pranchas.
  - `INVENTARIO_LOGOS_ANG_28-07-2026.csv` — inventário com hashes SHA-256 dos estudos/pranchas.

## Regras oficiais recuperadas
- ANG Group: dourado institucional `#b88936`; preservar esfera/insígnia oficial.
- ANG Travel: manter logo atual integralmente.
- ANG Travel Solutions: arquitetura aprovada em lilás; preservar insígnia/composição.
- ANG Business Travel: insígnia antiga ANG Corporate em dourado; texto `#f2c84b`.
- ANG MICE: insígnia própria; `#b14b1e`.
- ANG Celebrations: marca separada; não fundir com ANG Travel. A ficha normativa reconfirmada em 14/08/2026 determina `Opção 3`; pranchas exploratórias não devem substituir o master. O arquivo-fonte isolado ainda precisa ser recuperado/QA antes de kit final SVG/PNG.
- ANG Luxury Brazil: `Opção 30` prevalente; catálogo visual recuperado mostra a opção 30 na prancha `ANG Luxury Brazil: quatro conceitos premium.png` como a segunda proposta, assinatura horizontal `ANG LUXURY BRAZIL` e gesto dourado fluido em três traços. `Brazil` com Z. Hash da prancha no inventário histórico: `47d1a5575dea44a97fb8fd736b1a6d44c309a6a85a53382489e4d8a2bb149b22`.

## Estado do inventário de variantes 25/08
Todos os kits finais continuam explicitamente `AGUARDA_MASTER_OFICIAL`; isso significa que a decisão visual está recuperada, mas ainda faltam os arquivos mestres finais por unidade (SVG/PNG 3000px, versões inversas e hashes). Não transformar captura/prancha em SVG inventado.

## Estratégia de eliminação de bloqueios
1. Nunca contornar MFA/CAPTCHA/controle de conta por meios inseguros. Quando autenticação é obrigatória, usar somente sessão autorizada ou integração API oficialmente autenticada.
2. Preferir automação server-to-server autenticada por credenciais/cofre já existentes e tokens de curta duração; nunca gravar segredos em código, issue ou logs.
3. Social: materializar mídia em URL pública durável, validar unidade/idioma/localização, enviar ao executor Meta somente quando o binding autenticado estiver ativo; exigir `publication_id`/permalink real.
4. Google Business: atualizar/reivindicar perfis existentes sem duplicar; exigir URL/ID real e verificação oficial.
5. n8n/Meta/WhatsApp: Webhook GET/POST, HMAC, idempotência, Error Workflow, retry e handoff; nenhum E2E PASS sem inbound e outbound reais.
6. WordPress/go-live: manter manutenção enquanto P0 não tiver staging restaurável, smoke tests, Secure Forms, Área Restrita, backup e rollback testados.
7. Curadoria: 881/881 identidade fechada; publicar somente lotes reversíveis com mídia real/licenciada, QA, SEO/schema e staging PASS.
8. Wooba/XML: não inventar endpoint/credencial; concluir documentação/registro com Wooba e somente então integrar credenciais oficiais.
9. ANG Connect: preservar :8088 e não alterar ambiente local sem inventário/health-check no host real.
10. Branding: recuperar o arquivo-fonte inequívoco das opções aprovadas; até lá, usar somente masters atuais já aprovados onde existirem e manter opções/pranchas em `HOLD_REVISAO`.

## Regra de verdade
Nenhum item recebe `PUBLISHED`, `PASS`, `CONCLUÍDO` ou `100%` sem evidência verificável: URL/ID, log/teste, resposta de sistema, hash ou artefato.
