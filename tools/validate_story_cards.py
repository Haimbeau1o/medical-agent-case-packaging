#!/usr/bin/env python3
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "templates" / "story_card_template.md"
REQUIRED_KEYS = [
    "problem",
    "risk",
    "solution",
    "why_this_design",
    "metrics_with_scope",
    "failure_case",
    "iteration",
    "my_role",
    "ai_acceleration_point",
]


def fail(msg: str) -> None:
    print(f"[FAIL] {msg}")
    sys.exit(1)


if not TEMPLATE.exists():
    fail(f"missing template: {TEMPLATE}")

text = TEMPLATE.read_text(encoding="utf-8")
blocks = re.findall(r"^---\n(.*?)\n---", text, flags=re.DOTALL | re.MULTILINE)
if not blocks:
    fail("story card template missing frontmatter block")

frontmatter = blocks[0]
keys = set()
for line in frontmatter.splitlines():
    if ":" in line:
        k = line.split(":", 1)[0].strip()
        if k:
            keys.add(k)

missing = [k for k in REQUIRED_KEYS if k not in keys]
if missing:
    fail(f"missing keys in story card template: {missing}")

print("[OK] story card template validated")
