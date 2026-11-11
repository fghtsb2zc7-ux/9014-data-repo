---
id: r-positron.plot-scatter-with-trend-line
tool: r-positron
title: Make a scatterplot with geom_point() and add a trend line with geom_smooth()
keywords: [scatterplot, scatter plot, geom_point, geom_smooth, trend line, regression line, method lm, loess, relationship, correlation, alpha, transparency, point colour]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md]
datasets_used: [sources/files/buckthorn_updated.csv]
---
# Make a scatterplot with geom_point() and add a trend line with geom_smooth()

## Purpose
Show the relationship between two numeric variables, such as canopy cover vs buckthorn cover, or elevation and distance-to-water vs buckthorn cover, and add a smoothed or straight-line fit.

## Steps
1. Use raw (unsummarized) data with two numeric columns.
2. Write `ggplot(data, aes(x = x_var, y = y_var)) + geom_point()`. [script R Skills Review.R:324-325]
3. Add a trend line: `geom_smooth()` gives the default smooth curve; `geom_smooth(method = "lm")` gives a straight linear fit. [script R Skills Review.R:326, 490]
4. Optionally colour the points by group with `aes(colour = section)`, make them semi-transparent with `geom_point(alpha = 0.5)`, or use a fixed colour such as `geom_point(colour = "pink")`. [script R Skills Review.R:522-523, 325]
5. Optionally facet by group so each panel gets its own line. [script R Skills Review.R:525]
6. Label the axes with `labs()` and apply `theme_bw()`.

## Formulas / expressions / code
Topic 5 in-class [script R Skills Review.R:324-334]:
```r
ggplot(data = buckthorn_data, aes(x = canopy_cover, y = buckthorn_percent))+
  geom_point(colour = "pink")+
  geom_smooth()+
  labs(x = "Canopy cover (%)", y = "Buckthorn cover (%)")+
  theme_bw()

ggplot(data = buckthorn_data, aes(x = elevation1, y = buckthorn_percent))+
  geom_point(colour = "pink")+
  geom_smooth()+
  labs(x = "Elevation", y = "Buckthorn cover (%)")+
  theme_bw()
```
Topic 7 with a linear fit [script R Skills Review.R:487-490]:
```r
## Create a point plot that shows canopy cover against buckthorn percentage. Make sure you update the axis labels. 
ggplot(buckthorn_data, aes(x = canopy_cover, y = buckthorn_percent))+
  geom_point()+
  geom_smooth(method = "lm") #### You can add a line to your point plot by using geom_smooth(method = "lm")
```
Grouped and faceted, with transparency [script R Skills Review.R:522-531]:
```r
ggplot(buckthorn_data, aes(x = distance, y = buckthorn_percent, colour = section)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  facet_wrap(~section)+
  labs(
    x = "Distance",
    y = "Buckthorn cover (%)",
    colour = "Section"
  ) +
  theme_bw()
```

## Verify
- Points appear in the Plots pane, with a line and a grey confidence band.
- With `colour = section` there is one coloured line per section, and the legend is titled "Section".

## Pitfalls
- **Label bug in `sources/files/Topic 5 in-class script.R` line 18:** the elevation plot is labelled `x = "Canopy cover (%)"`. The corrected label `x = "Elevation"` is in Combined/R Skills Review. [script Topic 5 in-class script.R:15-19]
- Plain `geom_smooth()` prints a message such as "`geom_smooth()` using method = 'loess'". This is informational. (general knowledge)
- In `buckthorn_updated.csv`, `distance` is the QGIS "join attributes by nearest" distance to the water edge, not `distance_along_transect`. Both columns exist after `clean_names()`. (from dataset schema)
- To report the slope and its significance (practice exam TPM Q1 asks for this in the subtitle), fit `lm()` and read `summary()` (see [fit-linear-regression.md](fit-linear-regression.md)).

## Related
- [fit-linear-regression.md](fit-linear-regression.md)
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
- [plot-histogram-and-boxplot.md](plot-histogram-and-boxplot.md)
