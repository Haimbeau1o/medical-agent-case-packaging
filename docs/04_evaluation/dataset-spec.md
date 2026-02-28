# Dataset Specification

## Dataset
- Name: `eval_dataset_v1.csv`
- Current size: 100 samples
- Source: offline replay reconstruction
- Scope tag: `offline_replay`

## Required Columns
- sample_id
- timestamp
- query_text
- true_intent
- pred_intent
- is_ood
- pred_reject
- routed_correct
- latency_ms
- response_success
- fallback_used
- escalated_to_human
- error_type
- notes

## Labeling Rules
1. One primary intent per sample.
2. High-risk scenes prioritize emergency-related intent labeling.
3. Ambiguous cases must include notes for arbitration.

## Data Quality Checks
- no missing `true_intent` and `pred_intent`
- numeric columns parseable
- error types from controlled taxonomy
