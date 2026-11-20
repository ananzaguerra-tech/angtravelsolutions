# Página 108 — plano de sanitização sem aplicação

## Estado confirmado em 20/11/2026 18:58 BRT

- Página: `108`, slug `/fale-conosco/`, status WordPress `publish`.
- Revisão atual analisada: `153632`.
- Revisão anterior comparada: `153596`.
- A revisão atual trocou os endereços visíveis por elementos `hidden`, mas não removeu os dados da origem.
- O conteúdo atual ainda contém `16` atributos `data-map-address`, `14` spans ocultos com endereços, `1` iframe do Google Maps e `1` script que injeta o endereço selecionado no mapa.
- A URL inicial do iframe ainda contém o endereço completo de Campinas.

## Transformação mínima proposta

1. Preservar o título, formulário, canais oficiais, cidades e países já existentes.
2. Alterar o subtítulo `Nossos endereços` para `Onde atendemos`.
3. Substituir cada botão de mapa por item sem `data-map-address`, mantendo exclusivamente o texto `Cidade · País`.
4. Remover integralmente os `span hidden` que contêm rua, número, complemento e CEP.
5. Remover o iframe `#ang-address-map` e seu contêiner.
6. Remover integralmente o script que lê `[data-map-address]` e monta URLs do Google Maps.
7. Remover CSS residual exclusivo do iframe/mapa.
8. Após aplicação em staging: limpar cache; verificar HTML anônimo, DOM, atributos, fonte da página e mobile para zero ocorrências de ruas, números, CEPs, `data-map-address`, `ang-address-map` e `google.com/maps?q=`.
9. Testar formulário, LGPD, sucesso, erro, antispam e responsividade antes de qualquer publicação.

## Gate

`READY_FOR_STAGING=false` enquanto não houver backup integral e staging verificável. As revisões da página permitem rollback do conteúdo da página, mas não cobrem header, plugin, tema, cache ou banco completo.

## Rollback previsto

- Conteúdo da página: revisão `153632`.
- Site integral: pendente de backup de hospedagem; sem esse artefato, nenhuma aplicação está autorizada.
