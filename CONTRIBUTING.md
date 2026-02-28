# Contributing Guide

## Scope
This repository packages a medical agent project into interview-grade engineering assets.

## Branch Strategy
- Use feature branches with prefix: `codex/workstream-`.
- Keep `main` deployable and evidence-consistent.

## Commit Convention
- `docs:` content and structure updates
- `eval:` evidence and metric changes
- `tooling:` validation scripts and CI changes
- `ops:` workflow, labels, board, milestone setup

## Definition of Done
A task is done only when:
1. Content is complete and logically consistent.
2. Claims are linked in `data/evidence/evidence_ledger_v1.csv`.
3. All validation scripts pass.
4. PR checklist items are all checked.

## Review Checklist
- Are metric scope tags present and correct?
- Are claims reproducible from source paths?
- Does the content clearly state boundaries (assistant role, not autonomous diagnosis)?
- Is personal contribution explicit and evidence-backed?

## Hard Prohibitions
- No fabricated numbers.
- No online-vs-offline scope mixing.
- No untraceable achievements.
- No compliance-ambiguous language.
