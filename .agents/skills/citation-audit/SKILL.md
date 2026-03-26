---
name: citation-audit
description: "Check citation placeholders, key consistency, and reference hygiene"
argument-hint: "[paper path optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

Checks:
- No placeholder markers (`TODO_CITATION`, `[CITATION]`, `TBD_CITE`).
- Citation keys used in draft appear in BibTeX file.
- High-impact claims include at least one supporting citation.

Output:
- Warning list with file/line hints and unresolved citation risks.

