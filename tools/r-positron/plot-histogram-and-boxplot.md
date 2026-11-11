---
id: r-positron.plot-histogram-and-boxplot
tool: r-positron
title: Plot distributions with geom_histogram() and compare groups with geom_boxplot()
keywords: [histogram, geom_histogram, boxplot, box plot, geom_boxplot, distribution, compare groups, sections, fill by group, residuals histogram, hist]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3; base R hist()"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/lesson-7-overview.md]
datasets_used: [sources/files/buckthorn_updated.csv]
---
# Plot distributions with geom_histogram() and compare groups with geom_boxplot()

## Purpose
Look at how a numeric variable is distributed, overall or per group (histogram), and compare medians and spread between groups (boxplot). Topic 7 uses buckthorn cover by field section.

## Steps
1. Use raw data: one row per observation.
2. For a histogram, use `ggplot(data, aes(x = numeric_var, fill = group)) + geom_histogram()`. Add `facet_wrap(~group)` to give each group its own panel. [script R Skills Review.R:480-483]
3. For a boxplot, use `ggplot(data, aes(x = group, y = numeric_var, fill = group)) + geom_boxplot()`. [script R Skills Review.R:503-505]
4. Add labels with `labs()`; the Topic 7 script's prompt says "Add proper labels to the plot above". [script R Skills Review.R:485]
5. For a quick base-R histogram (for example of model residuals), use `hist(x)`. [script R Skills Review.R:514]

## Formulas / expressions / code
[script R Skills Review.R:480-505] (same in Topic 7.R:23-48):
```r
## Create a histogram of the buckthorn percentage with each section having its own colour (fill) and individual plot (hint: you can do this with one ggplot call)
ggplot(buckthorn_data, aes(x = buckthorn_percent, fill = section))+
  geom_histogram()+
  facet_wrap(~section)

## Create a boxplot to show the differences between each section
ggplot(buckthorn_data, aes(x = section, y = buckthorn_percent, fill = section))+
  geom_boxplot()
```
Base-R histogram of regression residuals [script R Skills Review.R:514]:
```r
hist(residuals(linear_regression))
```

## Verify
- The histogram has one panel per section ("Section 1", "Section 2") in different fill colours.
- The boxplot shows one box per section.

## Pitfalls
- `geom_histogram()` prints "`stat_bin()` using `bins = 30`. Pick better value with `binwidth`." This is informational. Set `bins =` or `binwidth =` to change it. (general knowledge — not shown in course)
- `hist()` draws in the Plots pane but can't be saved with `ggsave()`, because it isn't a ggplot. (general knowledge)

## Related
- [plot-scatter-with-trend-line.md](plot-scatter-with-trend-line.md)
- [fit-linear-regression.md](fit-linear-regression.md)
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
