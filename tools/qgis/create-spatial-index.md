---
id: qgis.create-spatial-index
tool: qgis
title: Speed up processing of a large vector layer with Create spatial index
keywords: [spatial index, create spatial index, performance, slow processing, large dataset, qix, index, native:createspatialindex, speed up, roads network, "No spatial index exists for input layer"]
software_context: "QGIS 3.44 (3.44.13-Solothurn, Windows), Processing Toolbox algorithm 'Create spatial index' (group Vector general)"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-creating-a-spatial-index.md, timestamps: "00:05-01:54"}
source_pages: [course-pages/topic-7.md, course-pages/case-study-5.md]
datasets_used: ["sources/files/Topic 7.zip (lpr_000b16a_f/lpr_000b16a_f.shp - Statistics Canada 2016 provincial/territorial boundaries, EPSG:3347)", "Ontario Road Network (case study 5)"]
---
# Speed up processing of a large vector layer with Create spatial index

## Purpose
Builds a spatial index for a vector layer so that geoprocessing tools relating it to other layers (joins, clips, counts, buffers) run much faster. It does not speed up map rendering. Recommended for very large datasets such as the Ontario Road Network ("go to the geoprocessing toolbox and search for Create Spatial Index"). [page case-study-5.md] [video qgis-creating-a-spatial-index @00:05]

## Steps
1. Load the large layer, e.g. drag `Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp` into the map (layer `lpr_000b16a_f`; drawing is slow because of the detailed Arctic coastline). [video qgis-creating-a-spatial-index @00:42-01:16] [frame @00:42-01:12]
2. Open the Processing Toolbox (gear icon) and search `spatial index` (course page: "search for Create Spatial Index"); double-click `Vector general > Create spatial index`. Dialog title `Vector General - Create Spatial Index`. [video qgis-creating-a-spatial-index @01:16] [page case-study-5.md] [frame @01:32]
3. `Input layer`: `lpr_000b16a_f`. There are no other parameters. [video qgis-creating-a-spatial-index @01:16]
4. Click `Run`. The Log shows "Execution completed in 0.32 seconds"; click `Close`. No new layer is added - the index is attached to the input layer. [frame @01:32]

## Formulas / expressions / code
Log (QGIS 3.44.13):
```
Algorithm 'Create spatial index' starting...
Input parameters: { 'INPUT' : '.../Topic lessons/Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp' }
Execution completed in 0.32 seconds
Results: OUTPUT: lpr_000b16a_f_...
```

## Verify
- Log "Execution completed" with OUTPUT = the same layer id. For a shapefile a `.qix` file appears next to the `.shp` (the course zip already contains `lpr_000b16a_f.qix`) (general knowledge — `.qix` not shown in video).
- Later processing logs no longer show "No spatial index exists for input layer, performance will be severely degraded" (warning seen in [join-attributes-by-location.md](join-attributes-by-location.md)).

## Pitfalls
- Rendering stays slow after indexing; the benefit is only for processing. [video qgis-creating-a-spatial-index @01:16-01:50]
- Delimited-text (CSV) layers cannot hold a persistent index file; their Data Source Manager has a separate `Use spatial index` option, or save as GeoPackage/shapefile first (general knowledge — not shown in course).

## Related
- [join-attributes-by-location.md](join-attributes-by-location.md)
- [merge-vector-layers.md](merge-vector-layers.md) - other Topic 7 layer management
- [processing-algorithms-reference.md](processing-algorithms-reference.md#create-spatial-index)
