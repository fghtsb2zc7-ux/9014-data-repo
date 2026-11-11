---
id: excel.readme
tool: excel
title: Excel in ENVRSUST 9014 — overview and procedure index
keywords: [index, overview, Excel, Power Query, start here]
---
# Excel in ENVRSUST 9014

**Software context:** Excel for Microsoft 365 (Windows) with **Power Query** (Get & Transform). The course does almost all data
preparation in the Power Query Editor (Data > Get Data / From Text/CSV), loads the result back to a worksheet table, and
then uses worksheet formulas, PivotTables/PivotCharts and conditional formatting for analysis.

**Typical workflow an agent should follow:**
1. Import the CSV with Power Query → [import-csv-as-table-power-query.md](import-csv-as-table-power-query.md) (watch the file encoding — NPRI files are Windows-1252; see [../../datasets/npri-file-schemas.md](../../datasets/npri-file-schemas.md)).
2. Clean in the Power Query Editor: data types → filter → remove/choose columns → split → dates → pivot/unpivot → merge.
3. Close & Load to a table, then summarise with formulas (COUNTIF/SUMIF/IF/IFS/FILTER/UNIQUE) or a PivotTable.

**Course datasets used in Excel videos:** NPRI Industry Air 2015-2024 and Data 2024 (inside `sources/files/Class 1/NPRI data.zip`),
OBIS North Atlantic Right Whale reduced CSV (`sources/files/Topic 2/`), PWQMN stations + 2024 data (`sources/files/`).
Every procedure cites its source video and timestamp; steps not shown in the course are marked "(general knowledge — not shown in course)".

## Reference files

- [formula-reference](formula-reference.md) — every worksheet function and Power Query step used in the course, with syntax and M code

## Setup and orientation

| Procedure | Keywords |
|---|---|
| [Add the Developer and Power Pivot tabs to the ribbon (and reorder tabs)](customize-ribbon-developer-power-pivot-tabs.md) | customize ribbon, developer tab, power pivot tab, show developer, add tab, enable power pivot |
| [Enable the Analysis ToolPak and open the Data Analysis tools](enable-data-analysis-toolpak.md) | analysis toolpak, data analysis toolpak, data analysis button, add-in, excel add-ins, regression |
| [Find the course's Excel tools on the ribbon (ribbon tour and lookup table)](ribbon-tour-course-features.md) | ribbon, tabs, where is, ribbon tour, home tab, insert tab |

## Importing data and the Power Query Editor

| Procedure | Keywords |
|---|---|
| [Import a CSV into Excel as a table (Data > From Text/CSV, Load or Transform Data)](import-csv-as-table-power-query.md) | import csv, load csv, open csv, from text/csv, get data, text csv |
| [Open and navigate the Power Query Editor (Applied Steps, formula bar, column profiling, Close & Load)](power-query-editor-basics.md) | power query editor, open power query, launch power query editor, edit query, applied steps, query settings |
| [Check and fix column data types and type errors in Power Query (keep errors, replace errors)](check-and-fix-data-types-power-query.md) | data type, variable type, change type, column type, whole number, decimal number |

## Cleaning and reshaping in Power Query

| Procedure | Keywords |
|---|---|
| [Filter rows in the Power Query Editor (keep one year, or selected categories)](filter-rows-power-query.md) | filter, filter rows, subset, power query filter, keep year, select year |
| [Keep only selected columns or remove columns in Power Query (Choose Columns / Remove Columns)](choose-and-remove-columns-power-query.md) | choose columns, remove columns, select columns, keep columns, drop columns, delete column |
| [Remove top/bottom rows, blank rows, duplicates and errors in Power Query (Remove Rows)](remove-rows-blanks-duplicates-power-query.md) | remove rows, remove blank rows, remove blanks, delete empty rows, remove bottom rows, remove top rows |
| [Split one column into several in Power Query (by number of characters or by delimiter)](split-column-power-query.md) | split column, split by delimiter, split by number of characters, split by positions, separate column, extract first digits |
| [Extract year, month, quarter, week or day from a date column in Power Query](extract-date-parts-power-query.md) | extract year, extract month, week of year, quarter, day, name of month |
| [Convert inconsistent date text into a proper date column with Date > Parse in Power Query](parse-inconsistent-dates-power-query.md) | parse date, fix dates, date stored as text, mixed date formats, slashes and dashes, month-year only |
| [Reshape data between long and wide format with Pivot Column / Unpivot Columns in Power Query](pivot-unpivot-columns-power-query.md) | pivot column, unpivot columns, unpivot other columns, unpivot only selected columns, long format, wide format |
| [Merge two tables with Power Query (Merge Queries, Left Outer join) and expand the matched columns](merge-queries-left-outer-join-power-query.md) | merge queries, join, left outer join, lookup, combine tables, add station coordinates |

## Worksheet formulas and conditional logic

| Procedure | Keywords |
|---|---|
| [Enter worksheet formulas, use the Function Library, and reference cells on other sheets](enter-formulas-and-cross-sheet-references.md) | formula, function, equals sign, formula bar, function library, insert function |
| [List the distinct values of a column with UNIQUE()](unique-distinct-values-formula.md) | unique, distinct values, list of categories, remove duplicates formula, dynamic array, spill |
| [Count, sum, and find max/min with COUNTIF, SUMIF, MAX and MIN (conditional calculations across sheets)](countif-sumif-max-min-formulas.md) | countif, sumif, count if, sum if, conditional count, conditional sum |
| [Return all rows that match a condition with the FILTER() function](filter-function-return-matching-rows.md) | FILTER function, subset rows, extract matching rows, dynamic filter, slice of data, rows where column equals |
| [Create a category column with IF (true/false classification) in an Excel table](if-classify-rows-new-column.md) | IF, if statement, conditional logic, classify, recode, new column |
| [Classify rows that match any of several values with IF + OR (and IF + AND)](if-or-multiple-conditions.md) | IF OR, IF AND, OR function, AND function, multiple conditions, any of several values |
| [Break a numeric column into Low/Medium/High classes with IFS](ifs-categorize-numeric-thresholds.md) | IFS, multiple conditions, thresholds, cutoffs, bins, classes |
| [Add a dropdown list to a cell with Data Validation (List)](data-validation-dropdown-list.md) | data validation, dropdown, drop-down list, in-cell dropdown, pick list, restrict input |
| [Colour cells by value with a Conditional Formatting colour scale](conditional-formatting-color-scale.md) | conditional formatting, color scale, colour scale, heat map cells, red high green low, highlight values |
| [Build an interactive one-industry summary sheet (dropdown + COUNTIF + FILTER + MAX/MIN + SUMIF)](build-interactive-summary-sheet-countif-filter.md) | interactive worksheet, summary sheet, dashboard sheet, supervisor sheet, dropdown selector, industry summary |

## Summaries and charts

| Procedure | Keywords |
|---|---|
| [Create a PivotTable to summarize data, then filter and sort it](create-pivottable-summarize-filter-sort.md) | pivot table, pivottable, summarize, aggregate, group by, sum by year |
| [Create a PivotChart from a PivotTable](create-pivotchart-from-pivottable.md) | pivot chart, pivotchart, chart from pivot table, column chart, quick chart, visualize pivot |
