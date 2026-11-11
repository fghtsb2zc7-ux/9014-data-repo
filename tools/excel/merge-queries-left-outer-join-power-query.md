---
id: excel.merge-queries-left-outer-join-power-query
tool: excel
title: Merge two tables with Power Query (Merge Queries, Left Outer join) and expand the matched columns
keywords: [merge queries, join, left outer join, lookup, combine tables, add station coordinates, key column, Table.NestedJoin, Table.ExpandTableColumn, JoinKind.LeftOuter, expand column, join kind, fuzzy matching, PWQMN, water quality stations, vlookup alternative, power query]
software_context: "Excel for Microsoft 365 (Windows), Power Query Editor > Home > Combine > Merge Queries"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-merging-data.md, timestamps: "00:05-04:34"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/PWQMN_Stations.csv", "sources/files/PWQMN_data_2024.csv", "sources/files/Topic 5.zip > Topic 5/PWQMN_Stations.csv, Topic 5/PWQMN_data_2024.csv"]
---
# Merge two tables with Power Query (Merge Queries, Left Outer join) and expand the matched columns

## Purpose
Add columns from one table to another by matching a shared key, e.g. add each monitoring station's name, description, latitude and longitude to every 2024 water-quality measurement so the result can be mapped in QGIS or analysed in R. Key columns may have different names (here `Collection Site` ↔ `STATION`) but must hold the same values. Checklist items 27-28 [page technical-skills-checklist.md].

## Steps
### A. Load both CSVs
1. `Data > Get & Transform Data > From Text/CSV`, select `PWQMN_Stations` (folder "Topic 5"), **Import**, then **Load**. Sheet "PWQMN_Stations": 2,198 rows loaded. [video excel-merging-data @00:05; frame @00:22, @00:32]
2. Repeat for `PWQMN_data_2024`: preview dialog "PWQMN_data_2024.csv" (File Origin "1252: Western European (Windows)", Delimiter "Comma", Data Type Detection "Based on first 200 rows") > **Load**. 112,392 rows loaded. [video @00:32; frame @00:42, @00:52]

### B. Merge in Power Query
3. Open the editor: `Data > Get & Transform Data > Get Data > Launch Power Query Editor...`. Both queries appear in the Queries pane. [video @00:57; frame @01:02, @01:12]
4. In the Queries pane click the **big table you want to keep all rows of** first: `PWQMN_data_2024` (the measurements). [video @01:23-01:52; frame @02:02]
5. Click `Home > Combine > Merge Queries`. [video @01:13; frame @01:12] (Its dropdown arrow also offers "Merge Queries as New", which puts the result in a new query instead of modifying this one — general knowledge — not shown in course.)
6. In the "Merge" dialog ("Select a table and matching columns to create a merged table."), the top preview is `PWQMN_data_2024`. In the second dropdown choose `PWQMN_Stations`. [frame @02:02, @02:12]
7. Click the `Collection Site` column header in the top preview, then the `STATION` column header in the bottom preview (both highlight). [video @02:05; frame @02:32]
8. **Join Kind**: leave `Left Outer (all from first, matching from second)`. Leave "Use fuzzy matching to perform the merge" unticked. [video @02:27; frame @02:32]
9. Check the match message: "✓ The selection matches 112126 of 112392 rows from the first table." Click **OK**. [frame @02:32]
10. A new column `PWQMN_Stations` filled with `Table` appears at the far right; step "Merged Queries". [video @02:47; frame @02:52, @03:02]
11. Click the expand icon (two arrows) in the `PWQMN_Stations` header. In the popup keep **Expand** selected, untick everything except `NAME`, `DESCRIPTION`, `LATITUDE`, `LONGITUDE` (untick STATION, STATUS, FIRST_YEAR, LAST_YEAR, TOTAL_YEARS, MISS_YEARS). "Use original column name as prefix" was left ticked. Click **OK**. [video @03:01-03:15; frame @03:12]
12. New columns `PWQMN_Stations.NAME`, `PWQMN_Stations.DESCRIPTION`, `PWQMN_Stations.LATITUDE`, `PWQMN_Stations.LONGITUDE`; step "Expanded PWQMN_Stations". [frame @03:22]
13. `Home > Close & Load`. The PWQMN_data_2024 sheet refreshes ("Running background query...") and shows the new columns. [video @03:15; frame @03:32, @03:42]

