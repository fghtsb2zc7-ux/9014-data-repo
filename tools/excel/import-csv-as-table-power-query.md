---
id: excel.import-csv-as-table-power-query
tool: excel
title: Import a CSV into Excel as a table (Data > From Text/CSV, Load or Transform Data)
keywords: [import csv, load csv, open csv, from text/csv, get data, text csv, get and transform, power query import, load to table, excel table, transform data, close and load, npri csv, bring data in, all files, double click csv, open file]
software_context: "Excel for Microsoft 365 desktop (Windows), Get & Transform (Power Query)"
prerequisites: []
source_videos: [{video: transcripts/excel/excel-loading-data-into-excel.md, timestamps: "00:06-02:40"}, {video: transcripts/excel/excel-data-and-variable-types.md, timestamps: "00:42-01:12"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md, course-pages/the-npri-dataset.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv)", "sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Import a CSV into Excel as a table (Data > From Text/CSV, Load or Transform Data)

## Purpose
The course's preferred way to bring a CSV into Excel: through **Get & Transform (Power Query)** so the data lands as an Excel **table** (banded rows, filter dropdowns, a refreshable query that records every transformation). Choose **Transform Data** to clean in the Power Query Editor first, or **Load** to drop it straight into a table. Opening the CSV directly (File > Open) is shown only as a quick-look alternative. Checklist items: "I can import a CSV file into Excel", "I can format a dataset as an Excel table". [page technical-skills-checklist.md]

## Steps
Preferred method - Power Query import:
1. Download and unzip `NPRI data.zip` first (Windows: right-click > Extract All). [page the-npri-dataset.md]
2. Open a blank workbook. Click **Data > Get & Transform Data > From Text/CSV**. [video excel-loading-data-into-excel @01:10; frame @01:12] (Equivalent: `Data > Get Data > From File > From Text/CSV` [frame excel-intro-to-excel @08:02].)
3. In the file browser pick the CSV (e.g. `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv` or `NPRI-INRP_DataDonnées_2024.csv`) and click **Import/Open**. [video excel-loading-data-into-excel @01:18]
4. A preview window titled with the file name opens. Check **File Origin** = "1252: Western European (Windows)", **Delimiter** = "Comma", **Data Type Detection** = "Based on first 200 rows" (these were the values shown; Excel detects them). [frame excel-data-and-variable-types @00:52]
5. Click **Transform Data** to open the Power Query Editor (recommended - lets you check types, filter, remove columns before loading) [video excel-loading-data-into-excel @01:30; video excel-data-and-variable-types @00:47] - or click **Load** to load it directly into a table. [video excel-data-and-variable-types @00:47]
6. In the Power Query Editor, make any transformations, then click **Home > Close > Close & Load**. [video excel-loading-data-into-excel @01:55; frame @01:42]
7. Excel inserts a new sheet named after the file with the data as a green banded table, and opens the **Queries & Connections** pane. [frame excel-loading-data-into-excel @02:02]

Quick-look alternative - open the CSV directly (no table, no query):
1. **File > Open > Browse**. [video excel-loading-data-into-excel @00:20; frame @00:32]
2. In the Open dialog, change the file-type dropdown beside "File name" to **All Files** (otherwise only Excel files show and the CSVs are invisible). [video excel-loading-data-into-excel @00:30; frame @00:32]
3. Select the CSV and click **Open**. [frame @00:42]
4. Optionally select all and widen columns to read them. [video excel-loading-data-into-excel @00:43; frame @00:52] (Double-clicking the CSV in File Explorer also opens it this way.) [video excel-loading-data-into-excel @00:06]

## Formulas / expressions / code
Power Query writes the import steps for you; the auto-generated type step seen for the Industry Air file [frame excel-loading-data-into-excel @01:52]:
```
= Table.TransformColumnTypes(#"Promoted Headers",{{"Industry (English) / Industrie (Anglais)", type text}, {"Industry (French) / Industrie (Français)", type text}, {"Year / Année", Int64.Type}, {"NAICS Number / Nu...
```
(truncated on screen) - sets each column's type: `type text` = Text, `Int64.Type` = Whole Number. The default steps are always **Source**, **Promoted Headers**, **Changed Type** (see [Power Query Editor basics](power-query-editor-basics.md)).

## Verify
- Table Design and Query contextual tabs appear when a cell in the data is selected; Table Style Options show Header Row, Banded Rows and Filter Button ticked. [frame excel-loading-data-into-excel @02:02]
- Queries & Connections pane lists the query with a row count: `NPRI-INRP_IndustryIndustrie_Air_2015-2024` -> "1,323 rows loaded." [frame @02:02]; `NPRI-INRP_DataDonnées_2024` -> "59,605 rows loaded. 49 errors." (after the data-type fix) [frame excel-data-and-variable-types @07:22].
- Industry Air file columns: Industry (English) / Industrie (Anglais); Industry (French) / Industrie (Français); Year / Année; NAICS Number / Numéro SCIAN; Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes); Facility Count / Nombres d'installations. [frame excel-loading-data-into-excel @00:52, @01:52]

## Pitfalls
- A CSV opened directly is just a sheet: no table features, and saving it back as .csv loses formatting (yellow "POSSIBLE DATA LOSS" bar). Save as an Excel workbook. [frame excel-loading-data-into-excel @00:52]
- Mac users may find From Text/CSV in a different place ("down in this column"); look under Get Data. [video excel-loading-data-into-excel @01:10]
- The full `NPRI-INRP_ReleasesRejets_1993-present.csv` ("Million Row data set") is challenging in Excel; the course uses the smaller 2024 and Industry Air files for Excel work. [video excel-data-and-variable-types @06:50]
- The 2024 file loads with 49 conversion errors in "ID INRP / NPRI ID" (and in "Année / Year" until fixed) - see [Check and fix data types](check-and-fix-data-types-power-query.md).

## Related
- [Power Query Editor basics](power-query-editor-basics.md)
- [Check and fix data types in Power Query](check-and-fix-data-types-power-query.md)
- [Filter rows in Power Query](filter-rows-power-query.md)
- [Create a PivotTable](create-pivottable-summarize-filter-sort.md)
- Dataset notes: [NPRI](../../datasets/npri.md)
- Transcript: [Excel - Loading data into Excel](../../transcripts/excel/excel-loading-data-into-excel.md)
