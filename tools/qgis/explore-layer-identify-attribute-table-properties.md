---
id: qgis.explore-layer-identify-attribute-table-properties
tool: qgis
title: Explore a layer with Identify Features, the attribute table and Layer Properties
keywords: [identify, identify features, info button, attribute table, open attribute table, F6, layer properties, symbology, labels, inspect features, feature values, pixel value, zoom to layer, explore data, world map, layer context menu]
software_context: "QGIS 3.x (Windows, instructor's install)"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "05:25-11:46"}, {video: transcripts/qgis/qgis-adding-a-delimited-text-layer.md, timestamps: "02:39-03:03"}, {video: transcripts/qgis/qgis-raster-import.md, timestamps: "03:48-05:07"}]
source_pages: [course-pages/technical-skills-checklist.md]
datasets_used: ["QGIS built-in 'World Map' layer", "sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv", "sources/files/Topic 2/Carcinus maenas.tif"]
---
# Explore a layer with Identify Features, the attribute table and Layer Properties

## Purpose
Basic inspection of any loaded layer: click features or pixels to read their values, open the attribute table, and open Layer Properties to see the CRS or change symbology/labels. Checklist skill "I can open and explore a layer's attribute table" [page technical-skills-checklist.md].

## Steps
### Identify a feature or pixel
1. Select the layer in the Layers panel (Identify uses Mode "Current Layer") [frame qgis-introduction-to-qgis @08:52].
2. Click **Identify Features** on toolbar row 1 (tooltip "Identify Features (Ctrl+Shift+I)"; also `View > Identify Features`) [frame qgis-introduction-to-qgis @05:32].
3. Click a feature on the map. The **Identify Results** panel opens on the right and the feature is highlighted red [video qgis-introduction-to-qgis @08:40].
   - World Map example, Canada: fid 16, iso_a2 CA, NAME Canada, FIPS_10_ CA, ISO_A3 CAN, WB_A2 CA, WB_A3 CAN [frame qgis-introduction-to-qgis @09:02].
   - Raster example: clicking a cell of "Carcinus maenas" shows "Band 1 0.1156265" (probability of occurrence) [frame qgis-raster-import @04:02].

### Open the attribute table
4. Right-click the layer > **Open Attribute Table** (or `Layer > Open Attribute Table`, F6) [frame qgis-introduction-to-qgis @09:32] [frame qgis-adding-a-delimited-text-layer @02:52].
5. The window title reports counts, e.g. "World Map — Features Total: 240, Filtered: 240, Selected: 0"; columns e.g. NAME, FIPS_10_, ISO_A3, WB_A2, WB_A3, fid, iso_a2 [frame qgis-introduction-to-qgis @10:02]. "fid" identifies each polygon [video qgis-introduction-to-qgis @10:10].

### Other context-menu actions shown
6. **Zoom to Layer(s)**: use when a newly added layer is "lost" among others [video qgis-introduction-to-qgis @09:30].
7. **Toggle Editing**: edit the layer (remove/add features) [video qgis-introduction-to-qgis @09:17].
8. **Export > Save Features As...**: save a reduced dataset to a new file (see [save-layers-to-geopackage.md](save-layers-to-geopackage.md), [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)) [video qgis-introduction-to-qgis @09:45].

### Layer Properties
9. Right-click > **Properties...** (or double-click the layer). "Layer Properties — World Map — Symbology" opens [frame qgis-introduction-to-qgis @10:42].
10. Tabs used in the course: **Information/Source** (layer CRS, e.g. 4326), **Symbology** (colours; Single Symbol > Fill > Simple Fill, Color, Opacity 100.0 %, Unit Millimeters), **Labels** (default "No Labels"; label by an attribute), **Joins** (attribute joins) [video qgis-introduction-to-qgis @10:29] [frame qgis-introduction-to-qgis @11:02].
11. Click **Apply**, then **OK**.

## Verify
- Identify Results lists the clicked feature's fields and values.
- Attribute table row count matches "Features Total".

## Pitfalls
- Identify returns nothing if a different layer is selected in the Layers panel (Mode = Current Layer).
- Point layers made from CSVs keep their latitude/longitude columns in the attribute table [video qgis-adding-a-delimited-text-layer @02:45].

## Related
- [interface-map.md](interface-map.md)
- [set-project-crs.md](set-project-crs.md)
- [join-table-to-layer-by-attribute.md](join-table-to-layer-by-attribute.md)
- [add-raster-geotiff-and-style-pseudocolor.md](add-raster-geotiff-and-style-pseudocolor.md)
