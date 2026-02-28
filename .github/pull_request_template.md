## What changed
- 

## Why this change
- 

## Evidence links
- [ ] Updated `data/evidence/evidence_ledger_v1.csv` if claims changed
- [ ] Added source paths for new metric or statement

## Scope correctness
- [ ] Metrics have explicit scope tags (`offline_replay`, `stress_test`, `online_observe`)
- [ ] No offline results presented as online performance

## Validation
- [ ] `python3 tools/validate_evidence.py`
- [ ] `python3 tools/validate_story_cards.py`
- [ ] `python3 tools/check_scope_tags.py`
