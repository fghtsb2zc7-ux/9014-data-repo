---
id: r-positron.create-columns-with-mutate
tool: r-positron
title: Create or modify columns with mutate() (calculations, constants, substrings)
keywords: [mutate, new column, calculated column, formula, add column, modify column, constant label, substring, NAICS code, $ assignment, total cover, sum columns, formulas and functions]
software_context: "Positron, R 4.6.1, dplyr 1.2.1 (tidyverse); base R substring()"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/lesson-3-overview.md, course-pages/technical-skills-checklist.md, course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/exam-practice.md, course-pages/npri-group-assignment-updated.md]
datasets_used: [sources/files/buckthorn_updated.csv, "sources/files/Class 2/Class 2.zip (data/108916_tag.csv)", sources/files/PWQMN_data_2024.csv, "sources/files/Class 1/NPRI data.zip", "Practice question data (1km_buffer.csv, 2km_buffer.csv — exported from QGIS, not in sources/files)"]
---
# Create or modify columns with mutate() (calculations, constants, substrings)

## Purpose
Use `mutate(new_column = expression)` to add a column or overwrite one. The expression can be a calculation from other columns, a type conversion, a date part, a classification (`ifelse`), or a constant label used to tag a dataset before binding. Topic 3 lists "Positron - Formulas and functions". The NPRI assignment starter shows the base-R `$` form for extracting the first 4 digits of a NAICS code.

## Steps
1. Start a pipe from the data: `data |> mutate(...)`. [script R Skills Review.R:163]
2. Inside `mutate()`, write `new_name = expression`. Separate several new columns with commas, or chain several `mutate()` calls. [script R Skills Review.R:584-586]
3. Reuse the same name to overwrite a column (for example `results = as.numeric(results)`). [script R Skills Review.R:587]
4. To tag every row with a constant (for example which buffer file it came from), use `mutate(buffer = "1 km")`. [page exam-practice.md]
5. Assign the result back to an object.

## Formulas / expressions / code
Several mutate patterns from the course:
```r
# Date-time and month columns (Topic 2)                         [R Skills Review.R:162-164]
location_data <- read_csv("data/108916_tag.csv") |> 
    mutate(date_time = ymd_hm(Date)) |>
    mutate(month = month(date_time, label = TRUE))

# Classification columns (Topic 7)                               [R Skills Review.R:462-465]
buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names() |>
  mutate(buckthorn_present = ifelse(buckthorn_percent > 0, "Yes", "No")) |>
  mutate(reproduction_present = ifelse(reproducing_buckthorn == TRUE, 1, 0))

# Several columns in one mutate (final lesson)                   [R Skills Review.R:584-586]
mutate(results = ifelse(results == "<1.5", NA, results),
       month = month(mdy(collected), label = TRUE),
       collection_site = as.character(collection_site))
```
Arithmetic column (written in the Topic 7 script, but sitting inside a comment, so it never runs) [script Topic 7.R:8]:
```r
mutate(total_cover = buckthorn_percent + bare_soil_percent + non_buckthorn_vegetation_percent)
## Create a column that sums the buckthorn, bare soil and vegetation percentage
```
Constant labels before `bind_rows()` (practice exam answer) [page exam-practice.md]:
```r
data1 <- read_csv("1km_buffer.csv") |> 
  clean_names()|>
  mutate(buffer = "1 km")

data2 <- read_csv("2km_buffer.csv") |> 
  clean_names() |>
  mutate(buffer = "2 km")
```
Base-R new column from the first 4 characters of a code (NPRI assignment) [page npri-group-assignment-updated.md]:
```r
npri_data$split <- substring(npri_data$`NAICS / Code_SCIAN`,1, 4)
```
- `data$new <- value` creates a column without dplyr.
- `substring(x, 1, 4)` returns characters 1 to 4, for example a 4-digit NAICS group such as 2121 or 2211 used to pick assignment sectors.

## Verify
- `glimpse(data)` lists the new column at the end, with the expected type.
- Spot-check a few rows in the Data Explorer.

## Pitfalls
- In `Topic 7.R` the `total_cover` mutate is commented out (it follows a `#` on line 8), so `total_cover` does not exist after running the script. To use it, move it onto its own line and add it to the pipe. [script Topic 7.R:8]
- Calculations need numeric columns. Convert text first (see [convert-column-types.md](convert-column-types.md)).
- Topic 3's "Deterministic modelling" in R has no script in the course materials. Lesson 3 objectives mention calculations such as catch per unit effort and population estimates, which would be `mutate()` arithmetic, but no course R code exists for them. [page lesson-3-overview.md]

## Related
- [classify-with-ifelse.md](classify-with-ifelse.md)
- [convert-column-types.md](convert-column-types.md)
- [parse-dates-and-extract-month.md](parse-dates-and-extract-month.md)
- [bind-rows.md](bind-rows.md)
