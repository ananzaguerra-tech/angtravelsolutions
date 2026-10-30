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
FACEBOOK = Path("docs/integrations/ZEUS_FACEBOOK_CANONICAL_PUBLISHER_V1_FAIL_CLOSED_IMPORT.json")
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
        facebook = json.loads((root / FACEBOOK).read_text(encoding="utf-8"))
        policy = (root / GOVERNANCE).read_text(encoding="utf-8")
    except (OSError, json.JSONDecodeError) as exc:
        return [f"LOAD_ERROR:{exc}"]

    select = node_code(guarded, "v5-selectpage")
    gate = node_code(guarded, "v5-action-guard")
    publish = node_code(guarded, "v5-publish")
    legacy_select = node_code(legacy, "v5-selectpage")
    facebook_gate = node_code(facebook, "fbv1-action-guard")
    facebook_select = node_code(facebook, "fbv1-selectpage")
    facebook_publish = node_code(facebook, "fbv1-publish")
    facebook_connections = facebook.get("connections", {})
    facebook_guard_main = facebook_connections.get("Fail Closed — Validar Facebook", {}).get("main", [])
    facebook_route_main = facebook_connections.get("Rota Facebook autorizada?", {}).get("main", [])

    checks = {
        "facebook_active_false": facebook.get("active") is False and facebook.get("meta", {}).get("active") is False,
        "facebook_canonical_only": CANONICAL in facebook_gate and CANONICAL in facebook_select and FORBIDDEN in facebook_gate and FORBIDDEN in facebook_select,
        "facebook_channel_scope": all(key in facebook_gate for key in ("channels", "facebook", "UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL")),
        "facebook_photo_only_video_hold": all(key in facebook_gate for key in ("facebook_photo", "HOLD_FACEBOOK_VIDEO_NOT_IMPLEMENTED", "HOLD_UNSUPPORTED_FACEBOOK_FORMAT")),
        "facebook_media_provenance_gates": all(key in facebook_gate for key in ("media_id", "source", "author_or_owner", "license_or_permission", "brand_master_id", "theme_key", "visual_hash", "sha256", "REAL_MEDIA_VERIFIED", "MASTER_LOGO_VERIFIED", "NO_DUPLICATE_PASS", "COPY_QA_PASS")),
        "facebook_idempotency_holds": all(key in facebook_gate for key in ("idempotency_key", "idempotency_record_id", "idempotency_persistence_verified", "idempotency_state", "UNUSED", "DURABLE_IDEMPOTENCY_LEDGER_NOT_IMPLEMENTED", "POST_SUCCESS_ATOMIC_LEDGER_WRITE_NOT_PROVEN")),
        "facebook_auth_hold": "META_ORGANIC_AUTH_READBACK_MISSING" in facebook_gate,
        "facebook_forbidden_payload": "CURADORIA_ANG_AGOSTO" in facebook_gate,
        "facebook_server_side_hard_block": "HOLD_SERVER_SIDE_LEDGER_AND_AUTH_NOT_WIRED" in facebook_gate and all(key not in facebook_gate for key in ("p.durable_ledger_ready", "p.post_success_atomic_write_ready", "p.meta_auth_readback_verified")),
        "facebook_guard_routes_to_if": bool(facebook_guard_main and facebook_guard_main[0] and facebook_guard_main[0][0].get("node") == "Rota Facebook autorizada?"),
        "facebook_if_true_meta_false_response": bool(len(facebook_route_main) == 2 and facebook_route_main[0] and facebook_route_main[1] and facebook_route_main[0][0].get("node") == "Meta — Descobrir Páginas" and facebook_route_main[1][0].get("node") == "Responder Facebook V1"),
        "facebook_no_first_page_fallback": "pages[0]" not in facebook_select,
        "facebook_readback_receipt": all(key in facebook_publish for key in ("post_id", "publication_id", "permalink_url", "permalink", "execution_id", "readback_verified", "HOLD_POST_PUBLICATION_READBACK_FAILED")),
        "facebook_atomic_write_not_claimed": all(key in facebook_publish for key in ("HOLD_ATOMIC_LEDGER_WRITE_REQUIRED", "post_success_atomic_ledger_write_verified:false")),
        "guarded_active_false": guarded.get("active") is False and guarded.get("meta", {}).get("active") is False,
        "guarded_canonical_id": CANONICAL in select and CANONICAL in gate,
        "guarded_forbidden_id": FORBIDDEN in select and FORBIDDEN in gate,
        "guarded_requires_payload_page_id": "facebook_page_id" in gate,
        "guarded_forbidden_legacy_payload": "CURADORIA_ANG_AGOSTO" in gate,
        "guarded_media_author_required": "author_or_owner" in gate,
        "guarded_media_sha256_required": "sha256" in gate,
        "guarded_media_material_https": all(key in gate for key in ("image_url", "image_urls", "MEDIA_MATERIAL_MISSING_OR_UNSUPPORTED", "media_material_https_verified")),
        "guarded_sha256_format": all(key in gate for key in ("INVALID_SHA256", "sha256_format_verified")),
        "guarded_idempotency_preflight": all(key in gate for key in (
            "idempotency_key", "idempotency_record_id", "idempotency_persistence_verified",
            "idempotency_state", "UNUSED", "IDEMPOTENCY_PERSISTENCE_NOT_VERIFIED",
            "IDEMPOTENCY_KEY_ALREADY_USED_OR_UNKNOWN",
        )),
        "guarded_channel_scope": all(key in gate for key in (
            "channels", "instagram", "channel_scope_supported", "UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL",
        )),
        "guarded_post_publish_readback": all(key in publish for key in (
            "readback", "permalink", "publication_id", "execution_id",
            "readback_verified", "HOLD_POST_PUBLICATION_READBACK_FAILED",
        )),
        "guarded_no_first_page_fallback": "pages[0]" not in select,
        "legacy_active_false": legacy.get("active") is False,
        "legacy_quarantined": "QUARANTINED" in str(legacy.get("name", "")) and "NEVER IMPORT" in str(legacy.get("name", "")),
        "legacy_hard_block": "HOLD_SUPERSEDED_EXECUTOR_NEVER_IMPORT" in legacy_select,
        "legacy_no_first_page_fallback": "pages[0]" not in legacy_select,
        "policy_canonical_id": CANONICAL in policy,
        "policy_forbidden_id": FORBIDDEN in policy and "NEVER PUBLISH" in policy,
        "policy_text_only_block": "Text-only posts are forbidden" in policy,
        "policy_channel_scope": all(key in policy for key in (
            "Instagram-only publisher", "UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL",
            "HOLD_FACEBOOK_PUBLISHER_NOT_IMPLEMENTED",
        )),
        "policy_readback_receipts": all(key in policy for key in (
            "publication_id", "permalink", "execution ID", "post-publication readback",
        )),
        "policy_media_gates": all(key in policy for key in (
            "media_id", "author_or_owner", "license_or_permission", "brand_master_id", "sha256", "visual_hash",
            "idempotency_key", "idempotency_record_id", "idempotency_persistence_verified", "idempotency_state",
            "REAL_MEDIA_VERIFIED", "MASTER_LOGO_VERIFIED", "NO_DUPLICATE_PASS", "COPY_QA_PASS",
        )),
    }
    errors.extend(name for name, ok in checks.items() if not ok)
    return errors


