---
paths:
  - "research/data/**"
  - "research/datasets/**"
  - "research/experiments/**"
  - "artifacts/**"
---

# Data Lineage Rules

- Every dataset snapshot must have source, timestamp, and acquisition method.
- Transform steps must be documented and reproducible.
- Dataset versions must be immutable once used in reported results.
- No undocumented manual edits to released dataset artifacts.
