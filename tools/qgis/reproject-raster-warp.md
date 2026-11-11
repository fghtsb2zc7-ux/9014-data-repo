---
id: qgis.reproject-raster-warp
tool: qgis
title: "Reproject a raster layer with Warp (reproject)"
keywords: [warp, gdalwarp, reproject raster, raster CRS, change raster projection, align raster and vector, EPSG:26917, UTM zone 17N, GDAL Raster projections, aci crop inventory]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (GDAL provider, GDAL 3.13.2)"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md, timestamps: "03:12-05:05"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md]
datasets_used: ["sources/files/Topic 5.zip (Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif, Annual Crop Inventory 2018 Ontario)"]
---
# Reproject a raster layer with Warp (reproject)

## Purpose
Converts a raster into another CRS so it lines up exactly with vector layers used in a calculation (e.g. buffers for a zonal histogram). The instructor: "if it's not in the same projection, they're not gonna line up properly, even if we're seeing them lined up here." For rasters the tool is called "warp". [video qgis-buffer-creation-and-zonal-histograms @03:12]

## Steps
1. Add the raster: drag `aci_2018_on_v3.tif` (folder `Topic 5/aci_2018_on_v3`) from File Explorer onto the map canvas. [video qgis-buffer-creation-and-zonal-histograms @01:02] (Menu alternative: `Layer > Add Layer > Add Raster Layer...` (general knowledge — not shown in course).)
2. Open the Processing Toolbox, search `warp`, double-click `GDAL > Raster projections > Warp (reproject)`. (Menu alternative: `Raster > Projections > Warp (Reproject)...` (general knowledge — not shown in course).) [frame @03:52]
3. In "Raster Projections - Warp (Reproject)" set: [frame @03:52, @04:02]
   - Input layer: `aci_2018_on_v3 [EPSG:10820]`
   - Source CRS [optional]: leave blank
   - Target CRS [optional]: `EPSG:26917 - NAD83 / UTM zone 17N` (same CRS as the reprojected points)
   - Resampling method: left at default (log shows `RESAMPLING: 0` = Nearest neighbour, `-r near`) — correct for class codes
   - Reprojected: `[Create temporary layer]`
4. Click `Run`. The ACI raster is very large; the progress bar climbs slowly (5% → 75% over ~40 s in the video). You can keep working in the main window meanwhile. [frame @04:02-04:42]
5. When finished, `Close`, uncheck the original raster, and rename the output (double-click its name) to `aci_warp`. [frame @05:02]

## Formulas / expressions / code
GDAL command shown in the Log tab:
```
gdalwarp -overwrite -t_srs EPSG:26917 -r near -of GTiff "<...>/Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif" <temp>/OUTPUT.tif
```
- `-t_srs EPSG:26917` target CRS; `-r near` nearest-neighbour resampling (keeps integer class codes); `-of GTiff` GeoTIFF output.

## Verify
- New raster layer (renamed `aci_warp`) appears; Layer Properties > Information or the zonal histogram dialog shows `aci_warp [EPSG:26917]`. [frame @07:12]
- Identify on the warped raster still returns integer crop codes (e.g. Band 1 = 147). [frame @07:02]

## Pitfalls
- Do not use bilinear/cubic resampling on categorical rasters (would create non-existent codes) (general knowledge — not shown in course); the default nearest was used.
- Processing a 1.7 GB raster takes time; do not close QGIS while it runs.
- Output is temporary; save it if it will be reused.

## Related
- [buffer-points-fixed-distance.md](buffer-points-fixed-distance.md)
- [zonal-histogram-raster-categories-in-polygons.md](zonal-histogram-raster-categories-in-polygons.md)
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#warp-reproject)
