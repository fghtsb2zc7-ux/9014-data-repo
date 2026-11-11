---
id: r-positron.join-tables
tool: r-positron
title: Join two tables with left_join(), semi_join() and anti_join() using join_by()
keywords: [join, left_join, semi_join, anti_join, join_by, merge, lookup, VLOOKUP, attach columns, key column, different column names, unmatched records, many-to-many warning, relationship, add station coordinates, quality check]
software_context: "Positron, R 4.5.0, dplyr (tidyverse 2.0.0)"
prerequisites: [r-positron.read-csv-and-clean-column-names, r-positron.convert-column-types, r-positron.find-duplicates-and-keep-distinct]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:43-03:07, 08:06-17:32"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md, course-pages/exam-practice.md]
datasets_used: [sources/files/PWQMN_data_2024.csv, sources/files/PWQMN_Stations.csv, "sources/files/Practice sets/Practice set #2/Information_stations.csv", "sources/files/Practice sets/Practice set #2/Nombre_crabe_crab_number.csv"]
---
# Join two tables with left_join(), semi_join() and anti_join() using join_by()

## Purpose
Attach columns from a lookup table to each row of a main table by a shared key, like Merge in Excel Power Query. The course example adds PWQMN station information (name, latitude, longitude, ...) to each 2024 water-quality measurement, matching `collection_site` to `station`.
- `left_join()` keeps every row of the main table, with NA where there is no match.
- `semi_join()` keeps only main-table rows that have a match, and adds no columns.
- `anti_join()` returns main-table rows with no match, which is useful as a quality check.

## Steps
1. Load both tables, clean names, and make the key columns the same type (character). [video r-row-binds-and-joins2 @00:43-02:31] [script R Skills Review.R:361-368]
2. Write the left join from the main (many) table: `main |> left_join(lookup, by = join_by(main_key == lookup_key))`. If the key names differ you must name both, using a **double** equals sign. [video r-row-binds-and-joins2 @08:06-08:44] [frame @08:52]
3. Run it. If you see the red warning "Detected an unexpected many-to-many relationship between `x` and `y`", the lookup table has duplicate keys. [video r-row-binds-and-joins2 @09:18] [frame @09:22]
4. Find and remove the duplicate keys (`count()`/`filter(n > 1)`, then `distinct(station, .keep_all = TRUE)`). See [find-duplicates-and-keep-distinct.md](find-duplicates-and-keep-distinct.md). [video r-row-binds-and-joins2 @09:52-12:13]
5. Re-run the left join with the de-duplicated table (`unique_stations`). There is no warning this time. [video r-row-binds-and-joins2 @12:13-12:52] [frame @13:02]
6. Compare `nrow()` and `ncol()` before and after. A many-to-one join keeps the row count and adds the lookup's non-key columns. [script R Skills Review.R:424-429] [frame @13:52]
7. Open the joined table in the Data Explorer and check the missing % of the new columns. [video r-row-binds-and-joins2 @12:52-13:31] [frame @13:32]
8. Keep only matched rows with `semi_join()` (same syntax). [video r-row-binds-and-joins2 @13:31-14:42] [frame @14:42]
9. List unmatched rows with `anti_join()` (same syntax), then `distinct(key)` to get the unmatched IDs for follow-up ("save this to an object, maybe save it to a CSV, go back..."). [video r-row-binds-and-joins2 @15:18-16:34] [frame @15:32-16:32]

