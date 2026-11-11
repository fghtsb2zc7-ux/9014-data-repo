---
id: r-positron.plot-line-chart
tool: r-positron
title: Make line charts (time series, monthly lines) and highlight or label selected points
keywords: [line chart, line graph, geom_line, geom_point, time series, trend over time, datetime axis, group = 1, highlight point, annotate, label point, geom_text, scale_colour_manual, linewidth, January peak]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3"
prerequisites: [r-positron.group-and-summarize, r-positron.parse-dates-and-extract-month]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip", "sources/files/Class 2/Class 2.zip (data/108916_tag.csv)", sources/files/PWQMN_data_2024.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Make line charts (time series, monthly lines) and highlight or label selected points

## Purpose
Show change through time: a summarized value by year, a raw date-time track, or monthly means at one station. Points can be added on top, and a separate small data frame can highlight and label one observation (the course's "January peak").

## Steps
1. Summarize to one value per time step, per group (or use raw date-time data).
2. Write `ggplot(data, aes(x = time, y = value)) + geom_line()`. Add `+ geom_point()` to mark each observation. [script R Skills Review.R:129-131]
3. For several series, map `colour = group` in `aes()` (one line per province). [script R Skills Review.R:129]
4. If x is categorical (labelled months), add `group = 1` in `aes()` so ggplot connects the points into one line. [script R Skills Review.R:651-652]
5. To highlight one point, make a filtered data frame (for example `january_data`) and add another `geom_point(data = january_data, ...)` and `geom_text(data = january_data, aes(label = "..."))`. [script R Skills Review.R:647-659]
6. To set the line colour through a legend key, map a constant string (`colour = "Chloride"`), then set it with `scale_colour_manual(values = c("Chloride" = "purple"))`. [script R Skills Review.R:652, 660]
7. Add labels and a theme (see [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)).

## Formulas / expressions / code
NPRI TPM by province over time (Topic 1) [script R Skills Review.R:129-137] [script Class 1/Topic 1.qmd:145-153]:
```r
ggplot(data = province_tpm, aes(x = year, y = sum_tpm, colour = province)) +
  geom_point() +
  geom_line() +
  theme_bw() +
  facet_wrap(~ province) +
  labs(x = "Year",
    y = "Total TPM",
    title = "Total particulate matter releases in Canada from 2015 onward",
    colour = "Province")
```
Date-time axis (Topic 2 shark track) [script R Skills Review.R:169-171]:
```r
# R can natively identify and plot datetime objects within ggplot
ggplot(data = location_data, aes(x = date_time, y = `Most Likely Latitude`))+
  geom_line()
```
Monthly chloride at one station, with a highlighted, labelled January peak (final lesson) [script R Skills Review.R:644-685]:
```r
station_data_302 <- selected_stations |>
  filter(collection_site == "6008200302")

january_data <- station_data_302 |>
  filter(month == "Jan")

line_plot <- ggplot(station_data_302,
                    aes(x = month, y = mean_chloride,
                        group = 1, colour = "Chloride")) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_point(data = january_data,
             aes(x = month, y = mean_chloride), colour = "red", size = 4) +
  geom_text(data = january_data,
            aes(label = "January peak"),
            colour = "black", hjust = -0.25, vjust = 0, size = 4) +
  scale_colour_manual(values = c("Chloride" = "purple")) +
  labs(
    title = "Chloride concentrations through 2024",
    subtitle = "PWQMN station 6008200302",
    x = "Month",
    y = "Mean chloride (mg/L)",
    colour = "Parameter"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 12, colour = "grey40"),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 11, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 11, colour = "black"),
    axis.line = element_line(colour = "grey40"),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10),
    legend.position = "bottom"
  )

line_plot

line_plot +
  theme(legend.position = "none")
```
Annual sightings in a fixed purple colour (whale practice R.1.4) [page practice-1-north-atlantic-right-whale.md]:
```r
ggplot(annual_whales, aes(x = year, y = sighting_count)) +
  geom_line(colour = "purple") +
  geom_point(colour = "purple", size = 2) +
  labs(x = "Year", y = "Whale sightings",
       title = "Whale sightings through time") +
  theme_bw()
```

## Verify
- One continuous line per series. The highlighted point is red and larger, with the text "January peak" to its right.
- `line_plot` must be run on its own line to draw.

## Pitfalls
- Monthly lines without `group = 1` show points but no line, with the message "Each group consists of only one observation". (general knowledge — the course adds `group = 1`)
- `geom_line(linewidth = 1)`: current ggplot2 uses `linewidth`, not `size`, for line thickness. [script R Skills Review.R:653]
- The `geom_text()` label layer inherits `colour = "Chloride"` unless you override it; the course sets `colour = "black"`. [script R Skills Review.R:659]

## Related
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
- [plot-heatmap.md](plot-heatmap.md)
- [parse-dates-and-extract-month.md](parse-dates-and-extract-month.md)
- [save-plot-png-and-csv.md](save-plot-png-and-csv.md)
