---
id: r-positron.convert-column-types
tool: r-positron
title: Convert column data types (as.numeric, as.character) and replace text codes with NA
keywords: [data types, convert type, as.numeric, as.character, character, numeric, text to number, ID as text, below detection limit, less than values, NA, results column, chr, dbl, type mismatch]
software_context: "Positron, R 4.6.1, dplyr 1.2.1 (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "01:53-03:07, 03:46-04:22"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/topic-2-transforming-and-wrangling-data.md]
datasets_used: [sources/files/PWQMN_data_2024.csv, sources/files/PWQMN_Stations.csv, "sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)", "sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv]
---
# Convert column data types (as.numeric, as.character) and replace text codes with NA

## Purpose
Fix columns that `read_csv()` typed wrongly. ID codes such as stations or quadrats should be text, so they act as labels and join keys. Measurement columns stored as text, such as PWQMN `results` with `<2` and `<1.5`, or histogram Bin6 with `>18.000000`, must become numeric before you compare or average them. Topic 2 lists this as "Positron - Data types".

## Steps
1. Find the current type with `glimpse()` or in the Data Explorer (`str` vs `dbl`). [frame r-row-binds-and-joins2 @02:52]
2. To make an ID text, use `mutate(id = as.character(id))`. The instructor explains that "the number isn't important, it's an ID tag". [video r-row-binds-and-joins2 @01:53]
3. Convert the key columns in **both** tables before joining or binding them (`station` in stations and in the 2000-2018 files; `collection_site` in the 2024 data). [video r-row-binds-and-joins2 @03:46]
4. To make a text column numeric, first replace non-numeric codes with `NA` using `ifelse()`, then apply `as.numeric()`. [script R Skills Review.R:584-587]
5. Drop the resulting `NA`s if needed with `filter(!is.na(column))`. [script R Skills Review.R:588]

## Formulas / expressions / code
IDs to text (Topic 5) [script Topic5.R:11-35; R Skills Review.R:361-382]:
```r
pwqmn_stations <- read_csv("PWQMN_Stations.csv") |>
  clean_names() |>
  mutate(station = as.character(station)) ## Station IDs

pwqmn_data_2024 <- read_csv("PWQMN_data_2024.csv") |>
  clean_names() |>
  mutate(collection_site = as.character(collection_site))

pwqmn_data_2010_2018 <- read_csv("PWQMN-2010_2018.csv") |>
  clean_names() |>
  mutate(station = as.character(station))
```
Quadrat number to text, so it plots as discrete bars (Topic 7) [script R Skills Review.R:552]:
```r
mutate(quadrat_id = as.character(quadrat_id))
```
Text to number (Topic 2) [script R Skills Review.R:216]:
```r
mutate(`Greater than 18 C` = as.numeric(`Greater than 18 C`))
```
Below-detection-limit code to NA, then numeric (PWQMN chloride, final lesson) [script R Skills Review.R:582-588]:
```r
chloride_data <- pwqmn_data |>
  filter(analyte == "Chloride") |>
  mutate(results = ifelse(results == "<1.5", NA, results),
         month = month(mdy(collected), label = TRUE),
         collection_site = as.character(collection_site)) |>
  mutate(results = as.numeric(results)) |>
  filter(!is.na(results), !is.na(month))
```

## Verify
- `glimpse()` shows `<chr>` for IDs and `<dbl>` for measurements.
- The Data Explorer header shows `str` under `station` and `collection_site`. [frame r-row-binds-and-joins2 @10:42, @14:22]
- After `as.numeric()`, `mean(results)` returns a number instead of an error.

## Pitfalls
- `as.numeric()` on text like `<2` gives `NA` with a warning ("NAs introduced by coercion"). The course replaces the known code (`"<1.5"`) first. Other analytes have different limits (`<1`, `<2`, `<5`), so check `unique(results)`. (warning text is general knowledge — not shown in course) [script R Skills Review.R:584]
- PWQMN `results` mixes numbers and "less than" values. The instructor flags this as something to deal with later. [video r-row-binds-and-joins2 @02:31-03:07]
- Converting a numeric ID to text drops any leading zeros the original file had. In the joins video, 2024 collection sites print as 10-digit text (`8012305202`) while station IDs print as 11 characters with a leading zero (`03007703502`), and those sites fail to match (see [join-tables.md](join-tables.md)). [frame r-row-binds-and-joins2 @14:22, @17:22]
- The `bind_rows()` inputs must have the same type in matching columns, which is why `station` is converted in both decade files. [script R Skills Review.R:376-382]

## Related
- [create-columns-with-mutate.md](create-columns-with-mutate.md)
- [classify-with-ifelse.md](classify-with-ifelse.md)
- [join-tables.md](join-tables.md)
- [bind-rows.md](bind-rows.md)
