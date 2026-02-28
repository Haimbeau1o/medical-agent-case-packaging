# medical-agent-case-packaging

A production-style packaging repository for a medical agent project, designed for AI application engineer interviews in large tech companies.

## Goals
- Reframe the project into an end-to-end delivery story: requirement -> design -> evaluation -> release gates -> retrospectives.
- Keep all claims evidence-backed with explicit scope tags (`offline_replay`, `stress_test`, `online_observe`).
- Make personal ownership explicit: what was done, why it was chosen, and how AI was used to accelerate delivery.
- Use a 4-workstream collaboration model with issue/project governance.

## Repository Layout
- `docs/00_overview`: project positioning and target interview profile.
- `docs/01_benchmark_alignment`: big-tech practices and compliance baseline.
- `docs/02_sop`: operational SOPs and release process.
- `docs/03_architecture`: layered routing and escalation design.
- `docs/04_evaluation`: metrics, dataset specs, offline replay report, error taxonomy.
- `docs/05_personal_contribution`: ownership ledger and AI-accelerated cases.
- `docs/06_interview_assets`: pitch scripts and deep-dive Q&A.
- `data/evidence`: claim-to-evidence CSV ledger.
- `templates`: reusable writing templates.
- `schemas`: machine-checkable contracts for docs and evidence.
- `tools`: validation scripts.
- `.github`: issue templates, PR template, CI workflow.

## 4-Workstream Execution Model
- Workstream A (Architecture): system design narrative and SOP alignment.
- Workstream B (Evidence): data, metrics, reproducibility, scripts.
- Workstream C (Compliance): medical boundary, risk gates, interview defense.
- Workstream D (Storytelling): personal impact narrative and role-fit outputs.

## Quick Start
```bash
cd /Volumes/passport/project/openclaw_work/resume/medical-agent-case-packaging
python3 tools/validate_evidence.py
python3 tools/validate_story_cards.py
python3 tools/check_scope_tags.py
```

## Evidence Rules (Hard Constraints)
1. Every metric statement must include scope (`offline_replay`, `stress_test`, `online_observe`).
2. Do not promote offline numbers as online performance.
3. Every resume/interview claim must be traceable to `data/evidence/evidence_ledger_v1.csv`.
4. Claims without reproducible source paths are not mergeable.

## Collaboration and Governance
- Branch naming: `codex/workstream-<letter>-<topic>`
- Labels: `workstream:*`, `type:*`, `priority:*`, `status:*`
- Milestones: `M1` to `M5`
- Board columns: `Backlog`, `Ready`, `In Progress`, `Review`, `Done`

## Suggested Delivery Cadence
- Day 1: repository bootstrap + issue/project setup
- Day 2-3: architecture and evidence workstreams
- Day 4: compliance and release gates
- Day 5: interview/storytelling assets
- Day 6: validation and consistency pass
- Day 7: final release notes and polish
