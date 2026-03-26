---
name: latex-build-check
description: "Run LaTeX and BibTeX build sanity checks for submission packages"
argument-hint: "[submission directory optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
---

When invoked:
1. Detect the submission root and locate the primary `.tex` entrypoint.
2. Validate bibliography files and citation key references.
3. Run LaTeX build checks (`latexmk` or fallback command if available).
4. Capture compile errors, missing references, and warning summary.
5. Output PASS/CONCERNS/FAIL and the final package readiness state.
