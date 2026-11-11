---
id: r-positron.plot-column-chart
tool: r-positron
title: Make column (bar) charts with ggplot2 geom_col(), including stacked and flipped bars
keywords: [ggplot, geom_col, bar chart, column chart, stacked bar, fill, coord_flip, horizontal bars, colour columns, aes, summary plot, grouped bars]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3 (tidyverse)"
prerequisites: [r-positron.group-and-summarize]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Make column (bar) charts with ggplot2 geom_col(), including stacked and flipped bars

## Purpose
Plot one summarized value per category as columns. `geom_col()` uses the y value as given, so summarize first. Map a second category to `fill` to get stacked columns, use `coord_flip()` for horizontal bars, and set a fixed colour outside `aes()`.

## Steps
1. Make a summary table with one row per bar, or per bar segment (see [group-and-summarize.md](group-and-summarize.md)).
2. Start the plot: `ggplot(data = summary, aes(x = category, y = value))`. [script R Skills Review.R:272]
3. Add `+ geom_col()`. [script R Skills Review.R:273]
4. For stacked bars, add `fill = second_category` inside `aes()`. [script R Skills Review.R:559-560]
5. For one fixed colour, put it outside `aes()`: `geom_col(fill = "blue")`. Outlines use `colour = "black"`. [page practice-1-north-atlantic-right-whale.md] [page exam-practice.md]
6. For horizontal bars, add `+ coord_flip()`. [script R Skills Review.R:275]
7. Add labels and a theme (see [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)). Order the bars if needed (see [order-categories-with-factor-and-reorder.md](order-categories-with-factor-and-reorder.md)).
8. Save with `ggsave()` (see [save-plot-png-and-csv.md](save-plot-png-and-csv.md)).

## Formulas / expressions / code
Basic flipped columns (Topic 2) [script R Skills Review.R:271-275]:
```r
## Create a basic plot
ggplot(data = grouped_tag_data, aes(x = `Temperature range`, y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip()
```
Columns sorted descending (Topic 5 buckthorn cover types) [script R Skills Review.R:347-349]:
```r
ggplot(data = summarized_data, aes(x = reorder(`Cover type`, -average), y = average))+
  geom_col()+
  labs(x = "Cover type", y = "Average cover (%)")
```
Stacked columns: sapling vs adult cover by quadrat (Topic 7) [script R Skills Review.R:558-563]:
```r
## Create a stacked column plot of sapling and adult cover by quadrat.
ggplot(life_stages_grouped, aes(x = quadrat_id, y = mean_value, group = life_stage, fill = life_stage))+
  geom_col()+
 # facet_wrap(~name)+
  labs(x = "Quadrat ID", y = "Percent cover")+
  labs(fill = "Life stage")
```
Fixed fill colour (whale practice R.1.3) [page practice-1-north-atlantic-right-whale.md]:
```r
ggplot(data = month_whales, aes(x = month_label, y = whale_count))+
  geom_col(fill = "blue") +
  labs(x = "Month", y = "Number of whales")
```
Stacked by class (whale practice R.1.6) and with outlines (ferry practice exam) [page practice-1-north-atlantic-right-whale.md] [page exam-practice.md]:
```r
ggplot(whale_data_month, aes(x = month_label, y = sightings_count, fill = group_size)) +
  geom_col() +
  labs(x = "Month", y = "Number of sightings", fill = "Group size") + theme_bw()

ggplot(count_data, aes(x = month, y= sightings, fill = buffer)) +
  geom_col(colour = "black")+
  labs(x = "Month", y = "Sightings", fill = "Distance from ferry route", title = "Sightings within 1 km and 2 km of the ferry", subtitle = "OBIS data from 1900-2024")+
  theme_bw()+
  theme(legend.position = "bottom")
```
Faceted columns, one panel per institution (whale practice R.1.5) [page practice-1-north-atlantic-right-whale.md]:
```r
ggplot(institution_whales,
       aes(x = year, y = whale_count, fill = institution_code)) +
  geom_col() + 
  facet_wrap(~institution_code)+
  labs(x = "Year", y = "Number of whales", fill = "Institution") +
  theme_bw()
```

## Verify
- The Plots pane shows one bar per category, with heights matching the summary table.
- Stacked bars show a legend titled by `labs(fill = ...)`.

## Pitfalls
- Use `geom_col()` for pre-summarized values. A numeric x such as `quadrat_id` should be converted to character first so it plots as discrete bars. [script R Skills Review.R:552]
- Colour inside vs outside `aes()`: `aes(fill = section)` maps a variable and creates a legend; `geom_col(fill = "blue")` sets one colour. [page technical-skills-checklist.md]
- With `coord_flip()`, `labs(y = ...)` still labels the value axis, which is now horizontal. [script R Skills Review.R:303]

## Related
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
- [order-categories-with-factor-and-reorder.md](order-categories-with-factor-and-reorder.md)
- [plot-histogram-and-boxplot.md](plot-histogram-and-boxplot.md)
- [save-plot-png-and-csv.md](save-plot-png-and-csv.md)
