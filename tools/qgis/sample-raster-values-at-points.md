---
id: qgis.sample-raster-values-at-points
tool: qgis
title: Add raster values (e.g. DEM elevation) to point features with Sample raster values
keywords: [sample raster values, raster to points, extract raster values, elevation at points, DEM, digital elevation model, pixel value, point sampling, native:rastersampling, output column prefix, SWOOP, identify raster value]
software_context: "QGIS 3.44 (Windows), Processing Toolbox algorithm 'Sample raster values' (group Raster analysis)"
prerequisites: [qgis.join-attributes-by-nearest]
source_videos:
  - {video: transcripts/qgis/qgis-sample-raster-values.md, timestamps: "01:17-05:10"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 5.zip (Topic 5/1km17477047610SWOOP2015.img - SWOOP 2015 DEM tile)", "Joined layer (buckthorn plots with distance, from join-attributes-by-nearest)"]
---
# Add raster values (e.g. DEM elevation) to point features with Sample raster values

## Purpose
Creates a copy of a point layer with one new column per raster band holding the value of the pixel under each point. The course adds elevation (m above sea level) from a SWOOP 2015 DEM tile to the buckthorn plots (checklist item 30 "I can sample raster values at point locations using Sample Raster Values"). [page technical-skills-checklist.md]

## Steps
1. Have the point layer loaded (here `Joined layer`, EPSG:26917, which already has the `distance` column). Turn off other layers if helpful. [video qgis-sample-raster-values @00:40-01:17] [frame @01:12]
2. Add the raster: drag `Topic 5/1km17477047610SWOOP2015` (.img) into the map. It appears as `1km17477047610SWOOP2015`, legend "Band 1: Layer_1" 233.126663 – 273.100006. [video qgis-sample-raster-values @01:54] [frame @02:02]
3. (Optional styling) Right-click the raster > `Properties...` > `Symbology`: `Render type` = `Singleband pseudocolor`; `Color ramp` > `All Color Ramps` > `BrBG`; `OK`. [video qgis-sample-raster-values @01:54-02:10] [frame @02:12]
4. Drag the point layer above the raster in the Layers panel. [video qgis-sample-raster-values @02:28] [frame @02:42]
5. (Optional check) Select the raster layer, choose the `Identify Features` tool and click a pixel; Identify Results show `Band 1: Layer_1` = e.g. `236.25375`. [video qgis-sample-raster-values @02:32-03:05] [frame @02:52-03:22]
6. Open the Processing Toolbox (gear icon), type `sample ras`, double-click `Raster analysis > Sample raster values`. Dialog title `Raster Analysis - Sample Raster Values`. [video qgis-sample-raster-values @03:20] [frame @03:32]
7. `Input layer`: `Joined layer [EPSG:26917]` (point layer). [frame @03:42-03:52]
8. `Raster layer`: `1km17477047610SWOOP2015 [EPSG:26917]` (auto-filled when only one raster is loaded). [video qgis-sample-raster-values @03:20] [frame @03:52]
9. `Output column prefix [optional]`: replace the default `SAMPLE_` with `elevation`. [video qgis-sample-raster-values @03:45] [frame @03:42-03:52]
10. Leave `Sampled` = `[Create temporary layer]` and `Open output file after running algorithm` checked; click `Run`, then `Close`. New layer `Sampled` appears. [frame @03:52-04:02]
11. Right-click `Sampled` > `Open Attribute Table`; the last column is `elevation1`. [frame @04:02-04:12]
12. (Optional map) `Sampled` > `Properties...` > `Symbology`: `Graduated`, `Value` = `elevation1`, red colour ramp, `Mode` = `Equal Count (Quantile)`, `Classes` = `5`, `Classify`, `Apply`, `OK`. [video qgis-sample-raster-values @04:20] [frame @04:32]

## Formulas / expressions / code
None (dialog only). New field name = prefix + band number: prefix `elevation` + band 1 -> `elevation1` (default would be `SAMPLE_1`). The help panel: "If the raster layer has more than one band, all the band values are sampled." [frame @03:52, @04:12]

## Verify
- "Sampled — Features Total: 53": all previous columns (incl. `distance`, `feature_x` ... `nearest_y`) plus `elevation1` with values about 234–239 (e.g. 237.80, 238.45, 235.125). [frame @04:12]
- Graduated map: higher (darker red) values upslope, lower values toward the river (234.31–238.63 m, a few metres of relief). [frame @05:02]

## Pitfalls
- Points must fall on the raster extent; points outside get NULL (general knowledge — not shown in course).
- Keep the point layer and raster in the same CRS (both EPSG:26917 here) (general knowledge — not shown in course; the course used matching CRSs).
- Do not pick the original `Buckthorn observations_0 [EPSG:4326]` in `Input layer` - it lacks the distance column. [frame @03:42]
- Applying the graduated style briefly froze the dialog ("Not Responding"); wait for it. [frame @04:42]

## Related
- [join-attributes-by-nearest.md](join-attributes-by-nearest.md) - produces `Joined layer`
- Raster loading and styling: [transcripts/qgis/qgis-raster-import.md](../../transcripts/qgis/qgis-raster-import.md)
- Export the result: [transcripts/qgis/qgis-exporting-attribute-table-to-csv.md](../../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#sample-raster-values)
