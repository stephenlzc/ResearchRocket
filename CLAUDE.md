# Research Studio -- Agent Architecture

SCI research development managed through coordinated research subagents.
Each agent owns a domain, enforcing quality gates and reproducibility.

## Technology Stack

- **Research Engine**: AutoResearchClaw (CLI pipeline backend)
- **Primary Language**: Python 3.11+
- **Version Control**: Git
- **Execution**: Local sandbox / Docker (per AutoResearchClaw config)
- **Writing Output**: Markdown + LaTeX + BibTeX

## Project Structure

@.claude/docs/directory-structure.md

## Technical Preferences

@.claude/docs/technical-preferences.md

## Coordination Rules

@.claude/docs/coordination-rules.md

## Collaboration Protocol

User-driven collaboration, not blind autonomous writing.
Every major change follows: Question -> Options -> Decision -> Draft -> Approval.

## Coding Standards

@.claude/docs/coding-standards.md
