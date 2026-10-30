#!/usr/bin/env python3
"""Offline model canaries for ANG social publication idempotency.

This is not a database integration test and does not prove PostgreSQL isolation.
"""

from __future__ import annotations

import json
import threading
from dataclasses import dataclass
from typing import Dict, Tuple


class LedgerError(RuntimeError):
    pass


@dataclass
class Row:
    record_id: str
    key: str
    channel: str
    destination: str
    visual_hash: str
    state: str = "UNUSED"
    reservation_execution_id: str = ""
    publication_id: str = ""
    permalink: str = ""
    publication_execution_id: str = ""
    readback_verified: bool = False


class LedgerModel:
    def __init__(self) -> None:
        self._lock = threading.Lock()
        self.rows: Dict[str, Row] = {}

    def register(self, row: Row) -> None:
        with self._lock:
            if row.key in self.rows:
                raise LedgerError("IDEMPOTENCY_KEY_ALREADY_EXISTS")
            for current in self.rows.values():
                if (
                    current.channel == row.channel
                    and current.destination == row.destination
                    and current.visual_hash == row.visual_hash
                    and current.state in {"RESERVED", "PUBLISHED"}
                ):
                    raise LedgerError("VISUAL_DESTINATION_ALREADY_ACTIVE")
            self.rows[row.key] = row

    def reserve(self, key: str, execution_id: str) -> None:
        with self._lock:
            row = self.rows.get(key)
            if row is None or row.state != "UNUSED":
                raise LedgerError("IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN")
            row.state = "RESERVED"
            row.reservation_execution_id = execution_id

    def publish(
        self,
        key: str,
        reservation_execution_id: str,
        publication_id: str,
        permalink: str,
        publication_execution_id: str,
        readback_verified: bool,
    ) -> None:
        if not publication_id or not permalink.startswith("https://") or not publication_execution_id or not readback_verified:
            raise LedgerError("INVALID_PUBLICATION_RECEIPT")
        with self._lock:
            row = self.rows.get(key)
            if row is None or row.state != "RESERVED" or row.reservation_execution_id != reservation_execution_id:
                raise LedgerError("RESERVATION_NOT_FOUND_OR_NOT_ACTIVE")
            row.state = "PUBLISHED"
            row.publication_id = publication_id
            row.permalink = permalink
            row.publication_execution_id = publication_execution_id
            row.readback_verified = True

    def fail(self, key: str, reservation_execution_id: str) -> None:
        with self._lock:
            row = self.rows.get(key)
            if row is None or row.state != "RESERVED" or row.reservation_execution_id != reservation_execution_id:
                raise LedgerError("RESERVATION_NOT_FOUND_OR_NOT_ACTIVE")
            row.state = "FAILED"


def expect_error(code: str, fn) -> None:
    try:
        fn()
    except LedgerError as exc:
        if str(exc) != code:
            raise AssertionError(f"expected {code}, got {exc}") from exc
    else:
        raise AssertionError(f"expected {code}")


def row(key: str, visual: str = "visual-a") -> Row:
    return Row(
        record_id=f"record-{key}",
        key=key,
        channel="facebook",
        destination="353450855530042",
        visual_hash=visual,
    )


def run() -> dict:
    passed = []

    ledger = LedgerModel()
    ledger.register(row("key-register"))
    expect_error("IDEMPOTENCY_KEY_ALREADY_EXISTS", lambda: ledger.register(row("key-register", "visual-b")))
    passed.append("duplicate_key_rejected")

    ledger.reserve("key-register", "exec-register")
    expect_error("VISUAL_DESTINATION_ALREADY_ACTIVE", lambda: ledger.register(row("key-visual", "visual-a")))
    passed.append("active_visual_duplicate_rejected")

    concurrent = LedgerModel()
    concurrent.register(row("key-race", "visual-race"))
    barrier = threading.Barrier(3)
    outcomes = []
    outcomes_lock = threading.Lock()

    def contender(execution_id: str) -> None:
        barrier.wait()
        try:
            concurrent.reserve("key-race", execution_id)
            result = "RESERVED"
        except LedgerError as exc:
            result = str(exc)
        with outcomes_lock:
            outcomes.append(result)

    threads = [threading.Thread(target=contender, args=(f"exec-{i}",)) for i in (1, 2)]
    for thread in threads:
        thread.start()
    barrier.wait()
    for thread in threads:
        thread.join()
    if sorted(outcomes) != ["IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN", "RESERVED"]:
        raise AssertionError(f"concurrency outcome invalid: {outcomes}")
    passed.append("single_winner_concurrent_reservation")

    receipt = LedgerModel()
    receipt.register(row("key-receipt", "visual-receipt"))
    receipt.reserve("key-receipt", "exec-reserve")
    expect_error(
        "INVALID_PUBLICATION_RECEIPT",
        lambda: receipt.publish("key-receipt", "exec-reserve", "", "http://invalid", "", False),
    )
    passed.append("incomplete_receipt_rejected")

    expect_error(
        "RESERVATION_NOT_FOUND_OR_NOT_ACTIVE",
        lambda: receipt.publish("key-receipt", "wrong-execution", "post-1", "https://example.test/post-1", "exec-publish", True),
    )
    passed.append("wrong_reservation_execution_rejected")

    receipt.publish("key-receipt", "exec-reserve", "post-1", "https://example.test/post-1", "exec-publish", True)
    if receipt.rows["key-receipt"].state != "PUBLISHED":
        raise AssertionError("publish transition failed")
    expect_error("IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN", lambda: receipt.reserve("key-receipt", "exec-reuse"))
    passed.append("published_terminal")

    failed = LedgerModel()
    failed.register(row("key-failed", "visual-failed"))
    failed.reserve("key-failed", "exec-failed")
    failed.fail("key-failed", "exec-failed")
    expect_error("IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN", lambda: failed.reserve("key-failed", "exec-retry"))
    passed.append("failed_terminal")

    expect_error("IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN", lambda: failed.reserve("unknown-key", "exec-unknown"))
    passed.append("unknown_key_rejected")

    return {"status": "PASS", "passed": passed, "count": len(passed), "scope": "OFFLINE_MODEL_ONLY"}


if __name__ == "__main__":
    print(json.dumps(run(), indent=2, sort_keys=True))
