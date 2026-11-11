---
id: r-positron.filter-rows
tool: r-positron
title: Filter rows with filter() using ==, !=, %in%, !, &, >= and missing-value checks
keywords: [filter, subset rows, condition, multiple conditions, equals, not equal, %in%, is one of, exclude, negate, and, complete.cases, is.na, remove NA, missing values, keep stations, top list]
software_context: "Positron, R 4.6.1, dplyr 1.2.1 (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "10:28-11:04"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", "sources/files/Class 1/NPRI data.zip", sources/files/PWQMN_data_2024.csv, sources/files/PWQMN_Stations.csv, sources/files/buckthorn_updated.csv]
---
# Filter rows with filter() using ==, !=, %in%, !, &, >= and missing-value checks

## Purpose
Keep only the rows that meet one or more conditions: one category, several categories, everything except some categories, numeric thresholds, combined conditions, non-missing values, or IDs listed in another dataset. Topic 2 calls this "Positron - Filtering data for multiple conditions".

## Steps
1. Check the exact category spellings first with `unique(data$column)`. [script R Skills Review.R:192-193]
2. Write `new <- data |> filter(condition)`. Use `==` for "is equal to" (two equals signs). [script R Skills Review.R:196-197]
3. For "does not equal", use `!=`. [script R Skills Review.R:201-202]
4. For "is one of these values", use `column %in% c("A", "B")`. [script R Skills Review.R:206-207]
5. For "is NOT one of these", put `!` in front: `!column %in% c(...)`. [script R Skills Review.R:210-211]
6. To combine conditions with AND, use `&`, or separate them with commas inside `filter()`. If you compare a column to a number, make sure it is numeric first. [script R Skills Review.R:215-217, 72-73]
7. To drop missing values, use `filter(complete.cases(column))` or `filter(!is.na(column))`. [script R Skills Review.R:98, 588]
8. To keep only IDs that appear in another (summary) table, use `filter(id %in% other_table$id)`. [script R Skills Review.R:597, 605]

## Formulas / expressions / code
Topic 2 tag histograms [script R Skills Review.R:192-217]:
```r
## The unique function shows the different values found in a column
unique(tag_data$HistType)

## Create a new dataset that keeps only rows where HistType is TAT
filtered_tag_data <- tag_data |> 
  filter(HistType == "TAT") # The double equals sign == means "is equal to"

## Exclude TAT data from the dataset
filtered_tag_data <- tag_data |> 
  filter(HistType != "TAT") # The exclamation mark means "does not equal"

## Include multiple histogram types
filtered_tag_data <- tag_data |> 
  filter(HistType %in% c("TAT", "TATLIMITS")) # %in% means "is one of these values"

## Remove multiple histogram types
filtered_tag_data <- tag_data |> 
  filter(!HistType %in% c("TAT", "TATLIMITS")) 
# The ! reverses the condition, so this keeps rows that are NOT in the list

## Combined filters
filtered_tag_data <- tag_data |>
   mutate(`Greater than 18 C` = as.numeric(`Greater than 18 C`)) |>    # Make sure this column is numeric before comparing it to a number
   filter(HistType == "TAT" & `Greater than 18 C` > 5)  # Keep rows where HistType is TAT AND percent time above 18 C is greater than 5
```
Numeric threshold plus exact text match (NPRI, Topic 1) [script R Skills Review.R:72-73]:
```r
filter(reporting_year_annee >= 2015,
       substance_name_english_nom_de_substance_anglais == "Total particulate matter")
```
Remove missing values [script R Skills Review.R:98, 583, 588]:
```r
filter(complete.cases(province)) ## removes any missing data from the province column.
filter(analyte == "Chloride")
filter(!is.na(results), !is.na(month))
```
Filter on a count, or on a list held in another table [script R Skills Review.R:411, 594, 597]:
```r
filter(n > 1)                     # after count(): keep duplicated stations
filter(months_recorded == 12)     # stations with all 12 months
filter(collection_site %in% monthly_data$collection_site)
```
Single value from a summary, and a month label [script R Skills Review.R:644-648]:
```r
station_data_302 <- selected_stations |>
  filter(collection_site == "6008200302")
january_data <- station_data_302 |>
  filter(month == "Jan")
```
Practice exam (ferry buffers) and whale practice [page exam-practice.md] [page practice-1-north-atlantic-right-whale.md]:
```r
filter(month %in% c("Jul", "Aug", "Sep", "Oct", "Nov"))
filter(institution_code %in% top_five_institutions$institution_code)
filter(year >= 2000)
```
Topic 7 filter-practice prompts (left blank in the script for students to complete): "Create one dataset that has section one and another that has section two"; "filter for just Buckstreet boys and Love islanders team data". [script Topic 7.R:12-17]

## Verify
- The row count in VARIABLES drops by the expected amount. `duplicate_stations` went from 2188 rows to 10 after `filter(n > 1)`. [frame r-row-binds-and-joins2 @10:42-11:12]
- `unique(new$column)` shows only the kept categories.

## Pitfalls
- `=` and `==` are different: inside `filter()` you must use `==`. [script R Skills Review.R:197]
- Text matches are exact and case-sensitive ("Total particulate matter", "Chloride", "TAT"). Check with `unique()` first.
- Comparing a text column to a number (`> 5`) gives wrong results. Convert with `as.numeric()` first (Bin6 holds text such as `>18.000000`). [script R Skills Review.R:216]
- When filtering on a month made with `month(..., label = TRUE)`, use the abbreviated label (`"Jan"`, `"Jul"`). [script R Skills Review.R:648]
- In the R practice exam, remove the species "Unknown" but keep names that merely contain "unknown" (for example "unknown duck"). Use an exact match such as `` `Species Common Name` != "Unknown" ``, not a pattern match. This is composed from course operators; the exam's solution isn't provided. [doc Practice Questions/ENVRSUST 9014 R Practice Exam.pdf]

## Related
- [select-and-rename-columns.md](select-and-rename-columns.md)
- [group-and-summarize.md](group-and-summarize.md)
- [sort-and-keep-top-n.md](sort-and-keep-top-n.md)
- [convert-column-types.md](convert-column-types.md)
