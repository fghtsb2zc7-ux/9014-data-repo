---
id: qgis.merge-vector-layers
tool: qgis
title: Combine several vector layers into one layer with Merge vector layers
keywords: [merge vector layers, combine layers, append layers, union of layers, stack layers, merge shapefiles, municipalities, First Nation reserves, native:mergevectorlayers, add source layer information, layer path fields]
software_context: "QGIS 3.44 (Windows), Processing algorithm 'Merge vector layers' (group Vector general), menu Vector > Data Management Tools"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-merging-vector-layers-and-features.md, timestamps: "00:06-01:54"}
source_pages: [course-pages/topic-7.md]
datasets_used: ["sources/files/Topic 7.zip (municlow/municlow.shp - Ontario municipalities; indianre/indianre.shp - First Nation reserves; both EPSG:4269)"]
---
# Combine several vector layers into one layer with Merge vector layers

## Purpose
Creates one new layer containing all features of two or more layers of the same geometry type, e.g. Ontario municipalities plus First Nation reserves so the province has no holes for a province-wide analysis. Different from merging features inside one layer ([merge-selected-features.md](merge-selected-features.md)). [video qgis-merging-vector-layers-and-features @00:06-01:16]

## Steps
1. Load the layers: drag `Topic 7/municlow/municlow.shp` and `Topic 7/indianre/indianre.shp` into the map (`municlow` gold, `indianre` green, both EPSG:4269). [video qgis-merging-vector-layers-and-features @00:06-01:16] [frame @00:22, @01:02]
2. Menu `Vector > Data Management Tools > Merge Vector Layers...` (or toolbox search `merge` > `Vector general > Merge vector layers` - general knowledge). Dialog title `Vector General - Merge Vector Layers`. [video qgis-merging-vector-layers-and-features @01:16] [frame @01:22]
3. `Input layers`: click `...` to the right of `0 input(s) selected`, tick `municlow` and `indianre`, click `OK` (the picker returns to the dialog showing 2 inputs). [video qgis-merging-vector-layers-and-features @01:16] [frame @01:22]
4. Leave `Destination CRS [optional]` empty (CRS taken from the first input layer; all layers reprojected to it). [frame @01:22]
5. Leave `Add source layer information (layer name and path)` checked. [frame @01:22]
6. Leave `Merged` = `[Create temporary layer]` and `Open output file after running algorithm` checked. Click `Run`, then `Close`. [video qgis-merging-vector-layers-and-features @01:16] [frame @01:32]

## Formulas / expressions / code
None. Output fields: union of all input fields (same-name fields with different types become text, per the dialog help), plus `layer` (source layer name) and `path` (source file path) when "Add source layer information" is checked. [frame @01:22, @01:42]

## Verify
- New layer `Merged` (one colour, no gaps where reserves were). Identify on London shows `NAME` CITY OF LONDON ... plus `layer` = `municlow` and `path` = `C:/Users/...`. [frame @01:32-01:42]
- Feature count of `Merged` = sum of the input feature counts (right-click > Show Feature Count) (general knowledge — not shown in course).

## Pitfalls
- All inputs must have the same geometry type (polygons here). [frame help @01:22]
- `Merged` is temporary; save/export it to keep it (general knowledge — not shown in course; see [transcripts/qgis/qgis-saving-working-layers-to-geopackages.md](../../transcripts/qgis/qgis-saving-working-layers-to-geopackages.md)).
- The instructor removed `Merged` and the inputs before the next part (selected in Layers panel > Remove Layer). [frame @01:52]

## Related
- [merge-selected-features.md](merge-selected-features.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#merge-vector-layers)
