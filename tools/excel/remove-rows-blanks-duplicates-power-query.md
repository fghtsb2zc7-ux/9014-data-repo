---
id: excel.remove-rows-blanks-duplicates-power-query
tool: excel
title: Remove top/bottom rows, blank rows, duplicates and errors in Power Query (Remove Rows)
keywords: [remove rows, remove blank rows, remove blanks, delete empty rows, remove bottom rows, remove top rows, metadata rows, footer rows, header junk, remove duplicates, duplicate rows, remove errors, remove alternate rows, keep rows, reduce rows, missing data, table.selectrows, use first row as headers]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-selecting-and-removing-columns-and-rows.md, timestamps: "01:15-02:56"}, {video: transcripts/excel/excel-data-and-variable-types.md, timestamps: "01:40-02:00"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Remove top/bottom rows, blank rows, duplicates and errors in Power Query (Remove Rows)

## Purpose
Clean unwanted rows: metadata/notes at the bottom (or top) of a CSV that ruin column types, completely blank rows, duplicate rows, and rows with errors. Topic 2: "removing columns and rows as well as removing blanks and duplicates". Checklist items 8-9. [page topic-2-transforming-and-wrangling-data.md; page technical-skills-checklist.md]

## Steps
1. Open the query in the Power Query Editor (e.g. **Data > From Text/CSV** > `NPRI-INRP_DataDonnées_2024.csv` > **Transform Data**). [video excel-selecting-and-removing-columns-and-rows @00:15]
2. Click **Home > Reduce Rows > Remove Rows** (lower half of the button). Menu: **Remove Top Rows, Remove Bottom Rows, Remove Alternate Rows, Remove Duplicates, Remove Blank Rows, Remove Errors**. [video @01:15; frame @01:22]
3. Metadata at the bottom: choose **Remove Bottom Rows**; in the dialog ("Specify how many rows to remove from the bottom.") enter **Number of rows** (e.g. 6 for a 6-line note) and click **OK**. [video @01:15-01:49; frame @01:52]
4. Blank lines / text above the header row: choose **Remove Top Rows** and enter the number of rows, then (if the real header is now row 1) **Home > Transform > Use First Row as Headers**. [video @02:27; video excel-data-and-variable-types @01:40-02:00; frame @02:32] (Narrated; the dialog for Remove Top Rows was not shown.)
5. Blank rows: choose **Remove Blank Rows**. Step **Removed Blank Rows** is added. [video @01:49; frame @02:02, @02:12]
6. Duplicates: select the column(s) that define a duplicate (all columns for whole-row duplicates), then **Remove Rows > Remove Duplicates**. [video @02:27-02:40] (Narrated; not applied in the frames.)
7. Errors: **Remove Rows > Remove Errors** drops rows with errors in the selected column(s) (also available from the column-quality right-click menu). [frame @01:22; frame excel-data-and-variable-types @04:32]
8. **Home > Close & Load**.

## Formulas / expressions / code
```
= Table.SelectRows(#"Removed Other Columns", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null})))
```
Removed Blank Rows - for each row, takes all field values, removes empty strings and nulls, and keeps the row only if something is left (i.e. drops rows where every column is blank). [frame excel-selecting-and-removing-columns-and-rows @02:12]

## Verify
- APPLIED STEPS shows the new step (e.g. Source, Promoted Headers, Changed Type, Removed Other Columns, Removed Blank Rows, Removed Columns). [frame @02:52]
- After removing footer rows, column types should no longer show errors at the bottom (profile the entire data set to check). [video @01:40]

## Pitfalls
- Footer metadata rows make "column data types go all wonky" - remove them before relying on Changed Type. [video @01:40]
- **Remove Blank Rows** only removes rows that are blank in *every* column; rows with some missing values stay. To drop rows missing a specific value, use that column's filter > **Remove Empty**. [formula @02:12; frame excel-basic-filtering @01:12]
- Remove Duplicates compares only the selected columns - selecting one column keeps the first row per value of that column (general knowledge - not shown in course).
- Check how many rows to remove by scrolling to the end of the preview first (general knowledge).

## Related
- [Choose and remove columns](choose-and-remove-columns-power-query.md)
- [Check and fix data types / errors](check-and-fix-data-types-power-query.md)
- [Filter rows in Power Query](filter-rows-power-query.md)
- Transcript: [Excel - Selecting and removing columns and rows](../../transcripts/excel/excel-selecting-and-removing-columns-and-rows.md)
