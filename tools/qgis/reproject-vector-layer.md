---
id: qgis.reproject-vector-layer
tool: qgis
title: Reproject a vector layer to a metre-based CRS (Reproject Layer)
keywords: [reproject, reprojection, transform, change CRS, coordinate reference system, projection, EPSG, 4326, 3162, 26917, UTM zone 17N, Ontario MNR Lambert, metres, meters, project CRS, Reproject Layer, native:reprojectlayer, NAD83]
software_context: "QGIS 3.44 (3.44.13-Solothurn, Windows), Processing algorithm 'Reproject layer' (toolbox group Vector general)"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-reprojecting-a-vector-layer.md, timestamps: "00:06-02:30"}
  - {video: transcripts/qgis/qgis-join-attributes-by-nearest.md, timestamps: "00:44-03:15"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 5.zip (Topic 5/Parking lot/Parking lot.shp)", "sources/files/Buckthorn observations_0.csv (also in Topic 5.zip)"]
---
# Reproject a vector layer to a metre-based CRS (Reproject Layer)

## Purpose
Layers loaded from latitude/longitude (EPSG:4326 - WGS 84) measure in degrees, so areas, perimeters and distances are meaningless. Reprojecting creates a NEW layer with the same features and attributes but geometries in a projected CRS measured in metres. The course uses EPSG:3162 (Ontario-wide) or EPSG:26917 (UTM zone 17N, southwestern Ontario). Do this before Add geometry attributes, Shortest line between features, Join attributes by nearest, buffers, etc.

## Steps
1. Load the layer (e.g. drag `Parking lot.shp` into the map, or add `Buckthorn observations_0.csv` as a delimited text layer with x/y fields and CRS EPSG:4326). [video qgis-reprojecting-a-vector-layer @00:06] [video qgis-join-attributes-by-nearest @00:05]
2. Check its current CRS: right-click the layer > `Properties...` > `Information` tab > section "Coordinate Reference System (CRS)" > Name (shows `EPSG:4326 - WGS 84`, Units "Geographic (uses latitude and longitude for coordinates)"). Click `OK`. [video qgis-reprojecting-a-vector-layer @00:45] [video qgis-join-attributes-by-nearest @00:52] [frame]
3. (Optional, done in the Buckthorn video) Set the project CRS so the map and new layers use metres: click the CRS button at the right end of the status bar (shows `EPSG:4326`) to open `Project Properties — CRS`; under "Recently Used Coordinate Reference Systems" (or by typing in `Filter`) select `EPSG:26917 - NAD83 / UTM zone 17N` (properties panel shows "Units: meters"); click `OK`. The status bar now shows `EPSG:26917`; a yellow bar "Used a ballpark transform from EPSG:4326 to EPSG:26917" may appear and can be closed. [video qgis-join-attributes-by-nearest @01:22-02:12] [frame]
4. Open the tool: menu `Vector > Data Management Tools > Reproject Layer...` (or Processing Toolbox search `reproject` > `Vector general > Reproject layer`). Dialog title: `Vector General - Reproject Layer`. [video qgis-reprojecting-a-vector-layer @01:22] [frame]
5. `Input layer`: the layer to reproject, e.g. `Parking lot [EPSG:4326]` or `Buckthorn observations_0 [EPSG:4326]`. Leave `Selected features only` unchecked. [frame @01:42]
6. `Target CRS`: open the drop-down and choose
   - `EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert` (parking lot example), or
   - `Project CRS: EPSG:26917 - NAD83 / UTM zone 17N` (buckthorn example, after step 3).
   If the CRS is not in the list, click the globe button to the right of the drop-down and search by EPSG code (general knowledge — not shown in course). [video qgis-reprojecting-a-vector-layer @01:42-01:52] [video qgis-join-attributes-by-nearest @02:41-03:02] [frame]
7. Leave `Convert curved geometries to straight segments` unchecked. Under `Advanced Parameters > Coordinate operation [optional]` leave the default first (highlighted) transformation, e.g. "Inverse of NAD83 to WGS 84 (1) + UTM zone 17N". [frame @03:02 nearest video]
8. Leave the output as `[Create temporary layer]` and click `Run`. The `Log` tab shows "Execution completed" and the progress bar reads "Complete". [frame @02:02]
9. Click `Close`. A new temporary layer named `Reprojected` is added to the Layers panel; it draws exactly on top of the original. [video qgis-reprojecting-a-vector-layer @02:00]

## Formulas / expressions / code
Parameters recorded in the Log tab (parking lot run):
```
{ 'CONVERT_CURVED_GEOMETRIES' : False, 'INPUT' : '.../Topic 5/Parking lot/Parking lot.shp',
  'OPERATION' : '+proj=pipeline ...', 'OUTPUT' : 'TEMPORARY_OUTPUT',
  'TARGET_CRS' : QgsCoordinateReferenceSystem('EPSG:3162') }
```
- `TARGET_CRS` is the CRS chosen in step 6; `OUTPUT : TEMPORARY_OUTPUT` = memory layer named `Reprojected`.

## Verify
- Right-click `Reprojected` > `Properties...` > `Information`: Provider `memory`, CRS Name `EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert` (or `EPSG:26917 - NAD83 / UTM zone 17N`, Units `meters`, Type Projected); Feature count equals the original (1 for the parking lot, 53 for the buckthorn plots). [frame @02:22] [frame nearest @03:12]
- The original layer still reports EPSG:4326 - reprojection never changes the source layer. [video qgis-reprojecting-a-vector-layer @02:00]

## Pitfalls
- The map still looks identical: QGIS draws every layer on-the-fly in the project CRS, so you must check Layer Properties > Information, not the map. [video qgis-reprojecting-a-vector-layer @02:00]
- `Reprojected` is a temporary (memory) layer - it is lost when QGIS closes. Export/save it (right-click > Export > Save Features As..., or make permanent) if you need it later (general knowledge — not shown in course; see the GeoPackage video [transcripts/qgis/qgis-saving-working-layers-to-geopackages.md](../../transcripts/qgis/qgis-saving-working-layers-to-geopackages.md)).
- A local projected CRS distorts the rest of the globe (UTM 17N only fits a narrow strip of longitude); that is expected. [video qgis-join-attributes-by-nearest @02:00]
- Several layers named `Reprojected` can pile up; rename them (right-click > `Rename Layer`) to keep track (general knowledge — not shown in course).

## Related
- [add-geometry-attributes-area-perimeter.md](add-geometry-attributes-area-perimeter.md) - next step in the parking-lot video
- [join-attributes-by-nearest.md](join-attributes-by-nearest.md), [measure-distance-shortest-line-between-features.md](measure-distance-shortest-line-between-features.md) - next steps in the buckthorn video
- [processing-algorithms-reference.md](processing-algorithms-reference.md#reproject-layer)
- CRS basics: [transcripts/qgis/qgis-crs.md](../../transcripts/qgis/qgis-crs.md); project CRS: [set-project-crs.md](set-project-crs.md); rasters: [reproject-raster-warp.md](reproject-raster-warp.md)
- Loading inputs: [add-shapefile-drag-and-drop.md](add-shapefile-drag-and-drop.md), [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md); the parking lot polygon was drawn in [create-shapefile-layer-and-digitize-polygon.md](create-shapefile-layer-and-digitize-polygon.md)
- Saving temporary outputs: [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