## Formulas / expressions / code
```
= Table.NestedJoin(#"Changed Type", {"Collection Site"}, PWQMN_Stations, {"STATION"}, "PWQMN_Stations", JoinKind.LeftOuter)
```
Merged Queries: left table = previous step of PWQMN_data_2024, key `Collection Site`; right table = query `PWQMN_Stations`, key `STATION`; new nested-table column named `PWQMN_Stations`; left outer join.
```
= Table.ExpandTableColumn(#"Merged Queries", "PWQMN_Stations", {"NAME", "DESCRIPTION", "LATITUDE", "LONGITUDE"}, {"PWQMN_Stations.NAME", ...
```
Expanded PWQMN_Stations: pulls the four chosen columns out of the nested table, prefixed with the query name (line cut off on screen).

Join kinds: the dialog's default "Left Outer (all from first, matching from second)" is the only one used in the course. Other options in the Join Kind dropdown (general knowledge — not shown in course): Right Outer (all from second, matching from first), Full Outer (all rows from both), Inner (only matching rows), Left Anti (rows only in first), Right Anti (rows only in second). Left Anti is the Excel analogue of R's `anti_join()` for finding unmatched records.

## Verify
- Match message before OK: 112126 of 112392 rows matched (266 measurement rows have no station; their new columns will be `null`). [frame @02:32]
- After loading, the right-hand columns show station names and coordinates repeated on every row from the same station (e.g. Big Carp River, At Herkimer Street Sault Ste Marie, 46.50622927, -84.44987174). [frame @03:42]

## Pitfalls
- **Start from the correct query.** The query selected when you click Merge Queries is the "first" (left) table. The instructor first opened Merge from PWQMN_Stations, cancelled, and restarted from PWQMN_data_2024. [video @01:18-01:52; frame @01:22]
- **Row count grew from 112,392 to 114,624 rows** after the merge. Cause: `STATION` is not unique in PWQMN_Stations.csv (2,198 rows, only 2,188 distinct STATION values), so measurements at duplicated stations match two station rows and are duplicated. Remove duplicate stations first (Home > Reduce Rows > Remove Rows > Remove Duplicates on STATION in the stations query) if one row per measurement is required. [frame @03:42; dataset schema _raw/extracted/PWQMN_Stations.csv.schema.md] (fix is general knowledge — not shown in course)
- After the merge the loaded rows are reordered (grouped by Collection Site), not in `_id` order; sort by `_id` if order matters. [frame @03:52]
- Key columns must have the same data type (both whole numbers here: `Collection Site` Int64, `STATION` Int64). A text-vs-number mismatch gives zero matches (general knowledge — not shown in course). [frame @01:12, @01:22]
- The ASR transcript says "tech CSV" = **Text/CSV**.

## Related
- [Remove duplicates (fix duplicated keys)](remove-rows-blanks-duplicates-power-query.md)
- [Import CSV](import-csv-as-table-power-query.md), [Power Query Editor basics](power-query-editor-basics.md)
- [Pivot / unpivot columns](pivot-unpivot-columns-power-query.md)
- R equivalent: [../r-positron/join-tables.md](../r-positron/join-tables.md)
- QGIS join: [../qgis/join-attributes-by-nearest.md](../qgis/join-attributes-by-nearest.md)
- Transcript: [../../transcripts/excel/excel-merging-data.md](../../transcripts/excel/excel-merging-data.md)
