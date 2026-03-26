---
name: figure-build
description: "Generate publication-ready figures from analysis artifacts"
argument-hint: "[figure set or paper section]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Load analysis outputs and plotting configuration.
2. Produce figures with deterministic scripts.
3. Export captions and metadata linking figure -> source artifact.
4. Save figures under `research/results/figures/`.
5. Summarize unresolved visual issues.

