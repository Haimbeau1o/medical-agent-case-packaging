# Fallback and Human Escalation

## Trigger Conditions
- Low confidence after arbitration.
- High-risk intent matched in safety audit.
- OOD query identified.
- Timeout or service degradation.

## Fallback Actions
1. Reject: explicitly refuse out-of-scope requests.
2. Clarify: ask targeted follow-up to disambiguate intent.
3. Escalate: route to human operator with context package.

## Escalation Packet
- user query and recent context summary
- predicted intent and confidence
- risk flag and trigger layer
- attempted actions and model outputs

## Reliability Targets
- Escalation path success >= 95% (`offline_replay`).
- No silent failure on high-risk scenes.
