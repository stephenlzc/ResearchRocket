---
name: start
description: "Research onboarding and stage detection"
argument-hint: "[optional current focus]"
user-invocable: true
allowed-tools: Read, Glob, Grep
---

When invoked:
1. Detect if `research/` structure exists.
2. Detect if topic/hypothesis docs exist.
3. Detect if any `artifacts/` run outputs exist.
4. Report current stage: Idea / Setup / Running / Drafting / Gate.
5. Recommend next command from MVP skills.
