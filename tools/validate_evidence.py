#!/usr/bin/env python3
import csv
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CSV_PATH = ROOT / "data" / "evidence" / "evidence_ledger_v1.csv"
ALLOWED_SCOPE = {"offline_replay", "stress_test", "online_observe"}
REQUIRED_HEADERS = [
    "claim_id",
    "claim_text",
    "metric_value",
    "metric_scope",
    "dataset_or_source",
    "calculation_method",
    "source_file_path",
    "owner",
    "interview_safe_answer",
    "risk_note",
]


def fail(msg: str) -> None:
    print(f"[FAIL] {msg}")
    sys.exit(1)


if not CSV_PATH.exists():
    fail(f"missing CSV: {CSV_PATH}")

rows = []
with CSV_PATH.open("r", encoding="utf-8", newline="") as f:
    reader = csv.DictReader(f)
    if reader.fieldnames != REQUIRED_HEADERS:
        fail(f"headers mismatch: {reader.fieldnames}")
    for idx, row in enumerate(reader, start=2):
        rows.append((idx, row))

if not rows:
    fail("no evidence rows found")

seen_ids = set()
for line, row in rows:
    cid = row["claim_id"].strip()
    if not cid.startswith("C"):
        fail(f"line {line}: invalid claim_id {cid}")
    if cid in seen_ids:
        fail(f"line {line}: duplicate claim_id {cid}")
    seen_ids.add(cid)

    scope = row["metric_scope"].strip()
    if scope not in ALLOWED_SCOPE:
        fail(f"line {line}: invalid scope {scope}")

    source = row["source_file_path"].strip()
    if not source:
        fail(f"line {line}: empty source_file_path")

print(f"[OK] evidence ledger validated: {len(rows)} rows")
