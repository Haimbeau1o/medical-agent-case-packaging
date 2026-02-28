# End-to-End Delivery SOP

## Stage 1: Problem Framing
- Input: inquiry logs, business risk taxonomy.
- Output: intent set, risk tiers, scope boundary.
- Owner: Product + Architecture.

## Stage 2: Data and Label Governance
- Input: sampled replay dataset.
- Output: labeled dataset with conflict resolution notes.
- Owner: Evaluation owner.

## Stage 3: Architecture Design
- Input: requirements and risk constraints.
- Output: layered routing design + fallback policy.
- Owner: Architecture owner.

## Stage 4: Implementation and Verification
- Input: design spec.
- Output: reproducible script, baseline report, error taxonomy.
- Owner: Engineering + Evaluation owners.

## Stage 5: Release Gate Review
- Input: evaluation report and compliance checks.
- Output: go/no-go decision and rollback plan.
- Owner: Compliance owner.

## Stage 6: Post-Release Observation and Retro
- Input: issue list, error breakdown, latency trends.
- Output: iteration backlog with priorities.
- Owner: all workstreams.

## Required Artifacts
- `docs/04_evaluation/offline-replay-report-v1.md`
- `docs/02_sop/release-gates.md`
- `data/evidence/evidence_ledger_v1.csv`
