---
id: excel.check-and-fix-data-types-power-query
tool: excel
title: Check and fix column data types and type errors in Power Query (keep errors, replace errors)
keywords: [data type, variable type, change type, column type, whole number, decimal number, text, date, type icon, changed type, data type detection, conversion error, DataFormat.Error, couldn't convert to number, keep errors, replace errors, remove errors, column quality, column profiling entire data set, error bar, fix year column, npri 2024 errors, table.replaceerrorvalues, table.selectrowswitherrors]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-data-and-variable-types.md, timestamps: "00:05-07:32"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Check and fix column data types and type errors in Power Query (keep errors, replace errors)

## Purpose
Make sure each column has the right type (Whole Number, Decimal Number, Text, Date...) and find/fix values that could not be converted. Mismatched types break later analysis in Excel, QGIS and R alike. Topic 2: "loading data into Power Query and then checking for data type errors". Checklist items 6, 8, 9. [page topic-2-transforming-and-wrangling-data.md; page technical-skills-checklist.md]

## Steps
Inspect the automatic types
1. **Data > From Text/CSV**, choose `NPRI-INRP_DataDonnées_2024.csv`, click **Transform Data**. [video excel-data-and-variable-types @00:38-00:50; frame @00:52]
2. In **APPLIED STEPS** note **Source**, **Promoted Headers**, **Changed Type**. Click **Changed Type** and read the formula bar (expand it with the chevron) to see the type Excel assigned to each column. [video excel-data-and-variable-types @00:58, @02:10; frame @02:22]
3. Look at the icon left of each header (1²3 Whole Number, 1.2 Decimal Number, ABC Text). Expected for this file: Année / Year and ID INRP / NPRI ID = whole number; Latitude / Longitude = number; names = text. [video excel-data-and-variable-types @03:15; frame @02:22]

Change a column's type
4. Click the type icon on the column header and pick a type from the menu: Decimal Number, Currency, Whole Number, Percentage, Date/Time, Date, Time, Date/Time/Timezone, Duration, Text, True/False, Binary, Using Locale... [video excel-data-and-variable-types @02:40; frame @03:02] (Equivalent ribbon control: `Home > Transform > Data Type:` dropdown, visible in frames.)

Find conversion errors in the whole file
5. Click the status-bar text "Column profiling based on top 1000 rows" (bottom left) and choose **Column profiling based on entire data set**. [video excel-data-and-variable-types @03:40; frame @03:52]
6. Look for red/striped segments in the thin quality bar under each header; hover to see counts (here Année / Year: "49 (< 1%) Error"). [video excel-data-and-variable-types @04:10; frame @04:22]
7. Right-click the red bar under the column > **Keep Errors**. A **Kept Errors** step shows only the failing rows. [video excel-data-and-variable-types @04:29; frame @04:32, @04:42]
8. Click an **Error** cell; the pane at the bottom explains it: "DataFormat.Error: We couldn't convert to Number. Details: Fort McKay". [video excel-data-and-variable-types @04:45; frame @05:02]

Fix the errors
9. Right-click the red bar under the column again > **Replace Errors**. In the **Replace Errors** dialog ("Enter the value which will replace errors in the selected columns.") type the correct value in **Value** - here `2024`, because every row in this file is reporting year 2024 - and click **OK**. A **Replaced Errors** step is added. [video excel-data-and-variable-types @05:10-05:35; frame @05:32, @05:42]
10. Delete the temporary **Kept Errors** step with its **X** so the full data set returns; the Replaced Errors step stays and re-points to Changed Type. [video excel-data-and-variable-types @06:10; frame @06:22]
11. Check the quality bar: Année / Year is now fully green. ID INRP / NPRI ID still shows errors (the correct IDs would have to be looked up elsewhere in the full NPRI data; the instructor leaves them). [video excel-data-and-variable-types @05:40, @06:25; frame @06:32]
12. **Home > Close & Load**. [video excel-data-and-variable-types @06:58; frame @07:12]

## Formulas / expressions / code
All seen in the formula bar:
```
= Table.TransformColumnTypes(#"Promoted Headers",{{"Année / Year", Int64.Type}, {"ID INRP / NPRI ID", Int64.Type}, {"Entreprise / Company Name", type text}, {"Nom de l'installation / Facility Name", type text}, ...})
```
Changed Type (auto) - assigns types; also `{"Latitude / Latitude", type number}`, `{"Longitude / Longitude", type number}`, `{"SCIAN 4 chiffres / NAICS 4 Code", Int64.Type}`. [frame @01:12, @02:22]
```
= Table.SelectRowsWithErrors(#"Changed Type", {"Année / Year"})
```
Kept Errors - keeps only rows where Année / Year is an error. [frame @04:42]
```
= Table.ReplaceErrorValues(#"Kept Errors", {{"Année / Year", 2024}})
```
Replaced Errors - replaces error values in Année / Year with 2024. After deleting Kept Errors it becomes [frame @06:22]:
```
= Table.ReplaceErrorValues(#"Changed Type", {{"Année / Year", 2024}})
```

## Verify
- Année / Year quality bar all green, no Error cells. [frame @06:32]
- After loading: Queries & Connections shows "59,605 rows loaded. 49 errors." (the 49 remaining errors are in ID INRP / NPRI ID). [video excel-data-and-variable-types @07:05; frame @07:22]

## Pitfalls
- Default profiling only uses the top 1000 rows, and the import preview's Data Type Detection uses the first 200 rows; errors further down are missed until you profile the entire data set. [frame @00:52; video @03:40]
- The 49 error rows (facility "Wood Buffalo--Cold Lake") have values shifted into the wrong columns (e.g. "AB" under Ville / City, text "Fort McKay" in the Year column) - a data-entry/quality problem in the source, not an Excel bug. [frame @04:42, @05:02]
- Right-clicking an Error *cell* does not offer Replace Errors; use the quality bar or the column header right-click menu (which lists "Replace Errors..."). [frame @05:22; frame excel-splitting-columns @02:02]
- Other quality-bar options: **Remove Errors** (drops the rows), **Remove Empty**, **Remove Duplicates**, **Keep Duplicates**, **Copy Quality Metrics**. [frame @04:32]
- Very large files (the million-row ReleasesRejets file) are slow in Excel. [video @06:50]

## Related
- [Power Query Editor basics](power-query-editor-basics.md)
- [Remove rows, blanks and duplicates](remove-rows-blanks-duplicates-power-query.md)
- [Import a CSV as a table](import-csv-as-table-power-query.md)
- Same concept in R: [convert column types](../r-positron/convert-column-types.md)
- Transcript: [Excel - Data and variable types](../../transcripts/excel/excel-data-and-variable-types.md)
