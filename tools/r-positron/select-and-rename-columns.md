---
id: r-positron.select-and-rename-columns
tool: r-positron
title: Keep, drop and rename columns with select() and rename()
keywords: [select, rename, keep columns, drop columns, remove columns, column position, negative select, backticks, subset columns, reduce dataset, dplyr]
software_context: "Positron, R 4.6.1, dplyr 1.2.1 (tidyverse)"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_ReleasesRejets_1993-present.csv)", "sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Keep, drop and rename columns with select() and rename()

## Purpose
Reduce a wide dataset to the variables you need with `select()`, by name or by position. Give columns shorter or more descriptive names with `rename(new = old)`.

## Steps
1. Run `names(data)` to see the exact column names and their order. [script R Skills Review.R:225]
2. To keep columns by name, use `select(col1, col2, ...)`. [script R Skills Review.R:66-71]
3. To drop columns by position, use `select(-(first:last))`. [script R Skills Review.R:228]
4. To keep columns by position inside other verbs, use a number range, for example `cols = 4:5` in `pivot_longer`. [script R Skills Review.R:551]
5. To rename, use `rename(new_name = old_name, ...)`. New names with spaces need backticks. [script R Skills Review.R:74-76, 178-184]
6. Chain these steps with `|>` and assign the result to a new object, so the original stays intact.

## Formulas / expressions / code
Select, filter and rename NPRI total particulate matter (Topic 1) [script R Skills Review.R:66-76]:
```r
npri_tpm <- npri_releases |>
  select(npri_id_no_inrp,
         reporting_year_annee,
         substance_name_english_nom_de_substance_anglais,
         province,
         quantity_quantite) |>
  filter(reporting_year_annee >= 2015,
         substance_name_english_nom_de_substance_anglais == "Total particulate matter") |>
  rename(quantity = quantity_quantite,
    year = reporting_year_annee,
    substance = substance_name_english_nom_de_substance_anglais)
```
Rename temperature-bin columns to descriptive names with spaces (Topic 2) [script R Skills Review.R:177-184]:
```r
tag_data <- read_csv("data/108916_histos.csv") |>   
    rename(
    `Greater than 18 C` = Bin6, 
    `Between 15-18 C` = Bin5,
    `Between 12-15 C` = Bin4,
    `Between 9-12 C` = Bin3,
    `Less than 9 C` = Bin2
  )
```
Drop columns 21 to 38 by position (Bin7 to Bin24 in 108916_histos.csv) [script R Skills Review.R:227-228]:
```r
filtered_tag_data |> 
  select(-(21:38))   # This can be useful when there are extra columns we do not need for this activity
```
Keep only the columns needed for a pivot (Topic 5, Topic 7) [script R Skills Review.R:338, 550]:
```r
select(buckthorn_percent, bare_soil_percent, non_buckthorn_vegetation_percent)
select(section, quadrat_id, group_members, sapling_percent, adult_percent)
```
Whale practice R.1.2 [page practice-1-north-atlantic-right-whale.md]:
```r
whale_selected <- whale_data |>
  select(id, year, month_label, individual_count, institution_code) |>
  filter(year >= 2000)
```

## Verify
- `names(new_object)` lists only the kept or renamed columns.
- In the Variables pane, the column count drops (for example `npri_tpm` has 5 columns).

## Pitfalls
- `rename()` syntax is `new = old`. Reversing the two gives an error that the column doesn't exist. (general knowledge — not shown in course)
- Positional selection depends on column order. Check `names()` first; `-(21:38)` only makes sense for the 38-column histos file. [script R Skills Review.R:224-228]
- Names containing spaces or symbols must be written in backticks: `` `Temperature range` ``, `` `Percent time` ``. [page technical-skills-checklist.md]
- Topic 1 - Case study R Q2 asks you to keep only the columns found in the reduced OBIS CSV. Compare `names()` of the full and reduced files, then `select()` those names. [script Topic 1 - Case study.qmd:91]

## Related
- [filter-rows.md](filter-rows.md)
- [pivot-longer-and-wider.md](pivot-longer-and-wider.md)
- [inspect-a-dataset.md](inspect-a-dataset.md)
