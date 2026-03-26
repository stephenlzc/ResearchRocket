# Example 02: Literature to Experiment

## Goal
Convert literature findings into a reproducible experiment plan.

## Suggested command flow
1. `/data-intake "topic sources and dataset list"`
2. `/data-clean "selected dataset"`
3. `/research-run "baseline and ablation setup"`
4. `/analysis-run "run-id or experiment group"`
5. `/figure-build "core result figures"`
6. `/figure-qc`

## Expected outputs
- Data lineage manifest under `research/datasets/`.
- Run artifacts under `artifacts/`.
- Analysis summaries under `research/results/analysis/`.
- Traceable figures under `research/results/figures/`.

## PASS criteria
- Configs and seeds are recorded.
- Metrics and uncertainty are reported.
- Figures map to source data and scripts.
