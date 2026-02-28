#!/usr/bin/env python3
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DOC_DIR = ROOT / "docs"
SCOPES = ("offline_replay", "stress_test", "online_observe")
PERCENT_PATTERN = re.compile(r"\d+(?:\.\d+)?%")


def fail(msg: str) -> None:
    print(f"[FAIL] {msg}")
    sys.exit(1)


if not DOC_DIR.exists():
    fail(f"docs directory not found: {DOC_DIR}")

violations = []
for path in DOC_DIR.rglob("*.md"):
    lines = path.read_text(encoding="utf-8").splitlines()
    for line_no, line in enumerate(lines, start=1):
        if PERCENT_PATTERN.search(line) and not any(scope in line for scope in SCOPES):
            metric = PERCENT_PATTERN.search(line).group(0)
            violations.append((path, line_no, metric))

if violations:
    print("[FAIL] missing scope tag near percentage metrics:")
    for path, line_no, metric in violations:
        print(f"  - {path}:{line_no} -> {metric}")
    sys.exit(1)

print("[OK] scope tags check passed")
