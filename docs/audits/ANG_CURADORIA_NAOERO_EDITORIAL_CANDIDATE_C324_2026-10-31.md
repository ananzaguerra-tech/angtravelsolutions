# ANG Curadoria — candidato editorial Naoero — C324

**Data de verificação:** 2026-10-31 03:00 BRT  
**Estado:** `NO_PUBLISH`  
**Identidade canônica:** `naoero`  
**Commit do candidato:** `7343b4fc15a4eec2b26b90233094df3f5a8ed222`

## EXECUTADO

- Revalidada a mudança oficial de nome para **Naoero / Republic of Naoero**.
- Criado um único candidato canônico; `Nauru`, `Republic of Nauru`, `NR` e `NRU` permanecem aliases, sem segunda identidade.
- Estruturados SEO, schema, CTA candidato e módulos de Yaren, Anibare Bay, Command Ridge e Buada Lagoon com fonte por módulo.
- Registrada a tabela pública de visto de visitante: AUD 50 até 1 mês, AUD 150 até 2 meses, AUD 250 até 3 meses.
- Aplicado fail-closed a mídia, logo, duplicidade, elegibilidade migratória por nacionalidade, CMS e publicação.
- Gmail: neste ciclo não houve nova resposta positiva além do histórico já registrado; Accor ainda sem autorização pública inequívoca de co-marketing/mídia.
- Drive: não foi localizado STATUS LIVE C324 nem documento canônico adicional de Naoero.

## EVIDÊNCIA

1. RONLAW: https://ronlaw.gov.nr/docs/any/naoero
2. ONU — Estado-membro Naoero: https://www.un.org/en/about-us/member-states/naoero
3. ONU Data — perfil legado NR: https://data.un.org/legacy/en/iso/nr.html
4. Department of Justice & Border Control — Immigration Division: https://justice.gov.nr/immigration-division/
5. Pacific Sustainable Tourism Portal: https://southpacificislands.travel/sustainable/country-profiles/nauru/
6. Portal de destino — Buada Lagoon: https://visitnauru.org/discover/buada-lagoon
7. Candidato: `ops/curadoria/candidates/ANG_CURADORIA_NAOERO_C324_2026-10-31.json`

## URL / ID / COMMIT

- Candidato: https://github.com/ananzaguerra-tech/angtravelsolutions/blob/staging/ops/curadoria/candidates/ANG_CURADORIA_NAOERO_C324_2026-10-31.json
- Commit: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/7343b4fc15a4eec2b26b90233094df3f5a8ed222
- CMS/post/permalink/publication ID: **não existem**.

## NÃO FEITO

- Nenhuma publicação em WordPress, Instagram, Facebook ou Google Business.
- Nenhuma mídia foi selecionada, baixada, recortada ou gerada.
- Nenhuma afirmação de elegibilidade, dispensa ou aprovação para passaporte brasileiro.
- Nenhum post de texto foi criado.
- Nenhum código ISO foi renomeado.

## MOTIVO / BLOQUEIO

- `REAL_MEDIA_VERIFIED=false`.
- `MASTER_LOGO_VERIFIED=false`.
- `NO_DUPLICATE_PASS=false`.
- `IMMIGRATION_NATIONALITY_PASS=false`.
- `CMS_STAGING_PASS=false`.
- O portal de imigração publica classes e taxas gerais, mas não prova a regra específica para brasileiros.
- Os módulos editoriais ainda precisam de validação local/operacional antes de prometer acesso, horários, transporte ou atividades.

## SOLUÇÃO TENTADA

- Priorizadas fontes legais, ONU, autoridade migratória e rede regional de turismo.
- Separadas identidade oficial, aliases técnicos e fatos dinâmicos.
- Reduzido o texto a afirmações suportadas; promessas operacionais foram excluídas.
- Aplicados gates explícitos no próprio JSON para impedir publicação acidental.

## AÇÃO HUMANA MÍNIMA

1. Obter confirmação escrita da autoridade migratória sobre passaporte brasileiro.
2. Selecionar mídia real com licença/uso comercial rastreável.
3. Validar o master de logo aplicável.
4. Aprovar staging CMS com permalink e leitura visual antes de qualquer publicação.

## PRÓXIMA AÇÃO

- Reconciliar o candidato no índice 881/WORLD sem duplicar `Nauru`.
- Executar dedupe por canonical key, slug, aliases e visual hash.
- Produzir staging apenas quando mídia/licença e master estiverem comprovados.
- Manter `NO_PUBLISH` até todos os gates passarem.

## ROLLBACK

Reverter os commits deste ciclo. Não há rollback externo porque nenhum CMS, canal social, GBP ou workflow foi alterado.
