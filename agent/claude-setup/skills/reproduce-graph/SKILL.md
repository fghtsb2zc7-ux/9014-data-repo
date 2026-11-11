---
name: reproduce-graph
description: Reproduce a target graph or map from user-supplied data files (csv, shp, xlsx, gpkg, tif, zip) and an image of the desired output, using Excel, QGIS and Positron/R on this Mac with the ENVRSUST 9014 course methods. Use whenever the user drops data plus a picture of a chart or map and asks to recreate, build or match it.
---

# Reproduce a target graph or map

Work through the phases in order. Keep `REPORT.md` in the job folder up to date as you go; it is the user's record
of what you did.

## Phase 0 — Environment (once per session)
1. If `agent/env.json` is missing or older than a week, run `bash agent/env_check.sh`. It finds Rscript, Positron,
   QGIS (app, `qgis_process`, PyQGIS python) and Excel and writes their paths to `agent/env.json`.
2. Read `agent/env.json`. If a needed tool is missing, tell the user which one and stop.

## Phase 1 — Set up the job
1. Pick a short name for the question (from the user's message or the image title), e.g. `crab counts`.
2. Run `bash agent/new_job.sh "crab counts" <every file the user gave, target image included>`.
   It prints the job folder, e.g. `results/03-crab-counts/`, with `inputs/`, `work/`, `screenshots/`, `final/` and a
   `REPORT.md` skeleton. If the user named a question number, use it: `bash agent/new_job.sh "Q2 crab counts" …`.
3. Unzip any zip in `inputs/` into `work/` (`unzip -o inputs/x.zip -d work/x/`).

## Phase 2 — Read the target (before any work)
Open the target image with the Read tool and fill the "Target specification" section of `REPORT.md`:
- product: chart type (column, stacked column, line, scatter + trend, histogram, boxplot, heatmap, …) or map
- x / y variables, units, axis titles, tick labels and their order, axis limits
- grouping: fill/colour variable, legend title and position, facet variable and layout
- statistic shown (count, sum, mean, per-distance rate …), filters implied (years, categories, top N)
- title, subtitle, caption **verbatim**; theme (e.g. `theme_bw`), colours
- for maps: layers, symbology and classes, base map, CRS hints, scale bar, north arrow, legend, grid, title, page
- anything you cannot read clearly → list it under "Open questions"

Then inspect each data file (columns, types, row counts, encodings) and check `datasets/` for a doc on it
(match on file name in `manifest.json` → `datasets[]`).

## Phase 3 — Plan the pipeline
Choose the tool for each step. If the user did not specify:
- **Map** (anything with geography, layers, scale bar) → final product in **QGIS** print layout.
- **Statistical chart** (ggplot look: grey/bw theme, facets, trend line, subtitle) → final product in **Positron/R**.
- **Excel-look chart** (PivotChart, Office default colours/fonts, field buttons) or a request for a workbook →
  final product in **Excel**.
- Spatial operations (buffer, clip, join by location, count points in polygon, sample raster, zonal histogram) are
  always done in **QGIS**, even when the final product is a chart; export the result to CSV for the next tool.
- Data cleaning can be done in whichever tool the question implies; otherwise do it in the tool of the next step.

For each step, find the course procedure: search `manifest.json` procedures by keyword
(`grep -i -n "<keyword>" manifest.json` or `python3 agent/kb_find.py <keywords…> [--tool qgis]`), open the procedure file, read its
prerequisites and Pitfalls. Write the plan into `REPORT.md` as a numbered list:
`step → tool → procedure file → output file in work/`.

Hand-off formats between tools:
| From → To | Format |
|---|---|
| Excel → QGIS / R | `work/<name>.csv` (UTF-8). Keep ID columns as text. |
| QGIS → R / Excel | `work/<name>.csv` from *Export > Save Features As* (CSV, no geometry unless needed) or `native:savefeatures` |
| QGIS → QGIS | `work/<job>.gpkg` (one layer per step) |
| R → Excel / QGIS | `write_csv()` to `work/` |

If the plan depends on an open question that changes the answer, ask the user now (one message, all questions,
each with your best guess) and continue with your best guess while you wait.

## Phase 4 — Execute
Run every step for real. After each step:
1. Save the step's output to `work/` (or `final/` for the last step).
2. Take a progress screenshot: `bash agent/screenshot.sh <job folder> "<NN step name>" [App]`
   (App = `Excel`, `QGIS`, `Positron`; it brings that app to the front first). If screen capture is not permitted,
   the script says so; then save a rendered image of the intermediate result instead (a quick ggplot, a QGIS map
   export, or a CSV preview) and tell the user once how to grant Screen Recording.
3. Add a line to the "Steps done" table in `REPORT.md`.

### Positron / R
- Write the code in `work/<NN>-<step>.R` while exploring; run it with `bash agent/r/run_r.sh <job> <file.R>` (runs
  `Rscript` with the job folder as working directory, logs to `work/r.log`).
- Follow the course style: `library(tidyverse)`, `library(janitor)`, `read_csv() |> clean_names()`, the native pipe
  `|>`, dplyr verbs, ggplot2, `ggsave(..., width =, height =, units = "cm")`.
- When the figure matches, write **`final/<slug>.R`**: one clean script, top to bottom, that loads the inputs with
  relative paths (`inputs/…`, `work/…`), does all cleaning and summarising, draws the figure and `ggsave()`s it to
  `final/<slug>.png`. Comment each block with the course procedure it follows. Rerun it from scratch to prove it
  works.
- Open it in Positron for the record: `bash agent/r/open_in_positron.sh <job> final/<slug>.R`, then screenshot.

### QGIS
- Prefer scripted runs so the work is reproducible: write a PyQGIS script in `work/<NN>-<step>.py` from the template
  `agent/qgis/template_job.py` and run it with `bash agent/qgis/run_pyqgis.sh <job> work/<NN>-<step>.py`.
  Single algorithms can also be run with `qgis_process` (path in `env.json`); algorithm ids and parameters are in
  `tools/qgis/processing-algorithms-reference.md`.
- Save the QGIS project to `final/<slug>.qgz` (or `work/` for an intermediate project) so the user can open it.
- Maps: build the print layout in the script (map, legend, scale bar, north arrow, grid, title, as in
  `tools/qgis/print-layout-map-export.md` and `print-layout-checklist.md`) and export PNG at 300 dpi to
  `final/<slug>.png`.
- For screenshots, open the project in the GUI: `bash agent/qgis/open_in_qgis.sh <job> final/<slug>.qgz`.
- If a step only works in the GUI (e.g. a plugin dialog like QuickMapServices), use computer use if it is available
  in this session; otherwise give the user the exact clicks from the procedure file and wait.

### Excel
- Power Query and PivotCharts are GUI features. Do the data steps with `bash agent/py.sh agent/excel/xlsx_tool.py …` (Python + openpyxl:
  read/clean/write sheets, add native Excel charts) so the result is a real `.xlsx`, and write the Power Query
  equivalent of what you did (M steps / menu path from the procedure file) in `REPORT.md`.
- Open the workbook in Excel for the screenshot: `bash agent/excel/open_in_excel.sh <job> <file.xlsx>`.
- If the question explicitly requires Power Query or a PivotTable built in Excel and computer use is available, do it
  in the GUI following the procedure steps; otherwise do the scripted version and list the GUI steps.

## Phase 5 — Compare and fix
1. Make a side-by-side image: `bash agent/py.sh agent/compare.py <job>` → `final/comparison.png` (target left, result right).
2. Run the `graph-checker` subagent on the job folder for an independent, detail-by-detail comparison.
3. Fix every difference you can (titles verbatim, order of categories, colours, legend position, axis breaks), rerun
   the final script, and repeat until the checker finds nothing material.
4. List remaining differences and why under "Differences from target".

## Phase 6 — Report
Finish `REPORT.md` (target spec, plan, steps with procedure links, hand-offs, decisions/assumptions, web lookups,
differences) and reply to the user with: the final image path, the final script/project path, and any assumption
they should check. Keep the reply short; the details are in the report.

## If something is not in the repo
Search the web for the specific function or menu (official docs first: docs.qgis.org, ggplot2.tidyverse.org,
dplyr.tidyverse.org, support.microsoft.com). Use only course-method tools. Record the URL and what it clarified.
