---
id: excel.choose-and-remove-columns-power-query
tool: excel
title: Keep only selected columns or remove columns in Power Query (Choose Columns / Remove Columns)
keywords: [choose columns, remove columns, select columns, keep columns, drop columns, delete column, remove other columns, reduce columns, subset columns, manage columns, table.selectcolumns, table.removecolumns, condense dataset]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-selecting-and-removing-columns-and-rows.md, timestamps: "00:35-01:15, 02:00-02:27"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Keep only selected columns or remove columns in Power Query (Choose Columns / Remove Columns)

## Purpose
Condense a wide data set (the 2024 NPRI file has ~66 columns) to the columns you need, either by ticking the ones to keep (**Choose Columns**) or by deleting selected ones (**Remove Columns**). Checklist items 7 and 11 ("select, retain, remove, and reorder columns"). [page technical-skills-checklist.md]

## Steps
1. **Data > From Text/CSV** > `NPRI-INRP_DataDonnées_2024.csv` > **Transform Data**. [video excel-selecting-and-removing-columns-and-rows @00:15; frame @00:32]
2. Keep a set of columns: click **Home > Manage Columns > Choose Columns** (top half of the button). [video @00:40; frame @00:42]
3. In **Choose Columns** ("Choose the columns to keep") untick **(Select All)**, then tick the columns to keep - use **Search Columns** to find them. The video keeps "Année / Year", "ID INRP / NPRI ID", "Ville / City" and "Grand Total - Totale des rejets, éliminations et transferts pour recyclage / Grand Total - Total Releases". Click **OK**. [video @00:48; frame @00:52, @01:12]
4. A step **Removed Other Columns** is added and only those columns remain. [frame @01:12]
5. Remove specific columns: click the column header (Ctrl+click for several), then **Home > Manage Columns > Remove Columns**. The video removes "Ville / City"; step **Removed Columns**. [video @02:05; frame @02:22]
6. **Home > Close & Load**.

Shortcut alternative: right-click a column header > **Remove** or **Remove Other Columns** (menu items visible). [frame excel-splitting-columns @02:02]

## Formulas / expressions / code
```
= Table.SelectColumns(#"Changed Type",{"Année / Year", "ID INRP / NPRI ID", "Ville / City", "Grand Total - Totale des rejets, éliminations et transferts pour recyclage / Grand Total - Total Releases"})
```
Removed Other Columns - keeps only the listed columns. [frame @01:12]
```
= Table.RemoveColumns(#"Removed Blank Rows",{"Ville / City"})
```
Removed Columns - drops the listed column(s) from the previous step (here the previous step was Removed Blank Rows). [frame @02:22]

## Verify
- Data preview shows only the kept columns (4 after Choose Columns, 3 after removing Ville / City). [frame @01:12, @02:22]
- APPLIED STEPS lists Removed Other Columns / Removed Columns. [frame @02:52]

## Pitfalls
- Dropping columns loses "some of the subtlety of the data" - keep what later analysis needs. [video @01:10]
- Steps refer to columns by exact name; renaming or removing a column in an earlier step breaks later steps that use it (general knowledge - not shown in course).
- Reordering columns (checklist item 11) can be done by dragging headers or right-click > **Move >** (menu item visible [frame excel-splitting-columns @02:02]; not demonstrated).

## Related
- [Remove rows, blanks and duplicates](remove-rows-blanks-duplicates-power-query.md)
- [Split a column](split-column-power-query.md)
- [Power Query Editor basics](power-query-editor-basics.md)
- Transcript: [Excel - Selecting and removing columns and rows](../../transcripts/excel/excel-selecting-and-removing-columns-and-rows.md)
