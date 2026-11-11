---
id: r-positron.inspect-a-dataset
tool: r-positron
title: Inspect a dataset with glimpse(), names(), head(), unique(), nrow() and ncol()
keywords: [inspect, explore, glimpse, names, head, unique, distinct values, nrow, ncol, dimensions, column names, data types, structure, $ operator, quality check]
software_context: "Positron, R 4.6.1, dplyr/tibble (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "04:59-05:40, 13:31-14:08"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip", "sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/PWQMN_data_2024.csv, "sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)", sources/files/buckthorn_updated.csv]
---
# Inspect a dataset with glimpse(), names(), head(), unique(), nrow() and ncol()

## Purpose
Check what you loaded before transforming it: column names, data types, example values, the distinct categories in a column, and the number of rows and columns. These checks are also used to confirm that two datasets can be row-bound, or that a join didn't add rows.

## Steps
1. Run `glimpse(object)` to see every column with its type (`<chr>`, `<dbl>`, ...) and its first values. [script R Skills Review.R:52]
2. Run `names(object)` to list the column names, which you need before `select()` or `pivot_longer()`. [script R Skills Review.R:57, 225]
3. Run `head(object)` to see the first six rows. [script R Skills Review.R:88]
4. Run `unique(object$column)` to see which categories exist in one column. `$` picks a single column out of the data frame. [script R Skills Review.R:193, 579]
5. Run `nrow(object)` and `ncol(object)` to count rows and columns, for example before and after a join. [script R Skills Review.R:426-429]
6. Alternatively, open the object in the Data Explorer (see [view-data-in-data-explorer.md](view-data-in-data-explorer.md)).

## Formulas / expressions / code
```r
glimpse(npri_releases)          # column names, types, example values   [R Skills Review.R:52]
names(npri_releases)            # all column names                       [R Skills Review.R:57]
head(npri_tpm)                  # first six rows by default              [R Skills Review.R:88]
unique(tag_data$HistType)       # distinct values in one column          [R Skills Review.R:193]
unique(pwqmn_data$collection_site)                                       # [R Skills Review.R:579]

# Compare structure of two datasets before bind_rows()                   [R Skills Review.R:384-385]
names(pwqmn_data_2010_2018)
names(pwqmn_data_2000_2009)

# Compare size before/after a join                                       [R Skills Review.R:426-429]
nrow(pwqmn_data_2024)
nrow(pwqmn_data_2024_joined)
ncol(pwqmn_data_2024)
ncol(pwqmn_data_2024_joined)
```

## Verify
- `names(pwqmn_data_2010_2018)` printed `"station" "parm" "parm_description" "year" "date_yyyymmdd" "time_hh_mm" "field_no" "remark_code" "result" "valuqualifi" "units" "analmethod"` (12 names), identical for 2000-2009. [frame r-row-binds-and-joins2 @05:22-05:42]
- `nrow`/`ncol` around the left join printed `112392`, `112392`, `15`, `24`. [frame r-row-binds-and-joins2 @13:52]
- `unique(tag_data$HistType)` returns the histogram types; the dataset schema lists TATLIMITS, TAT, TADLIMITS and TAD. [_raw Class 2__Class 2.zip.contents.md]

## Pitfalls
- The original `Class 1/Topic 1.qmd` (line 95) says head shows "the first 10 rows be default". That is wrong for `head()`, which shows 6. Ten rows is what a printed tibble shows. The later scripts correct it to "first six rows by default". [script Class 1/Topic 1.qmd:95] [script R Skills Review.R:86]
- `head()` shows 6 rows by default. `head(n)` keeps the first n rows; inside a pipe, `head(8)` keeps 8 (see [sort-and-keep-top-n.md](sort-and-keep-top-n.md)). [script R Skills Review.R:601]
- Practice set R.1.1 also asks you to inspect missing values. The course hint uses `glimpse()`; the Data Explorer's missing-% column shows missing values directly. [page practice-1-north-atlantic-right-whale.md]
- Printing a large tibble shows only 10 rows followed by "# ℹ 219 more rows". Use `print(n = ...)` as the console suggests. [frame r-row-binds-and-joins2 @16:32]

## Related
- [view-data-in-data-explorer.md](view-data-in-data-explorer.md)
- [read-csv-and-clean-column-names.md](read-csv-and-clean-column-names.md)
- [filter-rows.md](filter-rows.md)
