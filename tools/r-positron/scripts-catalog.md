---
id: r-positron.scripts-catalog
tool: r-positron
title: Catalog of every course R / Quarto script
keywords: [scripts, R script, qmd, Quarto, catalog, Topic 1, Topic 2, Topic 5, Topic 7, Combined R Scripts, R Skills Review, Topic5.R, Lesson_1.R, input files, outputs, packages]
software_context: "Positron, R 4.5-4.6, tidyverse 2.0.0, janitor"
prerequisites: []
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "00:12-07:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:12-17:32"}]
source_pages: [course-pages/class-1-overview.md, course-pages/lesson-2-overview.md, course-pages/lesson-5-overview.md, course-pages/lesson-7-overview.md, course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/case-study-8.md, course-pages/videos-organized-by-software.md]
datasets_used: [see per-script tables]
---
# Catalog of every course R / Quarto script

Every script loads only **tidyverse** and **janitor** (one draft placeholder loads only `ggplot2`). Paths are relative to `sources/files/` unless noted otherwise. Line numbers refer to the file named in each heading.

## Overview table
| Script | Course unit | Where linked | Datasets | Writes files? |
|---|---|---|---|---|
| `Class 1/Topic 1.qmd` | Class 1 Positron lesson (NPRI) | class-1-overview.md | NPRI releases CSV (Class 1/NPRI data.zip) | `province_tpm_plot.png`, `province_tpm.csv` (+ HTML on render) |
| `Lesson_1.R` (video only) | Positron intro video | — (seen on screen) | NPRI data folder | — |
| `Topic 1 - Case study.qmd` | Class 1 case study (right whale) | class-1-overview.md | OBIS full/reduced CSV | `.docx` on render |
| `Class 1 case study.zip` → `Topic 1 - Case study.qmd` (early variant) | Class 1 case study | class-1-overview.md | OBIS CSVs (in same zip) | `.docx` on render |
| `Class 2/Class 2.zip` → `Topic 2.R` | Class 2 data wrangling | lesson-2-overview.md | `data/108916_tag.csv`, `data/108916_histos.csv` | none |
| `Class 2/Class 2.zip` → `Topic 2 - Case study.qmd` | Class 2 case study (sportfish) | lesson-2-overview.md | `data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` | `.docx` on render |
| `Topic 5 in-class script.R` | Class 5 in class (buckthorn) | lesson-5-overview.md | `buckthorn_updated.csv` | none |
| `Topic5.R` | Topic 5 pre-class (PWQMN binds and joins; the script in the joins video) | topic-5 page | `PWQMN_Stations.csv`, `PWQMN_data_2024.csv`, `PWQMN-2000_2009.csv`, `PWQMN-2010_2018.csv` (all in Topic 5.zip) | none |
| `Topic 7.R` | Class 7 buckthorn R script | lesson-7-overview.md | `buckthorn_updated.csv` | none |
| `Combined R Scripts.R` | Case study 8 handout (all lessons combined) | case-study-8.md | NPRI, Class 2 tag data, buckthorn, PWQMN 2024 | png + csv (Topic 1 part) |
| `R Skills Review.R` | Review script (most complete) | videos-organized-by-software.md | NPRI, Class 2 tag data, buckthorn, all PWQMN | png + csv (Topic 1 part) |

---

## Class 1/Topic 1.qmd
Quarto lesson "Topic 1: Positron"; `format: html` with `embed-resources: true` (lines 1-6). The prose and code were later copied as comments into Combined/R Skills Review.
| Lines | Section | What it does |
|---|---|---|
| 12-21 | Install packages | `install.packages("tidyverse")`, `install.packages("janitor")` in a chunk with `#| eval: false` |
| 23-30 | Load packages | `library(tidyverse)`, `library(janitor)` |
| 32-38 | Check working directory | `getwd()` |
| 40-51 | Load the data | `read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv")`, then again with `|> clean_names()` |
| 53-65 | Inspect | `glimpse(npri_releases)`, `names(npri_releases)` |
| 67-85 | Select and filter | `npri_tpm`: select 5 columns, filter year ≥ 2015 and substance "Total particulate matter", rename to `quantity`, `year`, `substance` |
| 87-99 | Inspect filtered | `glimpse`, `head` (the prose wrongly says 10 rows by default) |
| 101-127 | Summarize | `province_tpm` = sum by year × province; **then overwritten** by a max version (line 116, still named `sum_tpm`); line 125 `summarize(count = n(), na.rm = TRUE))` has an **extra `)` (syntax error)** |
| 130-138 | Inspect summary | `glimpse`, `head` |
| 140-155 | Visualize | points + lines by province, `facet_wrap(~ province)`, `theme_bw`, `labs` |
| 157-163 | Save figure | `ggsave("province_tpm_plot.png", width = 15, height = 10, units = "cm")` |
| 165-171 | Save data | `write_csv(province_tpm, "province_tpm.csv")` |
Input: `NPRI-INRP_ReleasesRejets_1993-present.csv` from `Class 1/NPRI data.zip` (about 363 MB uncompressed). Outputs: PNG, CSV, and HTML if rendered.

