---
id: qgis.add-shapefile-drag-and-drop
tool: qgis
title: Add an ESRI Shapefile (.shp) to QGIS
keywords: [shapefile, shp, add vector layer, load shapefile, drag and drop, browser panel, dbf, shx, prj, cpg, vector data, points lines polygons, ESRI Shapefile, open shapefile]
software_context: "QGIS 3.x (newer Windows install without SCP; Browser shows STAC/Cloud/Scenes/SensorThings) plus Windows File Explorer"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-adding-a-shapefile.md, timestamps: "00:07-01:27"}, {video: transcripts/qgis/qgis-adding-a-delimited-text-layer.md, timestamps: "00:06-00:20"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["Geolocations shapefile (instructor-made export of the NPRI geolocations CSV; Geolocations.shp/.shx/.dbf/.prj/.cpg)", "sources/files/Topic 7.zip (e.g. wtrshter/wtrshter.shp)"]
---
# Add an ESRI Shapefile to QGIS

## Purpose
Load a shapefile (vector points, lines or polygons) into the project. Checklist skill "I can load an ESRI Shapefile into QGIS" [page technical-skills-checklist.md].

## Steps
### Option A: drag and drop (shown in the course)
1. Open Windows File Explorer at the folder holding the shapefile (instructor: Desktop) [frame qgis-adding-a-shapefile @00:32].
2. Identify the set of files with the same base name: `Geolocations.shp`, `.shx`, `.dbf`, `.prj`, `.cpg` (and possibly others) [frame qgis-adding-a-shapefile @00:32].
3. Drag the **.shp** file only onto the QGIS map canvas [video qgis-adding-a-shapefile @00:42] [frame qgis-adding-a-shapefile @00:52].
4. The layer (e.g. "Geolocations") is added and its features drawn (magenta points across Canada) [frame qgis-adding-a-shapefile @01:12].

### Option B: Browser panel
1. In the Browser panel, expand the drive/folder where you downloaded the data [video qgis-adding-a-delimited-text-layer @00:06].
2. Double-click the `.shp` (or drag it into the Layers panel/map) [video qgis-adding-a-shapefile @00:07].

### Option C: menu (general knowledge — not shown in course)
`Layer > Add Layer > Add Vector Layer...` (Ctrl+Shift+V) [frame qgis-introduction-to-qgis @02:02], browse to the .shp, click **Add**.

## Verify
- New layer listed in the Layers panel; right-click > Open Attribute Table shows the fields from the .dbf.
- Right-click > Zoom to Layer(s) if nothing is visible.

## Pitfalls
- A shapefile is a **collection of files**; the `.shp` binds them. Keep all companion files together in the same folder. Copying or moving only the `.shp` breaks the layer [video qgis-adding-a-shapefile @00:30-01:16].
- When you download a zipped shapefile, unzip it first (general knowledge — not shown in course).
- Missing `.prj` = unknown CRS; set it with right-click > Layer CRS (general knowledge — not shown in course).

## Related
- [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md)
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
- [save-layers-to-geopackage.md](save-layers-to-geopackage.md)
