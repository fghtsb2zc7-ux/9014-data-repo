---
title: "Technical skills checklist"
source: Brightspace content page
module_path: "Unit 1: Developing Skills in Data Analysis"
brightspace_url: https://westernu.brightspace.com/d2l/le/content/198357/viewContent/3985674/View
---

# Technical skills checklist

*Module: Unit 1: Developing Skills in Data Analysis*

# Technical Skills Checklist

This checklist summarizes the core technical skills developed throughout the course. Skills are grouped by software, with a continuous numbered list in each section. Use it to review your progress and identify skills that may require additional practice.

  

**Checklist update — 12 October 2026:** Additional skills are shown in blue and marked **Added**. These were not included in the original checklist.

- [Excel and Power Query](#excel)
- [QGIS](#qgis)
- [Positron and R](#r)

---

## Excel

1. I can open an Excel workbook and identify its worksheets, tables, variables, and observations.
2. I can import a CSV file into Excel.
3. I can open and navigate the Power Query Editor.
4. I can insert rows and columns when restructuring a worksheet.
5. I can format a dataset as an Excel table.
6. I can assign appropriate number, text, date, and time formats to columns.
7. I can select and inspect columns in Power Query.
8. I can identify null values, errors, unexpected values, and formatting problems.
9. I can remove or correct null and error values using Power Query.
10. I can filter data using Power Query.
11. I can select, retain, remove, and reorder columns appropriately.
12. I can parse data and then extract the year and month from a date variable.
13. I can pivot and unpivot data using Power Query.
14. I can ~~explain~~ understand the difference between wide and long data formats.
15. I can create a PivotTable from an Excel dataset.
16. I can organize PivotTable rows and columns and calculate sums, averages, and counts.
17. I can filter a PivotTable.
18. I can extract the underlying records represented by a summarized PivotTable value.
19. I can create a PivotChart as an initial visualization of summarized data.
20. I can use PivotTable and PivotChart field controls to explore different subsets of the data.
21. I can perform calculations across worksheets using existing variables (e.g., count if).
22. I can calculate sums, averages, minimums, and maximums.
23. I can use `IFS` or nested `IF` statements to represent several possible conditions.
24. **Added:** I can use `UNIQUE()` to create a list of distinct values from a column.
25. I can combine conditions using logical operators such as `AND` and `OR`.
26. I can use the `FILTER` function to return a subset of a dataset.
27. I can use Power Query to merge two datasets using a shared field.
28. I can expand selected columns from a merged dataset.
29. I can select a chart type that is appropriate for the variables and analytical question.
30. I can use field buttons to change the data displayed in a PivotChart.
31. I can remove field buttons when preparing a chart for presentation.
32. I can sort categories into an informative order.

---

## QGIS

1. I can load a CSV file into QGIS.
2. I can load an ESRI Shapefile into QGIS.
3. I can load a raster dataset into QGIS.
4. I can add a basemap to a QGIS project.
5. I can open and explore a layer’s attribute table.
6. I can identify a layer’s coordinate reference system and reproject a vector layer when necessary.
7. I can identify a raster layer’s coordinate reference system and reproject it when necessary.
8. I can change a field’s data type when it has been imported incorrectly using the Field Calculator.
9. I can identify and repair invalid vector geometries using Fix Geometries.
10. I can create a basic exploratory map to inspect the distribution of spatial data.
11. I can filter a spatial layer using one attribute condition.
12. I can filter a spatial layer using multiple conditions and operators such as `IN`.
13. I can distinguish between temporarily filtering features and permanently creating a new filtered dataset.
14. I can export layers as a new Shapefile, CSV file or GeoPackage.
15. I can use the Field Calculator to create a new attribute from existing fields.
16. I can use conditional expressions in the Field Calculator to classify spatial features.
17. I can calculate geometry attributes such as area~~, length, or coordinates~~.
18. I can use the Raster Calculator to create a new raster from one or more input layers.
19. **Added:** I can use Raster Calculator to classify raster cells using a cutoff value
20. I can create a new vector layer with an appropriate geometry type and coordinate reference system.
21. I can create, edit and save polygon features.
22. **Added:** I can export selected spatial attributes to their own Shapefile.
23. I can join a non-spatial table to a spatial layer using a shared attribute using Join.
24. I can use Join Attributes by Nearest to add attributes from other vector layers.
25. I can measure distances between spatial features.
26. I can use Join Attributes by Location to connect features that intersect or occur within one another.
27. I can count the number of points contained within polygons.
28. **Added:** I can use Clip to retain the parts of a spatial layer that fall within a study-area boundary.
29. I can create buffers around spatial features using Buffer.
30. I can sample raster values at point locations using Sample Raster Values.
31. I can summarize raster categories within polygons using a zonal histogram.
32. I can change the appearance of vector features including point shapes.
33. I can symbolize categorical  and quantitative data using categorized/graduated symbols or colour gradients.
34. I can select an appropriate classification method (e.g., Equal Intervals) and number of classes.
35. I can display raster values using an appropriate pseudocolour scheme.
36. I can use Overlap Analysis to identify places where vector layers overlap.
37. I can initiate a QGIS print layout.
38. I can add and position a map within a print layout.
39. I can add a north arrow and a appropriate scale bar.
40. I can add and format a legend including removing, renaming, reordering, and grouping legend items.
41. I can add a frame and coordinate system to a map.
42. I can export a finished map at an appropriate size and resolution.

---

## Positron and R

1. I can install R packages using `install.packages()` and load them using `library()`.
2. I can check my working directory using `getwd()` and work from the appropriate data folder.
3. I can load a CSV file using `read_csv()` and assign the result to an object using `<-`.
4. I can clean imported column names using `clean_names()` from the janitor package.
5. I can inspect the first rows of a dataset using `head()`.
6. I can inspect column names, data types, and example values using `names()` and `glimpse()`.
7. I can identify the distinct values in a variable using `unique()` and access a column using `$`.
8. I can use the pipe operators `|>` and `%>%` to connect data-processing steps.
9. I can select, remove, and reorder columns using `select()`.
10. I can select or exclude columns by name or position and use backticks around column names containing spaces.
11. I can rename variables using `rename()`.
12. I can filter observations using one or more conditions with `filter()`.
13. I can use `%in%` to retain or exclude several categories.
14. I can use `%in%` with a column from another dataset to retain selected stations or groups.
15. I can filter using `==`, `!=`, `>`, and `>=`, and combine or reverse conditions using `&` and `!`.
16. I can use `complete.cases()` to exclude missing values from selected variables.
17. I can convert values to numeric using `as.numeric()`.
18. I can convert a variable to text using `as.character()`.
19. I can parse date-time strings using `ymd_hm()` and dates using `mdy()`.
20. I can extract labelled months using `month(..., label = TRUE)`.
21. I can control category order using `factor(..., levels = ...)`.
22. I can create or modify variables using `mutate()`.
23. I can use `ifelse()` to classify observations or replace a specified value with `NA`.
24. I can group observations by one or more variables using `group_by()`.
25. I can calculate grouped summaries using `summarize()`.
26. I can calculate grouped totals, maxima, and means using `sum()`, `max()`, and `mean()`.
27. I can use `na.rm = TRUE` to omit missing values from summary calculations.
28. I can count records within groups using `n()` inside `summarize()`.
29. I can count distinct values using `n_distinct()`
30. I can sort summary values using `arrange()` and retain the first few rows using `head()`.
31. I can reshape data from wide to long using `pivot_longer()`.
32. I can reshape data from long to wide using `pivot_wider()`.
33. I can write a transformed dataset to a CSV file using `write_csv()`.
34. I can construct a plot using `ggplot()` and map variables to position, colour, fill, and group using `aes()`.
35. I can create column charts using `geom_col()`.
36. I can create scatterplots using `geom_point()`.
37. I can create boxplots using `geom_boxplot()`.
38. I can create line graphs using `geom_line()` to connect observations across categorical months.
39. I can plot a date-time variable on an axis to explore change through time.
40. I can create histograms using `geom_histogram()`.
41. I can create stacked column charts by mapping categories to `fill` in `geom_col()`.
42. I can create a heatmap using `geom_tile()` and map a summarized value to tile fill.
43. I can add numeric values or descriptive labels using `geom_text()`.
44. I can round numeric labels using `round()` and adjust text size and position using `size`, `hjust`, and `vjust`.
45. I can use a separate dataset in a plot layer to highlight or label selected observations.
46. I can distinguish between mapping colour inside `aes()` and assigning a fixed colour outside it.
47. I can manually set mapped line and point colours using `scale_colour_manual()`.
48. I can control point transparency using `alpha`, point size using `size`.
49. I can add a fitted trend using `geom_smooth()` and specify a straight-line fit using `method = "lm"`.
50. I can add informative titles, subtitles, axis labels, and legend titles using `labs()`.
51. I can change the overall appearance of a plot using `theme_bw()` or `theme_classic()`.
52. I can customize titles, subtitles, axis titles, axis text, and legend text using `theme()` and `element_text()`.
53. I can rotate axis labels and adjust their alignment to improve readability.
54. I can move a legend using `legend.position` or hide it using `legend.position = "none"`.
55. I can reorder categories by a summary value using `reorder()`, including changing the sort direction.
56. I can divide a visualization into panels using `facet_wrap()`.
57. I can flip the axes of a plot using `coord_flip()`.
58. I can export a PNG using `ggsave()` and specify its width, height, and units.
59. I can fit a simple linear regression using `lm()` with a formula such as `y ~ x`.
60. I can inspect a fitted model using `summary()` and identify the estimated slope and its p-value.
61. I can interpret a regression result in relation to the question being investigated.
62. I can compare a response between groups using a section predictor in a linear model.
63. I can fit a model with multiple predictors using an additive formula such as `y ~ section + distance`.
64. I can include an interaction using a formula such as `y ~ section * distance` and distinguish it from an additive model.
65. **Added:** I can combine datasets containing the same variables using `bind_rows()`.
66. **Added:** I can add information from another dataset using `left_join()` and explain which records it retains.
67. **Added:** I can retain records that have a match in another dataset using `semi_join()`.
68. **Added:** I can identify records without a match in another dataset using `anti_join()`.
69. **Added:** I can specify matching columns using `join_by()`, including columns with different names in the two datasets.
70. **Added:** I can retain unique records using `distinct()` and preserve other columns using `.keep_all = TRUE`.
