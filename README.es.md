# ResearchRocket

> Plantilla de estudio de investigación SCI nativa de IA para Claude Code.  
> 10 agentes, 16 workflows y un pipeline reproducible hasta el envío.

## Slogan

De la idea a la evidencia, hasta la publicación.

## Descripción del proyecto

ResearchRocket no es un conjunto de prompts sueltos; es un marco operativo para investigación.  
Estructura el ciclo completo (tema, literatura, datos, experimentos, estadística, figuras, redacción, auditoría de reproducibilidad y empaquetado de envío) y asigna en cada etapa agents, skills, rules y hooks explícitos.  
La prioridad es integridad antes que velocidad: detectar temprano citas incompletas, claims sin evidencia, problemas de linaje de datos y riesgos de no reproducibilidad.  
Descripción completa en inglés: [README.md#project-description](README.md#project-description).

## Idiomas

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | **🇪🇸 Español** | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## Resumen

| Área | Valor |
|---|---|
| Arquitectura de agentes | 10 roles (`estrategia -> ejecución -> gate final`) |
| Comandos skill | 16 comandos slash |
| Guardrails | 13 hooks + 11 reglas por ruta |
| Objetivo | Paquete SCI reproducible y listo para envío |

## Por qué existe

El problema principal no es velocidad, sino integridad científica.  
ResearchRocket impone límites de rol, quality gates, auditoría de reproducibilidad y empaquetado de envío.

## Arquitectura

Estrategia:
- `principal-investigator`

Ejecución:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

Gate final:
- `peer-reviewer`

## Superficie de comandos

Core:
- `/start`
- `/setup-researchclaw`
- `/research-idea`
- `/research-run`
- `/paper-gate-check`

Extended:
- `/data-intake`
- `/data-clean`
- `/analysis-run`
- `/figure-build`
- `/figure-qc`
- `/citation-audit`
- `/repro-audit`
- `/review-report`
- `/latex-venue-pack`
- `/latex-build-check`
- `/paper-style-sanity` (warn-only)

## Inicio rápido

```bash
git clone https://github.com/stephenlzc/ResearchRocket.git
cd ResearchRocket
python3 -m venv .venv
source .venv/bin/activate
git clone https://github.com/aiming-lab/AutoResearchClaw.git
cd AutoResearchClaw
pip install -e .
cd ..
claude
```

## Flujo de trabajo

| Paso | Agents principales | Skills principales | Rules clave | Hooks clave | Entregables | Gate |
|---|---|---|---|---|---|---|
| 1. Definición del tema | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | brief de tema, hipótesis | alcance bloqueado |
| 2. Literatura y evidencia | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, auditoría de citas | sin citas falsas/placeholder |
| 3. Datos | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | dataset curado, manifiesto de linaje | schema + linaje aprobados |
| 4. Experimentos | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | artefactos de corrida, snapshots de config | pipeline reproducible |
| 5. Análisis y estadística | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | métricas + incertidumbre | sin significancia no sustentada |
| 6. Figuras | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | figuras + trazabilidad | toda figura trazable |
| 7. Redacción e integridad | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | borrador, mapa claim-evidence | estilo solo advierte, integridad es obligatoria |
| 8. Auditoría de reproducibilidad | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | reporte repro, PASS/CONCERNS/FAIL | blockers resueltos o documentados |
| 9. Empaquetado para venue | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | paquete de envío | strict pre-submit gate aprobado |

Referencias:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## Estado de compatibilidad entre CLIs

Hallazgos actuales de validación local:
- Claude Code: experiencia nativa con comandos slash; es la referencia principal.
- Kimi CLI: puede cargar skills, pero la invocación directa con `/command` todavía no es equivalente.
- OpenCode: el flujo general se puede ejecutar, pero la paridad de rules/hooks requiere una capa de adaptación.

Issues de migración:
- [#1 Capa de compatibilidad de comandos slash entre CLIs](https://github.com/stephenlzc/ResearchRocket/issues/1)
- [#2 Paridad de guardrails (rules/hooks) y gates de envío entre CLIs](https://github.com/stephenlzc/ResearchRocket/issues/2)

Llamado a PRs:
- Se aceptan contribuciones para adaptadores de comandos, ejecutores de gates, pruebas de paridad y documentación de migración.

## Inspiraciones metodológicas

- [stop-slop](https://github.com/hardikpandya/stop-slop): inspiración para higiene de estilo, adaptada a advertencias académicas.
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): inspiración para límites de rol y patrones de gate.

## Política de mantenimiento i18n

Si cambia `README.md`, se deben actualizar también:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## Fuentes y agradecimientos

Basado en [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) (MIT).  
Integra conceptos de [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) (MIT).

## Contribuidores

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## Licencia

MIT.
