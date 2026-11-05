# ANG — Samoa 881 offline dedupe + WordPress reachability — C328

**checked_at:** 2026-11-05 17:02 BRT  
**master baseline:** Library version 39

## EXECUTADO
- Gmail partnership watch: zero new messages in the last day for Accor, Club Med, TTW/Guilherme Valle and Il Borro/Simone Pampaloni.
- Drive search: no `ANG STATUS LIVE C328` artifact found.
- Canonical spreadsheet scanned for `Samoa`, `Independent State of Samoa`, `Western Samoa` and `WSM` in both canonical tabs.
- WordPress reachability rechecked through public origin and two connected paths.

## EVIDÊNCIA
- `Item Register!A1:P900`: 0 matches for each of four aliases.
- `WP Export Identity 24-07!A1:H900`: 0 matches for each of four aliases.
- Public home returned HTTP 502 Bad Gateway.
- WPVibe: unreachable.
- WPWriter: connection record active, but posts/pages could not be fetched.

## URL/ID/COMMIT
- 881 sheet: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Site: https://angtravelsolutions.com.br

## NÃO FEITO
- No WordPress mutation, publication, page correction, media upload or database write.
- No Samoa module marked PASS.
- No social, Google Business, Meta/n8n or blog publication.

## MOTIVO / BLOQUEIO
The WordPress origin remains unavailable. Live CMS identity, external-id derivation, visual-hash validation, backup and readback cannot be proven. Nationality-specific immigration confirmation is not established.

## SOLUÇÃO TENTADA
Rechecked public origin, WPVibe and WPWriter, then advanced the independent 881 offline reconciliation without forcing a write.

## AÇÃO HUMANA MÍNIMA
Hosting administrator: inspect origin/PHP/database/upstream health and restore the existing site without disabling maintenance or recreating content.

## PRÓXIMA AÇÃO
After recovery, back up page 2109, validate staging/readback, reconcile Samoa against live CMS identifiers and only then resume the P0 callout correction.

## ROLLBACK
No production mutation occurred. Revert the two C328 GitHub commits if the offline evidence must be superseded.
