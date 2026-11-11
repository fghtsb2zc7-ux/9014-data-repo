---
id: qgis.measure-distance-shortest-line-between-features
tool: qgis
title: Draw and measure the shortest line from points to the nearest feature of another layer
keywords: [distance, shortest line, nearest, distance to river, distance to water, proximity, measure distance, lines between layers, Shortest line between features, native:shortestline, delete features, edit layer, toggle editing]
software_context: "QGIS 3.44 (Windows), Processing Toolbox algorithm 'Shortest line between features' (group Vector analysis)"
prerequisites: [qgis.reproject-vector-layer]
source_videos:
  - {video: transcripts/qgis/qgis-join-attributes-by-nearest.md, timestamps: "04:30-08:59"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Buckthorn observations_0.csv (reprojected to EPSG:26917)", "sources/files/Topic 5.zip (Topic 5/Water_Edges/Water_Edges.shp, City of London Open Data 'Water Edges')"]
---
# Draw and measure the shortest line from points to the nearest feature of another layer

## Purpose
Creates a line layer connecting every source feature (e.g. buckthorn sampling plots) to the closest point on the nearest destination feature (e.g. the Thames shoreline); each line carries a `distance` attribute in the layer CRS units. The course uses it to visualise distances before adding them to the plot data with Join attributes by nearest (checklist item "I can measure distances between spatial features"). [page technical-skills-checklist.md]

## Steps
1. Have both layers in the same metre-based CRS: `Reprojected` buckthorn points (EPSG:26917) and `Water_Edges` (already EPSG:26917 - check via right-click > `Properties...` > `Information`). [video qgis-join-attributes-by-nearest @06:29-07:07] [frame @07:02]
2. Load the line layer: drag `Topic 5/Water_Edges/Water_Edges.shp` into the map (downloaded from City of London Open Data, `opendata.london.ca` > Environment > "Water Edges"). [video qgis-join-attributes-by-nearest @04:28-05:30] [frame @04:52-05:42]
3. (Optional - remove destination features you don't want measured, e.g. small side channels.) Select `Water_Edges` in the Layers panel and click the `Toggle Editing` (pencil) button; use the select tool to select the unwanted lines (drag a box for several); press `Delete` (status bar: "1 feature(s) deleted."); click `Save Layer Edits` / toggle editing off and save. This permanently changes the shapefile. [video qgis-join-attributes-by-nearest @05:51-06:35] [frame @06:22-06:52]
4. Open the Processing Toolbox (gear icon), type `shortest`, double-click `Vector analysis > Shortest line between features`. Dialog title `Vector Analysis - Shortest Line Between Features`. [video qgis-join-attributes-by-nearest @07:30-07:50] [frame @07:52]
5. `Source layer`: `Reprojected [EPSG:26917]` (not the original `Buckthorn observations_0 [EPSG:4326]`). [frame @08:02]
6. `Destination layer`: `Water_Edges [EPSG:26917]`. [frame @08:12]
7. Leave `Method` = `Distance to Nearest Point on feature`, `Maximum number of neighbors` = `1`, `Maximum distance [optional]` = `Not set` (`meters`), `Shortest lines` = `[Create temporary layer]`, `Open output file after running algorithm` checked. [frame @08:12]
8. Click `Run`, then `Close`. New line layer `Shortest lines` appears. [frame @08:22]
9. To read a distance: select `Shortest lines`, click the `Identify Features` tool and click a line; the Identify Results panel lists the source attributes, the destination attributes and `distance`. [video qgis-join-attributes-by-nearest @08:23-08:50] [frame @08:32-08:42]

## Formulas / expressions / code
None. Output fields: all source-layer fields, all destination-layer fields (`OBJECTID_2`, `Theme`, `Layer`, `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen` for Water_Edges) and `distance` (metres here). [frame @08:42]

## Verify
- `Shortest lines` contains one line per plot (53) running to the shoreline; Identify on one line shows e.g. `distance` = `43.15379647444893` (≈ 43 m); another plot ≈ 18.74 m. [frame @08:42] [video qgis-join-attributes-by-nearest @08:23-08:50]

## Pitfalls
- Using the EPSG:4326 source layer gives distances in degrees; pick the reprojected layer. [frame @08:02]
- Deleting features in edit mode alters the source shapefile on save - keep a copy if you need the full dataset (general knowledge — not shown in course).
- The help panel notes the algorithm "uses purely Cartesian calculations for distance, and does not consider geodetic or ellipsoid properties" - another reason to use a projected CRS. [frame @08:02]
- This creates a separate layer; to put the distance into the plot table use [join-attributes-by-nearest.md](join-attributes-by-nearest.md).

## Related
- [join-attributes-by-nearest.md](join-attributes-by-nearest.md)
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#shortest-line-between-features)
