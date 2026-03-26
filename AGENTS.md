# Research Studio Template -- Agent Architecture

This repository is a research workflow template (not a game codebase).

## Core Stack

- AutoResearchClaw CLI (research pipeline backend)
- Python 3.11+
- Markdown + LaTeX + BibTeX outputs

## Collaboration Rules

- User-driven collaboration.
- Show options and trade-offs before major implementation.
- Ask for approval before multi-file write operations.
- No fabricated citations or unverifiable claims.
- If `README.md` changes, all localized README files must be updated in the same change.

## Command Surface

- /start
- /setup-researchclaw
- /research-idea
- /research-run
- /paper-gate-check
- /data-intake
- /data-clean
- /analysis-run
- /figure-build
- /figure-qc
- /citation-audit
- /repro-audit
- /review-report
- /latex-venue-pack
- /latex-build-check
- /paper-style-sanity (warn-only)

## Quality Baseline

- Reproducible runs with config snapshots
- Citation integrity checks
- Claim-evidence traceability
- Data lineage and schema integrity
- Venue-ready LaTeX/BibTeX packaging checks
- Data quality and figure traceability checks
