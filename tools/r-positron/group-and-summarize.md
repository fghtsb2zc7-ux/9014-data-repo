---
id: r-positron.group-and-summarize
tool: r-positron
title: Summarize data by group with group_by() and summarize() (sum, mean, max, n, n_distinct)
keywords: [group_by, summarize, summarise, aggregate, pivot table equivalent, total, sum, mean, average, max, count, n(), n_distinct, na.rm, grouped summary, per year, per province, per station, count records]
software_context: "Positron, R 4.6.1, dplyr 1.2.1 (tidyverse)"
prerequisites: [r-positron.filter-rows]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_ReleasesRejets_1993-present.csv)", "sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv, sources/files/PWQMN_data_2024.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Summarize data by group with group_by() and summarize() (sum, mean, max, n, n_distinct)

## Purpose
This is R's version of an Excel PivotTable. `group_by()` defines the groups (for example year and province) and `summarize()` calculates one value per group: a total, mean, maximum, record count or number of distinct values.

## Steps
1. Filter and select the data first (see [filter-rows.md](filter-rows.md)).
2. Add `group_by(var1, var2)` with the grouping columns. [script R Skills Review.R:96]
3. Add `summarize(new_name = function(column, na.rm = TRUE))`. Choose:
   - `sum()` for totals [script R Skills Review.R:97]
   - `max()` for maxima [script R Skills Review.R:104]
   - `mean()` for averages [script R Skills Review.R:267]
   - `n()` to count records/rows (takes no argument) [script R Skills Review.R:112]
   - `n_distinct(col)` to count distinct values [script R Skills Review.R:593]
4. Add `na.rm = TRUE` so missing values are ignored rather than making the result NA. [script R Skills Review.R:97]
5. Optionally drop groups with missing keys: `filter(complete.cases(province))`. [script R Skills Review.R:98]
6. Assign the result to a new object and inspect it with `glimpse()`/`head()`. [script R Skills Review.R:119-122]

## Formulas / expressions / code
NPRI total particulate matter by year and province: sum, max and count (Topic 1) [script R Skills Review.R:95-113]:
```r
province_tpm <- npri_tpm |>
  group_by(year, province) |>
  summarize(sum_tpm = sum(quantity, na.rm = TRUE)) |>
  filter(complete.cases(province)) ## removes any missing data from the province column. 

# We can also change the function we want to summarize by. 
province_tpm_max <- npri_tpm |>
  group_by(year, province) |>
  summarize(max_tpm = max(quantity, na.rm = TRUE)) |>
  filter(complete.cases(province))

# Or count the number of records for each year and province. 
province_tpm_count <- npri_tpm |>
  group_by(year, province) |>
  summarize(count = n()) |>
  filter(complete.cases(province))
```
Mean percent time per temperature range (Topic 2) [script R Skills Review.R:254-268]:
```r
grouped_tag_data <- filtered_tag_data_long |> 
  mutate(date_time = ymd_hm(Date)) |> 
  mutate(month = month(date_time, label = TRUE)) |> 
  group_by(`Temperature range`) |> 
  summarize(
    average_time = mean(`Percent time`, na.rm = TRUE)
  )
```
Buckthorn means (Topics 5 and 7) [script R Skills Review.R:343-345, 508-510, 542-544, 554-556]:
```r
summarized_data <- buckthorn_reduced |> 
  group_by(`Cover type`) |> 
  summarize(average = mean(Percent, na.rm = TRUE)) 

buckthorn_summary <- buckthorn_data |> 
  group_by(section) |> 
  summarize(mean_buckthorn = mean(buckthorn_percent))

buckthorn_summary_demographic <- buckthorn_data |> 
  group_by(section) |>
  summarize(sapling = mean(sapling_percent), adult = mean(adult_percent))

life_stages_grouped <- life_stages |>
  group_by(quadrat_id, life_stage) |> 
  summarize(mean_value = mean(percent))
```
Distinct months per station, and station-month means (PWQMN chloride) [script R Skills Review.R:591-607]:
```r
# Count the distinct months with numeric chloride results for each station.
monthly_data <- chloride_data |>
  group_by(collection_site) |>
  summarize(months_recorded = n_distinct(month)) |>
  filter(months_recorded == 12)

selected_stations <- chloride_data |>
  filter(collection_site %in% high_output$collection_site) %>%
  group_by(collection_site, month) %>%
  summarize(mean_chloride = mean(results))
```
Whale practice: sum of individuals vs count of sightings [page practice-1-north-atlantic-right-whale.md]:
```r
month_whales <- whale_data |>
  group_by(month_label) |>
  summarize(
    whale_count = sum(individual_count, na.rm = TRUE))|>
  filter(complete.cases(month_label))

annual_whales <- whale_data |>
  group_by(year) |>
  summarize(sighting_count = n())
```
Ferry-buffer practice exam: sightings per month and buffer [page exam-practice.md]:
```r
count_data <- combined_data |> 
  group_by(month, buffer) |> 
  summarize(sightings = n()) |> 
  filter(month %in% c("Jul", "Aug", "Sep", "Oct", "Nov"))
```

## Verify
- The result has one row per combination of the grouping variables, plus the new summary column(s).
- `head(province_tpm)` shows columns `year`, `province`, `sum_tpm`. [script R Skills Review.R:122]

## Pitfalls
- "Total number of whales" (sum of `individual_count`) is different from "number of sightings" (`n()`, rows). The practice set and the Topic 1 case study ask for both, so read the question. [page practice-1-north-atlantic-right-whale.md] [script Topic 1 - Case study.qmd:98-105]
- Forgetting `na.rm = TRUE` gives NA whenever any value in the group is missing.
- `summarize()` with two grouping variables prints a message about regrouping ("summarise() has grouped output by 'year'"). That is information, not an error. (general knowledge — not shown in course)
- **Bug in `sources/files/Topic 7.R` lines 85-86:** `buckthorn_summary_demographic` has no `group_by(section)`, so it returns a single overall row even though the prompt asks "for each section". The corrected version is `Combined R Scripts.R:451-453` / `R Skills Review.R:542-544`.
- **Bugs in the original Class 1 lesson `sources/files/Class 1/Topic 1.qmd`:**
  - Line 116 reuses the name `sum_tpm` for a **max** and overwrites `province_tpm`.
  - Line 125, `summarize(count = n(), na.rm = TRUE)) |>`, has an extra `)`, which is a syntax error, and `na.rm` doesn't belong in `n()`.
  - As a result, the lesson's plot (line 145) would chart the max values under the label "Total TPM".
  - Use the corrected version with separate objects (`province_tpm`, `province_tpm_max`, `province_tpm_count`) from `R Skills Review.R:95-113`.
- Both `summarize()` and `summarise()` spellings work. The course uses `summarize()`. (general knowledge)

## Related
- [sort-and-keep-top-n.md](sort-and-keep-top-n.md)
- [pivot-longer-and-wider.md](pivot-longer-and-wider.md)
- [plot-column-chart.md](plot-column-chart.md)
- [find-duplicates-and-keep-distinct.md](find-duplicates-and-keep-distinct.md) (count())
