---
id: r-positron.readme
tool: r-positron
title: Positron / R in ENVRSUST 9014 — overview, setup and procedure index
keywords: [index, overview, Positron, R, tidyverse, janitor, setup, environment, procedures, table of contents, start here]
software_context: "Positron (Posit), R 4.6.1 (course recommendation; R 4.5.0 in the joins video), Quarto 1.10.18 / 1.9.38, tidyverse 2.0.0, janitor 2.2.1, Windows"
prerequisites: []
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "00:00-07:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:00-17:32"}]
source_pages: [course-pages/getting-started-with-course-software.md, course-pages/technical-skills-checklist.md, course-pages/videos-organized-by-software.md]
datasets_used: []
---
# Positron / R in ENVRSUST 9014

## How the course uses Positron and R
- **Editor**: Positron, Posit's successor to RStudio. The instructor chose it for its data-exploration tools, especially the Data Explorer, and its AI integration ("Posit Assistant", planned for later in the term). [page getting-started-with-course-software.md] [video positron-introduction-and-package-installation @01:19-03:11]
- **Language and packages**: base R plus only **tidyverse** (dplyr, readr, tidyr, ggplot2, lubridate, forcats, stringr, tibble, purrr) and **janitor** (`clean_names()`). No spatial R packages are used; all spatial work is done in QGIS.
- **Workflow**: open the lesson folder in Positron (this sets the working directory), open the .R or .qmd script, run it line by line, check objects in the Variables pane and Data Explorer, plot in the Plots pane, save outputs with `ggsave()`/`write_csv()`, and render Quarto case studies to Word from the terminal.
- **Course topics with R content**: Topic 1 (load, clean, explore NPRI), Topic 2 (filtering, pivoting, dates, factors on basking-shark tag data), Topic 3 (formulas, if statements, deterministic modelling, taught in class; no script provided), Topic 5 (buckthorn plots, PWQMN row binds and joins), Topic 7 (buckthorn regression and plots), final lesson (PWQMN chloride heatmap and plot customization), plus practice sets and exams.
- **Skills list**: the 70 R items in [technical-skills-checklist.md](../../course-pages/technical-skills-checklist.md) are all covered by the procedures below.

