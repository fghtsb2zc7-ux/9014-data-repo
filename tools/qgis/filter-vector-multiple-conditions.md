---
id: qgis.filter-vector-multiple-conditions
tool: qgis
title: Filter a vector layer on multiple conditions (AND, IN, !=) in the Query Builder
keywords: [filter, query builder, provider filter, multiple conditions, AND, OR, IN, NOT IN, not equal, subset, where clause, NPRI, province, NAICS, breweries, layer filter]
software_context: "QGIS 3.x (Windows), Layers panel right-click > Filter... (Query Builder)"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-filter-vector-data-for-multiple-conditions.md, timestamps: "00:05-06:00"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv"]
---
# Filter a vector layer on multiple conditions (AND, IN, !=) in the Query Builder

## Purpose
Temporarily restricts which features of a layer are shown/used, combining conditions on several fields (e.g. NPRI facilities in Ontario or Alberta that are breweries). The filter is a layer setting, not a new dataset (checklist item 13 asks you to distinguish the two; to make it permanent, export the filtered layer — see [export-layer-to-csv-or-shapefile](export-layer-to-csv-or-shapefile.md)) [page technical-skills-checklist.md].

## Steps
1. Load the NPRI geolocation CSV: `Layer > Add Layer > Add Delimited Text Layer...`, file `NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv`, `Point coordinates`, X field `Longitude / Longitude`, Y field `Latitude / Latitude`, Geometry CRS `EPSG:4326 - WGS 84`, `Add` [video qgis-filter-vector-data-for-multiple-conditions @00:05] [frame @00:32]. (Full loading procedure: [QGIS - Adding a delimited text layer](../../transcripts/qgis/qgis-adding-a-delimited-text-layer.md).)
2. Optional basemap: Search QMS panel > `ESRI Gray (light)` > `Add` [frame @00:52].
3. Right-click the layer in the Layers panel > `Filter...` [frame @01:02]. The "Query Builder" opens ("Set provider filter on ... (provider: delimitedtext)").
4. First condition: double-click field `Province / Province` in "Fields", click operator `=`, click `All` under "Values", double-click `ON`. Expression: `"Province / Province" = 'ON'` [video @00:51-01:34] [frame @01:32]. `Test` → "The where clause returned 4394 row(s)." [frame @01:32].
5. Click the `AND` operator button [video @01:34].
6. Second condition: double-click field `NAICS Code Title (English) / Titre Code SCIAN (Anglais)`, click `=`, click `All`, scroll and double-click `Breweries` [video @01:34-02:14] [frame @02:12-02:22].
   Expression: `"Province / Province" = 'ON'  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'`
7. `Test` (transcript: 8 rows = Ontario breweries) [video @02:14].
8. To include several provinces, replace `=` with `IN` and list values in brackets separated by commas, typing the brackets/commas yourself: `"Province / Province" IN ('AB','ON')` [video @02:53-04:10] [frame @04:12].
9. Keep `AND` and the NAICS condition: final expression
   `"Province / Province" IN ('AB','ON')  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'` [frame @04:42]. `Test` (transcript: 10 rows) [video @04:46].
10. For "everything except", swap `=` for `!=`: `... AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" != 'Breweries'` [video @04:46-05:23] [frame @05:12].
11. Click `OK` to apply the filter to the layer (general knowledge — the video ends before OK is clicked, but OK is the apply button shown on the dialog) [frame].
12. To start over, click `Clear` in the Query Builder [video @03:34] [frame @03:52].

## Formulas / expressions / code
```
"Province / Province" = 'ON'
```
Field names in double quotes, text values in single quotes [frame @01:32].
```
"Province / Province" = 'ON'  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'
```
Both conditions must be true [frame @02:22].
```
"Province / Province" IN ('AB','ON')  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'
```
`IN (...)` = value is in the set (same idea as `%in%` in R) [video @02:53].
```
"Province / Province" IN ('AB','ON')  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" != 'Breweries'
```
`!=` = does not equal [frame @05:12]. Other buttons on the dialog: `<` `>` `<=` `>=` `LIKE` `ILIKE` `%` `NOT IN` `OR` `NOT` — see [expression-reference.md](expression-reference.md).

## Verify
- `Test` shows "The where clause returned N row(s)." (4394 for Ontario only; 8 for Ontario breweries and 10 for AB+ON breweries per the transcript) [frame @01:32] [video @02:14, @04:46].
- After OK, the layer shows a filter icon in the Layers panel and only matching points draw [frame @01:32 shows the funnel icon beside the layer name].

## Pitfalls
- After a filter is applied, the "Values" list only shows values from the filtered features (only `ON` appeared); tick `Use unfiltered layer` or `Clear` and rebuild, or type the value manually (e.g. `'AB'`) [video @02:53-03:34] [frame @03:32].
- Click the field before the value: inserting a value first produced `'Breweries'"NAICS Code Title..."`, which had to be deleted [video @04:10] [frame @04:32].
- `IN` needs brackets and commas typed manually [video @03:34-04:10].
- Long expressions scroll horizontally in the box; check the whole text before Test [frame].

## Related
- [field-calculator-if-statement.md](field-calculator-if-statement.md)
- [expression-reference.md](expression-reference.md)
- Single-condition filter: [QGIS - Basic filter in QGIS](../../transcripts/qgis/qgis-basic-filter-in-qgis.md)
- Transcript: [QGIS - Filter vector data for multiple conditions](../../transcripts/qgis/qgis-filter-vector-data-for-multiple-conditions.md)
