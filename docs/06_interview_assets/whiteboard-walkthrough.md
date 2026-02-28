# Whiteboard Walkthrough

## 1. Draw the pipeline
User -> L1 Rules -> L2 Safety -> L3 Context -> L4 Retrieval/LLM -> Fallback/Escalation

## 2. Explain ownership
- Architecture owner: layer contracts and fallback policy
- Evaluation owner: metrics and replay loop
- Compliance owner: release gates and boundary
- Story owner: interview packaging and contribution proof

## 3. Show metrics by quadrant
- Quality: Top1, Macro-F1
- Routing: route accuracy
- Safety: OOD reject recall, escalation reliability
- Performance: P95 latency

## 4. Explain iteration logic
Safety-critical errors first, broad quality second, performance third.