## Environment setup (quick)
1. Install Positron (https://positron.posit.co/download.html) and base R from CRAN (current version 4.6.1). See [install-r-and-positron.md](install-r-and-positron.md).
2. In Positron, use **Open Folder** to open the lesson data folder, then **Start Session** and pick R. See [open-folder-and-set-working-directory.md](open-folder-and-set-working-directory.md).
3. Run once: `install.packages("tidyverse")`, `install.packages("janitor")`. Run every session: `library(tidyverse)`, `library(janitor)`. See [install-and-load-packages.md](install-and-load-packages.md).
4. Check the folder with `getwd()`, then load data with `read_csv("file.csv") |> clean_names()`.

## Provenance tags used in these files
`[video <slug> @mm:ss]` = narration; `[frame]` / `[frame @mm:ss]` = seen on screen only; `[page <file>]` = course page; `[script <file>:<lines>]` = course R/qmd script under `sources/files/`; `[doc <file>]` = extracted PDF text (practice exams); `[_raw <file>]` = zip listing in `_raw/extracted/`; "(general knowledge — not shown in course)" = added by the KB author, not from the course.

## Procedure index
| id | Title | Keywords |
|---|---|---|
| [r-positron.install-r-and-positron](install-r-and-positron.md) | Install R and Positron and start an R console session | install, R version, Start Session |
| [r-positron.install-and-load-packages](install-and-load-packages.md) | Install and load R packages (tidyverse, janitor) | install.packages, library, Packages pane |
| [r-positron.open-folder-and-set-working-directory](open-folder-and-set-working-directory.md) | Open the lesson folder and check the working directory | Open Folder, getwd, relative paths |
| [r-positron.run-code-and-use-positron-panes](run-code-and-use-positron-panes.md) | Run script code; console, Variables and Plots panes | run selection, pipe, assignment |
| [r-positron.view-data-in-data-explorer](view-data-in-data-explorer.md) | Open a data frame in the Data Explorer | missing %, column types, table icon |
| [r-positron.read-csv-and-clean-column-names](read-csv-and-clean-column-names.md) | Load a CSV with read_csv() and clean_names() | import, janitor, backticks |
| [r-positron.inspect-a-dataset](inspect-a-dataset.md) | Inspect with glimpse/names/head/unique/nrow/ncol | structure, dimensions |
| [r-positron.select-and-rename-columns](select-and-rename-columns.md) | Keep, drop and rename columns | select, rename, position |
| [r-positron.filter-rows](filter-rows.md) | Filter rows with conditions | ==, !=, %in%, !, &, complete.cases |
| [r-positron.convert-column-types](convert-column-types.md) | Convert types; replace codes with NA | as.numeric, as.character, `<1.5` |
| [r-positron.create-columns-with-mutate](create-columns-with-mutate.md) | Create or modify columns with mutate() | calculations, labels, substring |
| [r-positron.classify-with-ifelse](classify-with-ifelse.md) | Classify or replace values with ifelse() | if statement, Yes/No, 1/0 |
| [r-positron.parse-dates-and-extract-month](parse-dates-and-extract-month.md) | Parse dates (ymd_hm, mdy) and extract months | lubridate, month label |
| [r-positron.group-and-summarize](group-and-summarize.md) | group_by() + summarize() | sum, mean, max, n, n_distinct |
| [r-positron.sort-and-keep-top-n](sort-and-keep-top-n.md) | arrange() and top-N with head() | descending, top 5 |
| [r-positron.pivot-longer-and-wider](pivot-longer-and-wider.md) | Reshape wide/long | pivot_longer, pivot_wider |
| [r-positron.order-categories-with-factor-and-reorder](order-categories-with-factor-and-reorder.md) | Control category order | factor levels, reorder |
| [r-positron.bind-rows](bind-rows.md) | Stack datasets with bind_rows() | row bind, append years |
| [r-positron.find-duplicates-and-keep-distinct](find-duplicates-and-keep-distinct.md) | Find duplicates (count) and keep distinct rows | count, distinct, .keep_all |
| [r-positron.join-tables](join-tables.md) | left_join / semi_join / anti_join with join_by() | merge, lookup, many-to-many |
| [r-positron.plot-column-chart](plot-column-chart.md) | Column charts (stacked, flipped) | geom_col, fill, coord_flip |
| [r-positron.plot-scatter-with-trend-line](plot-scatter-with-trend-line.md) | Scatterplot + trend line | geom_point, geom_smooth, lm |
| [r-positron.plot-line-chart](plot-line-chart.md) | Line charts; highlight/label a point | geom_line, group = 1, geom_text |
| [r-positron.plot-histogram-and-boxplot](plot-histogram-and-boxplot.md) | Histograms and boxplots | geom_histogram, geom_boxplot, hist |
| [r-positron.plot-heatmap](plot-heatmap.md) | Heatmap with geom_tile and labels | geom_tile, geom_text, round |
| [r-positron.customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) | Labels, themes, legend, facets, colours | labs, theme, facet_wrap, legend.position |
| [r-positron.save-plot-png-and-csv](save-plot-png-and-csv.md) | Export PNG (ggsave) and CSV (write_csv) | export, output |
| [r-positron.fit-linear-regression](fit-linear-regression.md) | Linear models with lm() and summary() | slope, p-value, interaction |
| [r-positron.render-quarto-document](render-quarto-document.md) | Complete and render a Quarto case study | qmd, quarto render, docx |
| [r-positron.practice-exam-r-workflows](practice-exam-r-workflows.md) | Practice/exam question to procedure map | recreate figure, exam |

Reference files:
- [scripts-catalog.md](scripts-catalog.md): every course script, section by section, with inputs and outputs.
- [function-reference.md](function-reference.md): every R function → package, purpose, file:line, procedure.

## Source videos
- [Positron - Introduction and package installation](../../transcripts/r-positron/positron-introduction-and-package-installation.md) (07:37): layout, Packages pane, Open Folder, Start Session, installing and loading tidyverse/janitor.
- [R - Row binds and joins2](../../transcripts/r-positron/r-row-binds-and-joins2.md) (17:32): Data Explorer, `bind_rows`, `arrange`, `left_join`/`semi_join`/`anti_join`, `count`/`distinct`, on Topic5.R.

## Known bugs in the course scripts (use the corrected versions)
| File:line | Problem | Corrected in |
|---|---|---|
| `Topic 7.R:8` | `ifelse(reproducing_buckthorn > TRUE, 1, 0)` makes everything 0 | RSR:465 / CRS:374 (`== TRUE`) |
| `Topic 7.R:8` | `total_cover` mutate is inside a comment and never runs | not fixed anywhere |
| `Topic 7.R:63` | `summary(compare_sections)` instead of `compare_sections_int` | RSR:520 / CRS:429 |
| `Topic 7.R:85-86` | demographic summary missing `group_by(section)` | RSR:543 / CRS:452 |
| `Topic 5 in-class script.R:18` | elevation plot labelled "Canopy cover (%)" | RSR:333 / CRS:339 |
| `Class 1/Topic 1.qmd:116,125` | max stored as `sum_tpm` and overwrites `province_tpm`; extra `)` syntax error | RSR:102-113 / CRS:99-110 |
| `Class 1/Topic 1.qmd:95` | says `head()` shows 10 rows (it shows 6) | RSR:86 |
| PWQMN join (all versions) | about 54% of 2024 measurements don't match a station; IDs appear to lose a leading zero | not addressed in course (see [join-tables.md](join-tables.md)) |
