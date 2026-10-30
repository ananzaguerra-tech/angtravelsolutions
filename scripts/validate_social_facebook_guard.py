#!/usr/bin/env python3
"""Fail-closed regression guard for ANG Facebook social executors."""

from __future__ import annotations

import argparse
import json
import sys
import tempfile
from pathlib import Path

CANONICAL = "353450855530042"
FORBIDDEN = "1214700205067389"

FAIL_CLOSED = Path("docs/integrations/ZEUS_SOCIAL_EXECUTOR_GITHUB_AUTH_V5_FAIL_CLOSED_IMPORT.json")
LEGACY = Path("docs/integrations/ZEUS_SOCIAL_EXECUTOR_GITHUB_AUTH_V5_IMPORT.json")
GOVERNANCE = Path("ops/social/ANG_FACEBOOK_DESTINATION_GOVERNANCE_2026-10-29.md")


def node_code(workflow: dict, node_id: str) -> str:
    for node in workflow.get("nodes", []):
        if node.get("id") == node_id:
            return str(node.get("parameters", {}).get("jsCode", ""))
    return ""


def validate(root: Path) -> list[str]:
    errors: list[str] = []
    try:
        guarded = json.loads((root / FAIL_CLOSED).read_text(encoding="utf-8"))
        legacy = json.loads((root / LEGACY).read_text(encoding="utf-8"))
        policy = (root / GOVERNANCE).read_text(encoding="utf-8")
    except (OSError, json.JSONDecodeError) as exc:
        return [f"LOAD_ERROR:{exc}"]

    select = node_code(guarded, "v5-selectpage")
    gate = node_code(guarded, "v5-action-guard")
    legacy_select = node_code(legacy, "v5-selectpage")

    checks = {
        "guarded_active_false": guarded.get("active") is False and guarded.get("meta", {}).get("active") is False,
        "guarded_canonical_id": CANONICAL in select and CANONICAL in gate,
        "guarded_forbidden_id": FORBIDDEN in select and FORBIDDEN in gate,
        "guarded_requires_payload_page_id": "facebook_page_id" in gate,
        "guarded_forbidden_legacy_payload": "CURADORIA_ANG_AGOSTO" in gate,
        "guarded_no_first_page_fallback": "pages[0]" not in select,
        "legacy_active_false": legacy.get("active") is False,
        "legacy_quarantined": "QUARANTINED" in str(legacy.get("name", "")) and "NEVER IMPORT" in str(legacy.get("name", "")),
        "legacy_hard_block": "HOLD_SUPERSEDED_EXECUTOR_NEVER_IMPORT" in legacy_select,
        "legacy_no_first_page_fallback": "pages[0]" not in legacy_select,
        "policy_canonical_id": CANONICAL in policy,
        "policy_forbidden_id": FORBIDDEN in policy and "NEVER PUBLISH" in policy,
        "policy_text_only_block": "Text-only posts are forbidden" in policy,
        "policy_media_gates": all(key in policy for key in (
            "media_id", "license_or_permission", "brand_master_id", "visual_hash",
            "REAL_MEDIA_VERIFIED", "MASTER_LOGO_VERIFIED", "NO_DUPLICATE_PASS", "COPY_QA_PASS",
        )),
    }
    errors.extend(name for name, ok in checks.items() if not ok)
    return errors


def self_test() -> int:
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        for path in (FAIL_CLOSED, LEGACY, GOVERNANCE):
            (root / path).parent.mkdir(parents=True, exist_ok=True)
        guarded = {
            "active": False,
            "meta": {"active": False},
            "nodes": [
                {"id": "v5-selectpage", "parameters": {"jsCode": f"canonical='{CANONICAL}'; forbidden='{FORBIDDEN}';"}},
                {"id": "v5-action-guard", "parameters": {"jsCode": f"facebook_page_id {CANONICAL} {FORBIDDEN} CURADORIA_ANG_AGOSTO"}},
            ],
        }
        legacy = {
            "name": "QUARANTINED — NEVER IMPORT",
            "active": False,
            "nodes": [{"id": "v5-selectpage", "parameters": {"jsCode": "HOLD_SUPERSEDED_EXECUTOR_NEVER_IMPORT"}}],
        }
        policy = (
            f"{CANONICAL} {FORBIDDEN} NEVER PUBLISH Text-only posts are forbidden "
            "media_id license_or_permission brand_master_id visual_hash REAL_MEDIA_VERIFIED "
            "MASTER_LOGO_VERIFIED NO_DUPLICATE_PASS COPY_QA_PASS"
        )
        (root / FAIL_CLOSED).write_text(json.dumps(guarded), encoding="utf-8")
        (root / LEGACY).write_text(json.dumps(legacy), encoding="utf-8")
        (root / GOVERNANCE).write_text(policy, encoding="utf-8")
        if validate(root):
            print("SELF_TEST_FAIL")
            return 1
        guarded["nodes"][0]["parameters"]["jsCode"] += " pages[0]"
        (root / FAIL_CLOSED).write_text(json.dumps(guarded), encoding="utf-8")
        if "guarded_no_first_page_fallback" not in validate(root):
            print("SELF_TEST_FAIL_NEGATIVE_CASE")
            return 1
    print("SELF_TEST_PASS")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    errors = validate(args.root)
    print(json.dumps({"status": "PASS" if not errors else "FAIL", "errors": errors}, indent=2))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
