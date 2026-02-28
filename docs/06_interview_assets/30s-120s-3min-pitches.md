# Interview Pitch Pack

## 30s Version
I built a safety-first medical inquiry routing system using a layered pipeline (rules, safety audit, context continuation, retrieval/LLM arbitration, and fallback). I also set up a reproducible offline replay evaluation loop with explicit scope tags, so every claim is traceable. The key outcome is not just model accuracy, but an auditable process that prioritizes high-risk control and supports human escalation.

## 120s Version
In a medical inquiry setting, the biggest risk is not just low accuracy, but unsafe handling of high-risk intents and out-of-domain requests. I decomposed the decision path into four layers and added fallback and escalation as first-class controls. Then I standardized an offline replay dataset and metric scripts so that Top1, Macro-F1, OOD reject recall, routing accuracy, and latency are all reproducible and clearly marked as `offline_replay`. Finally, I introduced error taxonomy (E1/E2/E3/E6) to prioritize fixes by risk impact, which made iteration strategy much more production-oriented.

## 3min Version
The project started from a practical problem: single-step LLM intent decisions in medical consultations can look fluent but fail in risk-sensitive scenarios. I redesigned the flow into layered routing: deterministic rules for high-certainty hits, safety audit for high-risk gating, context continuation for multi-turn consistency, and retrieval-constrained LLM arbitration for boundary samples. Low-confidence and high-risk cases are handled through reject, clarify, or human escalation.

To avoid narrative-only claims, I built a reproducible evidence loop: a replay dataset with controlled schema, a metric script with explicit formulas, and a report with scope tags. Baseline results show 85.00% Top1, 85.48% Macro-F1, 84.00% routing accuracy, 83.33% OOD reject recall, and 2166.9 ms P95, all marked `offline_replay`.

The most important engineering move was error-priority strategy. Instead of optimizing aggregate accuracy first, I used E1/E2/E3/E6 taxonomy to prioritize safety-critical fixes. This improved the project from a feature implementation into a governed, interview-defensible delivery process.
