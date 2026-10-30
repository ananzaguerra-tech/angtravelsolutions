#!/usr/bin/env python3
"""Offline validation for the ANG social idempotency ledger reference migration."""

from __future__ import annotations

import argparse
import sys
import tempfile
from pathlib import Path

SQL = Path("docs/integrations/ANG_SOCIAL_IDEMPOTENCY_LEDGER_POSTGRES_V1.sql")

REQUIRED = (
    "REFERENCE_ONLY / NOT_APPLIED / NO_CREDENTIALS",
    "CREATE TABLE IF NOT EXISTS ang_social_publication_ledger",
    "idempotency_record_id text NOT NULL UNIQUE",
    "idempotency_key text NOT NULL UNIQUE",
    "CHECK (state IN ('UNUSED', 'RESERVED', 'PUBLISHED', 'FAILED'))",
    "media_sha256 ~ '^[0-9A-Fa-f]{64}$'",
    "WHERE state IN ('RESERVED', 'PUBLISHED')",
    "CREATE OR REPLACE FUNCTION ang_register_social_publication",
    "ON CONFLICT DO NOTHING",
    "IDEMPOTENCY_OR_VISUAL_KEY_ALREADY_EXISTS",
    "CREATE OR REPLACE FUNCTION ang_reserve_social_publication",
    "AND state = 'UNUSED'",
    "IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN",
    "CREATE OR REPLACE FUNCTION ang_mark_social_publication_published",
    "INVALID_PUBLICATION_RECEIPT",
    "AND state = 'RESERVED'",
    "readback_verified = true",
    "publication_execution_id = p_publication_execution_id",
    "CREATE OR REPLACE FUNCTION ang_mark_social_publication_failed",
    "RESERVATION_NOT_FOUND_OR_NOT_ACTIVE",
    "No reset/reuse function is intentionally provided",
)


def validate(root: Path) -> list[str]:
    try:
        sql = (root / SQL).read_text(encoding="utf-8")
    except OSError as exc:
        return [f"LOAD_ERROR:{exc}"]
    errors = [f"MISSING:{item}" for item in REQUIRED if item not in sql]
    if sql.count("BEGIN;") != 1 or sql.count("COMMIT;") != 1:
        errors.append("TRANSACTION_BOUNDARY_INVALID")
    if "DELETE FROM ang_social_publication_ledger" in sql or "TRUNCATE" in sql:
        errors.append("DESTRUCTIVE_LEDGER_OPERATION_FORBIDDEN")
    if "RESET" in sql.upper() and "No reset/reuse function" not in sql:
        errors.append("RESET_PATH_FORBIDDEN")
    return errors


def self_test() -> int:
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        (root / SQL).parent.mkdir(parents=True, exist_ok=True)
        valid = "\n".join(REQUIRED) + "\nBEGIN;\nCOMMIT;\n"
        (root / SQL).write_text(valid, encoding="utf-8")
        if validate(root):
            print("SELF_TEST_FAIL_POSITIVE")
            return 1
        broken = valid.replace("AND state = 'UNUSED'", "AND state = 'RESERVED'")
        (root / SQL).write_text(broken, encoding="utf-8")
        if not any("AND state = 'UNUSED'" in error for error in validate(root)):
            print("SELF_TEST_FAIL_NEGATIVE")
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
    print({"status": "PASS" if not errors else "FAIL", "errors": errors})
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
