---
id: qgis.clip-vector-layer-to-boundary
tool: qgis
title: "Clip a vector layer to a boundary polygon"
keywords: [clip, clipping, cut layer to study area, trim to boundary, remove water portions, municipalities clipped to Ontario, Vector overlay Clip, native:clip, overlay layer, cookie cutter]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (Vector overlay)"
prerequisites: [qgis.fix-invalid-geometries]
source_videos: [{video: transcripts/qgis/qgis-clipping-vector-layers.md, timestamps: "00:05-08:03"}, {video: transcripts/qgis/qgis-counting-points-in-polygons-and-creating-grids.md, timestamps: "06:42-07:50"}]
source_pages: [course-pages/topic-7.md, course-pages/lesson-7-overview.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 7.zip (municlow/municlow.shp — Ontario lower/single-tier municipal boundaries, EPSG:4269)", "sources/files/Topic 7.zip (lpr_000b16a_f/lpr_000b16a_f.shp — Statistics Canada provinces/territories, EPSG:3347)"]
---
# Clip a vector layer to a boundary polygon

## Purpose
Keeps only the parts of an input layer that fall inside the polygons of an overlay layer — e.g. cut Ontario municipal polygons that extend into the Great Lakes back to the land boundary, or trim a rectangular grid to Canada's outline. Use it when the reduction is spatial and cannot be done with an attribute filter. Checklist item 28. [video qgis-clipping-vector-layers @00:05] [page technical-skills-checklist.md]

## Steps
1. Add both layers by dragging the shapefiles onto the canvas: `lpr_000b16a_f.shp` (provinces) and `municlow.shp` (municipalities), both from the Topic 7 folder. [video qgis-clipping-vector-layers @00:42] [frame @01:02, @01:22]
2. (Optional context) Add an `ESRI Satellite` base map to see polygons extending into the lakes; Identify shows such pieces with `EXTENT_T = Water`. [frame @02:02, @02:32]
3. Reduce the overlay to the area wanted: right-click `lpr_000b16a_f` > `Filter...`, in the Query Builder double-click field `PRNOM`, click `=`, choose value `Ontario` (Values > All), `OK`. [video qgis-clipping-vector-layers @02:30] [frame @02:52] — see [filter-vector-single-condition-query-builder.md](filter-vector-single-condition-query-builder.md)
4. Create spatial indexes on both layers (speeds processing of detailed coastlines): Processing Toolbox, search `spatial`, double-click `Vector general > Create spatial index`, Input layer `municlow [EPSG:4269]`, `Run`; repeat with `lpr_000b16a_f`. [video qgis-clipping-vector-layers @03:07] [frame @03:42, @04:02]
5. Processing Toolbox, search `clip`, double-click `Vector overlay > Clip`. (Menu alternative: `Vector > Geoprocessing Tools > Clip...` (general knowledge — not shown in course).) [frame @03:32]
6. In "Vector Overlay - Clip" set: Input layer `municlow [EPSG:4269]` (layer to be cut); Overlay layer `lpr_000b16a_f [EPSG:3347]` (the cutter); Selected features only unchecked for both; Clipped `[Create temporary layer]`; Open output file after running algorithm checked. `Run`. [frame @04:22]
7. If the Log shows "Feature (129) from "municlow" has invalid geometry ..." and "Execution failed", remove the incomplete `Clipped` layer, run Fix geometries on the input (see [fix-invalid-geometries.md](fix-invalid-geometries.md)), rename the fixed output (e.g. `Municipal boundaries`) and create a spatial index on it. [frame @04:42, @06:12, @06:32]
8. Re-run `Vector overlay > Clip` with Input layer `Municipal boundaries [EPSG:4269]` and Overlay layer `lpr_000b16a_f [EPSG:3347]`; `Run`, then `Close`. [frame @06:52]
9. Rename the `Clipped` output descriptively (right-click > `Rename Layer`). [frame counting video @08:02]

Grid variant (counting video): Input layer `Grid [EPSG:3347]`, Overlay layer `lpr_000b16a_f [EPSG:3347]` (unfiltered, all provinces) → `Clipped`, renamed `100x100 grid`. [video qgis-counting-points-in-polygons-and-creating-grids @06:54] — see [create-grid-and-count-point-density.md](create-grid-and-count-point-density.md)

## Formulas / expressions / code
Filter on the overlay (as recorded in the Clip log `subset=`):
```
"PRNOM" = 'Ontario'
```
- `PRNOM` = province name field of `lpr_000b16a_f`; keeps only the Ontario polygon.

Clip log parameters:
```
'INPUT' : '.../Topic 7/municlow/municlow.shp', 'OUTPUT' : 'TEMPORARY_OUTPUT',
'OVERLAY' : '.../Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp|subset="PRNOM" = \'Ontario\''
```

## Verify
- A new `Clipped` layer appears; municipal polygons now end at the shoreline, while the original `municlow` still extends into the lakes (toggle layers to compare). [frame @07:02, @07:42]
- Attributes are unchanged from the input (area/length fields are not recalculated — see Pitfalls).

## Pitfalls
- Invalid geometries in the input stop the algorithm (red log message above). Fix with `Vector geometry > Fix geometries` first. [video qgis-clipping-vector-layers @04:18]
- Even when execution fails, a (partial) `Clipped` layer is still loaded — do not use it. [frame @04:42]
- Input and overlay can be in different CRSs (EPSG:4269 vs EPSG:3347 here); QGIS reprojects on the fly, but processing is slower.
- The Clip help notes attribute values such as area/length are not updated; recompute with the field calculator if needed. [frame @04:22 help panel] — see [add-geometry-attributes-area-perimeter.md](add-geometry-attributes-area-perimeter.md)
- Large detailed layers render and process slowly; spatial indexes help. [video qgis-clipping-vector-layers @03:07]

## Related
- [fix-invalid-geometries.md](fix-invalid-geometries.md)
- [create-grid-and-count-point-density.md](create-grid-and-count-point-density.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#clip)
- Spatial index transcript: [create-spatial-index.md](create-spatial-index.md)
- Transcript: [qgis-clipping-vector-layers.md](../../transcripts/qgis/qgis-clipping-vector-layers.md)
