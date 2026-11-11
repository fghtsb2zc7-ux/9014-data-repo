---
id: r-positron.sort-and-keep-top-n
tool: r-positron
title: Sort rows with arrange() and keep the top N groups with head()
keywords: [arrange, sort, order, descending, ascending, minus sign, top five, top N, highest, ranking, head, top stations, top institutions, desc]
software_context: "Positron, R 4.5.0/4.6.1, dplyr 1.2.1 (tidyverse)"
prerequisites: [r-positron.group-and-summarize]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "06:53-08:06"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)", sources/files/PWQMN_data_2024.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Sort rows with arrange() and keep the top N groups with head()

## Purpose
`arrange()` sorts a data frame, like Sort in Excel. A minus sign in front of the column sorts largest first. Combined with `head(n)`, this gives a "top N" table (top 8 chloride stations, top 5 institutions), whose IDs can then filter the full data.

## Steps
1. Write `arrange(column)` to sort ascending (oldest or smallest at the top). [video r-row-binds-and-joins2 @07:31] [frame @07:32]
2. Write `arrange(-column)` to sort descending (newest or largest at the top). "This minus sign is what indicates that." [video r-row-binds-and-joins2 @07:16] [frame @07:52]
3. Arrange can be tacked onto the end of any pipe, for example after `bind_rows()`. [video r-row-binds-and-joins2 @08:06]
4. For a top-N table: `group_by()`, then `summarize()`, then `arrange(-value)`, then `head(N)`. [script R Skills Review.R:596-601]
5. Use that top-N table to filter the detailed data: `filter(id %in% top_table$id)`. [script R Skills Review.R:604-605]

## Formulas / expressions / code
Sort the combined 2000-2018 PWQMN data newest first [script Topic5.R:40-45; R Skills Review.R:388-392] [frame r-row-binds-and-joins2 @05:22]:
```r
## Stack the two datasets on top of one another
combined_data <- bind_rows(
  pwqmn_data_2000_2009,
  pwqmn_data_2010_2018
) |>
  arrange(-year)
```
Top 8 chloride stations, then keep only those stations [script R Skills Review.R:596-607]:
```r
high_output <- chloride_data |>
  filter(collection_site %in% monthly_data$collection_site) |>
  group_by(collection_site) |>
  summarize(mean_chloride = mean(results)) |>
  arrange(-mean_chloride) %>%
  head(8)

# Choose eight stations with a numeric mean in all 12 months.
selected_stations <- chloride_data |>
  filter(collection_site %in% high_output$collection_site) %>%
  group_by(collection_site, month) %>%
  summarize(mean_chloride = mean(results))
```
Top five institutions by whales seen (practice R.1.5) [page practice-1-north-atlantic-right-whale.md]:
```r
top_five_institutions <- whale_data |>
  group_by(institution_code)|>
  summarize(sum_whales = sum(individual_count, na.rm = TRUE)) |>
  arrange(-sum_whales) |>
  head(5)

institution_whales <- whale_data |>
  filter(institution_code %in% top_five_institutions$institution_code) |>
  group_by(institution_code, year) |>
  summarize(whale_count = sum(individual_count, na.rm = TRUE))
```

## Verify
- After `arrange(-year)` the first row of `combined_data` shows 2018. Before arranging it showed 2000. [video r-row-binds-and-joins2 @07:31] [frame @06:32]
- The top-N object has exactly N rows (`high_output` has 8).

## Pitfalls
- `-column` works only for numeric columns. For text, use `desc(column)`. (general knowledge — not shown in course)
- If the data is still grouped, `head()` can return N rows per group. The course pattern summarizes first, which removes the last grouping level, so `head(8)` returns 8 stations overall. (general knowledge)
- For a "top by number of sightings" question, rank by `n()`, not by summed individuals (Topic 1 case study Excel Q6 makes this distinction). [script Topic 1 - Case study.qmd:47]

## Related
- [group-and-summarize.md](group-and-summarize.md)
- [filter-rows.md](filter-rows.md)
- [plot-heatmap.md](plot-heatmap.md)
- [bind-rows.md](bind-rows.md)
