---
id: qgis.join-attributes-by-nearest
tool: qgis
title: Add distance-to-nearest-feature and nearest-feature attributes with Join attributes by nearest
keywords: [join attributes by nearest, nearest neighbour, nearest neighbor, distance to nearest, distance to water, proximity join, spatial join nearest, native:joinbynearest, n, distance, feature_x, nearest_x, max distance, prefix]
software_context: "QGIS 3.44 (Windows), Processing Toolbox algorithm 'Join attributes by nearest' (group Vector general)"
prerequisites: [qgis.reproject-vector-layer]
source_videos:
  - {video: transcripts/qgis/qgis-join-attributes-by-nearest.md, timestamps: "08:59-10:45"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Buckthorn observations_0.csv (reprojected to EPSG:26917)", "sources/files/Topic 5.zip (Topic 5/Water_Edges/Water_Edges.shp)", "sources/files/buckthorn_updated.csv (final result of the Topic 5 joins)"]
---
# Add distance-to-nearest-feature and nearest-feature attributes with Join attributes by nearest

## Purpose
Creates a copy of an input layer whose attribute table gains the attributes of the nearest feature in a second layer plus the distance to it. In the course each buckthorn sampling plot gets its distance (m) to the nearest Thames shoreline (checklist item 24 "I can use Join Attributes by Nearest to add attributes from other vector layers"). [page technical-skills-checklist.md]

## Steps
1. Put both layers in the same metre-based CRS (input `Reprojected` buckthorn points, EPSG:26917; `Water_Edges`, EPSG:26917). See [reproject-vector-layer.md](reproject-vector-layer.md). Optionally delete unwanted destination features first (see step 3 of [measure-distance-shortest-line-between-features.md](measure-distance-shortest-line-between-features.md)). [video qgis-join-attributes-by-nearest @06:29-07:07]
2. Open the Processing Toolbox (gear icon), type `joi` (or `join attr`), double-click `Vector general > Join attributes by nearest`. Dialog title `Vector General - Join Attributes by Nearest`. [video qgis-join-attributes-by-nearest @08:59] [frame @09:12-09:22]
3. `Input layer`: `Reprojected [EPSG:26917]` - the layer that receives the new columns. (The dialog may pre-fill the most recent layer, e.g. `Shortest lines`; change it.) [frame @09:22-09:32]
4. `Input layer 2`: `Water_Edges [EPSG:26917]` - the layer searched for the nearest feature. [frame @09:32]
5. `Layer 2 fields to copy (leave empty to copy all fields) [optional]`: the instructor opened the `...` picker (fields such as `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen`) and closed it with nothing ticked, leaving `0 field(s) selected`. To copy only some fields, tick them and click `OK` in the picker. [video qgis-join-attributes-by-nearest @09:35] [frame @09:42]
6. Leave `Discard records which could not be joined` unchecked, `Joined field prefix [optional]` empty, `Maximum nearest neighbors` = `1`, `Maximum distance [optional]` = `Not set` (`meters`). [frame @09:32-09:52]
7. Leave `Joined layer [optional]` = `[Create temporary layer]` and `Open output file after running algorithm` checked; leave `Unjoinable features from first layer [optional]` at its default. [frame @09:52]
8. Click `Run`, then `Close`. New layer `Joined layer` is added. [video qgis-join-attributes-by-nearest @09:46] [frame @10:42]
9. Right-click `Joined layer` > `Open Attribute Table` and scroll right to the new columns. [video qgis-join-attributes-by-nearest @09:46-10:12]

## Formulas / expressions / code
None (dialog only). Columns added at the right of the table [frame @10:02-10:22]:
- the copied layer-2 fields (here all Water_Edges fields: `OBJECTID_2`, `Theme`, `Layer`, `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen`; a name clash such as `OBJECTID` is renamed `OBJECTID_2`)
- `n` - neighbour rank (1)
- `distance` - distance to the nearest layer-2 feature, in the layer CRS units (metres)
- `feature_x`, `feature_y` - coordinates of the input point
- `nearest_x`, `nearest_y` - coordinates of the closest point on the nearest feature

## Verify
- Attribute table "Joined layer — Features Total: 53" (same count as the input) with `distance` values such as 86.63, 77.66, 18.75 m; values match the `Shortest lines` distances. [frame @10:02-10:12]

## Pitfalls
- Leaving the field picker empty does NOT mean "copy nothing": the label says "leave empty to copy all fields", and the result did contain every Water_Edges field. The transcript's "we don't want to select anything" just means the instructor accepted all fields. [frame @09:32, @10:12]
- Run it on the reprojected (metre) layer; on EPSG:4326 the `distance` would be in degrees. [video qgis-join-attributes-by-nearest @00:05]
- Leaving `Maximum distance` as `Not set` searches without a limit; set a value to ignore far features, and tick `Discard records which could not be joined` to drop inputs with no match within that distance (general knowledge — not shown in course).
- `Joined layer` is temporary; export it if needed (the course exports it as CSV - see [transcripts/qgis/qgis-exporting-attribute-table-to-csv.md](../../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md)).

## Related
- [measure-distance-shortest-line-between-features.md](measure-distance-shortest-line-between-features.md) - visual check of the same distances
- [sample-raster-values-at-points.md](sample-raster-values-at-points.md) - next step: add DEM elevation to `Joined layer`
- [join-attributes-by-location.md](join-attributes-by-location.md) - join by overlap instead of proximity
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md) - save the result
- [processing-algorithms-reference.md](processing-algorithms-reference.md#join-attributes-by-nearest)
