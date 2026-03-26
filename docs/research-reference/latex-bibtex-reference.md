# LaTeX and BibTeX Reference

## LaTeX baseline
- Keep a single entrypoint (`main.tex`) for build checks.
- Ensure `\begin{document}` and `\end{document}` are balanced.
- Keep figure/table labels unique and cross-references resolvable.

## BibTeX baseline
- Every `\cite{key}` must map to a valid key in `.bib`.
- No placeholder entries (`@article{TBD, ...}`).
- Avoid duplicate citation keys.

## Template behavior
- `validate-latex-compile.sh` checks placeholders and compile sanity.
- `validate-bibtex.sh` checks placeholder and duplicate citation keys.
- Failures block strict pre-submit gate.
