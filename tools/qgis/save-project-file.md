---
id: qgis.save-project-file
tool: qgis
title: Save and reopen a QGIS project file (.qgz)
keywords: [save project, project file, qgz, qgs, save as, open recent, reopen project, symbology saved, layer paths, recent projects, Project menu]
software_context: "QGIS 3.x (Windows, instructor's install); start page shows banner 'New QGIS version available ... 3.44.15'"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-saving-a-project-file.md, timestamps: "00:05-01:37"}, {video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "00:05-00:42"}]
source_pages: [course-pages/topic-7.md]
datasets_used: ["thames_river_watershed.gpkg (built in the geopackage video)", "ESRI Satellite base map"]
---
# Save and reopen a QGIS project file

## Purpose
A project file stores which layers are loaded, where they live on disk, the layer order and all symbology. It does **not** store the data itself; symbology changes are not saved into a GeoPackage, so save the project [video qgis-saving-a-project-file @00:05-00:41]. Save the whole project for independent projects [video qgis-saving-a-project-file @01:20].

## Steps
1. Save any temporary/scratch layers first to a GeoPackage or shapefile (see [save-layers-to-geopackage.md](save-layers-to-geopackage.md)) [video qgis-saving-a-project-file @01:28].
2. `Project > Save As...` (Ctrl+Shift+S; use `Project > Save`, Ctrl+S, afterwards) [video qgis-saving-a-project-file @00:20] [frame qgis-introduction-to-qgis @00:32].
3. In "Save Project As" navigate to the lesson folder (instructor: ...\EnvrSust 9014\2026-2027\Class materials\Topic lessons\Topic 7) [frame qgis-saving-a-project-file @00:32] [frame qgis-saving-a-project-file @01:12].
4. **File name**: `watershed`; **Save as type**: `QGIS Project Formats (*.qgz *.QGZ *.qgs *.QGS)` [frame qgis-saving-a-project-file @00:32].
5. Click **Save**.
6. To reopen later: `Project > Open Recent > watershed` or click it under **Recent Projects** on the start page [video qgis-saving-a-project-file @01:15] [frame qgis-saving-a-project-file @01:12].

## Verify
- Title bar changes from "*test — QGIS" to "watershed — QGIS"; status bar "Saved project to: C:\Users\...\Topic ..." [frame qgis-saving-a-project-file @00:42].
- Start page lists "watershed" with path `.../Topic lessons/Topic 7/watershed.qgz` and "EPSG:4326 (EPSG:4326 - WGS 84)" [frame qgis-saving-a-project-file @01:12].
- After reopening, all layers come back with the same symbology [video qgis-saving-a-project-file @01:20].
- An asterisk in the title ("*watershed") means unsaved changes.

## Pitfalls
- **Do not move data files** after saving: the project only remembers file locations; a moved GeoPackage will not be found [video qgis-saving-a-project-file @00:41].
- Projects saved in cloud-synced folders (e.g. an Apple/iCloud-linked folder) may fail to find their data [video qgis-saving-a-project-file @00:50].
- Temporary (scratch) layers are lost when the project closes unless saved to files first [video qgis-saving-a-project-file @01:28].

## Related
- [save-layers-to-geopackage.md](save-layers-to-geopackage.md)
- [interface-map.md](interface-map.md)
