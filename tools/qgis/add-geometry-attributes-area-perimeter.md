---
id: qgis.add-geometry-attributes-area-perimeter
tool: qgis
title: Calculate polygon area and perimeter in metres with Add geometry attributes
keywords: [area, perimeter, square metres, geometry attributes, add geometry attributes, measure polygon, size of polygon, native:exportaddgeometrycolumns, length, calculate geometry]
software_context: "QGIS 3.44 (Windows), Processing Toolbox algorithm 'Add geometry attributes' (group Vector geometry)"
prerequisites: [qgis.reproject-vector-layer]
source_videos:
  - {video: transcripts/qgis/qgis-reprojecting-a-vector-layer.md, timestamps: "02:30-03:55"}
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 5.zip (Topic 5/Parking lot/Parking lot.shp)"]
---
# Calculate polygon area and perimeter in metres with Add geometry attributes

## Purpose
Adds `area` and `perimeter` columns (for polygons) to a copy of a layer, measured in the units of the layer's CRS. Run it on a layer reprojected to a metre-based CRS so the results are in m² and m (checklist item "I can calculate geometry attributes such as area"). [page technical-skills-checklist.md]

## Steps
1. Make sure the input layer is in a projected CRS (here `Reprojected`, EPSG:3162). See [reproject-vector-layer.md](reproject-vector-layer.md). [video qgis-reprojecting-a-vector-layer @02:30]
2. Open the Processing Toolbox with the gear (cog) icon on the toolbar (or `Processing > Toolbox`, Ctrl+Alt+T - general knowledge — not shown in course). [video qgis-reprojecting-a-vector-layer @02:38] [frame @02:42]
3. In the toolbox search box type `add geo`; double-click `Vector geometry > Add geometry attributes`. Dialog title `Vector Geometry - Add Geometry Attributes`. [frame @02:52-03:02]
4. `Input layer`: `Reprojected [EPSG:3162]`. [frame @03:02]
5. `Calculate using`: leave `Cartesian Calculations in Layer's CRS`. [frame @03:12]
6. `Added geometry info`: leave `[Create temporary layer]`; keep `Open output file after running algorithm` checked. [frame]
7. Click `Run`, then `Close`. New layer `Added geometry info` appears. [video qgis-reprojecting-a-vector-layer @03:10] [frame @03:52]
8. Right-click `Added geometry info` > `Open Attribute Table`. [video qgis-reprojecting-a-vector-layer @03:18]

## Formulas / expressions / code
None (dialog only). Output columns for a polygon layer: `area` (layer CRS units², here m²) and `perimeter` (layer CRS units, here m).

## Verify
- Attribute table "Added geometry info — Features Total: 1" shows `id` 2, `area` `23683.200833305717` (≈ 23,683 m²) and `perimeter` `617.407809975...` (≈ 617 m) for the campus parking lot. [frame @03:22]

## Pitfalls
- If the input is still EPSG:4326, `Cartesian Calculations in Layer's CRS` returns square degrees - reproject first. [video qgis-reprojecting-a-vector-layer @01:22]
- The output is a temporary layer; the original layer is not changed. Save it if needed (general knowledge — not shown in course).
- Other options in `Calculate using` (Project CRS / Ellipsoidal) were not used in the course.

## Related
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#add-geometry-attributes)
- Field Calculator alternative ($area): [transcripts/qgis/qgis-field-calculator.md](../../transcripts/qgis/qgis-field-calculator.md)
