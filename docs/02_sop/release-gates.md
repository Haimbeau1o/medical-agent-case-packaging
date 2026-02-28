# Release Gates

## Gate Matrix
| Gate | Description | Threshold/Rule | Owner |
| --- | --- | --- | --- |
| medical_safety_gate | High-risk intents are never auto-handled without safe path | Any high-risk miss blocks release | Compliance |
| ood_reject_gate | Out-of-domain queries are rejected or escalated | OOD reject recall >= 0.80 (`offline_replay`) | Evaluation |
| human_escalation_gate | Human handoff path is functional and tested | Escalation path success >= 0.95 (`offline_replay`) | Architecture |
| latency_gate | Long-tail latency within defined budget | P95 <= 2500 ms (`offline_replay`) | Engineering |
| audit_trace_gate | Key decisions are traceable | 100% traceability for risk events (`offline_replay`) | Compliance |
| rollback_condition | Trigger rollback when severe risk events spike | Any compliance-critical regression | Delivery Lead |

## Decision Output
- GO: all gates pass with evidence links.
- CONDITIONAL GO: non-critical gaps have time-boxed mitigation.
- NO GO: any compliance-critical or safety-critical gate fails.
