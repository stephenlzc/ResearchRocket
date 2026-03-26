---
name: figure-qc
description: "Verify figure traceability, labeling, and publication consistency"
argument-hint: "[figure directory optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

Checks:
- Figure files exist and are referenced by draft sections.
- Each figure has a caption and source trace metadata.
- Axis labels, units, and legends are consistent.
- No low-resolution placeholders in submission-ready outputs.

Output:
- PASS / CONCERNS / FAIL with concrete fix list.

