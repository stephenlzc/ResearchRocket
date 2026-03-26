---
name: data-clean
description: "Normalize, clean, and validate raw data into curated datasets"
argument-hint: "[dataset or split hint]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Load raw dataset and expected schema.
2. Apply deterministic cleaning and normalization steps.
3. Emit curated dataset with version tag and transform log.
4. Report missing values, outliers, and dropped records.
5. Write quality summary under `research/datasets/reports/`.

