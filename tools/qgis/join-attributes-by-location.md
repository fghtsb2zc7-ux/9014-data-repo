---
id: qgis.join-attributes-by-location
tool: qgis
title: Add polygon attributes to points that fall inside them with Join attributes by location
keywords: [join attributes by location, spatial join, point in polygon, intersects, within, contains, geometric predicate, one-to-many, one-to-one, ecodistrict, ecoregion, native:joinattributesbylocation, discard records, joined field prefix, overlay attributes]
software_context: "QGIS 3.22 (3.22.3-Białowieża, Windows), Processing Toolbox algorithm 'Join attributes by location' (group Vector general)"
prerequisites: [qgis.join-table-to-layer-by-attribute]
source_videos:
  - {video: transcripts/qgis/qgis-join-attributes-by-location.md, timestamps: "00:05-03:15"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: [sources/files/PWQMN_Stations.csv, "sources/files/Topic 5.zip (Topic 5/EcoDistrict/EcoDistrict.shp, Ontario ecodistricts, EPSG:4269)"]
---
# Add polygon attributes to points that fall inside them with Join attributes by location

## Purpose
Creates a new layer: a copy of a base layer (PWQMN stations) whose attribute table gains the attributes of the features of a join layer (EcoDistrict polygons) that satisfy a spatial relationship (intersects). Each station gets its ecodistrict, ecoregion and ecozone (checklist item 26 "I can use Join Attributes by Location to connect features that intersect or occur within one another"). [page technical-skills-checklist.md]

## Steps
1. Have the point layer loaded (`PWQMN_Stations`, EPSG:4326; in the video it already carries the joined phosphate results and a numeric `phosphate` field). [video qgis-join-attributes-by-location @00:05] [frame @00:12]
2. Add the polygon layer: drag `EcoDistrict/EcoDistrict.shp` into the map (layer `EcoDistrict`, EPSG:4269). Move it below the points in the Layers panel. [video qgis-join-attributes-by-location @00:43-01:18] [frame @00:52, @01:42]
3. (Optional) Identify a polygon to see the fields to be pulled: `ECODISTRIC` (e.g. Stratford), `ECODISTR_1` (6E-1), `ECOREGION_` (Lake Simcoe - Rideau), `ECOREGIO_1`, `ECOZONE_NA` (Mixedwood Plains), `OGF_ID`, ... [frame @01:02]
4. Open the Processing Toolbox (gear icon), type `join attr`, double-click `Vector general > Join attributes by location` (not "Join attributes by location (summary)"). Dialog title `Join Attributes by Location`. [video qgis-join-attributes-by-location @01:56] [frame @01:52-02:02]
5. `Base Layer` (called `Join to features in` in newer QGIS versions - general knowledge): `PWQMN_Stations [EPSG:4326]` - the layer that receives the attributes. [frame @02:22]
6. `Join Layer` (`By comparing to` in newer versions): `EcoDistrict [EPSG:4269]` - the layer the attributes come from. [frame @02:22]
7. `Geometric predicate`: keep only `intersects` checked (overlaps, contains, within, equals, crosses, touches unchecked). [video qgis-join-attributes-by-location @01:56-02:35] [frame @02:22-02:32]
8. `Fields to add (leave empty to use all fields) [optional]`: leave `0 options selected` (all EcoDistrict fields). [frame @02:22]
9. `Join type`: leave `Create separate feature for each matching feature (one-to-many)`. [frame @02:22]
10. Leave `Discard records which could not be joined` unchecked and `Joined field prefix [optional]` empty; `Joined layer [optional]` = `[Create temporary layer]`. [frame @02:22]
11. Click `Run`. Log: "JOINED_COUNT : 2134"; a new layer `Joined layer` appears. Click `Close`. [video qgis-join-attributes-by-location @02:35] [frame @02:42]
12. Right-click `Joined layer` > `Open Attribute Table`, scroll right to the EcoDistrict columns. [video qgis-join-attributes-by-location @02:35-03:15] [frame @02:52-03:12]

## Formulas / expressions / code
Parameters as logged (Log tab):
```
{ 'DISCARD_NONMATCHING' : False, 'INPUT' : '...PWQMN_Stations.csv...', 'JOIN' : '.../EcoDistrict/EcoDistrict.shp',
  'JOIN_FIELDS' : [], 'METHOD' : 0, 'OUTPUT' : 'TEMPORARY_OUTPUT', 'PREDICATE' : [0], 'PREFIX' : '' }
Results: { 'JOINED_COUNT' : 2134, 'OUTPUT' : 'Joined_layer_...' }
```
- `PREDICATE [0]` = intersects; `METHOD 0` = one-to-many; `JOIN_FIELDS []` = all fields; `DISCARD_NONMATCHING False` keeps stations outside every polygon (with NULLs).

## Verify
- "Joined layer — Features Total: 2198" (all stations kept), with columns `OGF_ID`, `ECODISTRIC`, `ECODISTR_1`, `ECOREGION_`, `ECOREGIO_1`, `ECOZONE_NA`, `GEOMETRY_U`, `EFFECTIVE_`, `SYSTEM_DAT`, `OBJECTID`, `SHAPEAREA`, `SHAPELEN` appended; e.g. sorting by `phosphate` shows ecodistricts Niagara, Kemptville, St. Thomas, Picton ... [frame @02:52-03:12]
- 2134 stations joined; the rest (outside the EcoDistrict coverage) have NULL ecodistrict fields. [frame @02:42]

## Pitfalls
- Log warning "No spatial index exists for input layer, performance will be severely degraded" - for large layers create a spatial index first ([create-spatial-index.md](create-spatial-index.md)). [frame @02:42]
- Base and join layers were in different CRSs (EPSG:4326 vs EPSG:4269); QGIS handled it, but matching CRSs is safer (general knowledge — not shown in course).
- One-to-many: if a point touched two polygons (e.g. on a shared border) it is duplicated; choose `Take attributes of the first matching feature only (one-to-one)` to prevent duplicates (general knowledge — not shown in course).
- Do not confuse with `Join attributes by location (summary)`, which aggregates (sum/mean ...) values (general knowledge — not shown in course).
- Output is temporary; export the table to CSV for R/Excel (next video [transcripts/qgis/qgis-exporting-attribute-table-to-csv.md](../../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md)). [video qgis-join-attributes-by-location @03:15]

## Related
- [join-table-to-layer-by-attribute.md](join-table-to-layer-by-attribute.md) - previous step (results joined to stations)
- [join-attributes-by-nearest.md](join-attributes-by-nearest.md) - join by proximity instead of overlap
- [create-spatial-index.md](create-spatial-index.md)
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md) - export the joined table for R/Excel
- [processing-algorithms-reference.md](processing-algorithms-reference.md#join-attributes-by-location)
