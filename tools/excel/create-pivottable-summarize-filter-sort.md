---
id: excel.create-pivottable-summarize-filter-sort
tool: excel
title: Create a PivotTable to summarize data, then filter and sort it
keywords: [pivot table, pivottable, summarize, aggregate, group by, sum by year, total by industry, pivottable fields, rows, values, filters, columns, sum of, sort pivot, sort by value, largest, filter pivot, label filters, value filters, more sort options, insert pivottable, new worksheet]
software_context: "Excel for Microsoft 365 desktop (Windows), Insert > PivotTable; PivotTable Analyze tab"
prerequisites: [excel.import-csv-as-table-power-query]
source_videos: [{video: transcripts/excel/excel-pivot-tables-and-charts.md, timestamps: "00:06-01:42, 02:00-03:11"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv)"]
---
# Create a PivotTable to summarize data, then filter and sort it

## Purpose
Aggregate a table (e.g. total releases to air per year, or per industry) in a few clicks, then filter to particular categories and sort to find the largest values. Topic 1 objective: "Aggregate and plot data within Excel using Pivot Tables and Charts". Checklist items 15-17. [page topic-1-loading-cleaning-and-exploring-data.md; page technical-skills-checklist.md]

## Steps
1. Have the data loaded as an Excel table (Power Query import). The video uses the NPRI industry air releases table (`NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv`, 1,323 rows). [video excel-pivot-tables-and-charts @00:30; frame @00:22]
2. Click any cell in the table, then **Insert > Tables > PivotTable**. [video excel-pivot-tables-and-charts @00:41]
3. In **PivotTable from table or range**, confirm **Table/Range** shows the table name (here `NPRI_INRP_IndustryIndustrie_Air_2015_2024`) - Excel picks up the whole table automatically. [frame @00:52]
4. Under "Choose where you want the PivotTable to be placed" keep **New Worksheet** (instructor's preference); leave "Add this data to the Data Model" unticked. Click **OK**. [video excel-pivot-tables-and-charts @00:55; frame @00:52]
5. A new sheet (here "Sheet4") opens with an empty PivotTable and the **PivotTable Fields** pane listing the column headings, plus four areas: **Filters, Columns, Rows, Values**. [frame @01:12]
6. Tick **Year / Année** (it goes to **Rows**) and tick **Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes)** (numeric, goes to **Values** as "Sum of ..."). [video excel-pivot-tables-and-charts @01:19; frame @01:32] You can also drag fields into the areas.
7. To change the grouping, untick **Year / Année** and tick **Industry (English) / Industrie (Anglais)** - one row per industry with its summed releases. [video excel-pivot-tables-and-charts @02:00; frame @02:12]
8. Filter: click the dropdown on **Row Labels**, untick **(Select All)**, tick the categories wanted (e.g. "Animal food manufacturing"), **OK**. [video excel-pivot-tables-and-charts @02:20; frame @02:22, @02:32] To remove it: Row Labels dropdown > **Clear Filter From "Industry (English...)"**. [frame @02:32]
9. Sort by value: Row Labels dropdown > **More Sort Options...**; in **Sort (Industry (English) / Industrie (Anglais))** choose **Ascending (A to Z) by:** and select **Sum of Total - Releases to Air (tonnes) / Total - Rejets...** from the dropdown (or **Descending (Z to A) by:** to put the largest first); **OK**. [video excel-pivot-tables-and-charts @02:34; frame @02:42]
10. Scroll to the bottom (ascending) to read the largest category. [frame @02:52]

## Formulas / expressions / code
None (no formulas). Values used by default: **Sum**. (Changing to Average/Count is a checklist item, via the Values field > Value Field Settings - general knowledge, not shown in this video.)

## Verify
Year x Sum of releases [frame @01:32]:

| Year | Sum of Total - Releases to Air (tonnes) |
|---|---|
| 2015 | 3074826.391 |
| 2016 | 3032880.318 |
| 2017 | 3076243.857 |
| 2018 | 2931739.565 |
| 2019 | 2895114.283 |
| 2020 | 2723519.547 |
| 2021 | 2755602.542 |
| 2022 | 2733149.652 |
| 2023 | 2660257.051 |
| 2024 | 2591038.961 |
| (blank) | |
| Grand Total | 28474372.17 |

Industry sorted ascending by sum: last rows "Alumina and aluminum production and processing 4612271.886", "Oil and gas extraction 8212153.277" (largest emitter), Grand Total 28474372.17. [frame @02:52, @03:02] Filtered to "Animal food manufacturing": 21736.44826. [frame @02:32]

## Pitfalls
- Start from a table: if the data is a table, PivotTable recognizes the full range automatically; with a plain range you must check the selected range yourself. [video excel-pivot-tables-and-charts @00:41]
- A **(blank)** row appears because the source has blank/null values in the row field. [frame @01:32] Remove blanks in Power Query first if unwanted (see Related).
- **Sort A to Z / Sort Z to A** sort the labels alphabetically; to rank by the summed value use **More Sort Options...** and pick the "Sum of ..." field. [frame @02:22, @02:42]
- The PivotTable does not refresh automatically when source data changes: **PivotTable Analyze > Data > Refresh** (button visible [frame @01:12]; usage general knowledge).

## Related
- [Create a PivotChart from a PivotTable](create-pivotchart-from-pivottable.md)
- [Import a CSV as a table](import-csv-as-table-power-query.md)
- [Remove rows, blanks and duplicates](remove-rows-blanks-duplicates-power-query.md)
- Transcript: [Excel - Pivot tables and charts](../../transcripts/excel/excel-pivot-tables-and-charts.md)
