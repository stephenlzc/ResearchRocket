---
name: paper-style-sanity
description: "Warn-only style checks for vague or AI-slop phrasing in manuscripts"
argument-hint: "[paper path optional]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
---

This is a warn-only style quality pass. It must not block submission by itself.

When invoked:
1. Scan manuscript text for vague, inflated, or repetitive phrasing patterns.
2. Flag likely AI-slop wording and suggest concise academic alternatives.
3. Mark tone or clarity issues without changing claims or evidence.
4. Output only warnings and suggested edits (no hard failure).
5. Link unresolved items to `/paper-gate-check` as context.
