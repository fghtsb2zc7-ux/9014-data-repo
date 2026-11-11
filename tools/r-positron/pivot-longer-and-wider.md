---
id: r-positron.pivot-longer-and-wider
tool: r-positron
title: Reshape data between wide and long format with pivot_longer() and pivot_wider()
keywords: [pivot_longer, pivot_wider, reshape, unpivot, pivot, wide to long, long to wide, tidy data, gather, spread, names_to, values_to, names_from, values_from, cover type, temperature range]
software_context: "Positron, R 4.6.1, tidyr 1.3.2 (tidyverse)"
prerequisites: [r-positron.select-and-rename-columns]
source_videos: []
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv]
---
# Reshape data between wide and long format with pivot_longer() and pivot_wider()

## Purpose
ggplot and `group_by()` work best with long data: one column naming the category and one holding the value. `pivot_longer()` stacks several measurement columns into name/value pairs, like Unpivot in Excel Power Query. `pivot_wider()` reverses it. Topic 2 lists this as "Positron - Pivoting data".

## Steps
1. Run `names(data)` to confirm the exact column names. [script R Skills Review.R:224-225]
2. Optionally drop unneeded columns first with `select()`. [script R Skills Review.R:228]
3. Call `pivot_longer(cols = <columns to stack>, names_to = "<new name column>", values_to = "<new value column>")`. `cols` can be a `c(...)` list of names (quoted or bare) or a position range like `4:5`. [script R Skills Review.R:229-239, 551]
4. To go back to wide, call `pivot_wider(names_from = "<name column>", values_from = "<value column>")`. [script R Skills Review.R:241-245]
5. Continue with `group_by()`/`summarize()` or plot the long data.

## Formulas / expressions / code
Topic 2 temperature-at-depth histogram bins, wide to long and back [script R Skills Review.R:224-245]:
```r
## Check the column names before selecting or pivoting
names(filtered_tag_data)

filtered_tag_data_long <- filtered_tag_data |> 
  select(-(21:38)) |>  # This can be useful when there are extra columns we do not need for this activity
  pivot_longer(
    cols = c(
      "Less than 9 C", 
      "Between 9-12 C",  
      "Between 12-15 C", 
      "Between 15-18 C", 
      "Greater than 18 C"
    ), 
    names_to = "Temperature range", 
    values_to = "Percent time"
  )  

filtered_tag_data_wide <- filtered_tag_data_long |> 
  pivot_wider(
    names_from = "Temperature range", 
    values_from = "Percent time"
  ) # Convert the data back from long format to wide format, This recreates one column for each temperature range
```
Buckthorn cover types (Topic 5 in-class) [script R Skills Review.R:337-341]:
```r
buckthorn_reduced <- buckthorn_data |> 
  select(buckthorn_percent, bare_soil_percent, non_buckthorn_vegetation_percent) |>
  pivot_longer(cols = c(buckthorn_percent, bare_soil_percent, non_buckthorn_vegetation_percent),
    names_to = "Cover type", 
    values_to = "Percent")
```
Buckthorn life stages, columns chosen by position (Topic 7) [script R Skills Review.R:549-552]:
```r
life_stages <- buckthorn_data |> 
  select(section, quadrat_id, group_members, sapling_percent, adult_percent) |> 
  pivot_longer(cols = 4:5, names_to = "life_stage", values_to = "percent") |>
  mutate(quadrat_id = as.character(quadrat_id)) 
```
Here `4:5` means the 4th and 5th columns of the selected data (`sapling_percent`, `adult_percent`).

## Verify
- The long table has (rows × number of stacked columns) rows and two new columns. With 5 bins, the long table has 5 times as many rows.
- The wide table recreated by `pivot_wider()` has one column per temperature range again.

## Pitfalls
- Values being stacked must share a type. In 108916_histos.csv `Bin6` (renamed `Greater than 18 C`) is text because of the `>18.000000` limits row. The course converts it with `as.numeric()` in the combined filter before pivoting. Without that step, `pivot_longer` fails with a type-combination error. (error behaviour is general knowledge) [script R Skills Review.R:216]
- New column names with spaces ("Temperature range", "Cover type") must be back-ticked later: `` group_by(`Temperature range`) ``. [script R Skills Review.R:263]
- `pivot_wider` needs the non-pivoted columns to identify rows uniquely. Otherwise it creates list-columns with a warning. (general knowledge — not shown in course)
- The R practice exam Q3 hint says to use back-ticks around year headers, for example `` `2013` ``. That implies pivoting years wide and then calculating with `` `2023` - `2013` ``. The exam's solution code isn't provided. [doc Practice Questions/ENVRSUST 9014 R Practice Exam.pdf]

## Related
- [select-and-rename-columns.md](select-and-rename-columns.md)
- [group-and-summarize.md](group-and-summarize.md)
- [plot-column-chart.md](plot-column-chart.md)
