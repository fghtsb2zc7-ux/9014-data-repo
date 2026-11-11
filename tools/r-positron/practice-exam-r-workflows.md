---
id: r-positron.practice-exam-r-workflows
tool: r-positron
title: Solve the course R practice and exam questions (question-to-procedure map)
keywords: [exam, practice exam, practice set, recreate figure, right whale, ferry buffer, crab counts, human wildlife conflict, particulate matter, TPM, case study, R.1.1, workflow, answer key]
software_context: "Positron, R 4.6.x, tidyverse + janitor"
prerequisites: [r-positron.install-and-load-packages, r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/exam-practice.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv", "sources/files/Practice sets/Practice set #2/Information_stations.csv", "sources/files/Practice sets/Practice set #2/Nombre_crabe_crab_number.csv", "sources/files/Practice Questions/pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv", "sources/files/Practice Questions/pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv", "sources/files/TPM practice exam.zip (particulate_matter_ON.csv)"]
---
# Solve the course R practice and exam questions (question-to-procedure map)

## Purpose
Exam questions ask you to "recreate the figure" from course datasets. This page maps each practice question to the procedures that cover it, and quotes the course-provided solution code where it exists. Target figures (PNG/PDF images) can't be read from the extracted text, so exact titles and colours must come from the original images.

## Steps
1. Open the exam's data folder in Positron, then load `tidyverse` and `janitor` ([install-and-load-packages.md](install-and-load-packages.md)).
2. Read each CSV with `read_csv() |> clean_names()` ([read-csv-and-clean-column-names.md](read-csv-and-clean-column-names.md)).
3. Find the question in the table below and follow the linked procedures.
4. End every figure question with `ggsave()` when asked ([save-plot-png-and-csv.md](save-plot-png-and-csv.md)).

| Question | What it needs | Procedures | Course solution code? |
|---|---|---|---|
| Practice set 1, R.1.1 to R.1.6 (right whale) | load + month label; select/filter ≥2000; monthly sum + blue columns; annual `n()` line plot (purple); top-5 institutions faceted; Group/Individual stacked columns + PNG/CSV | read-csv, parse-dates, select, filter, group-and-summarize, sort-and-keep-top-n, plot-column-chart, plot-line-chart, classify-with-ifelse, save | Yes, in "Get help" foldouts [page practice-1-north-atlantic-right-whale.md] |
| Practice exam question (ferry, grand_manan.png / ferry.png) | QGIS buffer exports `1km_buffer.csv`, `2km_buffer.csv` → label, bind, month, count, stacked columns | create-columns-with-mutate, bind-rows, group-and-summarize, plot-column-chart, customize | Yes [page exam-practice.md] (below) |
| Practice set 2 (crab counts, crab_counts.png) | join crab counts (`n.tot` per tow; keys `date`, `st`, `tr`, `bat`) to tow info (`dist`, year `an`), standardise counts by tow distance, plot | join-tables (join without `by`), create-columns-with-mutate, group-and-summarize, plot | Only the join hint [page exam-practice.md] |
| R Practice Exam Q1 (human-wildlife) | animals-involved CSV; remove species "Unknown" (keep "unknown duck" etc.); incidents over time; save PNG | filter-rows, parse-dates, group-and-summarize, plot, save | No |
| R Practice Exam Q2 | filter Incident Type "Human Wildlife Interaction"; top 5 species; filter deterrent records to those species | filter-rows, sort-and-keep-top-n, group-and-summarize, plot-column-chart | No |
| R Practice Exam Q3 | columns Year, Incident Type, Sum of Number of Animals; mean animals per incident type, 2013 vs 2023 (hint: back-ticks around year headers such as `` `2013` ``) | select, group-and-summarize, pivot-longer-and-wider, create-columns-with-mutate | No |
| TPM practice exam Q1 (particulate_matter_ON.csv) | recreate figure; add slope and whether it differs significantly from zero to the subtitle | group-and-summarize, plot-scatter-with-trend-line, fit-linear-regression, customize | No |
| TPM practice exam Q2 | 5 km rings around facilities in areas with >500 people; raster grid cells over 1000 people | QGIS task (buffers and raster); no R procedure in course | No |
| TPM practice exam Q3 | recreate figure; "pay careful attention to the details in the figure title and subtitle" | customize-plot-labels-themes-facets | No |
| Topic 1 - Case study, R Q1-6 (full OBIS file) | load full OBIS; keep reduced-file columns; animals per institution per year; sightings per year and month; column plot; PNG; CSV | read-csv, select, group-and-summarize, plot-column-chart, save, render-quarto-document | No [script Topic 1 - Case study.qmd:81-131] |

## Formulas / expressions / code
Ferry-buffer practice exam answer (verbatim) [page exam-practice.md]:
```r
library(tidyverse)
library(janitor)

data1 <- read_csv("1km_buffer.csv") |> 
  clean_names()|>
  mutate(buffer = "1 km")

data2 <- read_csv("2km_buffer.csv") |> 
  clean_names() |>
  mutate(buffer = "2 km")

combined_data <- bind_rows(data1, data2) |> 
  mutate(month = month(event_date_standard, label = TRUE))

count_data <- combined_data |> 
  group_by(month, buffer) |> 
  summarize(sightings = n()) |> 
  filter(month %in% c("Jul", "Aug", "Sep", "Oct", "Nov"))

ggplot(count_data, aes(x = month, y= sightings, fill = buffer)) +
  geom_col(colour = "black")+
  labs(x = "Month", y = "Sightings", fill = "Distance from ferry route", title = "Sightings within 1 km and 2 km of the ferry", subtitle = "OBIS data from 1900-2024")+
  theme_bw()+
  theme(legend.position = "bottom")
```
Crab practice set join hint (verbatim): "For any left_joins required for this question you do not need to explicitly write which columns you want the data to be joined by ... You can simply tell it which datasets you want to be joined and it will attach the columns by default." [page exam-practice.md]
```r
pwqmn_data_2024_joined  <- pwqmn_data_2024 |>
       left_join(unique_stations)
```
Whale practice R.1.1 to R.1.6 solutions are quoted in full in the linked procedures: read-csv-and-clean-column-names (R.1.1), select-and-rename-columns (R.1.2), plot-column-chart (R.1.3, R.1.5, R.1.6), plot-line-chart (R.1.4), sort-and-keep-top-n (R.1.5), classify-with-ifelse (R.1.6) and save-plot-png-and-csv (R.1.6).

## Verify
- Compare your figure with the target image: same geometry, same axis and legend titles, same facets and order, same title and subtitle text.

## Pitfalls
- Key column names after `clean_names()` (from dataset schemas, general knowledge of janitor):
  - Crab files: `st`, `tr`, `an`, `bat`, `dist`, `n_tot` (from `n.tot`). `date`, `st`, `tr` and `bat` appear in both files, so a `by`-less `left_join` joins on **all four**. Information_stations also has `an` (year); the crab file has no `an`. Check that `date` is the same type in both files after reading.
  - Human-wildlife file: `species_common_name`, `incident_type`, `sum_of_number_of_animals`, `incident_date`.
- Crab practice set: counts must be divided by tow distance ("tows that run for longer distances could have more crabs ... This needs to be fixed!"). No R solution is provided. A composed approach is `mutate(crabs_per_m = n_tot / dist)` after the join (general knowledge — not shown in course). [page exam-practice.md]
- Human-wildlife Q2 says "go back and filter the deterrent_records dataset". No object of that name is defined in the provided materials; it presumably means a filtered copy of the animals-involved data. [doc Practice Questions/ENVRSUST 9014 R Practice Exam.pdf]

## Related
- [README.md](README.md)
- [join-tables.md](join-tables.md)
- [fit-linear-regression.md](fit-linear-regression.md)
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
