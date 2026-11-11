---
id: excel.power-query-editor-basics
tool: excel
title: Open and navigate the Power Query Editor (Applied Steps, formula bar, column profiling, Close & Load)
keywords: [power query editor, open power query, launch power query editor, edit query, applied steps, query settings, delete step, undo step, formula bar, M code, M formula, column profiling, entire data set, close and load, queries and connections, refresh, power query ribbon, promoted headers, changed type, source step]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query]
source_videos: [{video: transcripts/excel/excel-loading-data-into-excel.md, timestamps: "01:30-02:40"}, {video: transcripts/excel/excel-basic-filtering.md, timestamps: "00:07-00:52"}, {video: transcripts/excel/excel-data-and-variable-types.md, timestamps: "00:47-02:35, 03:40-04:22, 06:10-07:22"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/topic-1-loading-cleaning-and-exploring-data.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv)", "sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Open and navigate the Power Query Editor (Applied Steps, formula bar, column profiling, Close & Load)

## Purpose
All of the course's Excel cleaning (filtering, data types, splitting, removing columns/rows, pivoting, merging) happens in the Power Query Editor. This file explains how to get into it for an existing query, what the panes are, how Applied Steps record and undo work, how to profile the full data set, and how to send results back to the sheet. Checklist item: "I can open and navigate the Power Query Editor." [page technical-skills-checklist.md]

## Steps
Open the editor
1. New data: **Data > From Text/CSV > (file) > Transform Data**. [video excel-data-and-variable-types @00:47]
2. Existing query, route A: click any cell in the loaded table, then the **Query** contextual tab > **Edit** group > **Edit**. [video excel-basic-filtering @00:20; frame @00:12, @00:32]
3. Existing query, route B: **Data > Get Data > Launch Power Query Editor...** (tooltip: "Open the Power Query Editor window to create or modify queries."). [video excel-basic-filtering @00:33; frame @00:42]

Know the layout [frame excel-loading-data-into-excel @01:42; frame excel-basic-filtering @00:52]
4. Ribbon tabs: **File, Home, Transform, Add Column, View**. Home groups: **Close** (Close & Load), **Query** (Refresh Preview, Properties, Advanced Editor, Manage), **Manage Columns** (Choose Columns, Remove Columns), **Reduce Rows** (Keep Rows, Remove Rows), **Sort**, **Transform** (Split Column, Group By, Data Type, Use First Row as Headers, Replace Values), **Combine** (Merge Queries, Append Queries, Combine Files), **Parameters**, **Data Sources** (Data source settings), **New Query** (New Source, Recent Sources, Enter Data).
5. Left: **Queries [n]** pane listing queries. Centre: data preview with a type icon on each header (ABC = Text, 1²3 = Whole Number, 1.2 = Decimal Number). Top: formula bar showing the M formula of the selected step (expand with the chevron at its right end). [frame excel-data-and-variable-types @02:22]
6. Right: **Query Settings** pane - **PROPERTIES** (Name) and **APPLIED STEPS**. Every action you take adds a step; on a CSV import the first three are always **Source**, **Promoted Headers**, **Changed Type**. [video excel-data-and-variable-types @00:58; frame @01:12]

Work with Applied Steps
7. Click any step to see the data as it was at that point and its formula (e.g. click **Promoted Headers** to see the table before types were set). [frame excel-data-and-variable-types @01:32]
8. To undo a step, click the **X** to the left of the step name. Later steps are automatically re-pointed to the step before it. [video excel-basic-filtering @00:45; video excel-data-and-variable-types @06:10; frame @06:22]

Profile the whole data set
9. At the bottom-left status bar click "Column profiling based on top 1000 rows" and choose **Column profiling based on entire data set**. Wait while the bars under the headers recompute. [video excel-data-and-variable-types @03:40; frame @03:52]

Return to Excel
10. Click **Home > Close & Load**. The table on the sheet is updated (or created) and the **Queries & Connections** pane shows rows loaded and errors. [video excel-loading-data-into-excel @01:55; frame excel-data-and-variable-types @07:12-07:22]

## Formulas / expressions / code
Default import steps, as shown in the formula bar [frame excel-data-and-variable-types @01:32, @01:12]:
```
= Table.PromoteHeaders(Source, [PromoteAllScalars=true])
```
Promoted Headers - turns the first row of the CSV into column names.
```
= Table.TransformColumnTypes(#"Promoted Headers",{{"Année / Year", Int64.Type}, {"ID INRP / NPRI ID", Int64.Type}, {"Entreprise / Company Name", type text}, {"Nom de l'installation / Facility Name", type text}, ...})
```
Changed Type - sets a type per column (`Int64.Type` whole number, `type text`, `type number` decimal; e.g. `{"Latitude / Latitude", type number}`). Each step's formula refers to the previous step by name (`#"Promoted Headers"`). You do not need to write M yourself; the instructor notes "we don't need to know this one". [video excel-data-and-variable-types @02:00]

## Verify
- Status bar at bottom shows column/row counts, e.g. "6 COLUMNS, 999+ ROWS" and the profiling mode. [frame excel-loading-data-into-excel @01:52]
- After Close & Load: Queries & Connections lists the query and "N rows loaded." [frame excel-loading-data-into-excel @02:02]

## Pitfalls
- Filtering a plain range on the sheet only changes the view; filtering in Power Query (on a table) actually changes the data set that is loaded, and the step is recorded. [video excel-basic-filtering @00:07; video excel-loading-data-into-excel @02:20]
- Column quality/type checks default to the top 1000 rows - not enough for big files; switch to entire data set before trusting "no errors". [video excel-data-and-variable-types @03:40]
- If a CSV has explanatory text above the header row, the automatic Promoted Headers step promotes the wrong row: remove the top rows first and then use **Home > Transform > Use First Row as Headers**. [video excel-data-and-variable-types @01:40-02:00] (Those buttons are visible in frames; the fix itself is narrated, not demonstrated.)
- Deleting a middle step can break later steps that depend on columns it created (general knowledge - not shown in course).

## Related
- [Import a CSV as a table](import-csv-as-table-power-query.md)
- [Filter rows in Power Query](filter-rows-power-query.md)
- [Check and fix data types](check-and-fix-data-types-power-query.md)
- [Split a column](split-column-power-query.md)
- [Choose and remove columns](choose-and-remove-columns-power-query.md)
- [Remove rows, blanks and duplicates](remove-rows-blanks-duplicates-power-query.md)
- [Pivot / unpivot columns](pivot-unpivot-columns-power-query.md), [Merge queries](merge-queries-left-outer-join-power-query.md) (other Power Query tasks)
