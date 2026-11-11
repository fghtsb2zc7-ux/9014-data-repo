---
id: r-positron.save-plot-png-and-csv
tool: r-positron
title: Export a plot as PNG with ggsave() and a data frame as CSV with write_csv()
keywords: [ggsave, save plot, export figure, PNG, image, width height units, write_csv, export CSV, save data, transfer to Excel, transfer to QGIS, output file]
software_context: "Positron, R 4.6.1, ggplot2 4.0.3, readr 2.2.0"
prerequisites: [r-positron.plot-column-chart]
source_videos: []
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip", "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Export a plot as PNG with ggsave() and a data frame as CSV with write_csv()

## Purpose
Save the last ggplot as an image file for reports or exam answers, and save a summarized dataset as a CSV that can be opened in Excel or QGIS ("a nice way to transfer data between R and Excel and QGIS").

## Steps
1. Draw the plot so it is the most recent one in the Plots pane.
2. Run `ggsave("name.png", width = 15, height = 10, units = "cm")`. The file is written to the working directory (the opened folder). [script R Skills Review.R:141-145]
3. Run `write_csv(data_frame, "name.csv")` to save a table. [script R Skills Review.R:148-152]
4. Check that the files appear in the Explorer pane of the opened folder.

## Formulas / expressions / code
Topic 1 [script R Skills Review.R:145, 152] [script Class 1/Topic 1.qmd:162, 170]:
```r
ggsave("province_tpm_plot.png", width = 15, height = 10, units = "cm")
write_csv(province_tpm, "province_tpm.csv")
```
Whale practice R.1.6 [page practice-1-north-atlantic-right-whale.md]:
```r
ggsave("whale_monthly_records.png", width = 18, height = 12, units = "cm")
write_csv(whale_data_month, "whale_annual_summary.csv")
```
- `ggsave()` saves the **most recent** plot unless you pass `plot = object`. (The `plot =` argument is general knowledge — not shown in course.)
- `width`, `height` and `units` control the image size.

## Verify
- `province_tpm_plot.png` and `province_tpm.csv` appear in the Explorer next to the script.
- Opening the PNG shows the intended figure, at the intended size.

## Pitfalls
- If you drew another plot after the one you want, `ggsave()` saves the wrong figure. Re-run the intended plot first, or use `ggsave("x.png", plot = my_plot, ...)`. (general knowledge)
- `ggsave()` doesn't save base-R `hist()` plots. (general knowledge)
- Exam questions explicitly ask you to "Include code in your script to save your figure as a PNG". [doc Practice Questions/ENVRSUST 9014 R Practice Exam.pdf]

## Related
- [customize-plot-labels-themes-facets.md](customize-plot-labels-themes-facets.md)
- [render-quarto-document.md](render-quarto-document.md)
- [group-and-summarize.md](group-and-summarize.md)
