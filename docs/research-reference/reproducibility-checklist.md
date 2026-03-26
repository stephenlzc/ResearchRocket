# Reproducibility Checklist

## Experiment evidence
- Run config snapshot is preserved.
- Random seeds are explicitly recorded.
- Environment notes (runtime, packages, key versions) are documented.

## Artifact evidence
- Reported metrics map to a concrete run directory.
- Data lineage and transforms are traceable.
- Figures map to source data and plotting scripts.

## Audit evidence
- `/repro-audit` report exists at `artifacts/repro-audit-report.md`.
- Mismatch criteria and tolerance are documented.
- Final verdict is explicit: PASS / CONCERNS / FAIL.
