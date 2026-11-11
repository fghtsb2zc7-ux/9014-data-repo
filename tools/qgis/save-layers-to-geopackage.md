---
id: qgis.save-layers-to-geopackage
tool: qgis
title: Save selected features or working layers into one GeoPackage (.gpkg) and reload them
keywords: [geopackage, gpkg, save features as, save selected features as, export layer, save vector layer as, multiple layers one file, make permanent, temporary layer, scratch layer, select features, Thames River watershed, PWQMN stations, add layers from geopackage]
software_context: "QGIS 3.x (Windows, instructor's install), Layers panel right-click > Export > Save (Selected) Features As..."
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-saving-working-layers-to-geopackages.md, timestamps: "00:06-05:03"}, {video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "09:45-09:52"}]
source_pages: [course-pages/topic-7.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 7.zip > wtrshter/wtrshter.shp (Ontario tertiary watersheds; Upper+Lower Thames merged in the merging video)", "sources/files/PWQMN_Stations.csv"]
---
# Save selected features or working layers into one GeoPackage

## Purpose
A GeoPackage is a single file that can hold many layers (unlike a shapefile = one layer, many files). Use it to store the manipulated layers of a project together, then reload them later [video qgis-saving-working-layers-to-geopackages @00:46-01:10, @04:39]. Checklist skills "I can export layers as a new Shapefile, CSV file or GeoPackage" and "I can export selected spatial attributes to their own Shapefile" [page technical-skills-checklist.md].

## Steps
### A. Export one selected feature to a new GeoPackage
1. Click **Select Features by Area or Single Click** (Selection toolbar) [frame qgis-saving-working-layers-to-geopackages @01:12].
2. Click the feature (merged Thames River watershed in layer `wtrshter`). Status bar: "1 feature selected on layer wtrshter (Thames River Watershed)." [frame qgis-saving-working-layers-to-geopackages @01:22]
3. Right-click the layer > **Export > Save Selected Features As...** [video qgis-saving-working-layers-to-geopackages @01:20].
4. In "Save Vector Layer as...": **Format** = `GeoPackage` (from the dropdown) [frame qgis-saving-working-layers-to-geopackages @01:32].
5. Click **...** next to **File name**, browse to the lesson folder (Topic 7), type `thames_river_watershed`, Save (type "GeoPackage (*.gpkg *.gpkg.zip *.GPKG *.GPKG.ZIP)") [frame qgis-saving-working-layers-to-geopackages @01:42].
6. **Layer name**: change `wtrshter` to `thames_river` (name of the layer inside the .gpkg) [frame qgis-saving-working-layers-to-geopackages @02:02].
7. Leave **CRS** `EPSG:4269 - NAD83` (layer's CRS), **Save only selected features** ticked, all fields ticked, **Persist layer metadata** ticked, Geometry type `Automatic`, **Add saved file to map** ticked [frame qgis-saving-working-layers-to-geopackages @01:32].
8. Click **OK** [video qgis-saving-working-layers-to-geopackages @02:03].

### B. Add another layer to the same GeoPackage
9. Build or load the next layer (video: add `PWQMN_Stations.csv` as delimited text, X `LONGITUDE`, Y `LATITUDE`, EPSG:4326; then Vector overlay > Clip with Input `PWQMN_Stations`, Overlay `thames_river_watershed — thames_river`, output temporary "Clipped") [frame qgis-saving-working-layers-to-geopackages @02:32, @03:02] — see [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md).
10. Rename the temporary layer: double-click/right-click > Rename Layer, type `pwqmn_station_thames` [frame qgis-saving-working-layers-to-geopackages @03:32].
11. Right-click it > **Export > Save Features As...** [frame qgis-saving-working-layers-to-geopackages @03:42].
12. Format `GeoPackage`; **File name** = the same `...\Topic 7\thames_river_watershed.gpkg`; **Layer name** = `pwqmn_station_thames`; CRS `EPSG:4326 - WGS 84`; **OK** [frame qgis-saving-working-layers-to-geopackages @03:52]. The layer is added inside the existing file.

### C. Reload layers from the GeoPackage
13. (Video removes all layers first.) Drag `thames_river_watershed.gpkg` from File Explorer/Browser onto the map [video qgis-saving-working-layers-to-geopackages @04:00].
14. In "Select Items to Add | thames_river_watershed" tick the layers wanted (list shows pwqmn_station_thames Point (97), thames_river MultiPolygon (1), thames_river_watershed MultiPolygon (1), wtrshter MultiPolygon (1)) and click **Add Layers** [frame qgis-saving-working-layers-to-geopackages @04:22].

## Verify
- Green message bar "Layer Exported: Successfully saved vector layer to ...\Topic 7\thames_river_watershed.gpkg" [frame qgis-saving-working-layers-to-geopackages @02:12].
- New layers named "<gpkg name> — <layer name>", e.g. "thames_river_watershed — thames_river", "thames_river_watershed — pwqmn_station_thames" [frame qgis-saving-working-layers-to-geopackages @02:12, @04:02].
- Reloaded layers appear in a group named `thames_river_watershed` [frame qgis-saving-working-layers-to-geopackages @04:32].
- The clipped station layer holds 97 points [frame qgis-saving-working-layers-to-geopackages @04:22].

## Pitfalls
- If the source layer was being edited (e.g. after merging features), toggle editing off and save edits first; QGIS prompts to save [video qgis-saving-working-layers-to-geopackages @00:22] [page topic-7.md].
- "Save Selected Features As..." is greyed out when nothing is selected; "Save only selected features" must be ticked to export just the selection [frame qgis-saving-working-layers-to-geopackages @03:42, @01:32].
- Reusing an existing .gpkg with a new Layer name adds a layer; reusing an existing layer name may overwrite it (QGIS asks; general knowledge — not shown in course).
- Temporary outputs (e.g. "Clipped") show an indicator icon and are lost on close unless saved (right-click > Make Permanent... or Export) [frame qgis-saving-working-layers-to-geopackages @03:42].
- Symbology is not stored by this export; save the project file too [video qgis-saving-a-project-file @00:05].

## Related
- [save-project-file.md](save-project-file.md)
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
- [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md)
- [add-shapefile-drag-and-drop.md](add-shapefile-drag-and-drop.md)
