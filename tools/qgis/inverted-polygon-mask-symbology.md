---
id: qgis.inverted-polygon-mask-symbology
tool: qgis
title: "Highlight a study area with an outline and an inverted-polygon mask"
keywords: [inverted polygons, mask outside polygon, fade surroundings, highlight study area, transparent fill, outline only, stroke width, watershed highlight, base map context, symbology trick]
software_context: "QGIS 3.44.13-Solothurn, Layer Properties > Symbology"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-print-layout.md, timestamps: "00:05-03:49"}]
source_pages: [course-pages/topic-7.md]
datasets_used: ["thames_river_watershed.gpkg (Topic 7 folder; layers pwqmn_station_thames, thames_river, thames_river_watershed, wtrshter — created in the GeoPackage video)", "ESRI Satellite base map"]
---
# Highlight a study area with an outline and an inverted-polygon mask

## Purpose
Map-styling steps done before building a print layout: draw the study area (Thames River watershed) as a coloured outline with no fill, and use a second copy of the polygon with the "Inverted Polygons" renderer to wash out everything outside it, so the area "pops" while the base map still gives context. [video qgis-print-layout @00:44, @01:57]

## Steps
1. Drag `thames_river_watershed.gpkg` (Topic 7) onto the canvas; in "Select Items to Add" click `Select All` (pwqmn_station_thames, thames_river, thames_river_watershed, wtrshter) and `Add Layers`. [frame @00:32]
2. Add a satellite base map: `ESRI Satellite` (see [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md)); keep it at the bottom of the layer list. [frame @01:02]
3. Turn off layers not needed (`wtrshter`). [frame @01:22]
4. Outline layer: double-click `thames_river_watershed` > `Symbology` > click `Simple Fill`. Fill color dropdown > `Transparent Fill`; Stroke color red; Stroke width about `1.86` Millimeters then reduced slightly (instructor found 1.86 "a little heavy"); `Apply`, `OK`. [frame @01:32, @01:52] [video qgis-print-layout @01:22]
5. Mask layer: double-click `thames_river` (the filled copy) > `Symbology`; change the renderer dropdown at the top from `Single Symbol` to `Inverted Polygons`; Sub renderer `Single Symbol`; leave "Merge polygons before rendering (slow)" unchecked. [frame @02:22-02:42]
6. Set the fill color to solid white; `Apply` — everything outside the polygon becomes white. [frame @02:42, @02:52]
7. Re-open the mask layer symbology, select the Fill level, and lower the `Opacity` slider (white becomes semi-transparent) so the base map shows through faintly; `Apply`, `OK`. [frame @03:22, @03:32]
8. Keep the station points (`pwqmn_station_thames`) on top. [frame @03:32]

## Formulas / expressions / code
None.

## Verify
- Inside the watershed the satellite image is full colour with a red boundary and orange station points; outside it is pale/washed out but still readable. [frame @03:32]

## Pitfalls
- With 100% opaque white, the surroundings disappear completely and the viewer loses geographic context; reduce opacity. [video qgis-print-layout @02:58]
- Apply the inverted renderer to a separate polygon layer from the outline layer (two layers of the same area are used here). [video qgis-print-layout @01:57]
- Exact final stroke width and opacity percentages were not readable in the frames.

## Related
- [print-layout-map-export.md](print-layout-map-export.md)
- [print-layout-checklist.md](print-layout-checklist.md)
- Transcript: [qgis-print-layout.md](../../transcripts/qgis/qgis-print-layout.md)
