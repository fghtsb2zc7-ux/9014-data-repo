---
id: r-positron.customize-plot-labels-themes-facets
tool: r-positron
title: Customize ggplot labels, themes, legend, facets and colours
keywords: [labs, title, subtitle, axis labels, legend title, theme_bw, theme_classic, theme, element_text, element_blank, element_line, legend.position, hide legend, rotate axis labels, facet_wrap, panels, small multiples, scale_colour_manual, coord_flip, alpha, size, colour vs fill]
software_context: "Positron Plots pane, R 4.6.1, ggplot2 4.0.3"
prerequisites: [r-positron.plot-column-chart]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md]
datasets_used: [sources/files/PWQMN_data_2024.csv, sources/files/buckthorn_updated.csv, "sources/files/Class 1/NPRI data.zip"]
---
# Customize ggplot labels, themes, legend, facets and colours

## Purpose
This collects the finishing options the course uses on every figure. Exam questions ask you to "recreate the figure", so titles, subtitles, axis and legend titles, theme, legend position, facets and colours must match.

## Steps
1. **Labels**: add `labs(title =, subtitle =, x =, y =, colour = / fill = )`. The legend title argument must match the aesthetic used (`colour` or `fill`). [script R Skills Review.R:134-137, 615-621]
2. **Overall theme**: add `theme_bw()` (grey grid, white background) or `theme_classic()` (axis lines, no grid). [script R Skills Review.R:622, 668]
3. **Fine control**: add `theme(...)` after the overall theme, using `element_text(size =, face = "bold", colour =, angle =, hjust =)`, `element_line(colour =)` and `element_blank()`. [script R Skills Review.R:623-635]
4. **Rotate x labels**: `axis.text.x = element_text(angle = 45, hjust = 1)`. [script R Skills Review.R:628]
5. **Legend position**: `theme(legend.position = "bottom" / "right" / "none")`. [script R Skills Review.R:634, 679, 685]
6. **Panels**: add `facet_wrap(~ variable)`. [script R Skills Review.R:133]
7. **Flip axes**: add `coord_flip()`. [script R Skills Review.R:275]
8. **Manual colours** for a mapped colour: `scale_colour_manual(values = c("Chloride" = "purple"))`. [script R Skills Review.R:660]
9. **Fixed vs mapped colour**: `aes(colour = province)` maps a variable and creates a legend; `geom_point(colour = "pink")`, `geom_col(fill = "blue")` and `geom_line(colour = "purple")` set one colour. [page technical-skills-checklist.md]
10. **Point and line appearance**: `alpha = 0.5` (transparency), `size = 3`, `linewidth = 1`. [script R Skills Review.R:523, 653-654]
11. **Modify a saved plot**: store it (`p <- ggplot(...)`), then add layers to it (`p + theme(legend.position = "none")`). [script R Skills Review.R:640-642]

## Formulas / expressions / code
Facets and labels (Topic 1) [script R Skills Review.R:129-137]:
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
Full theme block (final lesson heatmap) [script R Skills Review.R:622-635]:
```r
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
```
Hide the legend and move the units into the subtitle [script R Skills Review.R:639-642]:
```r
heatmap_plot +
  labs(subtitle = "Monthly mean chloride (mg/L), 2024") +
  theme(legend.position = "none")
```
Legend at the bottom (ferry practice exam) [page exam-practice.md]:
```r
  theme_bw()+
  theme(legend.position = "bottom")
```
Multiple `labs()` calls also work (Topic 7) [script R Skills Review.R:562-563]:
```r
  labs(x = "Quadrat ID", y = "Percent cover")+
  labs(fill = "Life stage")
```

## Verify
- Titles and axis texts appear as specified. A legend appears only for mapped aesthetics.
- `legend.position = "none"` removes the legend.

## Pitfalls
- `theme(...)` must come **after** `theme_bw()`/`theme_classic()`. A complete theme added later resets earlier `theme()` tweaks. (general knowledge; the course always orders them this way)
- The legend title argument must match the aesthetic: `labs(fill = ...)` for `fill =`, `labs(colour = ...)` for `colour =`.
- In the R practice exam and the TPM practice exam, the target figures exist only as images in the original PDFs. Their titles and subtitles can't be read from the extracted text. [doc ENVRSUST 9014 - Practice Exam - Particulate Matter 2026 updated.pdf]

## Related
- [plot-column-chart.md](plot-column-chart.md)
- [plot-line-chart.md](plot-line-chart.md)
- [plot-heatmap.md](plot-heatmap.md)
- [save-plot-png-and-csv.md](save-plot-png-and-csv.md)
