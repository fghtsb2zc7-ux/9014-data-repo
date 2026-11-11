---
id: r-positron.order-categories-with-factor-and-reorder
tool: r-positron
title: Control category order with factor(levels = ) and reorder()
keywords: [factor, levels, order categories, reorder, sort bars, category order, axis order, factor manipulation, forcats, descending bars, ordered factor]
software_context: "Positron, R 4.6.1, base R factor()/reorder() with ggplot2 4.0.3"
prerequisites: [r-positron.group-and-summarize]
source_videos: []
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 2/Class 2.zip (data/108916_histos.csv)", sources/files/buckthorn_updated.csv]
---
# Control category order with factor(levels = ) and reorder()

## Purpose
By default ggplot orders text categories alphabetically. Use `factor(x, levels = c(...))` for a logical fixed order (for example temperature bins from cold to warm). Use `reorder(x, value)` to sort categories by a summary value, ascending, or descending with `-value`. Topic 2 lists this as "Positron - Factor manipulation".

## Steps
1. Summarize first so there is one value per category (see [group-and-summarize.md](group-and-summarize.md)).
2. For a fixed order, `mutate()` the column into a factor with `levels` in the order you want. [script R Skills Review.R:280-295]
3. For an order by value, wrap the x variable in `reorder()` inside `aes()`. [script R Skills Review.R:307]
4. For descending order, use a minus sign on the value: `reorder(x, -value)`. [script R Skills Review.R:347]
5. Re-plot to check the order.

## Formulas / expressions / code
Fixed order with factor levels (Topic 2) [script R Skills Review.R:278-304]:
```r
grouped_tag_data <- grouped_tag_data |> 
  # Set Temperature range factor levels in temperature order
  # This controls the order of categories in tables and plots
  mutate(
    `Temperature range` = factor(
      `Temperature range`,
      levels = c(
        "Less than 9 C",
        "Between 9-12 C",
        "Between 12-15 C",
        "Between 15-18 C",
        "Greater than 18 C"
      )
    )
  )

## Plot again after setting the factor order
ggplot(data = grouped_tag_data, aes(x = `Temperature range`, y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip() +
  labs(y = "Percent of time")+
  theme_bw()
```
Order by value, ascending (Topic 2) [script R Skills Review.R:306-312]:
```r
## Plot by percent of time 
ggplot(data = grouped_tag_data, aes(x = reorder(`Temperature range`, average_time), y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip() +
  labs(y = "Percent of time")+
  theme_bw()
```
Order by value, descending (Topic 5 buckthorn) [script R Skills Review.R:347-349]:
```r
ggplot(data = summarized_data, aes(x = reorder(`Cover type`, -average), y = average))+
  geom_col()+
  labs(x = "Cover type", y = "Average cover (%)")
```

## Verify
- Bars or axis categories appear in the requested order. With `coord_flip()`, the first level is drawn at the bottom.
- `levels(data$col)` lists the order. (general knowledge — not shown in course)

## Pitfalls
- A level spelled differently from the data (for example a missing space) turns those values into NA. Copy the strings exactly. (general knowledge)
- When you use `reorder()`, the axis title becomes the expression `reorder(...)`. Set a clean title with `labs(x = "...")`. [script R Skills Review.R:349]
- `month(..., label = TRUE)` already returns an ordered factor (Jan to Dec), so no reordering is needed for months. (general knowledge)

## Related
- [plot-column-chart.md](plot-column-chart.md)
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
