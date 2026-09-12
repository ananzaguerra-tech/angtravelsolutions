# ANG WordPress P0 Low-Content Audit — 2026-09-12

Published pages audited via WordPress REST: 88.

## Critical public pages with very low rendered content
- 141451 `salas-vip` — 163 chars
- 141450 `fornecedores` — 180 chars
- 67208 `private-collections` — 143 chars
- 2108 `curadoria-global` — 99 chars
- 106 `yachts-cruzeiros` — 111 chars
- 104 `curadoria` — 223 chars

## Other low-content pages / modules requiring review
- 152472 `espacos-de-trabalho` — 287 chars
- 106242 `ang-connect-academy` — 34 chars
- 106241 `intranet-ang` — 35 chars
- 86748 `ang-celebration` — 344 chars
- 86745 `ang-travel-solutions` — 335 chars
- 86743 `privillege` — 215 chars
- 83176 `seja-um-franqueado` — 314 chars
- 81898 `area-do-agente` — 329 chars
- 73548 `proposal-studio` — 434 chars
- 67422 `nossos-escritorios` — 182 chars
- 57680 `grupos-2` — 245 chars
- 57679 `concierge-2` — 271 chars
- 57676 `console-cotacao-ang` — 313 chars
- 51696 `nova-cotacao` — 27 chars
- 47554 `login-agencias` — 31 chars
- 47551 `franquias` — 192 chars
- 47549 `concierge` — 222 chars
- 2435 `ang-franchising` — 85 chars
- 2434 `ang-mice-business-travel` — 78 chars
- 2433 `ang-luxury-brazil` — 344 chars
- 2432 `ang-travel` — 361 chars
- 1820 `contato` — 266 chars

## Corrective policy
Restore from WordPress revision history where a richer valid revision exists; do not recreate from scratch unless no valid source exists. Preserve maintenance mode until public P0 smoke passes. Do not touch production theme files without preview/approval.
