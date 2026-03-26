---
name: review-report
description: "Produce final review verdict with blockers and next actions"
argument-hint: "[draft path optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

Review dimensions:
- Novelty and relevance
- Evidence and reproducibility
- Statistics and uncertainty
- Writing clarity and structure
- Submission readiness

Output:
- PASS / CONCERNS / FAIL
- Blockers and recommended remediations

