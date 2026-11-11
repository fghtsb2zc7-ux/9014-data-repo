---
id: r-positron.bind-rows
tool: r-positron
title: Stack datasets with identical columns using bind_rows()
keywords: [bind_rows, row bind, stack, append, combine years, union, concatenate, rbind, merge files, combine datasets, same columns, multiple years]
software_context: "Positron, R 4.5.0, dplyr (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names, r-positron.convert-column-types]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "03:07-08:06"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)", "Practice question buffer exports 1km_buffer.csv / 2km_buffer.csv (not in sources/files)"]
---
# Stack datasets with identical columns using bind_rows()

## Purpose
Put two or more datasets with the same columns on top of each other, typically data delivered in separate files by year or decade. The course example stacks PWQMN 2000-2009 and 2010-2018 into one 2000-2018 dataset, which makes temporal trends easier to analyse. "It's not doing anything fancy, it's literally just putting them on top of each other."

## Steps
1. Load each file with `read_csv() |> clean_names()` and convert the key columns to the same type in every file (`mutate(station = as.character(station))`). [video r-row-binds-and-joins2 @03:46] [script R Skills Review.R:376-382]
2. Open each dataset in the Data Explorer to check the year range (2010-2018 starts in 2010 and ends in 2018). [video r-row-binds-and-joins2 @04:22]
3. Run `names()` on each dataset and confirm the column names match exactly (12 identical names in the example). [video r-row-binds-and-joins2 @04:59-05:40] [frame @05:22-05:42]
4. Run `combined <- bind_rows(data_a, data_b)`. [video r-row-binds-and-joins2 @05:40-06:15]
5. Optionally pipe into `arrange(-year)` so the newest year is at the top (see [sort-and-keep-top-n.md](sort-and-keep-top-n.md)). [video r-row-binds-and-joins2 @06:53]
6. Check the row count: it should equal the sum of the inputs.

## Formulas / expressions / code
Topic 5 PWQMN [script Topic5.R:26-45; same in R Skills Review.R:374-392] [frame r-row-binds-and-joins2 @03:52-05:42]:
```r
## Row binds ##
## Row binds are useful when datasets contain the same variables
pwqmn_data_2010_2018 <- read_csv("PWQMN-2010_2018.csv") |>
  clean_names() |>
  mutate(station = as.character(station))

pwqmn_data_2000_2009 <- read_csv("PWQMN-2000_2009.csv") |>
  clean_names() |>
  mutate(station = as.character(station))

names(pwqmn_data_2010_2018)
names(pwqmn_data_2000_2009)

## Stack the two datasets on top of one another
combined_data <- bind_rows(
  pwqmn_data_2000_2009,
  pwqmn_data_2010_2018
) |>
  arrange(-year)
```
Practice exam: tag each file with a label column, then bind [page exam-practice.md]:
```r
data1 <- read_csv("1km_buffer.csv") |> 
  clean_names()|>
  mutate(buffer = "1 km")

data2 <- read_csv("2km_buffer.csv") |> 
  clean_names() |>
  mutate(buffer = "2 km")

combined_data <- bind_rows(data1, data2) |> 
  mutate(month = month(event_date_standard, label = TRUE))
```

## Verify
- In VARIABLES: `pwqmn_data_2000_2009 [972717 rows x 12 columns]` + `pwqmn_data_2010_2018 [948153 rows x 12 columns]` = `combined_data [1920870 rows x 12 columns]`. [frame r-row-binds-and-joins2 @06:32]
- `year` now runs from 2000 to 2018. [video r-row-binds-and-joins2 @06:15]

## Pitfalls
- The columns must have the same names. A column that exists in only one file becomes a separate column filled with NA for the other file's rows. (general knowledge — the course stresses "identical names and sort of identical columns") [video r-row-binds-and-joins2 @16:34]
- Matching columns must have the same type. `bind_rows` errors if `station` is character in one file and numeric in the other, which is why both are converted. (error behaviour is general knowledge) [script R Skills Review.R:378, 382]
- Without a label column (like `buffer`) you can't tell afterwards which file a row came from. The practice exam adds one with `mutate()` before binding. [page exam-practice.md]
- The decade files are about 100 MB each and the combined table has about 1.9 million rows, so expect slow loading and high memory use (the session showed roughly 2.5 GB). [frame r-row-binds-and-joins2 @06:32]
- `Topic 5.zip` also has `PWQMN_2010_2018_update5.csv` (same size as `PWQMN-2010_2018.csv`). The course script reads `PWQMN-2010_2018.csv`. (from the Topic 5.zip listing)

## Related
- [join-tables.md](join-tables.md)
- [sort-and-keep-top-n.md](sort-and-keep-top-n.md)
- [convert-column-types.md](convert-column-types.md)
- [inspect-a-dataset.md](inspect-a-dataset.md)
