# Data Repo — chart-reproduction agent and study coach

This folder is the base knowledge for an agent that **reproduces a target graph or map** from data files the user
supplies (csv, shp, xlsx, gpkg, tif, zip …) plus an image of the output they want. The agent does the work in the
real applications on this Mac: **Excel**, **QGIS 3.44** and **Positron (R)**.

## Two agents share this folder — pick by what the user asks
| The user… | Use |
|---|---|
| gives data files and/or a target image to recreate | `reproduce-graph` skill (chart agent, below) |
| wants to study, review, be quizzed, do a mock exam, wrap up a study session, or asks "how am I doing" | `study-9014` skill (`.claude/skills/study-9014/SKILL.md`), state in `study/` |

The study coach only writes in `study/`; the chart agent only writes in `results/`. Neither edits the knowledge base.

## When the user gives you data + a target image
Use the `reproduce-graph` skill (`.claude/skills/reproduce-graph/SKILL.md`). It is the full workflow. In short:

1. Create a job folder with `agent/new_job.sh "<short question name>" <files…>` → `results/<NN-slug>/`.
2. Read the target image closely and write down every visible detail (chart type, axes, titles, legend, colours,
   facets, map elements) in the job's `REPORT.md` before doing anything else.
3. Plan the pipeline. Pick the tool for the final product yourself unless the user names one, and expect hand-offs
   (e.g. clean in Excel → spatial work in QGIS → final figure in Positron).
4. For every step, find the matching course procedure in this repo first (see "Finding knowledge") and follow it.
5. Run each step for real, save the intermediate files in `work/`, and save a screenshot after each step in
   `screenshots/`.
6. Save the final product in `final/`. Positron work always ends with one clean `final/<slug>.R` that reruns
   everything from the inputs.
7. Compare the result with the target, fix differences, and finish `REPORT.md`.

## Rules
- **Course methods only.** Every task can be done with what ENVRSUST 9014 teaches: Excel Power Query / formulas /
  PivotCharts, QGIS core tools and Processing algorithms, R with **tidyverse + janitor only** (no sf, terra,
  patchwork, etc.). Do not install other R packages.
- **Repo first, web second.** Look in this repo before anything else. The web may be used only for extra context, e.g.
  how a function's argument works or where a menu moved. Record each web source in `REPORT.md` under "Web lookups".
- **Never edit the knowledge base** (`tools/`, `datasets/`, `course/`, `transcripts/`, `sources/`, `_raw/`) during a
  job. Inputs are copied into the job folder; work on the copies.
- **Ask the user** when the target image is ambiguous in a way that changes the answer (e.g. which year range, which
  statistic), or when the data cannot produce what the image shows. Otherwise make the most likely choice and note it.
- Read `README.md` → "Known data traps" before touching course data (encodings, leading zeros, truncated files).

## Finding knowledge
- `manifest.json` → `procedures[]` (id, title, keywords, path), `datasets[]`, `references[]`. Search it with
  `grep -i` or `python3 -c` / `jq`.
- `INDEX.md` and the quick router in `README.md`; folder guides `tools/excel/README.md`, `tools/qgis/README.md`,
  `tools/r-positron/README.md`.
- Function look-ups: `tools/excel/formula-reference.md`, `tools/qgis/expression-reference.md`,
  `tools/qgis/processing-algorithms-reference.md`, `tools/r-positron/function-reference.md`.
- Exam-style "recreate this figure" questions: `tools/r-positron/practice-exam-r-workflows.md`,
  `course/assessments.md`.
- Dataset columns and traps: `datasets/<name>.md`.
- Running the apps from scripts (not taught in the course, written for this agent): `agent/README.md`.

## Where things go
| Path | What |
|---|---|
| `agent/` | the agent's helper scripts (environment check, job folders, screenshots, QGIS/Excel/R runners) |
| `.claude/skills/reproduce-graph/` | the workflow skill |
| `.claude/agents/graph-checker.md` | independent reviewer that compares the result with the target |
| `results/<NN-slug>/` | one sub-folder per question (see `results/README.md`) |
| `.claude/skills/study-9014/` | the study coach skill |
| `study/` | study coach: question bank, progress helper, your progress, drills (see `study/README.md`) |
