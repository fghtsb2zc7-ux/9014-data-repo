---
id: r-positron.classify-with-ifelse
tool: r-positron
title: Classify observations or replace values with ifelse() (R if statement)
keywords: [ifelse, if statement, if_else, case_when, conditional, classify, categorize, yes no, presence absence, binary, replace value, threshold, group size, individual vs group, conditional logic]
software_context: "Positron, R 4.6.1, base R ifelse() inside dplyr::mutate()"
prerequisites: [r-positron.create-columns-with-mutate]
source_videos: []
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: [sources/files/buckthorn_updated.csv, sources/files/PWQMN_data_2024.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Classify observations or replace values with ifelse() (R if statement)

## Purpose
`ifelse(test, value_if_true, value_if_false)` inside `mutate()` is the course's R "IF statement" (Topic 3, "Positron - If statements"). It can turn a number into categories (Yes/No, Group/Individual), turn TRUE/FALSE into 1/0, or replace one specific value with NA while keeping all others.

## Steps
1. Decide the test, for example `buckthorn_percent > 0`.
2. Inside `mutate()`, write `new_col = ifelse(test, "value if TRUE", "value if FALSE")`. [script R Skills Review.R:464]
3. To keep the original value when the test is FALSE, put the column itself as the third argument: `ifelse(results == "<1.5", NA, results)`. [script R Skills Review.R:584]
4. Run it and check the new column with `unique()` or `count()`.

## Formulas / expressions / code
Presence/absence and 1/0 coding (Topic 7, buckthorn) [script R Skills Review.R:462-465]:
```r
buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names() |> ## Load in the buckthorn data and clean the column headers 
  mutate(buckthorn_present = ifelse(buckthorn_percent > 0, "Yes", "No")) |> #Create a new column that identifies if a plot has buckthorn (yes) or does not have buckthorn (no)
  mutate(reproduction_present = ifelse(reproducing_buckthorn == TRUE, 1, 0))
```
Replace a code with NA and keep everything else (PWQMN chloride) [script R Skills Review.R:584]:
```r
mutate(results = ifelse(results == "<1.5", NA, results))
```
Group vs individual sightings (whale practice R.1.6) [page practice-1-north-atlantic-right-whale.md]:
```r
whale_data_month <- whale_data |>
  mutate(group_size = ifelse(individual_count > 1, "Group", "Individual"))|>
  group_by(month_label, group_size) |>
  summarize(sightings_count = n())
```
The practice page also explains the logic by comparison with Excel's `=IF([@bathymetry] <0, 0,[@bathymetry])`: "you can have the 'FALSE' part of the IF statement just be the results in the column". In R the equivalent would be `mutate(corrected_depth = ifelse(bathymetry < 0, 0, bathymetry))`. That R line is composed from the course pattern; only the Excel version is shown. [page practice-1-north-atlantic-right-whale.md]

## Verify
- `unique(data$new_col)` shows only the expected classes (for example "Yes", "No").
- Counts make sense: `count(buckthorn_data, buckthorn_present)` (general knowledge: `count(data, col)`; the course uses `data |> count(col)`).

## Pitfalls
- **Bug in `sources/files/Topic 7.R` line 8:** `ifelse(reproducing_buckthorn > TRUE, 1, 0)` uses `>`. Nothing is greater than TRUE, so every value becomes 0. The corrected version in `Combined R Scripts.R:374` and `R Skills Review.R:465` uses `== TRUE`. Always use the `==` version. [script Topic 7.R:8]
- `reproducing_buckthorn` is logical (TRUE/FALSE) in `buckthorn_updated.csv`, but "Yes"/"No" text in the raw `Buckthorn observations_0.csv`. Use the `== TRUE` test only on the updated file. (from dataset schemas)
- `NA` values in the test column produce `NA` output, not the FALSE value. (general knowledge — not shown in course)
- `case_when()` (multiple conditions) and `if_else()` are not used in any course R code. Multi-condition classification is taught only in QGIS ("Case when for multiple conditions"). For more than two classes in R, nest `ifelse()` calls. (general knowledge — not shown in course)

## Related
- [create-columns-with-mutate.md](create-columns-with-mutate.md)
- [convert-column-types.md](convert-column-types.md)
- [plot-column-chart.md](plot-column-chart.md) (stacked by class)
