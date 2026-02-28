# Layered Routing Architecture

## Pipeline
```text
User Query
  -> Layer 1: Fast Pattern Match
  -> Layer 2: Safety Audit
  -> Layer 3: Context Continuation
  -> Layer 4: Retrieval Candidates + LLM Arbitration
  -> Fallback: Reject / Clarify / Escalate
```

## Layer Specs
### Layer 1: Fast Pattern Match
- Purpose: deterministic short-circuit for high-certainty intents.
- Failure mode: rule coverage gaps.
- Mitigation: synonym expansion and periodic replay patching.

### Layer 2: Safety Audit
- Purpose: prioritize high-risk safety over answer completeness.
- Failure mode: unsafe route leakage.
- Mitigation: hard-stop policy + mandatory escalation.

### Layer 3: Context Continuation
- Purpose: keep multi-turn intent state consistent.
- Failure mode: stale context override.
- Mitigation: recency-priority and reset conditions.

### Layer 4: Retrieval + LLM Arbitration
- Purpose: constrain decision space before LLM judgment.
- Failure mode: candidate bias causing misclassification.
- Mitigation: candidate recall tuning + rerank feature refinement.

## Why Not All-in-One LLM
- Safety-critical domain requires deterministic controls.
- Layered decomposition improves debuggability and ownership.
- Fallback and escalation paths are explicit and auditable.
