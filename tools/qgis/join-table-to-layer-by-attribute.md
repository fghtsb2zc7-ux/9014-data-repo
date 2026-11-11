---
id: qgis.join-table-to-layer-by-attribute
tool: qgis
title: Join a non-spatial table to a point layer by a shared ID (Layer Properties > Joins)
keywords: [attribute join, table join, join by field, vector join, Add Vector Join, Layer Properties Joins, join CSV to layer, no geometry, attribute only table, spatial join (course term), PWQMN, STATION, Collection Site, join field, target field, one-to-one, Join attributes by field value]
software_context: "QGIS 3.22 (3.22.3-Białowieża, Windows) - Layer Properties > Joins; Data Source Manager | Delimited Text"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-spatial-joins.md, timestamps: "00:06-08:36"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md, course-pages/case-study-8.md]
datasets_used: [sources/files/PWQMN_Stations.csv, sources/files/PWQMN_data_2024.csv]
---
# Join a non-spatial table to a point layer by a shared ID (Layer Properties > Joins)

## Purpose
Gives a table without coordinates (PWQMN 2024 sampling results) a location by linking it to a point layer (PWQMN stations) through a common ID column. The instructor calls this a "spatial join"; technically it is an attribute (table) join (checklist item 23 "I can join a non-spatial table to a spatial layer using a shared attribute using Join"). The join is stored on the target layer, not written to a new file. [page technical-skills-checklist.md]

## Steps
1. `Layer > Add Layer > Add Delimited Text Layer...` (Ctrl+Shift+T). In "Data Source Manager | Delimited Text" click `...` next to `File name` and choose `PWQMN_Stations.csv`; `Layer name` = `PWQMN_Stations`; File Format `CSV (comma separated values)`; Geometry Definition `Point coordinates` with `X field` = `LONGITUDE`, `Y field` = `LATITUDE`; `Geometry CRS` = `EPSG:4326 - WGS 84`; click `Add`. [video qgis-spatial-joins @01:18] [frame @01:02-01:22]
2. (Optional) add a basemap (QuickMapServices > Google Maps). [video qgis-spatial-joins @01:18-01:51]
3. Inspect the key: right-click `PWQMN_Stations` > `Open Attribute Table`; `STATION` is the unique station code (2198 features). [video qgis-spatial-joins @01:51-02:24] [frame @02:12]
4. Add the results table: `Layer > Add Layer > Add Delimited Text Layer...`, `File name` = `PWQMN_data_2024.csv` (`Layer name` `PWQMN_data_2024`). X/Y are blank ("X and Y field names must be selected") because the file has no coordinates - set Geometry Definition to `No geometry (attribute only table)`; click `Add`, then `Close`. [video qgis-spatial-joins @02:24-03:01] [frame @02:52-03:02]
5. Open its attribute table: 112,392 rows; the station code column is `Collection Site` (different name from `STATION`); `Analyte` holds the parameter and `Results` the value. [video qgis-spatial-joins @03:36-04:13] [frame @03:42]
6. Reduce the table to one analyte before joining: right-click `PWQMN_data_2024` > `Filter...`; in "Query Builder" double-click `Analyte` in Fields, click `=`, click `All` under Values, type `phos` in the Values search, double-click `Phosphorus; phosphate`; the expression reads `"Analyte" = 'Phosphorus; phosphate'`; click `Test` (≈3600 rows), then `OK`. A filter icon appears next to the layer. [video qgis-spatial-joins @04:51-05:42] [frame @05:12-05:42]
7. Right-click the TARGET (spatial) layer `PWQMN_Stations` > `Properties...` > `Joins` tab (in the left list). Click the green `+` button at the bottom. [video qgis-spatial-joins @05:42-06:06] [frame @06:02]
8. In "Add Vector Join" set: `Join layer` = `PWQMN_data_2024`; `Join field` = `Collection Site`; `Target field` = `STATION`. Leave `Cache join layer in memory` checked, `Dynamic form` unchecked, `Editable join layer` unchecked, `Joined fields` unchecked (= join all fields), `Custom field name prefix` unchecked (default prefix = join layer name + `_`). Click `OK`. [video qgis-spatial-joins @06:06-06:42] [frame @06:12-06:32]
9. The Joins list shows "Join layer PWQMN_data_2024"; click `Apply`, then `OK`. [frame @06:42]
10. Open the `PWQMN_Stations` attribute table and scroll right: new columns `PWQMN_data_2024_<field>` are filled where a station matched, NULL elsewhere. [video qgis-spatial-joins @06:42-07:19] [frame @06:52-07:12]
11. (Optional map) `Properties...` > `Symbology` > `Categorized`, `Value` = `PWQMN_data_2024_Results`, `Classify`, `Apply`; uncheck the empty/NULL category in the legend to show only stations with phosphate values. [video qgis-spatial-joins @07:19-08:20] [frame @07:32-08:22]

