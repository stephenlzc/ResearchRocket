---
name: repro-audit
description: "Independently rerun key results and generate reproducibility verdict"
argument-hint: "[run id or artifact set]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Select key claims and linked run artifacts.
2. Rerun from documented configs and seeds.
3. Compare regenerated outputs against claimed results.
4. Record environment notes and mismatch details.
5. Emit PASS/CONCERNS/FAIL report at `artifacts/repro-audit-report.md` (optional detailed logs under `artifacts/repro-audit/`).
