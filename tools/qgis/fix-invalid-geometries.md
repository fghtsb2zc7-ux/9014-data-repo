---
id: qgis.fix-invalid-geometries
tool: qgis
title: "Fix invalid geometries before geoprocessing"
keywords: [fix geometries, invalid geometry, has invalid geometry error, Invalid features filtering, repair polygons, native:fixgeometries, Structure repair method, clip failed]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (Vector geometry)"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-clipping-vector-layers.md, timestamps: "04:18-06:45"}]
source_pages: [course-pages/topic-7.md]
datasets_used: ["sources/files/Topic 7.zip (municlow/municlow.shp)"]
---
# Fix invalid geometries before geoprocessing

## Purpose
Repairs malformed polygons (e.g. rings not properly closed when the dataset was created) that make Processing algorithms fail with "Feature (N) ... has invalid geometry". The instructor flags this as an error "that commonly comes up when you're trying to do processing on vector layers." [video qgis-clipping-vector-layers @04:18]

## Steps
1. Recognise the error in an algorithm's Log tab (shown for Clip): `Feature (129) from "municlow" has invalid geometry. Please fix the geometry or change the "Invalid features filtering" option for this input or globally in Processing settings.` followed by `Execution failed after 13.21 seconds`. [frame @04:42]
2. Processing Toolbox: search `fix geo`, double-click `Vector geometry > Fix geometries`. (Menu alternative: `Vector > Geometry Tools > Fix Geometries...` (general knowledge — not shown in course).) [frame @06:02]
3. In "Vector Geometry - Fix Geometries" set: Input layer `municlow [EPSG:4269]` (the layer named in the error); Repair method `Structure` (default); Fixed geometries `[Create temporary layer]`; Open output file after running algorithm checked. `Run`. [frame @05:22, @05:42]
4. When complete, `Close`. A temporary layer `Fixed geometries` is added. Rename it (double-click name), e.g. `Municipal boundaries`. [frame @06:02, @06:32]
5. Create a spatial index on the new layer (`Vector general > Create spatial index`), then re-run the original algorithm using the fixed layer as input. [video qgis-clipping-vector-layers @06:07]

## Formulas / expressions / code
Log parameters:
```
'INPUT' : '.../Topic 7/municlow/municlow.shp', 'METHOD' : 1, 'OUTPUT' : 'TEMPORARY_OUTPUT'
```
- `METHOD 1` = Structure repair method.

## Verify
- `Fixed geometries` looks the same as the input on the map (the instructor: "looks very similar to the underlying municipal layer"). [video qgis-clipping-vector-layers @05:31]
- Re-running the failed algorithm (Clip) completes without the red invalid-geometry message. [frame @07:02]

## Pitfalls
- Fix geometries always outputs a multi-geometry layer and drops M values (help panel). [frame @05:22]
- The output is a scratch/temporary layer; it disappears when QGIS closes unless saved.
- Delete any partial output created by the failed run before continuing.

## Related
- [clip-vector-layer-to-boundary.md](clip-vector-layer-to-boundary.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#fix-geometries)
