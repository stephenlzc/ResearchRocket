# ResearchRocket

> Modèle de studio de recherche SCI natif IA pour Claude Code.  
> 10 agents, 16 workflows, un pipeline coordonné et reproductible.

## Slogan

De l'idée à la preuve, jusqu'à la publication.

## Description du projet

ResearchRocket est un cadre d'exécution de recherche, pas un simple jeu de prompts.  
Il structure l'ensemble du cycle scientifique en étapes auditables et relie chaque étape à des agents, skills, règles et hooks explicites.  
L'objectif est de sécuriser l'intégrité avant la vitesse: citations, traçabilité des preuves, reproductibilité et package de soumission sont contrôlés en amont.  
Description complète (anglais) : [README.md#project-description](README.md#project-description).

## Langues

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | **🇫🇷 Français** | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## Vue d'ensemble

| Zone | Valeur |
|---|---|
| Architecture agents | 10 rôles (`stratégie -> exécution -> revue finale`) |
| Commandes skills | 16 commandes slash |
| Garde-fous | 13 hooks + 11 règles par chemins |
| Cible | Dossier SCI prêt à soumission et reproductible |

## Pourquoi ce template

Le problème principal n'est pas la vitesse de génération, mais l'intégrité scientifique.  
ResearchRocket introduit des rôles stricts, des quality gates, des vérifications de reproductibilité et un packaging de soumission.

## Architecture

Stratégie:
- `principal-investigator`

Exécution:
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

## Commandes

Noyau:
- `/start`
- `/setup-researchclaw`
- `/research-idea`
- `/research-run`
- `/paper-gate-check`

Étendu:
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

## Démarrage rapide

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

## Flux de travail

| Étape | Agents principaux | Skills principaux | Règles clés | Hooks clés | Livrables | Gate |
|---|---|---|---|---|---|---|
| 1. Cadrage | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | brief sujet, hypothèse | périmètre verrouillé |
| 2. Littérature | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, audit citations | pas de citations factices |
| 3. Données | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | dataset curé, manifeste de lignage | schéma + lignage validés |
| 4. Expériences | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | artifacts d'exécution, snapshots config | exécution rejouable |
| 5. Analyse | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | métriques + incertitudes | pas de sur-interprétation |
| 6. Figures | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | figures + traçabilité | chaque figure traçable |
| 7. Rédaction | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | draft, mapping claim-evidence | style warn-only, intégrité obligatoire |
| 8. Audit repro | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | rapport repro, verdict PASS/CONCERNS/FAIL | blockers traités |
| 9. Soumission | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | package de soumission | gate strict validé |

Références:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## Inspirations méthodologiques

- [stop-slop](https://github.com/hardikpandya/stop-slop): inspiration pour l'hygiène rédactionnelle, adapté en mode avertissement.
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): inspiration pour les frontières de rôles et patterns de gate.

## Politique de maintenance i18n

Toute modification de `README.md` doit être synchronisée avec:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## Sources et remerciements

Basé sur [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) (MIT).  
Intègre des concepts de [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) (MIT).

## Contributeurs

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## Licence

MIT.
