# agent/ — how the chart-reproduction agent drives the apps

Written for this agent; **not course material**. The course teaches the apps through their menus. These scripts run
the same course methods from the command line so the work is reproducible and can be screenshotted.

## First-time setup on the Mac
1. Open the `Data Repo` folder in Claude Code (desktop app → Code → choose this folder).
2. Ask: "run the environment check", or run `bash agent/env_check.sh`. It writes `agent/env.json` and prints what is
   missing:
   - **R** (`Rscript`) and the packages `tidyverse` and `janitor` (in Positron: `install.packages(c("tidyverse","janitor"))`).
   - **QGIS 3.44** in `/Applications` (`QGIS.app` or `QGIS-LTR.app`). PyQGIS is tested headless; if that fails the
     scripts run inside the QGIS window instead (`--code`).
   - **Microsoft Excel** in `/Applications`.
   - **python3** for the helper scripts (Xcode command line tools: `xcode-select --install`). A private
     `agent/.venv` with `openpyxl` and `pillow` is created automatically.
   - **Screen Recording permission** for screenshots: System Settings → Privacy & Security → Screen Recording →
     turn on Claude (and Terminal if you run things there). Excel export via AppleScript also asks once for
     Automation permission.

## Using it
Drop the data files and the target image into the chat (or give their paths) and say what the question is, e.g.
"Q2: recreate this crab counts figure" or "make this map in QGIS". The `reproduce-graph` skill takes over and
writes everything to `results/NN-name/`.

## Scripts
| Script | Use |
|---|---|
| `env_check.sh` | find the tools, write `env.json`, set up `agent/.venv` |
| `new_job.sh "<name>" files…` | create `results/NN-name/{inputs,work,screenshots,final}` + `REPORT.md` |
| `screenshot.sh <job> "<label>" [Excel\|QGIS\|Positron]` | bring the app to the front and save `screenshots/NN-label.png` |
| `kb_find.py <keywords…> [--tool qgis]` | rank course procedures in `manifest.json` by keyword |
| `py.sh <script.py> …` | run a helper with the agent's python |
| `compare.py <job>` | `final/comparison.png`: target left, result right |
| `r/run_r.sh <job> <file.R>` | run R with the job folder as working directory (log: `work/r.log`) |
| `r/open_in_positron.sh <job> [file]` | open the job folder / script in Positron |
| `qgis/run_pyqgis.sh <job> <file.py>` | run a PyQGIS script headless (or in the GUI as a fallback); log `work/qgis.log` |
| `qgis/template_job.py` | starting point for QGIS steps: load layers, run Processing algorithms, export CSV/GeoPackage, build a print layout, save `.qgz` |
| `qgis/open_in_qgis.sh <job> <project.qgz>` | open a project in QGIS for a screenshot |
| `excel/xlsx_tool.py` | CSV → Excel table (IDs as text, encoding auto-detect), native Excel charts, chart → PNG via Excel |
| `excel/open_in_excel.sh <job> <file>` | open a workbook in Excel for a screenshot |

## Hand-offs between tools
Excel → QGIS/R: UTF-8 CSV in `work/`. QGIS → R/Excel: CSV export of the attribute table. QGIS → QGIS: one GeoPackage
per job (`work/<job>.gpkg`). R → anything: `write_csv()`.
