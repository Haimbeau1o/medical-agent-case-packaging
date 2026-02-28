# Offline Replay Report v1

## Scope
- Evaluation scope: `offline_replay`
- Dataset size: 100
- Source file: `/Volumes/passport/project/openclaw_work/resume/hospital_sop_phase1/data/eval_dataset_v1.csv`
- Script: `/Volumes/passport/project/openclaw_work/resume/hospital_sop_phase1/scripts/calc_metrics.py`

## Baseline Snapshot
- Intent Top1 Accuracy: 85.00% (`offline_replay`)
- Macro-F1: 85.48% (`offline_replay`)
- Routing Accuracy: 84.00% (`offline_replay`)
- Response Success Rate: 98.00% (`offline_replay`)
- OOD Reject Recall: 83.33% (`offline_replay`, OOD=12)
- P50 Latency: 1246.5 ms (`offline_replay`)
- P95 Latency: 2166.9 ms (`offline_replay`)

## Error Breakdown
- E1: 13
- E3: 3
- E6: 2
- E2: 2

## Prioritized Iteration Plan
1. Emergency risk detection hardening.
2. OOD boundary tightening and clarification prompts.
3. Routing map and candidate rerank updates.
4. Long-tail latency optimization.
