---
name: latex-venue-pack
description: "Prepare venue-aligned LaTeX submission package and checklist"
argument-hint: "[venue name optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When invoked:
1. Identify venue constraints (anonymity, page limits, template).
2. Validate package contents: `.tex`, `.bib`, figures, supplementary files.
3. Prepare `deliverables/submission/` layout and checklist.
4. Flag missing required files or format mismatches.
5. Output packaging report with blockers.