## Lesson_1.R (seen in the Positron intro video only; not in sources/files)
Shown at [00:12]-[07:02] of [positron-introduction-and-package-installation](../../transcripts/r-positron/positron-introduction-and-package-installation.md). Lines 1-19: `#01_loading-and-clean-data`, install lines, library lines, `getwd()`, then `npri_releases <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") %>%` / `clean_names()`. It is an R-script version of Class 1/Topic 1.qmd that uses `%>%`. It sits in the `NPRI data` folder beside the NPRI CSVs.

## Topic 1 - Case study.qmd
Case-study worksheet (`format: docx`, `editor: visual`), lines 1-5.
| Lines | Section | Content |
|---|---|---|
| 7-21 | Intro and Quarto instructions | type answers, paste screenshots, write R code |
| 23-53 | Excel Q1-7 | metadata sheet, Pivot charts (whales by year and month, institutions, top 3) |
| 55-79 | QGIS Q1-5 | load OBIS CSV, symbology, vessel routes |
| 81-131 | R Q1-6 (empty ```` ```{r} ```` chunks) | 1 load packages and the full OBIS data; 2 keep only the reduced-file columns; 3 total animals per institution per year; 3b total SIGHTINGS per year and month; 4 column plot; 5 export PNG; 6 save CSV |
| 133-135 | Render | `quarto render "Topic 1 - Case study.qmd"` pasted into the terminal |
Inputs: `OBIS - North Atlantic Right Whale full.csv` (285 columns) and `... reduced.csv` (15 columns), both from `Class 1/Class 1 case study.zip`. The reduced file is also in `Topic 2/` and `Practice sets/`. No solution code.

## Class 1 case study.zip → Topic 1 - Case study.qmd (early variant)
Listing in `_raw/extracted/Class 1__Class 1 case study.zip.contents.md:397-465`. Shorter version: Excel Q1-3, QGIS Q1 plus an unfinished "testsasdf" item, and an R section with an empty load chunk. The next chunk is a **placeholder**: `library(ggplot2)` then `ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()`. Prompts: "Create a new dataset that only has the top" (unfinished), "Create a figure that shows how the maximum size of the groups has changed over years", BONUS "Plot the QGIS data", and interpretation questions (peak months for sightings, change over time). Ends with the `quarto render "Topic 1 - Case study.qmd"` instruction ("Use right click to paste"). The zip also holds both OBIS CSVs and `Vessel_Traffic_Routes.zip`.

## Class 2.zip → Topic 2.R
Listing in `_raw/extracted/Class 2__Class 2.zip.contents.md:209-368`. Line numbers below are Topic 2.R lines (listing line − 210). Identical to the Topic 2 block in `R Skills Review.R:154-312`. Run from the `Class 2` root folder ("Ensure you are sitting in the root folder for the lesson"). File names are not cleaned, so backticks are needed.
| Lines | Section | What it does |
|---|---|---|
| 1-2 | Packages | tidyverse, janitor |
| 6-9 | Location data | `read_csv("data/108916_tag.csv")`, `mutate(date_time = ymd_hm(Date))`, `mutate(month = month(date_time, label = TRUE))` |
| 11-16 | Quick look | `glimpse`; date-time line plot of `` `Most Likely Latitude` `` |
| 19-31 | Histogram data | `read_csv("data/108916_histos.csv")`, rename Bin2-Bin6 to temperature ranges, `glimpse` |
| 33-62 | Basic filtering | `unique(tag_data$HistType)`; `==`, `!=`, `%in%`, `!%in%`; combined filter with `as.numeric` and `&` |
| 64-90 | Pivot | `names()`, `select(-(21:38))`, `pivot_longer` (5 ranges → "Temperature range"/"Percent time"), `pivot_wider` back |
| 93-113 | Mutate/group/summarize | date-time + month, `group_by(`Temperature range`)`, mean percent time |
| 116-120 | Basic plot | `geom_col` + `theme_bw` + `coord_flip` |
| 123-149 | Factor order | `factor(levels = ...)`, re-plot with `labs(y = "Percent of time")` |
| 151-157 | Reorder by value | `reorder(`Temperature range`, average_time)` |
Inputs: `Class 2/Class 2.zip` → `data/108916_tag.csv` (586 × 14), `data/108916_histos.csv` (1072 × 38). Outputs: none.

## Class 2.zip → Topic 2 - Case study.qmd
Listing lines 191-207. Contains only YAML (`title: "Case study 2 - Marine Sportfishing Tagging Program"`, `format: docx`) and the line "To finalize your submission, copy the following into the powershell terminal:quarto render "Topic 2 - Case study.qmd"". Data: `Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` (47086 × 15). Objectives are on [marine-sportfish-tagging-programme.md](../../course-pages/marine-sportfish-tagging-programme.md).

## Topic 5 in-class script.R (34 lines)
| Lines | What it does |
|---|---|
| 1-2 | tidyverse, janitor |
| 4-7 | `buckthorn_data <- read_csv("buckthorn_updated.csv") |> clean_names()`; `glimpse` |
| 9-13 | scatter canopy_cover vs buckthorn_percent, pink points, `geom_smooth()`, `theme_bw` |
| 15-19 | scatter elevation1 vs buckthorn_percent (**x label wrongly "Canopy cover (%)"**) |
| 22-26 | select 3 cover columns, `pivot_longer` to "Cover type"/"Percent" |
| 28-30 | mean per cover type (`na.rm = TRUE`) |
| 32-34 | columns ordered by `reorder(`Cover type`, -average)` |
Input: `buckthorn_updated.csv` (53 × 36; class field data joined in QGIS with distance-to-water and elevation). Outputs: none.

## Topic5.R (118 lines; the script shown in the "R - Row binds and joins2" video)
The Topic 5 page links it ("download and copy it into the data you downloaded above and then open that folder within Positron"). Identical code to `R Skills Review.R:351-453`.
| Lines | Section | What it does |
|---|---|---|
| 3-4 | Packages | tidyverse, janitor |
| 10-19 | Load data | stations (`station` to character); 2024 data (`collection_site` to character) |
| 22-45 | Row binds | read 2010-2018 and 2000-2009 (`station` to character), `names()` both, `bind_rows()` then `arrange(-year)` |
| 51-60 | Left join | `left_join(pwqmn_stations, by = join_by(collection_site == station), )`, which gives the many-to-many warning |
| 62-73 | Duplicates | `count(station) |> filter(n > 1)` (10 stations); `distinct(station, .keep_all = TRUE)` |
| 75-87 | Left join again | with `unique_stations`; `nrow`/`ncol` before and after |
| 89-101 | Semi join | matched rows; `nrow` |
| 104-115 | Anti join | unmatched rows; `distinct(collection_site)` |
Inputs (`Topic 5.zip`): `PWQMN_Stations.csv` (2198 × 10), `PWQMN_data_2024.csv` (112392 × 15; the standalone `sources/files/PWQMN_data_2024.csv` copy), `PWQMN-2000_2009.csv` (972717 rows), `PWQMN-2010_2018.csv` (948153 rows). Outputs: none (objects only). Results are in [join-tables.md](join-tables.md).

## Topic 7.R (110 lines)
| Lines | Section | What it does |
|---|---|---|
| 1-8 | Load | buckthorn + `clean_names`; `buckthorn_present = ifelse(buckthorn_percent > 0, "Yes", "No")`; `reproduction_present = ifelse(reproducing_buckthorn > TRUE, 1, 0)` (**bug: `>` should be `==`**); `total_cover` mutate is inside a comment and does not run |
| 12-17 | Filter practice | prompts only (section 1 vs 2; teams "Buckstreet boys" and "Love islanders") |
| 23-28 | Histogram | `geom_histogram`, fill and facet by section |
| 30-33 | Scatter | canopy vs buckthorn with `geom_smooth(method = "lm")` |
| 35-44 | Regression | `lm(buckthorn_percent~canopy_cover)`, `summary`; answer comment (not significant) |
| 46-48 | Boxplot | by section |
| 50-63 | Group models | mean by section; `lm(~section)`, `hist(residuals())`, `lm(~section+distance)`, `lm(~section*distance)` (**line 63 summarizes the wrong model**) |
| 65-74 | Faceted scatter | distance vs buckthorn by section, `alpha = 0.5`, lm lines |
| 84-86 | Demographic summary | **no `group_by(section)`** (bug) |
| 89-98 | Life stages | select, `pivot_longer(cols = 4:5)`, quadrat_id to character, group mean |
| 100-105 | Stacked columns | by quadrat, fill = life_stage |
Input: `buckthorn_updated.csv`. Outputs: none. The corrected version is `Combined R Scripts.R:367-472` / `R Skills Review.R:456-563`.

## Combined R Scripts.R (596 lines)
Header: "Combined original lesson scripts / Topic 1 Quarto is presented as R comments." Linked from Case study 8 with `PWQMN_data_2024.csv` and `PWQMN_Stations.csv`.
| Lines | Block | Equivalent |
|---|---|---|
| 4-147 | TOPIC 1 (Quarto as comments; separate `province_tpm`, `province_tpm_max`, `province_tpm_count`) | Class 1/Topic 1.qmd, corrected |
| 151-311 | TOPIC 2 | Topic 2.R |
| 317-355 | TOPIC 5 (buckthorn in-class; elevation label corrected) | Topic 5 in-class script.R |
| 361-472 | TOPIC 7 (`== TRUE`, `group_by(section)` and `summary(compare_sections_int)` fixed) | Topic 7.R, corrected |
| 479-596 | "Topic 8": PWQMN chloride heatmap + station line plot | final lesson |
It does **not** contain the PWQMN binds/joins block. Inputs: NPRI CSV, `data/108916_tag.csv`, `data/108916_histos.csv`, `buckthorn_updated.csv`, `PWQMN_data_2024.csv`. Outputs: `province_tpm_plot.png`, `province_tpm.csv`.

## R Skills Review.R (685 lines; the most complete script)
| Lines | Block |
|---|---|
| 4-152 | TOPIC 1 (Quarto prose as comments; keeps the `#| eval: false` line as a comment) |
| 154-312 | TOPIC 2 |
| 314-349 | TOPIC 5 in-class buckthorn |
| 351-453 | TOPIC 5 PWQMN row binds and joins (= Topic5.R) |
| 456-563 | TOPIC 7 (corrected) |
| 570-685 | FINAL LESSON: PWQMN heatmaps, labels and plot customization (chloride; `n_distinct`; top 8 stations; `geom_tile`/`geom_text`; `theme()` styling; highlighted January peak; `scale_colour_manual`) |
Inputs: all of the above plus `PWQMN_Stations.csv`, `PWQMN-2000_2009.csv`, `PWQMN-2010_2018.csv`. Outputs: `province_tpm_plot.png`, `province_tpm.csv`.

## Code on course pages (not separate files)
- [practice-1-north-atlantic-right-whale.md](../../course-pages/practice-1-north-atlantic-right-whale.md): solutions R.1.1-R.1.6 (OBIS reduced CSV). Writes `whale_monthly_records.png` and `whale_annual_summary.csv`.
- [exam-practice.md](../../course-pages/exam-practice.md): ferry-buffer answer (`1km_buffer.csv`, `2km_buffer.csv`, exported from QGIS, not in sources) and the `left_join(unique_stations)` hint.
- [npri-group-assignment-updated.md](../../course-pages/npri-group-assignment-updated.md): `read_csv` NPRI and `substring(npri_data$`NAICS / Code_SCIAN`, 1, 4)`.

## Scripts referenced but not available
- None missing now. `Class 1/Topic 1.qmd` and `Topic5.R` are present.
- `SOLRIS 3.0.qmd` and `buckthorn_updated.qmd` are **QGIS metadata files** (XML), not Quarto.

## Related
- [function-reference.md](function-reference.md)
- [README.md](README.md)
