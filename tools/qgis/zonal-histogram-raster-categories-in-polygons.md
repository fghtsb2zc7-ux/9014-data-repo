---
id: qgis.zonal-histogram-raster-categories-in-polygons
tool: qgis
title: "Count raster categories inside polygons with Zonal histogram"
keywords: [zonal histogram, zonal statistics categorical, land cover in buffer, crop types around station, pixel count per class, raster categories in polygons, native:zonalhistogram, Annual Crop Inventory, ACI, HISTO_ prefix]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (Raster analysis)"
prerequisites: [qgis.buffer-points-fixed-distance, qgis.reproject-raster-warp]
source_videos: [{video: transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md, timestamps: "01:18-09:39"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 5.zip (Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif)", "sources/files/Topic 5.zip (Topic 5/aci_2018_on_v3/aci_crop_classifications_iac_classifications_des_cultures.csv)", sources/files/PWQMN_Stations.csv]
---
# Count raster categories inside polygons with Zonal histogram

## Purpose
For each polygon (zone), appends one field per unique raster value holding the number of pixels of that value inside the polygon. Used in the course to get the crop distribution within a 500 m buffer around every PWQMN station (e.g. to relate agricultural runoff to water quality). Checklist item 31. [video qgis-buffer-creation-and-zonal-histograms @00:06] [page technical-skills-checklist.md]

## Steps
1. Prepare inputs in the same CRS: buffered polygons (`Buffered`, EPSG:26917 — see [buffer-points-fixed-distance.md](buffer-points-fixed-distance.md)) and the raster warped to EPSG:26917 (`aci_warp` — see [reproject-raster-warp.md](reproject-raster-warp.md)). [video qgis-buffer-creation-and-zonal-histograms @03:12]
2. (Optional check) With the Identify Features tool click raster pixels to see codes (e.g. 145, 147, 158) and look them up in `aci_crop_classifications_iac_classifications_des_cultures.csv` (column `Code`): 145 = Winter wheat, 147 = Corn, 158 = Soybeans. [frame @01:32, @01:52]
3. Processing Toolbox: search `zonal` and double-click `Raster analysis > Zonal histogram`. (Menu alternative: `Processing > Toolbox` then the same; no fixed Raster-menu entry is shown in the course.) [frame @08:22]
4. In "Raster Analysis - Zonal Histogram" set: [frame @07:12, @07:22, @07:32]
   - Raster layer: `aci_warp [EPSG:26917]`
   - Band number: `Band 1: aci_2018_on_v3 (Palette)`
   - Vector layer containing zones: `Buffered [EPSG:26917]`
   - Selected features only: unchecked
   - Output column prefix [optional]: replace default `HISTO_` with `crop`
   - Output zones: `[Create temporary layer]`
   - Open output file after running algorithm: checked
5. Click `Run`, then `Close`. A new layer `Output zones` is added. [video qgis-buffer-creation-and-zonal-histograms @07:30]
6. Right-click `Output zones` > `Open Attribute Table` to read the counts. [frame @07:52]
7. To analyse further: join/merge with water-quality data (spatial join, or export and merge in Excel/R) and pivot the crop columns to long format (one column for crop code, one for pixel count). [video qgis-buffer-creation-and-zonal-histograms @08:45] — see the exporting transcript [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)

## Formulas / expressions / code
Output field naming: `<prefix><raster value>`; with prefix `crop` the fields are `crop0, crop20, crop30, crop34, crop35, crop50, crop80, crop110, crop120, crop122, crop131, ... crop145, crop147, crop158, ... crop190`. [frame @07:52, @08:02]
- Each value = number of pixels of that class in the zone (ACI pixels are 30 m (general knowledge — not shown in course)); multiply by pixel area for area.

## Verify
- Attribute table title "Output zones — Features Total: 2198" (same count as buffers) with the original station fields (STATION, NAME, DESCRIPTION, LATITUDE, LONGITUDE, STATUS, FIRST_YEAR, LAST_YEAR, TOTAL_YEARS, MISS_YEARS) followed by `crop…` columns. [frame @07:52, @08:52]
- Identify on one buffer shows plausible counts, e.g. crop145 = 159 and crop147 = 461 (winter wheat and corn dominate), matching what is seen under the buffer. [frame @09:32]

## Pitfalls
- Raster and zones must share a CRS or the counts are wrong even if the layers appear aligned on screen. [video qgis-buffer-creation-and-zonal-histograms @03:12]
- Without a custom prefix, fields are named `HISTO_<value>`.
- The table is wide (one column per class); pivot it before analysis. [video qgis-buffer-creation-and-zonal-histograms @09:15]

## Related
- [buffer-points-fixed-distance.md](buffer-points-fixed-distance.md)
- [reproject-raster-warp.md](reproject-raster-warp.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#zonal-histogram)
- Transcript: [qgis-buffer-creation-and-zonal-histograms.md](../../transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md)
- Spatial joins: [qgis-spatial-joins.md](../../transcripts/qgis/qgis-spatial-joins.md)
