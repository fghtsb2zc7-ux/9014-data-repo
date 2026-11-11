---
id: qgis.buffer-points-fixed-distance
tool: qgis
title: "Create fixed-distance buffers around vector features"
keywords: [buffer, buffers, buffer zone, radius, distance around points, 500 m buffer, catchment, proximity polygon, native:buffer, Vector geometry Buffer, PWQMN stations buffer]
software_context: "QGIS 3.44.13-Solothurn (version shown in Processing log), Processing Toolbox"
prerequisites: [qgis.reproject-vector-layer]
source_videos: [{video: transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md, timestamps: "02:32-06:52"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: [sources/files/PWQMN_Stations.csv, "sources/files/Topic 5.zip (Topic 5/PWQMN_Stations.csv)"]
---
# Create fixed-distance buffers around vector features

## Purpose
Builds a polygon of a fixed radius around every feature in a vector layer (in the course: a 500 m circle around each Provincial Water Quality Monitoring Network station). The buffers are then used as zones, e.g. to summarise crop types underneath with a zonal histogram. Checklist item 29: "I can create buffers around spatial features using Buffer." [page technical-skills-checklist.md]

## Steps
1. Load the points: `Layer > Add Layer > Add Delimited Text Layer...`, choose `PWQMN_Stations.csv` (Topic 5 folder), Point coordinates from LONGITUDE/LATITUDE, `Add`, `Close`. [video qgis-buffer-creation-and-zonal-histograms @00:42]
2. Check the layer CRS (it loads as `EPSG:4326`, degrees). Buffers in degrees are hard to interpret, so reproject first. [video qgis-buffer-creation-and-zonal-histograms @02:32]
3. Open the Processing Toolbox (gear icon on the Attributes toolbar, or `Processing > Toolbox`) and run `Vector general > Reproject layer`: Input layer `PWQMN_Stations [EPSG:4326]`, Target CRS `EPSG:26917 - NAD83 / UTM zone 17N`, leave the default coordinate operation (row 1), `Run`, then `Close`. If a "Select Transformation for the vector layer" dialog appears, keep the first (highlighted) row and click `OK`. [video qgis-buffer-creation-and-zonal-histograms @03:02] [frame] — full procedure in [reproject-vector-layer.md](reproject-vector-layer.md)
4. Rename the output (`Reprojected`) by double-clicking its name in the Layers panel, e.g. `pwqmn_reproject`; uncheck the original layer. [video qgis-buffer-creation-and-zonal-histograms @05:03] [frame]
5. In the Processing Toolbox search box type `buffer` and double-click `Vector geometry > Buffer`. (Menu alternative: `Vector > Geoprocessing Tools > Buffer...` (general knowledge — not shown in course).) [frame @03:42]
6. In "Vector Geometry - Buffer" set: [frame @05:22, @05:42]
   - Input layer: `pwqmn_reproject [EPSG:26917]`
   - Selected features only: unchecked
   - Distance: `500`, unit dropdown `meters` (default shown was 10.000000)
   - Segments: `5` (default)
   - End cap style: `Round` (default)
   - Join style: `Round` (default)
   - Miter limit: `2.000000` (default)
   - Dissolve result: unchecked (keep one buffer per station so each keeps its attributes)
   - Buffered: `[Create temporary layer]`
7. Click `Run`; wait for "Execution completed" in the Log tab, then `Close`. A temporary layer `Buffered` is added. [frame @05:52]
8. Optionally restyle the station points so they stand out from underlying layers: double-click the layer > `Symbology` > Single Symbol > Simple Marker, change `Color`, Size `2.00000 Millimeters`, `OK`. [video qgis-buffer-creation-and-zonal-histograms @01:58] [frame @02:42]

## Formulas / expressions / code
Parameters recorded in the Processing log (useful to verify or reproduce):
```
'DISSOLVE' : False, 'DISTANCE' : 500, 'END_CAP_STYLE' : 0, 'JOIN_STYLE' : 0,
'MITER_LIMIT' : 2, 'OUTPUT' : 'TEMPORARY_OUTPUT', 'SEGMENTS' : 5, 'SEPARATE_DISJOINT' : False
```
- `DISTANCE` is in the layer's CRS units (metres for EPSG:26917); `END_CAP_STYLE`/`JOIN_STYLE` 0 = Round.

## Verify
- `Buffered` appears in the Layers panel (polygon layer, EPSG:26917); zooming in shows a circle around each point. [frame @06:22]
- Identify on a buffer returns the station's attributes (e.g. NAME `Thames River`, STATION `4001301302`, DESCRIPTION `Sanatorium Rd, London,`), i.e. attributes were carried over from the points. [frame @06:22]
- Feature count equals the station count (the zonal-histogram output from these buffers had 2198 features). [frame @07:52]

## Pitfalls
- Layer in EPSG:4326: distance would be in degrees. Reproject to a projected CRS in metres (UTM zone 17N, EPSG:26917, for southwestern Ontario) before buffering. [video qgis-buffer-creation-and-zonal-histograms @02:32]
- The instructor first left the default `10` m ("not very far") and changed it to 500 m; he says "5 kilometer" afterwards but the log confirms `DISTANCE: 500` (0.5 km). [frame @05:52]
- Outputs are temporary (scratch) layers; save them if needed later (see [save-layers-to-geopackage.md](save-layers-to-geopackage.md)).

## Related
- [zonal-histogram-raster-categories-in-polygons.md](zonal-histogram-raster-categories-in-polygons.md) — next step in the video
- [reproject-raster-warp.md](reproject-raster-warp.md)
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#buffer)
- Transcript: [qgis-buffer-creation-and-zonal-histograms.md](../../transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md)
