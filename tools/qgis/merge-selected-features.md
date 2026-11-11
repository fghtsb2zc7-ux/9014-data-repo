---
id: qgis.merge-selected-features
tool: qgis
title: Merge selected polygons within one layer into a single feature (Merge Selected Features)
keywords: [merge features, merge selected features, dissolve selected, combine polygons, join polygons, edit mode, toggle editing, watershed, Upper Thames, Lower Thames, advanced digitizing, Merge Features dialog, manual value]
software_context: "QGIS 3.44 (Windows), editing tools (Toggle Editing, Advanced Digitizing toolbar 'Merge Selected Features')"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-merging-vector-layers-and-features.md, timestamps: "01:54-04:07"}
source_pages: [course-pages/topic-7.md]
datasets_used: ["sources/files/Topic 7.zip (wtrshter/wtrshter.shp - Ontario tertiary watersheds, EPSG:4269)"]
---
# Merge selected polygons within one layer into a single feature (Merge Selected Features)

## Purpose
Combines two or more selected features of the same layer into one feature, letting you set the merged feature's attributes - e.g. Upper Thames + Lower Thames tertiary watersheds -> one "Thames River Watershed". This edits the layer itself (no new layer). [video qgis-merging-vector-layers-and-features @01:54-02:29]

## Steps
1. Load `Topic 7/wtrshter/wtrshter.shp` (layer `wtrshter`, EPSG:4269). [video qgis-merging-vector-layers-and-features @01:54] [frame @02:12]
2. (Optional) Identify the features: `NAME` Lower Thames (`IDENT` 02GE) and Upper Thames (`IDENT` 02GD), `GUT_NUMBER` 1271. [frame @02:32, @03:22]
3. Select `wtrshter` in the Layers panel and click the `Toggle Editing` (pencil) button; the layer shows a pencil icon. [video qgis-merging-vector-layers-and-features @02:29] [frame @02:52]
4. Choose `Select Features by Area or Single Click`; click Lower Thames, then hold `Shift` and click Upper Thames (both yellow). [video qgis-merging-vector-layers-and-features @02:29-03:02] [frame @02:52-03:02]
5. Click `Merge Selected Features` on the Advanced Digitizing toolbar (or `Edit > Edit Geometry > Merge Selected Features` - general knowledge; menu not shown). [video qgis-merging-vector-layers-and-features @03:02] [frame @03:12]
6. In the "Merge Features" dialog, the table shows one row per selected feature (Id 36 Upper Thames, 37 Lower Thames) and a `Merge` row with the values the new feature will get. Each column header has a drop-down (`Feature 36`, `Feature 37`, `Manual Value`, ...). [frame @03:22]
7. Edit the `Merge` row cells to set new values (the column switches to `Manual Value`): `LABEL` = `Thames River Watershed`, `IDENT` = `02GD-2`, `NAME` = `Thames River Watershed`; leave other columns taking values from `Feature 36`. Buttons "Take attributes from selected feature", "Take attributes from feature with the largest area", "Skip all fields", "Remove feature from selection" are alternatives. [video qgis-merging-vector-layers-and-features @03:02-03:44] [frame @03:22-03:42]
8. Click `OK`. [video qgis-merging-vector-layers-and-features @03:44]
9. Save: click `Toggle Editing` (pencil) again and choose `Save` (or `Save Layer Edits`). The course page notes: "At the end of this video, you need to uncheck the pencil in order to save your changes to the watershed shapefile." [page topic-7.md]

## Formulas / expressions / code
None. Merged-feature attribute values typed in the video: `LABEL` "Thames River Watershed", `IDENT` "02GD-2", `NAME` "Thames River Watershed" (NAME partly visible; status bar confirms the display name "Thames River Watershed"). [frame @03:32-04:02]

## Verify
- A single click now selects the whole Thames watershed; status bar "1 feature selected on layer wtrshter (Thames River Watershed)." [frame @04:02]

## Pitfalls
- The video ends with the layer still in edit mode - edits are not written to `wtrshter.shp` until you toggle editing off and save. [page topic-7.md] [frame @04:02]
- Merging edits the source shapefile permanently once saved; keep a copy or work on a saved duplicate if the original is needed (general knowledge — not shown in course).
- Accidentally clicking without Shift replaces the selection ("just selecting multiple features on me there"). [video qgis-merging-vector-layers-and-features @02:29]

## Related
- [merge-vector-layers.md](merge-vector-layers.md) - combine whole layers instead
- Editing basics: [create-shapefile-layer-and-digitize-polygon.md](create-shapefile-layer-and-digitize-polygon.md)
- Save to GeoPackage (next video in the series): [transcripts/qgis/qgis-saving-working-layers-to-geopackages.md](../../transcripts/qgis/qgis-saving-working-layers-to-geopackages.md)
