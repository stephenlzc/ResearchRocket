---
name: data-intake
description: "Register, freeze, and document dataset sources and intake steps"
argument-hint: "[topic or source set]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Identify source datasets and access methods.
2. Create/update a source manifest with URL, version/date, and license notes.
3. Record intake commands and output paths.
4. Save/update lineage manifest at `research/datasets/lineage-manifest.md` (or `.json`).
5. Summarize unresolved source risks.
