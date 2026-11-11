---
id: qgis.add-raster-geotiff-and-style-pseudocolor
tool: qgis
title: Add a raster (GeoTIFF) and display it with a Singleband pseudocolor ramp
keywords: [raster, GeoTIFF, tif, add raster layer, import raster, drag and drop, species distribution model, SDM, probability, symbology, singleband pseudocolor, singleband gray, color ramp, pixels, identify pixel value, Carcinus maenas, Ciona intestinalis, green crab, sea vase, marine invasive species]
software_context: "QGIS 3.x (Windows, instructor's install), Layer Properties > Symbology for rasters"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-raster-import.md, timestamps: "00:05-05:16"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 2/Carcinus maenas.tif", "sources/files/Topic 2/Ciona intestinalis.tif", "QuickMapServices 'ESRI Ocean' base map"]
---
# Add a raster (GeoTIFF) and display it with a Singleband pseudocolor ramp

## Purpose
Load gridded (pixel) data such as species distribution models (0 = species almost certainly absent, 1 = very high probability of presence) and give it a colour ramp so patterns are visible [video qgis-raster-import @00:05, @02:20]. Checklist skills "I can load a raster dataset into QGIS" and "I can display raster values using an appropriate pseudocolour scheme" [page technical-skills-checklist.md].

## Steps
1. Download `Carcinus maenas.tif` (green crab) and `Ciona intestinalis.tif` (sea vase) from the Topic 2 page [page topic-2-transforming-and-wrangling-data.md].
2. In Windows File Explorer, select the .tif files and drag them onto the QGIS map canvas (instructor's preferred method; the Browser panel also works; `Layer > Add Layer > Add Raster Layer...` Ctrl+Shift+R is the menu route) [video qgis-raster-import @00:41-01:22] [frame qgis-raster-import @01:12].
3. Both layers appear in grayscale with legend "Band 1 (Gray)" (Carcinus maenas range 0 to 0.932818) [frame qgis-raster-import @01:22].
4. Optional: add an **ESRI Ocean** base map via Search QMS and drag it to the bottom [video qgis-raster-import @01:22] — see [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md).
5. Untick the layer you are not styling (e.g. Ciona intestinalis) [video qgis-raster-import @01:50].
6. Double-click the raster layer (e.g. "Carcinus maenas"). "Layer Properties - Carcinus maenas — Symbology" opens; current Render type "Singleband gray", Color gradient "Black to White", Min 0, Max 0.932818, Contrast enhancement "Stretch to MinMax" [frame qgis-raster-import @02:12].
7. Set **Render type** = `Singleband pseudocolor` [video qgis-raster-import @02:15] [frame qgis-raster-import @02:22].
8. Leave defaults as shown: Band `Band 1 (Gray)`, Min `0`, Max `0.9328175`, Interpolation `Linear`, Color ramp (default dark-blue-to-yellow ramp; name not shown), Mode `Continuous`, Classes `5`, Label precision `4` [frame qgis-raster-import @02:22].
9. Click **Apply**, then **OK** [video qgis-raster-import @02:35].
10. Repeat for Ciona intestinalis (double-click > Singleband pseudocolor > Apply > OK; range 0 to 1) [video qgis-raster-import @04:25] [frame qgis-raster-import @04:42].
11. Inspect pixel values: select the layer, click **Identify Features**, click a cell; Identify Results shows "Band 1 <value>" (e.g. 0.1156265, 0.847169 for Carcinus; 0.00729797 for Ciona) [video qgis-raster-import @03:50] [frame qgis-raster-import @04:02, @05:02].

## Verify
- Legend shows a colour bar from 0 to the max; high-probability cells (yellow) for Carcinus maenas along the Nova Scotia / Gulf of Maine coast [frame qgis-raster-import @02:42].
- Zooming in reveals square pixels (coarse resolution) [video qgis-raster-import @02:50] [frame qgis-raster-import @03:22].
- Project stays EPSG:4326 when the raster is the first layer [frame qgis-raster-import @01:22].

## Pitfalls
- Grayscale default makes differences hard to see; always switch to pseudocolor for continuous values [video qgis-raster-import @01:22].
- Rasters can be very large (up to ~0.5 GB); the course later handles very large rasters in Positron/Python rather than QGIS [video qgis-raster-import @03:12].
- Identify uses the layer selected in the Layers panel (Mode: Current Layer); the layer label in Identify Results may lag if you switch layers.

## Related
- [raster-set-value-transparent.md](raster-set-value-transparent.md)
- [raster-calculator-threshold-filter.md](raster-calculator-threshold-filter.md)
- [add-arcgis-rest-server-layer.md](add-arcgis-rest-server-layer.md)
- [explore-layer-identify-attribute-table-properties.md](explore-layer-identify-attribute-table-properties.md)
- [reproject-raster-warp.md](reproject-raster-warp.md)
