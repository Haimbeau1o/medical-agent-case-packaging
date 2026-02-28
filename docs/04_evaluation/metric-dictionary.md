# Metric Dictionary

## Core Fields
- `metric_name`
- `definition`
- `formula`
- `scope`
- `sample_requirement`
- `owner`

## Metrics
### Intent Top1 Accuracy
- Definition: percentage of samples where predicted intent equals true intent.
- Formula: `correct / total`.
- Scope: `offline_replay`.

### Macro-F1
- Definition: mean F1 score across all intent labels.
- Scope: `offline_replay`.

### Routing Accuracy
- Definition: percentage of samples correctly routed to target service/tool.
- Scope: `offline_replay`.

### OOD Reject Recall
- Definition: percentage of OOD samples correctly rejected/escalated.
- Scope: `offline_replay`.

### Response Success Rate
- Definition: percentage of non-error responses.
- Scope: `offline_replay`.

### Latency P95
- Definition: 95th percentile end-to-end latency in milliseconds.
- Scope: `offline_replay`.