## Formulas / expressions / code
Filter expression on the results table (Query Builder, "Provider Specific Filter Expression"):
```
"Analyte" = 'Phosphorus; phosphate'
```
- `"Analyte"` - field name in double quotes; `'Phosphorus; phosphate'` - exact text value in single quotes (the semicolon is part of the value).

## Verify
- `PWQMN_Stations` table still shows "Features Total: 2198" and now has columns such as `PWQMN_data_2024_Analyte` = `Phosphorus; phosphate`, `PWQMN_data_2024_Results` = `0.004`, `PWQMN_data_2024_Units` = `mg/L`, `PWQMN_data_2024_Result Call` = `Detected`. [frame @06:52-07:12]
- Identify on a station lists the `PWQMN_data_2024...` fields. [frame qgis-join-attributes-by-location @01:42]

## Pitfalls
- Join on the spatial layer (`PWQMN_Stations`), not on the table; the target layer is the one whose Properties you open. [video qgis-spatial-joins @05:42]
- The key columns have different names (`Collection Site` vs `STATION`); you must pick both explicitly. [video qgis-spatial-joins @03:36, @06:06]
- Filter first: joining all 112,392 rows/analytes "would probably crash QGIS". [video qgis-spatial-joins @04:13]
- A Layers Properties join is one-to-one: each station takes only the FIRST matching row, so the row count stays 2198 even though there are ~3600 phosphate measurements. For one feature per measurement use `Join attributes by field value` with the one-to-many option (general knowledge — not shown in course). [frame @06:52]
- `Results` comes in as text because some values contain `<` (e.g. `<0.003`); convert before graduated symbology - see [transcripts/qgis/qgis-changing-column-types.md](../../transcripts/qgis/qgis-changing-column-types.md). [video qgis-spatial-joins @07:19-07:52]
- The join is virtual: it lives in the project. Export the layer (Save Features As / CSV) to keep the joined columns in a file (general knowledge — not shown in course; see [transcripts/qgis/qgis-exporting-attribute-table-to-csv.md](../../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md)).
- `STATION` has 10 duplicated IDs in the stations file [page ../../datasets/pwqmn.md] - matched results appear on both duplicates.

## Related
- [join-attributes-by-location.md](join-attributes-by-location.md) - next video: add EcoDistrict info to the stations
- Dataset notes: [../../datasets/pwqmn.md](../../datasets/pwqmn.md)
- [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md), [field-calculator-change-column-type.md](field-calculator-change-column-type.md) (make `Results` numeric), [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
- Delimited text loading: [transcripts/qgis/qgis-adding-a-delimited-text-layer.md](../../transcripts/qgis/qgis-adding-a-delimited-text-layer.md); filtering: [transcripts/qgis/qgis-basic-filter-in-qgis.md](../../transcripts/qgis/qgis-basic-filter-in-qgis.md)
