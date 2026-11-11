---
id: qgis.create-shapefile-layer-and-digitize-polygon
tool: qgis
title: Create a new polygon shapefile layer and draw (digitize) features
keywords: [create layer, new shapefile layer, new vector layer, digitize, draw polygon, toggle editing, add polygon feature, study area, sampling area, trace satellite imagery, geometry type, edit mode, save edits]
software_context: "QGIS 3.x (Windows), Layer > Create Layer > New Shapefile Layer...; Digitizing toolbar"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-creating-a-new-layer.md, timestamps: "00:05-05:05"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Buckthorn observations_0.csv (Topic 5.zip > Topic 5/Buckthorn observations_0.csv)", "Topic 5.zip > Topic 5/Sampling area/Sampling area.shp", "Topic 5.zip > Topic 5/Parking lot/Parking lot.shp"]
---
# Create a new polygon shapefile layer and draw (digitize) features

## Purpose
Makes an empty shapefile with a chosen geometry type and CRS, then hand-draws features (e.g. a polygon around the buckthorn sampling site, or a parking lot traced from satellite imagery). Checklist items 20-21 [page technical-skills-checklist.md].

## Steps
1. Context layers: add `Buckthorn observations_0.csv` as delimited text (X field `x`, Y field `y`, `EPSG:4326 - WGS 84`), `Add`, `Close`; add a basemap (Google Road via QuickMapServices) [video qgis-creating-a-new-layer @00:05] [frame @00:22-00:32].
2. `Layer > Create Layer > New Shapefile Layer...` [video @00:21-00:40] [frame @03:42].
3. In "New Shapefile Layer", click the `...` button right of `File name` [video @00:40] [frame @00:42].
4. In "Save Layer As", create a new folder for the shapefile (course: `Sampling area` inside `Topic 5`), open it, set `File name` `Sampling area`, Save as type `ESRI Shapefile (*.shp *.SHP)`, click `Save` [video @00:40] [frame @00:52]. File name becomes `...\Topic 5\Sampling area\Sampling area.shp` [frame @01:02].
5. `File encoding`: `UTF-8` (default) [frame].
6. `Geometry type`: `Polygon` (Point / Line are alternatives) [video @00:40-01:14] [frame @01:12].
7. `Additional dimensions`: `None`; CRS: `EPSG:4326 - WGS 84` (same as the project) [video @01:14] [frame @01:12].
8. Fields: keep the default `id | Integer | 10` in Fields List (no new fields added in the course) [frame @00:42].
9. `OK`. Layer `Sampling area` appears in the Layers panel [frame @01:22].
10. With the layer selected, click the pencil `Toggle Editing` button (status bar: "Toggles the editing state of the current layer") [video @01:14] [frame @01:22, @02:12].
11. Click `Add Polygon Feature` on the Digitizing toolbar [video @01:14] [frame @01:22].
12. Left-click vertices around the area (outside all sample points) [video @01:14-01:57] [frame @01:32-01:52].
13. Right-click to close the polygon [video @01:57].
14. In the feature attribute prompt enter `id` = `1`, `OK` [video @01:57].
15. Optional: drag the layer below the points in the Layers panel so points draw on top [video @01:57] [frame @02:12].
16. Click `Toggle Editing` again to stop editing and confirm saving when asked [video @01:57-02:36].
17. The shapefile is now on disk; you can remove and drag it back in from the folder [video @01:57-02:36] [frame @02:22-02:32].
18. Repeat for other features: e.g. switch basemap to `ESRI Satellite`, `Layer > Create Layer > New Shapefile Layer...`, new folder `Parking lot`, file `Parking lot.shp`, `Polygon`, EPSG:4326, `OK`, Toggle Editing, Add Polygon Feature, trace, right-click, `id` = `2` [video @02:36-04:28] [frame @03:22-04:22].

## Formulas / expressions / code
None.

## Verify
- Folder contains the shapefile (e.g. `Topic 5/Sampling area/Sampling area.shp`, `.dbf`, `.prj`, `.shx`, `.cpg`; matching files are in the course `Topic 5.zip`, per the zip listing `_raw/extracted/Topic 5.zip.contents.md`) [page topic-5-connecting-data-joins-merges-and-spatial-relationships.md].
- Polygon(s) draw after re-adding the file; editing pencil is off [frame @02:32].

## Pitfalls
- Close the polygon with a right-click, not a double-click [video @01:57].
- Stop editing (Toggle Editing) and save, or the drawn features are not written to the file [video @01:57].
- EPSG:4326 is in degrees: reproject before measuring area/perimeter/distance [video @04:28] → [reproject-vector-layer.md](reproject-vector-layer.md), [add-geometry-attributes-area-perimeter.md](add-geometry-attributes-area-perimeter.md).
- The ID prompt dialog itself was not captured in frames; its title/fields are from the transcript only.

## Related
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [add-geometry-attributes-area-perimeter.md](add-geometry-attributes-area-perimeter.md)
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
- Transcript: [QGIS - Creating a new layer](../../transcripts/qgis/qgis-creating-a-new-layer.md)
