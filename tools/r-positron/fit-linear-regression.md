---
id: r-positron.fit-linear-regression
tool: r-positron
title: Fit and interpret linear models with lm() and summary() (simple, group, additive, interaction)
keywords: [linear regression, lm, summary, slope, p-value, significance, model, ANOVA-like, group comparison, additive model, interaction, residuals, R squared, statistics, y ~ x]
software_context: "Positron, R 4.6.1, base R stats::lm()"
prerequisites: [r-positron.read-csv-and-clean-column-names]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/lesson-7-overview.md]
datasets_used: [sources/files/buckthorn_updated.csv, "sources/files/TPM practice exam.zip (particulate_matter_ON.csv)"]
---
# Fit and interpret linear models with lm() and summary() (simple, group, additive, interaction)

## Purpose
Test whether a response, such as buckthorn cover, is related to a predictor (canopy cover, distance to water, field section). Read the slope and its p-value from `summary()`. This is from the Topic 7 buckthorn script. The TPM practice exam Q1 also asks for "the slope" and "whether or not the slope is significantly different from zero" in a figure subtitle.

## Steps
1. Write `model <- lm(response ~ predictor, data = data)`. [script R Skills Review.R:495]
2. Run `summary(model)`. In the coefficients table, the row named after the predictor holds the **slope estimate** and its **p-value** (`Pr(>|t|)`). [script R Skills Review.R:496-501]
3. Compare the p-value with your significance threshold (usually 0.05). The Topic 7.R answer comment says the canopy relationship is "not considered a statistically significant relationship" because the p-value exceeds the threshold. [script Topic 7.R:43-44]
4. To compare groups, use a categorical predictor: `lm(buckthorn_percent ~ section, ...)`. [script R Skills Review.R:512-513]
5. To check the model assumptions, look at a residuals histogram: `hist(residuals(model))`. [script R Skills Review.R:514]
6. For several predictors, use `y ~ a + b` (additive) or `y ~ a * b` (main effects plus interaction). [script R Skills Review.R:516-520]
7. Visualise the fit with `geom_smooth(method = "lm")` (see [plot-scatter-with-trend-line.md](plot-scatter-with-trend-line.md)).

## Formulas / expressions / code
[script R Skills Review.R:492-531]:
```r
## Run a linear regression between canopy cover (x) and buckthorn % (y)
linear_regression <- lm(buckthorn_percent~canopy_cover, data = buckthorn_data)
summary(linear_regression)

# In the regression summary, the slope p-value is in the canopy_cover row.
# Compare that p-value with the significance threshold to interpret the result.

compare_sections <- lm(buckthorn_percent~section, data = buckthorn_data)
summary(compare_sections)
hist(residuals(linear_regression))

compare_sections <- lm(buckthorn_percent~section+distance, data = buckthorn_data)
summary(compare_sections)

compare_sections_int <- lm(buckthorn_percent~section*distance, data = buckthorn_data)
summary(compare_sections_int)
```
- `~` reads "is modelled by". `section+distance` estimates both effects; `section*distance` adds the section × distance interaction (whether the distance slope differs between sections).
- For a categorical predictor, the coefficient row (for example `sectionSection 2`) is the difference from the first level ("Section 1"). (interpretation is general knowledge)

## Verify
- `summary()` prints Call, Residuals, Coefficients (Estimate, Std. Error, t value, Pr(>|t|)), Residual standard error and R-squared. (output layout is general knowledge)

## Pitfalls
- **Bug in `sources/files/Topic 7.R` line 63:** after fitting `compare_sections_int` it runs `summary(compare_sections)`, so the interaction model is never shown. Use `summary(compare_sections_int)` as in Combined/R Skills Review. [script Topic 7.R:62-63]
- The Topic 7.R comment says the p-value is listed "near buckthorn_percent". It is actually in the **predictor** row (`canopy_cover`), as the corrected script says. [script Topic 7.R:43] [script R Skills Review.R:500]
- `hist(residuals(linear_regression))` plots residuals of the canopy model, even though it sits right after the section model in the script. [script R Skills Review.R:514]
- To put the slope in a subtitle (TPM exam), extract it with `coef(model)[2]` or read it from `summary()`, then paste it into `labs(subtitle = ...)`. `coef()` is general knowledge — not shown in course.

## Related
- [plot-scatter-with-trend-line.md](plot-scatter-with-trend-line.md)
- [plot-histogram-and-boxplot.md](plot-histogram-and-boxplot.md)
- [practice-exam-r-workflows.md](practice-exam-r-workflows.md)