def self_test() -> int:
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        for path in (FAIL_CLOSED, LEGACY, FACEBOOK, GOVERNANCE):
            (root / path).parent.mkdir(parents=True, exist_ok=True)
        guarded = {
            "active": False,
            "meta": {"active": False},
            "nodes": [
                {"id": "v5-selectpage", "parameters": {"jsCode": f"canonical='{CANONICAL}'; forbidden='{FORBIDDEN}';"}},
                {"id": "v5-action-guard", "parameters": {"jsCode": f"channels instagram channel_scope_supported UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL facebook_page_id {CANONICAL} {FORBIDDEN} CURADORIA_ANG_AGOSTO author_or_owner sha256 image_url image_urls MEDIA_MATERIAL_MISSING_OR_UNSUPPORTED media_material_https_verified INVALID_SHA256 sha256_format_verified idempotency_key idempotency_record_id idempotency_persistence_verified idempotency_state UNUSED IDEMPOTENCY_PERSISTENCE_NOT_VERIFIED IDEMPOTENCY_KEY_ALREADY_USED_OR_UNKNOWN"}},
                {"id": "v5-publish", "parameters": {"jsCode": "readback permalink publication_id execution_id readback_verified HOLD_POST_PUBLICATION_READBACK_FAILED"}},
            ],
        }
        legacy = {
            "name": "QUARANTINED — NEVER IMPORT",
            "active": False,
            "nodes": [{"id": "v5-selectpage", "parameters": {"jsCode": "HOLD_SUPERSEDED_EXECUTOR_NEVER_IMPORT"}}],
        }
        facebook = {
            "name": "FACEBOOK CANONICAL INACTIVE", "active": False, "meta": {"active": False},
            "nodes": [
                {"id": "fbv1-action-guard", "parameters": {"jsCode": f"channels facebook UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL facebook_photo HOLD_FACEBOOK_VIDEO_NOT_IMPLEMENTED HOLD_UNSUPPORTED_FACEBOOK_FORMAT media_id source author_or_owner license_or_permission brand_master_id theme_key visual_hash sha256 REAL_MEDIA_VERIFIED MASTER_LOGO_VERIFIED NO_DUPLICATE_PASS COPY_QA_PASS idempotency_key idempotency_record_id idempotency_persistence_verified idempotency_state UNUSED DURABLE_IDEMPOTENCY_LEDGER_NOT_IMPLEMENTED POST_SUCCESS_ATOMIC_LEDGER_WRITE_NOT_PROVEN META_ORGANIC_AUTH_READBACK_MISSING CURADORIA_ANG_AGOSTO HOLD_SERVER_SIDE_LEDGER_AND_AUTH_NOT_WIRED {CANONICAL} {FORBIDDEN}"}},
                {"id": "fbv1-selectpage", "parameters": {"jsCode": f"{CANONICAL} {FORBIDDEN}"}},
                {"id": "fbv1-publish", "parameters": {"jsCode": "post_id publication_id permalink_url permalink execution_id readback_verified HOLD_POST_PUBLICATION_READBACK_FAILED HOLD_ATOMIC_LEDGER_WRITE_REQUIRED post_success_atomic_ledger_write_verified:false"}},
            ],
            "connections": {
                "Fail Closed — Validar Facebook": {"main": [[{"node": "Rota Facebook autorizada?"}]]},
                "Rota Facebook autorizada?": {"main": [[{"node": "Meta — Descobrir Páginas"}], [{"node": "Responder Facebook V1"}]]},
            },
        }
        policy = (
            f"{CANONICAL} {FORBIDDEN} NEVER PUBLISH Text-only posts are forbidden Instagram-only publisher UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL HOLD_FACEBOOK_PUBLISHER_NOT_IMPLEMENTED publication_id permalink execution ID post-publication readback "
            "media_id author_or_owner license_or_permission brand_master_id sha256 visual_hash idempotency_key idempotency_record_id idempotency_persistence_verified idempotency_state REAL_MEDIA_VERIFIED "
            "MASTER_LOGO_VERIFIED NO_DUPLICATE_PASS COPY_QA_PASS"
        )
        (root / FAIL_CLOSED).write_text(json.dumps(guarded), encoding="utf-8")
        (root / LEGACY).write_text(json.dumps(legacy), encoding="utf-8")
        (root / FACEBOOK).write_text(json.dumps(facebook), encoding="utf-8")
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
