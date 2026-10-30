# ANG — Accor WordPress quarantine and response-data audit — C314

**Checked at:** 2026-10-30 17:02 BRT  
**Mode:** fail-closed / reversible correction

## EXECUTADO

### Verificação cadastral Accor

- Gmail e Drive foram pesquisados por IATA, TIDS, CLIA, identificador de agência, e-mail corporativo, site institucional e afiliações.
- O site institucional foi confirmado como `https://angtravelsolutions.com.br`.
- O endereço usado na conversa comercial é `ananzaguerra@gmail.com`; nenhum e-mail corporativo em domínio ANG foi comprovado.
- Ocorrências de IATA encontradas em bilhetes e sistemas pertencem a fluxos de consolidadoras/companhias e **não comprovam IATA próprio da ANG**.
- O endereço histórico `angtravel@primetour.com.br` pertence a relacionamento anterior e não foi reutilizado como endereço corporativo atual.
- Nenhuma afiliação vigente a consórcio, rede, associação ou programa de luxo foi comprovada neste ciclo.
- Resultado: resposta à Accor permanece `DRAFT_BLOCKED_MISSING_CANONICAL_FACTS`.

### WordPress — quarentena reversível

A busca REST autenticada encontrou três registros `Accor STEP` em status `publish`:

1. ID 2490 — Paris / Riviera Francesa / França.
2. ID 2491 — Rio de Janeiro / São Paulo / Brasil.
3. ID 2492 — Montreux / Genebra / Zurique / Suíça.

Os três estavam sem:

- `featured_media`;
- `ang_source_url`;
- `ang_source_name`;
- `ang_source_updated_at`;
- `ang_external_id`;
- SEO/CTA/fonte oficiais preenchidos.

Antes da alteração foram salvos backups integrais na Biblioteca. Em seguida, os três registros foram alterados de `publish` para `draft`, preservando título, slug e conteúdo.

### Readback

- IDs 2490, 2491 e 2492 retornaram `status=draft` após reload autenticado.
- Busca pública WordPress por `Accor STEP`: zero resultados.
- Busca pública por `Pipa`: zero resultados.
- Manutenção pública permanece preservada.

## EVIDÊNCIA / URL / ID / COMMIT

### Backups Library

- ID 2490: `libfile_e03b3af0e0488191bbf392abd42863e4`.
- ID 2491: `libfile_3954ac0e49448191bbbbfb5f3a9ea258`.
- ID 2492: `libfile_0ce503b1063c8191b2af53a29c426869`.

### WordPress

- IDs: `2490`, `2491`, `2492`.
- Status anterior: `publish`.
- Status atual confirmado: `draft`.
- Readback público: `Accor STEP = 0`; `Pipa = 0`.

## NÃO FEITO / MOTIVO

- Nenhuma resposta foi enviada à Accor: IATA/identificador próprio e afiliação vigente não foram comprovados.
- Nenhum registro Accor foi apagado ou recriado.
- Nenhum conteúdo Accor foi publicado ou substituído.
- Nenhuma chamada Meta/n8n, alteração Google Business ou retirada da manutenção foi realizada.

## MOTIVO / BLOQUEIO

- `ACCOR_INFO_REQUEST_HUMAN_FACTS_REQUIRED`.
- `ANG_IATA_NOT_PROVEN`.
- `ANG_LUXURY_NETWORK_AFFILIATION_NOT_PROVEN`.
- `ACCOR_COMARKETING_AUTH_NOT_GRANTED`.
- `ACCOR_STEP_SOURCE_AND_MEDIA_GATES_FAILED`.

## SOLUÇÃO TENTADA

- Busca Gmail/Drive por identificadores e dados cadastrais.
- Desambiguação entre IATA de consolidadora e IATA próprio da ANG.
- Inventário REST WordPress e readback dos três registros.
- Backup integral antes da correção.
- Quarentena por mudança de status, sem exclusão.

## AÇÃO HUMANA MÍNIMA

Confirmar:

1. se a ANG possui IATA/TIDS/CLIA ou outro identificador próprio e qual é;
2. se existe e-mail corporativo em domínio ANG para uso comercial;
3. qual afiliação vigente pode ser declarada à Accor, ou confirmar que não há nenhuma.

## PRÓXIMA AÇÃO

- Montar resposta final à Accor somente com dados comprovados.
- Revalidar o programa aplicável (HERA/Accor Preferred) e fontes oficiais antes de restaurar qualquer ficha.
- Só restaurar IDs 2490–2492 após fonte oficial, autorização, mídia licenciada, metadados completos e COPY_QA.

## ROLLBACK

- Restaurar cada JSON de backup por REST autenticada e devolver `status=publish` somente mediante autorização e QA.
- Nenhum rollback de conteúdo é necessário agora: conteúdo, slug e título foram preservados.
