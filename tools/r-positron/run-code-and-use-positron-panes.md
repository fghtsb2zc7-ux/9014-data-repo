---
id: r-positron.run-code-and-use-positron-panes
tool: r-positron
title: Run script code in Positron and read the console, Variables and Plots panes
keywords: [run code, execute, run line, run selection, console, script, editor, Variables pane, environment, Plots pane, layout, terminal, Ctrl+Enter, objects, assignment]
software_context: "Positron (R 4.6.1 / 4.5.0), default four-area layout"
prerequisites: [r-positron.install-r-and-positron, r-positron.open-folder-and-set-working-directory]
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "00:07-01:19, 05:37-07:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:43-02:31, 07:31-08:06"}]
source_pages: [course-pages/getting-started-with-course-software.md, course-pages/technical-skills-checklist.md]
datasets_used: [sources/files/PWQMN_Stations.csv, sources/files/PWQMN_data_2024.csv]
---
# Run script code in Positron and read the console, Variables and Plots panes

## Purpose
This covers how the course works in Positron: write code in an R script, run it line by line or selection by selection, and check results in the console, the Variables pane and the Plots pane.

## Steps
1. Know the layout. Top-left is the script editor. Bottom-left is the **CONSOLE** (tabs: CONSOLE, TERMINAL, OUTPUT, PORTS, DEBUG CONSOLE), where R runs. Top-right is **VARIABLES** under the SESSION tab, where created objects appear. Bottom-right is **PLOTS**, where ggplot output appears. [video positron-introduction-and-package-installation @00:07-00:42] [frame @00:12]
2. Place the cursor on a line, or select several lines (a whole pipe from the `<-` line to its last line), and run it. The videos show selected lines being executed and echoed in the console with `>` and `+` continuation prompts. (general knowledge — the run shortcut isn't shown: Ctrl+Enter runs the current line or selection; the ▶ button at the top-left of the editor runs the file) [frame @05:52] [video r-row-binds-and-joins2 @01:42]
3. Run multi-line pipes as one unit. If you select only part of a pipe, only that part runs. In the joins video, `bind_rows(...)` was first run without its `|> arrange(-year)` line. [video r-row-binds-and-joins2 @06:32]
4. To test a pipe step by step, run it up to an intermediate step first. The instructor ran `pwqmn_stations |> count(station)` before adding `filter(n > 1)`. [video r-row-binds-and-joins2 @10:12]
5. Read the console output. Messages such as `Rows: 2198 Columns: 10` and the column specification are information, not errors. Warnings print in red. [frame r-row-binds-and-joins2 @01:12, @09:22]
6. Check the Variables pane. Data frames appear under **DATA** as `name [rows x columns] <tbl_df>`. Expand an entry with its arrow, or click the table icon on the right to open it in the Data Explorer (see [view-data-in-data-explorer.md](view-data-in-data-explorer.md)). [frame r-row-binds-and-joins2 @04:52]
7. A ggplot command draws its plot in the Plots pane. A plot saved to an object (for example `heatmap_plot <- ggplot(...)`) appears only when you run the object name alone (`heatmap_plot`). [script R Skills Review.R:609-637]
8. Save the script often. An unsaved script shows a ● dot on its editor tab. [frame r-row-binds-and-joins2 @05:22]
9. Use the **TERMINAL** tab (not the console) for shell commands such as `quarto render`. See [render-quarto-document.md](render-quarto-document.md). [script Topic 1 - Case study.qmd:133-135]

## Formulas / expressions / code
Assignment and piping, as used everywhere in the course:
```r
pwqmn_stations <- read_csv("PWQMN_Stations.csv") |>
  clean_names() |>  ## Clean up column headers
  mutate(station = as.character(station)) ## Station IDs
```
- `<-` assigns the result to an object, which then appears in VARIABLES.
- `|>` (native pipe) passes the left-hand result into the next function. The course also uses `%>%` (magrittr pipe, loaded with tidyverse), for example `arrange(-mean_chloride) %>% head(8)`, and the video's `Lesson_1.R` uses `read_csv(...) %>% clean_names()`. Both pipes behave the same in course code. [script R Skills Review.R:600-607] [frame positron-introduction-and-package-installation @07:02]
- `#` starts a comment.

## Verify
- The console echoes the code you ran and shows no red "Error".
- New or changed objects appear in VARIABLES with the expected row and column counts (for example `pwqmn_stations [2198 rows x 10 columns]`). [frame r-row-binds-and-joins2 @04:52]

## Pitfalls
- A dangling `|>` at the end of the last selected line leaves the console waiting for more input (`+` prompt). Select the full pipe, or press Esc in the console. (general knowledge — not shown in course)
- Objects are lost when the session restarts. Re-run the script from the top, including `library()` lines.
- A plot assigned to an object is not drawn until the object name is run. [script R Skills Review.R:637]

## Related
- [view-data-in-data-explorer.md](view-data-in-data-explorer.md)
- [install-and-load-packages.md](install-and-load-packages.md)
- [inspect-a-dataset.md](inspect-a-dataset.md)
