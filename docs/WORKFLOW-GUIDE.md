# Research Workflow Guide (Extended)

## Phase 1: Idea and Framing

- Run `/start` and `/research-idea`
- Input: topic hints, constraints, and target venue direction
- Define topic, hypothesis, target audience, and success metrics
- Output: `research/ideas/` and `research/hypotheses/` artifacts

## Phase 2: Setup and Backend

- Run `/setup-researchclaw`
- Input: AutoResearchClaw install path and execution environment
- Ensure `researchclaw` is available with validated config
- Standard minimal test command order:
  - If `config.arc.yaml` is missing: `researchclaw init`
  - Export or confirm the API key environment variable required by `llm.api_key_env`
  - Run `researchclaw doctor`
  - Run `researchclaw validate`
  - Proceed to the next workflow step only after both checks pass
- Output: reproducible runtime config snapshot

## Phase 3: Literature and Data

- Run `/citation-audit` and `/data-intake`
- Run `/data-clean` after source freeze
- Input: source list, acquisition constraints, and raw datasets
- Output: curated data, lineage manifest, and citation-quality report

## Phase 4: Experiments and Analysis

- Run `/research-run` and `/analysis-run`
- Input: curated datasets, run config, and metric definitions
- Keep run logs, metrics definitions, uncertainty reports, and robustness notes
- Output: `artifacts/` runs and analysis summaries under `research/results/`

## Phase 5: Figures and Writing

- Run `/figure-build`, `/figure-qc`, and drafting workflows
- Run `/paper-style-sanity` (warn-only) and `/paper-gate-check`
- Input: analysis outputs, figure specs, and manuscript draft
- Output: traceable figures, coherent draft, gate report (PASS/CONCERNS/FAIL)

## Phase 6: Reproducibility and Submission

- Run `/repro-audit` and `/review-report`
- Run `/latex-venue-pack` and `/latex-build-check`
- Input: gated draft, figure bundle, bibliography, and venue requirements
- Output: venue-ready submission package in `deliverables/submission/`

## Gate Semantics

- PASS: all required artifacts and checks are complete
- CONCERNS: submission possible with documented risks
- FAIL: critical integrity/reproducibility blockers remain unresolved

## Companion Docs

- Conversation templates: `docs/examples/`
- Stable checklists and conventions: `docs/research-reference/`
