---
id: r-positron.plot-heatmap
tool: r-positron
title: Make a heatmap with geom_tile() and label the tiles with geom_text()
keywords: [heatmap, heat map, geom_tile, geom_text, tile, matrix plot, month by station, labels on tiles, round, scale_fill_gradient, chloride heatmap, colour scale]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3"
prerequisites: [r-positron.group-and-summarize, r-positron.sort-and-keep-top-n, r-positron.parse-dates-and-extract-month]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/case-study-8.md]
datasets_used: [sources/files/PWQMN_data_2024.csv]
---
# Make a heatmap with geom_tile() and label the tiles with geom_text()

## Purpose
Show a summarized value across two categorical dimensions, such as month × station. Each tile is coloured by value, and the rounded value can be printed on top. This is from the course's final R lesson (PWQMN chloride, 2024), also distributed with Case study 8 as `Combined R Scripts.R`.

## Steps
1. Clean and filter the data to one analyte, with numeric results and a month label. [script R Skills Review.R:582-588]
2. Keep stations with all 12 months (`n_distinct(month) == 12`) and pick the top 8 by mean (see [sort-and-keep-top-n.md](sort-and-keep-top-n.md)). [script R Skills Review.R:591-601]
3. Summarize to one mean per station × month. [script R Skills Review.R:604-607]
4. Plot with `aes(x = month, y = collection_site, fill = mean_chloride)` + `geom_tile(colour = "white")`. [script R Skills Review.R:609-612]
5. Add the values with `geom_text(aes(label = round(mean_chloride, 1)), size = 3)`. [script R Skills Review.R:613]
6. Optionally set a custom colour gradient with `scale_fill_gradient(low = "white", high = "lightblue")`; this line is commented out in the script. [script R Skills Review.R:614]
7. Add titles and theme settings, assign the plot to `heatmap_plot`, and print it. [script R Skills Review.R:615-637]

## Formulas / expressions / code
[script R Skills Review.R:576-642] (also Combined R Scripts.R:487-553):
```r
pwqmn_data <- read_csv("PWQMN_data_2024.csv") |>
  clean_names()

unique(pwqmn_data$collection_site)

# Filter by chloride data
chloride_data <- pwqmn_data |>
  filter(analyte == "Chloride") |>
  mutate(results = ifelse(results == "<1.5", NA, results),
         month = month(mdy(collected), label = TRUE),
         collection_site = as.character(collection_site)) |>
  mutate(results = as.numeric(results)) |>
  filter(!is.na(results), !is.na(month))

# Count the distinct months with numeric chloride results for each station.
monthly_data <- chloride_data |>
  group_by(collection_site) |>
  summarize(months_recorded = n_distinct(month)) |>
  filter(months_recorded == 12)

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

heatmap_plot <- ggplot(selected_stations,
                       aes(x = month, y = collection_site,
                           fill = mean_chloride)) +
  geom_tile(colour = "white") +
  geom_text(aes(label = round(mean_chloride, 1)), size = 3) +
  #scale_fill_gradient(low = "white", high = "lightblue") +
  labs(
    title = "Monthly chloride concentrations",
    subtitle = "Selected PWQMN stations, 2024",
    x = "Month",
    y = "Station",
    fill = "Chloride (mg/L)"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 12, colour = "grey40"),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 11, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 10, colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10),
    legend.position = "right"
  )

heatmap_plot

# Hide the legend; put units in the subtitle instead.
heatmap_plot +
  labs(subtitle = "Monthly mean chloride (mg/L), 2024") +
  theme(legend.position = "none")
```

## Verify
- The plot shows 8 rows (stations) × 12 columns (Jan-Dec), each tile labelled with a value to one decimal place.
- `high_output` has 8 rows, and `selected_stations` has up to 96 rows (8 × 12).

## Pitfalls
- Without `as.numeric(results)`, `mean()` fails because `results` is text. [script R Skills Review.R:587]
- The script mixes `|>` and `%>%`. Both work. [script R Skills Review.R:600-606]
- The course only replaces `"<1.5"`. Other below-detection codes become NA through `as.numeric()` and are then dropped by `filter(!is.na(results))`. (behaviour of as.numeric is general knowledge)

## Related
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
- [plot-line-chart.md](plot-line-chart.md)
- [convert-column-types.md](convert-column-types.md)
