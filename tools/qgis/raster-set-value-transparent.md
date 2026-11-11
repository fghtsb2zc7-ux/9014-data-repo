---
id: qgis.raster-set-value-transparent
tool: qgis
title: Make zero (or any single value) transparent in a pseudocolour raster
keywords: [raster transparency, hide zeros, opacity, no data look, singleband pseudocolor, colour ramp, viridis, symbology, select color]
software_context: "QGIS 3.x, Layer Properties > Symbology (Singleband pseudocolor), Select color dialog"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-raster-calculator.md, timestamps: "04:30-05:50"}, {video: transcripts/qgis/qgis-raster-calculator-with-two-raster-layers.md, timestamps: "04:33-05:10, 07:02-07:41"}]
source_pages: [course-pages/technical-skills-checklist.md]
datasets_used: ["Raster Calculator outputs from Carcinus maenas.tif / Ciona intestinalis.tif"]
---
# Make zero (or any single value) transparent in a pseudocolour raster

## Purpose
After a Raster Calculator filter, cells set to 0 still draw a colour. Setting that class's opacity to 0 shows only the cells of interest over the basemap [video qgis-raster-calculator @05:09].

## Steps
1. Double-click the raster layer in the Layers panel → "Layer Properties - <layer> — Symbology" [video qgis-raster-calculator @04:30] [frame @04:42].
2. `Render type` = `Singleband pseudocolor`; `Band` = `Band 1` [frame @04:42].
3. Pick a `Color ramp` from the dropdown (course used `Viridis`); `Apply` [video qgis-raster-calculator @04:30] [frame @04:52].
4. In the Value / Color / Label table, click the colour swatch of value `0` → "Select color" dialog opens [video qgis-raster-calculator @05:09] [frame @05:32].
5. Drag the `Opacity` slider all the way down to 0% (the video reached 0.47%; typing 0 in the box works too — general knowledge — not shown in course) [frame two-raster @07:22].
6. `OK` in Select color, then `Apply`, `OK` in Layer Properties [video qgis-raster-calculator @05:09-05:50].

## Formulas / expressions / code
None.

## Verify
Areas that were 0 now show the basemap; only non-zero cells are coloured [frame qgis-raster-calculator @05:52].

## Pitfalls
- In Continuous interpolation mode the 0 entry is the first row of the table (values 0, 0.0036…, 0.0072… for a 0–0.93 raster); only that exact value becomes transparent, very small non-zero values keep their colour [frame @04:42] (interpretation).
- The new Raster Calculator layer starts in greyscale; switch to Singleband pseudocolor first [video qgis-raster-calculator @03:53].

## Related
- [raster-calculator-threshold-filter.md](raster-calculator-threshold-filter.md)
- [raster-calculator-combine-two-rasters.md](raster-calculator-combine-two-rasters.md)
- [QGIS - Raster import](../../transcripts/qgis/qgis-raster-import.md) (first-time raster symbology)
