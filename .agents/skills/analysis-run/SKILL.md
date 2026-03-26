---
name: analysis-run
description: "Execute analysis pipeline with metrics and uncertainty reporting"
argument-hint: "[run id or experiment group]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Collect run artifacts and metric definitions.
2. Compute summary metrics with uncertainty estimates.
3. Run sensitivity or robustness checks when configured.
4. Write analysis report with assumptions and limitations.
5. Save outputs under `research/results/analysis/`.

