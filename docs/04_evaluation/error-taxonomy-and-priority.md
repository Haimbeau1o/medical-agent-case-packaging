# Error Taxonomy and Priority

## Taxonomy
- E1: Intent misclassification
- E2: OOD not rejected
- E3: Routing mismatch
- E6: Safety/compliance risk

## Priority Logic
1. Safety first: E6 and high-risk E2 are always top priority.
2. Business-critical routing next: E3.
3. Broad quality improvements: E1.

## Action Mapping
- E1 -> expand semantic coverage and context features.
- E2 -> tune reject thresholds and strengthen fallback policy.
- E3 -> validate route map/version consistency.
- E6 -> mandatory escalation and safe response templates.

## Verification Rule
Any change must re-run offline replay metrics and compare against baseline with unchanged scope tags.
