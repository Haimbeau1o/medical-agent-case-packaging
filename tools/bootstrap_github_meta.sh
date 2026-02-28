#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-Haimbeau1o/medical-agent-case-packaging}"

echo "Bootstrapping labels for ${REPO}"
gh label create "workstream:A-architecture" --repo "$REPO" --color BFDADC --description "Architecture workstream" || true
gh label create "workstream:B-evidence" --repo "$REPO" --color FEF2C0 --description "Evidence workstream" || true
gh label create "workstream:C-compliance" --repo "$REPO" --color F9D0C4 --description "Compliance workstream" || true
gh label create "workstream:D-storytelling" --repo "$REPO" --color D4C5F9 --description "Storytelling workstream" || true
gh label create "type:doc" --repo "$REPO" --color 0E8A16 --description "Documentation task" || true
gh label create "type:script" --repo "$REPO" --color 5319E7 --description "Script/tooling task" || true
gh label create "priority:P0" --repo "$REPO" --color B60205 --description "Highest priority" || true
gh label create "priority:P1" --repo "$REPO" --color D93F0B --description "Important" || true
gh label create "priority:P2" --repo "$REPO" --color FBCA04 --description "Normal priority" || true
gh label create "status:blocked" --repo "$REPO" --color 000000 --description "Blocked by dependency" || true

echo "Bootstrapping milestones"
gh api repos/${REPO}/milestones -f title='M1 Repo Bootstrap' -f state='open' || true
gh api repos/${REPO}/milestones -f title='M2 SOP & Architecture' -f state='open' || true
gh api repos/${REPO}/milestones -f title='M3 Evidence & Metrics' -f state='open' || true
gh api repos/${REPO}/milestones -f title='M4 Compliance & Interview' -f state='open' || true
gh api repos/${REPO}/milestones -f title='M5 Final Packaging' -f state='open' || true

echo "Creating starter issues"
gh issue create --repo "$REPO" --title "[A] Layered routing architecture spec" --label "workstream:A-architecture,type:doc,priority:P0" --body "Deliver docs/03_architecture/layered-routing-architecture.md and update SOP links." || true
gh issue create --repo "$REPO" --title "[B] Evidence ledger v1 validation" --label "workstream:B-evidence,type:script,priority:P0" --body "Validate and complete data/evidence/evidence_ledger_v1.csv with reproducible source paths." || true
gh issue create --repo "$REPO" --title "[C] Release gates compliance alignment" --label "workstream:C-compliance,type:doc,priority:P1" --body "Finalize docs/02_sop/release-gates.md and compliance baseline." || true
gh issue create --repo "$REPO" --title "[D] Interview pitch and contribution narrative" --label "workstream:D-storytelling,type:doc,priority:P1" --body "Finalize docs/06_interview_assets and docs/05_personal_contribution." || true

echo "Done. Project board creation is manual in GitHub UI or GraphQL API."
