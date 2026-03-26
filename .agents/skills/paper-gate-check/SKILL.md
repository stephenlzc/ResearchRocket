---
name: paper-gate-check
description: "Pre-submission paper quality and integrity gate"
argument-hint: "[paper path optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

Gate checklist:
- Citation integrity (no TODO/fake placeholder refs)
- Claim-evidence mapping exists
- Experiment artifacts referenced and reproducible
- Stats sanity checks (metrics defined, uncertainty reported)
- Required sections present (abstract/introduction/method/experiments/conclusion/limitations)
- LaTeX/BibTeX packaging checks complete for target venue
- Style sanity report reviewed (`/paper-style-sanity`, warn-only)

Verdict:
- PASS / CONCERNS / FAIL with blockers and next actions.
