# Big-Tech Medical Agent Practice Alignment

## Industry Pattern Snapshot
Large tech medical AI efforts usually share these traits:
- multi-role products (hospital side, clinician side, user side),
- risk-aware orchestration over single-model direct output,
- human-in-the-loop for high-risk intents,
- traceability, auditability, and release gate discipline,
- explicit boundary statements for compliant operation.

## Mapping to This Project
- We use layered routing (`rules -> safety -> context -> retrieval/LLM -> fallback`).
- We prioritize high-risk control over raw aggregate accuracy.
- We track evidence with source-path traceability.
- We document release gates and rollback conditions.

## Packaging Principle
The interview story should emphasize repeatable engineering process instead of headline numbers alone.
