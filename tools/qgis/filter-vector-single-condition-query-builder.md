---
id: qgis.filter-vector-single-condition-query-builder
tool: qgis
title: Filter a vector layer on one condition with the Query Builder (basic filter)
keywords: [filter, basic filter, query builder, provider filter, single condition, equals, greater than, year, NPRI, year of last filed report, subset, where, layer filter, Filter..., Ctrl+F]
software_context: "QGIS 3.x (newer Windows install), Layers panel right-click > Filter... (Query Builder)"
prerequisites: [qgis.add-delimited-text-layer-csv]
source_videos: [{video: transcripts/qgis/qgis-basic-filter-in-qgis.md, timestamps: "00:06-02:15"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv"]
---
# Filter a vector layer on one condition with the Query Builder

## Purpose
Temporarily restrict a layer to the features meeting one condition (e.g. NPRI facilities whose last report was filed in 2025) to make big datasets manageable [video qgis-basic-filter-in-qgis @00:06]. Checklist skill "I can filter a spatial layer using one attribute condition" [page technical-skills-checklist.md]. For several conditions see [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md).

## Steps
1. Load the NPRI geolocations CSV as a point layer (X = Longitude / Longitude, Y = Latitude / Latitude) [video qgis-basic-filter-in-qgis @00:35] — see [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md).
2. Right-click the layer in the Layers panel > **Filter...** (also `Layer > Filter...`, Ctrl+F) [video qgis-basic-filter-in-qgis @01:05].
3. "Query Builder" opens: header "Set provider filter on NPRI-INRP_GeolocationsGeolocalisation_1993-present (provider: delimitedtext)" [frame qgis-basic-filter-in-qgis @01:12].
4. In **Fields**, double-click `Year of last filed report / Ann�e de d�claration la plus r�cente`; it is inserted (in double quotes) into the **Provider Specific Filter Expression** box [frame qgis-basic-filter-in-qgis @01:22].
5. Under **Values** click **All** (or **Sample**) to list the field's values (2011 ... 2025) [video qgis-basic-filter-in-qgis @01:15] [frame qgis-basic-filter-in-qgis @01:32].
6. Click the **=** operator button, then type (or double-click) `2025` [video qgis-basic-filter-in-qgis @01:30].
7. Optional: **Test** to count matching features (button shown, not used in video).
8. Click **OK** [video qgis-basic-filter-in-qgis @01:45].

## Formulas / expressions / code
Exact expression on screen [frame qgis-basic-filter-in-qgis @01:42]:
```
"Year of last filed report / Ann�e de d�claration la plus r�cente" = 2025
```
- `"..."` double quotes = field name (exactly as QGIS displays it, including the garbled accented characters; insert it by double-clicking rather than typing).
- `= 2025` keeps rows where the field equals 2025 (numeric field, so no quotes around the value).

Variant mentioned by the instructor (not typed on screen) [video qgis-basic-filter-in-qgis @01:57]:
```
"Year of last filed report / Ann�e de d�claration la plus r�cente" > 2020
```
Operator buttons available: `=` `<` `>` `LIKE` `%` `IN` `NOT IN` `<=` `>=` `!=` `ILIKE` `AND` `OR` `NOT` [frame qgis-basic-filter-in-qgis @01:12].

## Verify
- Far fewer points on the map (only facilities that filed in 2025) [frame qgis-basic-filter-in-qgis @01:52].
- A funnel (filter) icon appears next to the layer name in the Layers panel [frame qgis-basic-filter-in-qgis @01:52].
- Attribute table "Features Total" drops accordingly.

## Pitfalls
- The filter is **temporary** (a view on the source); to keep the subset, export it (right-click > Export > Save Features As...) — see [save-layers-to-geopackage.md](save-layers-to-geopackage.md) / [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md).
- To remove the filter, reopen Filter..., click **Clear**, then OK (general knowledge — not shown in course).
- Numbers vs text: if the year column were imported as text, compare to `'2025'` in single quotes or convert the type first (general knowledge — not shown in course; see [field-calculator-change-column-type.md](field-calculator-change-column-type.md)).

## Related
- [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md)
- [expression-reference.md](expression-reference.md)
- [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md)
