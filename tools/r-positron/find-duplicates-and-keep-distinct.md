---
id: r-positron.find-duplicates-and-keep-distinct
tool: r-positron
title: Find duplicate keys with count() and remove them with distinct()
keywords: [duplicates, duplicate rows, count, n, distinct, unique rows, .keep_all, deduplicate, remove duplicates, many-to-many, quality check, unique stations]
software_context: "Positron, R 4.5.0, dplyr (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "09:18-12:52, 15:57-16:34"}]
source_pages: [course-pages/technical-skills-checklist.md]
datasets_used: [sources/files/PWQMN_Stations.csv, sources/files/PWQMN_data_2024.csv]
---
# Find duplicate keys with count() and remove them with distinct()

## Purpose
A lookup table, such as station locations, should have one row per key. `count(key) |> filter(n > 1)` lists keys that appear more than once. `distinct(key, .keep_all = TRUE)` keeps the first row for each key, with all its columns. In the course this fixes the many-to-many warning from `left_join()`, and `distinct(col)` lists the unique unmatched IDs after an anti-join.

## Steps
1. Count how often each key occurs: `data |> count(station)`. This adds a column `n`; every value should be 1. [video r-row-binds-and-joins2 @09:52-10:28] [frame @10:42]
2. Keep only duplicated keys: add `|> filter(n > 1)`. [video r-row-binds-and-joins2 @10:28-11:04] [frame @11:12]
3. Inspect the result. The course found 10 stations listed twice. [frame @11:12]
4. Create a de-duplicated table: `data |> distinct(station, .keep_all = TRUE)`. Without `.keep_all = TRUE`, only the `station` column would be kept. [video r-row-binds-and-joins2 @11:39] [frame @11:42]
5. Confirm the row count dropped by the number of extra copies (2198 to 2188). [video r-row-binds-and-joins2 @12:13]
6. Use the de-duplicated table in joins (see [join-tables.md](join-tables.md)).

## Formulas / expressions / code
[script Topic5.R:62-73; R Skills Review.R:407-416] [frame r-row-binds-and-joins2 @09:52, @11:42]:
```r
## The warning you receive from the code above indicates that there may be duplicate entries of the stations
# Below, we can identify stations in the dataset that are appearing more than once
duplicate_stations <- pwqmn_stations |>
  count(station) |> # this line counts how many times a station is listed in the dataset
  filter(n > 1)  # this filters for cases when a station is listed more than once

# It looks like there are 10 stations that occur more than once
# To get rid of those extra stations, we can use the distinct function
unique_stations <- pwqmn_stations |>
  distinct(station, .keep_all = TRUE) # distinct keeps only the unique stations and the keep all means we keep the rest of the row
```
List the distinct values of one column (unmatched sites after an anti-join) [script Topic5.R:113-115; R Skills Review.R:451-453]:
```r
## Examine records without a matching station
pwqmn_data_2024_missing |>
  distinct(collection_site)
```

## Verify
- `duplicate_stations` before the filter: "2,188 rows 2 columns", all `n` = 1 on the first rows. After the filter: "10 rows 2 columns", each `n` = 2 (for example `03005300102`, `03005700702`, `16012401302`). [frame r-row-binds-and-joins2 @10:42, @11:12]
- `unique_stations [2188 rows x 10 columns]` vs `pwqmn_stations [2198 rows x 10 columns]`. [frame @12:32]
- `distinct(collection_site)` on the missing data printed 229 site IDs (10 shown, "# ℹ 219 more rows"). [frame @16:32]

## Pitfalls
- `distinct(key, .keep_all = TRUE)` keeps the **first** row for each key and silently drops the others, even if they hold different coordinates. The instructor notes the duplicated stations' information "is potentially duplicated". Check the duplicates before discarding them. [video r-row-binds-and-joins2 @11:04]
- `count()` names its count column `n`, so filter on `n`. The instructor says it "works very similarly to our `n()` function". [video r-row-binds-and-joins2 @10:28]
- `distinct()` works like base `unique()` but on data-frame columns. [video r-row-binds-and-joins2 @11:39]

## Related
- [join-tables.md](join-tables.md)
- [group-and-summarize.md](group-and-summarize.md)
- [inspect-a-dataset.md](inspect-a-dataset.md)
