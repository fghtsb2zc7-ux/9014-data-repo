---
id: qgis.raster-calculator-combine-two-rasters
tool: qgis
title: Combine two rasters with conditions (AND / +) in the Raster Calculator
keywords: [raster calculator, two rasters, overlay, combine layers, AND, add rasters, co-occurrence, hotspot, invasive species, map algebra, count of layers above threshold]
software_context: "QGIS 3.x (Windows), Raster > Raster Calculator..."
prerequisites: [qgis.raster-calculator-threshold-filter, qgis.raster-set-value-transparent]
source_videos: [{video: transcripts/qgis/qgis-raster-calculator-with-two-raster-layers.md, timestamps: "00:45-08:38"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 2/Carcinus maenas.tif", "sources/files/Topic 2/Ciona intestinalis.tif"]
---
# Combine two rasters with conditions (AND / +) in the Raster Calculator

## Purpose
Overlays two rasters of the same resolution to find where conditions hold in both. `AND` returns 1 where both layers exceed their cutoff (else 0); `+` of two comparisons returns 0, 1 or 2 = how many layers exceed the cutoff. Course example: where green shore crab (*Carcinus maenas*) and sea vase (*Ciona intestinalis*) each have > 50% probability (invasive-species hotspots) [video qgis-raster-calculator-with-two-raster-layers @01:22-02:00].

## Steps
1. Load both rasters (drag and drop `Carcinus maenas.tif` and `Ciona intestinalis.tif` from the Topic 2 download) [video qgis-raster-calculator-with-two-raster-layers @00:45].
2. Optional context basemap: Search QMS panel (QuickMapServices plugin) > `ESRI Ocean` > `Add` [video qgis-raster-calculator-with-two-raster-layers @02:00] [frame @02:22].
3. `Raster > Raster Calculator...` [frame @02:32].
4. Build the AND expression: double-click `Carcinus maenas@1`, `>`, `0.5`, wrap in brackets; then double-click `Ciona intestinalis@1`, `>`, `0.5`, wrap in brackets; click the `AND` operator button between them [video qgis-raster-calculator-with-two-raster-layers @03:55-04:33] [frame @04:22]:
   `("Carcinus maenas@1" > 0.5) AND ("Ciona intestinalis@1" > 0.5)`
5. Confirm "Expression valid"; tick `Create on-the-fly raster instead of writing layer to disk` (or set Output layer + GeoTIFF to save); click `OK` [video qgis-raster-calculator-with-two-raster-layers @04:33] [frame @04:42].
6. New layer (0/1, greyscale) appears. Double-click it > `Symbology`, set pseudocolour, set the colour of value 0 to Opacity 0 (see [raster-set-value-transparent](raster-set-value-transparent.md)), `Apply`, `OK`; turn off the original rasters [video qgis-raster-calculator-with-two-raster-layers @04:33-05:10]. Coloured cells = both species > 0.5 [frame @05:22].
7. For a count instead of a yes/no: reopen `Raster > Raster Calculator...` (the on-the-fly AND layer is now also listed in Raster Bands) [frame @06:02] and enter, using `+` instead of `AND` [video qgis-raster-calculator-with-two-raster-layers @06:24] [frame @06:52]:
   `("Carcinus maenas@1" >0.5) + ("Ciona intestinalis@1" > 0.5)`
8. On-the-fly, `OK`; style as pseudocolour with value 0 transparent [video qgis-raster-calculator-with-two-raster-layers @07:02] [frame @07:22].
9. Read the result with Identify Features: 1 = one species (teal), 2 = both species (yellow) [video qgis-raster-calculator-with-two-raster-layers @07:41] [frame @07:42, @08:12].

## Formulas / expressions / code
```
("Carcinus maenas@1" > 0.5) AND ("Ciona intestinalis@1" > 0.5)
```
Each bracket is 1/0; `AND` gives 1 only where both are 1 — "analogous to an if statement" [video qgis-raster-calculator-with-two-raster-layers @02:36, @04:22 frame].
```
("Carcinus maenas@1" >0.5) + ("Ciona intestinalis@1" > 0.5)
```
Sums the two 1/0 layers → 0 (neither), 1 (one species), 2 (both) [frame @06:52]. Spacing `>0.5` is exactly as typed in the video; spaces do not matter.

## Verify
- Status "Expression valid" before OK [frame].
- AND layer legend 0-1; `+` layer legend 0-2 [frame @04:52, @07:42].
- Identify Results on a yellow cell of the `+` layer shows `Band 1  2` [frame @08:12].

## Pitfalls
- Two bracketed comparisons with no operator between them give "Expression invalid" [frame @04:12].
- The rasters must have the same pixel resolution; the course rasters do because they come from the same dataset. Otherwise extra processing is needed first (not shown) [video qgis-raster-calculator-with-two-raster-layers @07:41-08:15]. `Raster > Align Rasters...` appears in the Raster menu [frame @02:32] — using it is (general knowledge — not shown in course).
- The result covers the full extent with 0s, which hide the basemap until 0 is made transparent [frame @04:52].

## Related
- [raster-calculator-threshold-filter.md](raster-calculator-threshold-filter.md)
- [raster-set-value-transparent.md](raster-set-value-transparent.md)
- [expression-reference.md](expression-reference.md#raster-calculator-syntax)
- Transcript: [QGIS - Raster calculator with two raster layers](../../transcripts/qgis/qgis-raster-calculator-with-two-raster-layers.md)