## Formulas / expressions / code
[script Topic5.R:47-115 (the script used in the video); same code in R Skills Review.R:394-453] [frame r-row-binds-and-joins2 @08:22-16:02]. Lightly edited: the trailing comma and `## here you can specify what the matching columns are` comment after both `join_by()` lines (Topic5.R:59, 78) are removed, and the `duplicate_stations` block (lines 62-70) is replaced by a one-line comment:
```r
## LEFT JOIN
## The join below adds station information to each water-quality measurement.
## Many water-quality measurements can come from the same station, but each measurement should match only one station ("many-to-one")
pwqmn_data_2024_joined <- pwqmn_data_2024 |>
  left_join(
    pwqmn_stations,
    by = join_by(collection_site == station)
  )

## (warning -> find duplicates, build unique_stations; see find-duplicates-and-keep-distinct.md)
unique_stations <- pwqmn_stations |>
  distinct(station, .keep_all = TRUE)

pwqmn_data_2024_joined <- pwqmn_data_2024 |>
  left_join(
    unique_stations,
    by = join_by(collection_site == station)
  )

## Compare the number of rows before and after the join.
## A many-to-one join should not increase the number of water-quality records.
nrow(pwqmn_data_2024)
nrow(pwqmn_data_2024_joined)
ncol(pwqmn_data_2024)
ncol(pwqmn_data_2024_joined)

## SEMI JOIN
## Keep only water-quality measurements that HAVE a matching station.
## semi_join() is useful for filtering one dataset based on whether
## a matching record exists in another dataset.
pwqmn_data_2024_matched <- pwqmn_data_2024 |>
  semi_join(
    unique_stations,
    by = join_by(collection_site == station)
  )

nrow(pwqmn_data_2024)
nrow(pwqmn_data_2024_matched)

## ANTI JOIN
pwqmn_data_2024_missing <- pwqmn_data_2024 |>
  anti_join(
    unique_stations,
    by = join_by(collection_site == station)
  )

## Examine records without a matching station
pwqmn_data_2024_missing |>
  distinct(collection_site)
```
- `join_by(collection_site == station)` means the main table's `collection_site` matches the lookup's `station`.
- When the key has the **same name** in both tables you can omit `by`, and dplyr joins on all common columns. The exam-practice page shows this for the crab practice set: [page exam-practice.md]
```r
pwqmn_data_2024_joined  <- pwqmn_data_2024 |>
       left_join(unique_stations)
```

## Verify
Values seen in the video:
| Object | Rows x columns |
|---|---|
| pwqmn_data_2024 | 112392 x 15 |
| first join with duplicated stations | 112558 x 24 (rows increased, with warning) |
| pwqmn_data_2024_joined (with unique_stations) | 112392 x 24 |
| pwqmn_data_2024_matched (semi_join) | 51351 x 15 |
| pwqmn_data_2024_missing (anti_join) | 61041 x 15 |
- matched + missing = original (51351 + 61041 = 112392).
- The Data Explorer showed the station columns (name, latitude, ...) 54% missing in the joined table. That is the 61,041 unmatched measurements. [frame @13:32]

## Pitfalls
- **Many-to-many warning**: "Row 40 of `x` matches multiple rows in `y`. Row 1200 of `y` matches multiple rows in `x`." This means duplicate keys in the lookup, and the joined table gains rows (112392 became 112558). De-duplicate the lookup rather than setting `relationship = "many-to-many"`. [frame @09:22]
- **Single `=` in `join_by()`** is wrong. Use `==`. [video r-row-binds-and-joins2 @08:44]
- **Key type mismatch**: convert both keys with `as.character()` first. A character-vs-numeric join errors. (error behaviour is general knowledge) [script R Skills Review.R:363, 368]
- **Many unmatched rows, possibly from leading zeros.** In the video, unmatched `collection_site` values are 10-digit (`8012305202`, `8012304802`, ...), while `pwqmn_stations$station` values display as 11 characters with a leading `0` (`03007703502`, `03005300102`). The instructor attributes the 61,000 unmatched measurements to an incomplete stations file. A likely cause is that `PWQMN_data_2024.csv` stores Collection Site as a number (dbl), so the leading zero is lost before `as.character()`. If so, padding the ID, for example `stringr::str_pad(collection_site, 11, pad = "0")`, would recover matches. (general knowledge — not shown in course; verify with `anti_join` counts) [frame @14:22, @17:22] Supporting evidence: the Excel version of the same merge, with both keys typed as whole numbers, matches 112,126 of 112,392 rows [frame excel-merging-data @02:32]; see [../../datasets/pwqmn.md](../../datasets/pwqmn.md).
- `Topic5.R` (lines 59 and 78) leaves a trailing comma after the `by = join_by(...)` argument (`by = join_by(collection_site == station), ## here you can specify ...` followed by `)`). It ran without error in the video, but you can delete the comma safely. [script Topic5.R:59, 78] [frame @13:02]
- In the joined table, columns that exist in both tables under the same name get `.x`/`.y` suffixes. (general knowledge)

## Related
- [find-duplicates-and-keep-distinct.md](find-duplicates-and-keep-distinct.md)
- [bind-rows.md](bind-rows.md)
- [view-data-in-data-explorer.md](view-data-in-data-explorer.md)
- [convert-column-types.md](convert-column-types.md)
- [practice-exam-r-workflows.md](practice-exam-r-workflows.md)
