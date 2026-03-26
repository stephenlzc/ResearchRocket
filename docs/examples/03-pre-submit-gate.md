# Example 03: Pre-submit Gate

## Goal
Produce a venue-ready package and explicit gate verdict.

## Suggested command flow
1. `/paper-style-sanity "research/papers/main.tex"`
2. `/paper-gate-check "research/papers/main.tex"`
3. `/repro-audit "latest key runs"`
4. `/latex-venue-pack "AAAI"`
5. `/latex-build-check "deliverables/submission"`
6. `/review-report "deliverables/submission/main.tex"`

## Expected outputs
- `artifacts/repro-audit-report.md`
- `deliverables/submission/` package
- Final `PASS/CONCERNS/FAIL` verdict with blockers

## Gate semantics
- PASS: all required checks and artifacts complete.
- CONCERNS: submission possible with documented risks.
- FAIL: critical integrity or reproducibility blocker exists.
