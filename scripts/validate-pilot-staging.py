#!/usr/bin/env python3
import csv
import json
import sys
from pathlib import Path

MANIFEST = Path("content/destinations/pilot-qa-5-staging-manifest.json")
MEDIA = Path("content/destinations/pilot-qa-5-media-manifest.csv")
EXPECTED_DESTINATIONS = {"Rio de Janeiro", "Paris", "Milão", "Nova York", "Lisboa"}
BLOCKED_MEDIA_STATES = {"HOLD_LICENSE_PROOF", "PENDING_LICENSE", "BLOCK", "NOT_VERIFIED"}

def fail(errors, msg):
    errors.append(msg)

def validate_manifest(errors):
    try:
        data = json.loads(MANIFEST.read_text(encoding="utf-8"))
    except Exception as exc:
        fail(errors, f"{MANIFEST}: invalid JSON: {exc}")
        return set()

    items = data.get("destinations")
    if not isinstance(items, list) or not items:
        fail(errors, f"{MANIFEST}: destinations must be a non-empty array")
        return set()

    seen_names, seen_posts, seen_external, seen_slugs = set(), set(), set(), set()
    for i, item in enumerate(items):
        loc = f"{MANIFEST}.destinations[{i}]"
        if not isinstance(item, dict):
            fail(errors, f"{loc}: object required")
            continue
        name = str(item.get("destination") or item.get("name") or "").strip()
        post_id = str(item.get("post_id") or "").strip()
        external_id = str(item.get("external_id") or "").strip()
        slug = str(item.get("slug") or "").strip()
        seo_title = str(item.get("seo_title") or "").strip()
        meta = str(item.get("meta_description") or "").strip()
        gates = item.get("gates") or {}

        if not name: fail(errors, f"{loc}.destination: required")
        if not post_id.isdigit(): fail(errors, f"{loc}.post_id: numeric WordPress ID required")
        if len(external_id) < 32: fail(errors, f"{loc}.external_id: stable external ID required")
        if not slug: fail(errors, f"{loc}.slug: required")
        if not seo_title or len(seo_title) > 65: fail(errors, f"{loc}.seo_title: required and <=65 chars")
        if not meta or not 110 <= len(meta) <= 170: fail(errors, f"{loc}.meta_description: expected 110-170 chars")
        if not isinstance(gates, dict): fail(errors, f"{loc}.gates: object required")

        for value, seen, label in ((name, seen_names, "destination"), (post_id, seen_posts, "post_id"), (external_id, seen_external, "external_id"), (slug, seen_slugs, "slug")):
            if value and value in seen: fail(errors, f"{loc}.{label}: duplicate {value}")
            if value: seen.add(value)

        if isinstance(gates, dict):
            if gates.get("identity") != "PASS": fail(errors, f"{loc}.gates.identity: must be PASS")
            if gates.get("source") not in {"PASS", "FACTUAL_PASS"}: fail(errors, f"{loc}.gates.source: must be PASS/FACTUAL_PASS")
            if gates.get("staging") == "PASS" and gates.get("media") in BLOCKED_MEDIA_STATES:
                fail(errors, f"{loc}: staging cannot PASS while media is blocked")

    if seen_names != EXPECTED_DESTINATIONS:
        fail(errors, f"{MANIFEST}: expected pilots {sorted(EXPECTED_DESTINATIONS)}, found {sorted(seen_names)}")
    return seen_names

def validate_media(errors, manifest_names):
    try:
        with MEDIA.open("r", encoding="utf-8-sig", newline="") as fh:
            rows = list(csv.DictReader(fh))
    except Exception as exc:
        fail(errors, f"{MEDIA}: invalid CSV: {exc}")
        return
    if not rows:
        fail(errors, f"{MEDIA}: at least one row required")
        return

    fields = {f.strip() for f in (rows[0].keys() or []) if f}
    def pick(row, *names):
        for n in names:
            if n in row and row[n] is not None:
                return str(row[n]).strip()
        return ""

    media_names = set()
    for i, row in enumerate(rows, start=2):
        name = pick(row, "destination", "destino", "name")
        if name: media_names.add(name)
        rights = pick(row, "rights_status", "license_status", "status_direitos", "status")
        source = pick(row, "source", "official_library", "biblioteca_oficial", "source_url")
        alt = pick(row, "alt_text", "alt", "texto_alt")
        credit = pick(row, "credit", "credito", "attribution")
        if not name: fail(errors, f"{MEDIA}:{i}: destination required")
        if not source: fail(errors, f"{MEDIA}:{i}: source/library required")
        if not rights: fail(errors, f"{MEDIA}:{i}: rights/license status required")
        if rights.upper() in {"PASS", "APPROVED", "LICENSED"} and not credit:
            fail(errors, f"{MEDIA}:{i}: approved media requires documented credit/attribution")
        if not alt: fail(errors, f"{MEDIA}:{i}: alt text required")

    missing = manifest_names - media_names
    if missing: fail(errors, f"{MEDIA}: missing media rows for {sorted(missing)}")

def main():
    errors = []
    if not MANIFEST.exists(): fail(errors, f"missing {MANIFEST}")
    if not MEDIA.exists(): fail(errors, f"missing {MEDIA}")
    names = validate_manifest(errors) if MANIFEST.exists() else set()
    if MEDIA.exists(): validate_media(errors, names)
    if errors:
        print("\n".join(f"ERROR: {e}" for e in errors), file=sys.stderr)
        return 1
    print("PASS: pilot manifest/media controls are structurally consistent. This does not authorize publication.")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
