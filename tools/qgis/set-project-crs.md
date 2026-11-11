---
id: qgis.set-project-crs
tool: qgis
title: Check and change the project coordinate reference system (CRS)
keywords: [CRS, coordinate reference system, projection, project CRS, EPSG, EPSG:4326, WGS 84, EPSG:3857, Pseudo-Mercator, EPSG:3161, Ontario MNR Lambert, NAD83, datum, units, metres, degrees, Project Properties, select transformation, on-the-fly reprojection, world map]
software_context: "QGIS 3.x (Windows, instructor's install), status-bar CRS button > Project Properties — CRS"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-crs.md, timestamps: "00:06-05:23"}, {video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "07:23-08:40"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["QGIS built-in 'World Map' layer (type world in the status-bar Coordinate box)"]
---
# Check and change the project coordinate reference system (CRS)

## Purpose
The project CRS controls how all layers are drawn together (QGIS reprojects layers on the fly) and which units you see. Use EPSG:4326 (WGS 84, degrees) for global lat/long data, EPSG:3857 (WGS 84 / Pseudo-Mercator, metres) when you need metre units, or a regional CRS such as EPSG:3161 (NAD83 / Ontario MNR Lambert, metres) for low distortion in Ontario [video qgis-crs @00:42, @02:38, @03:49]. This changes only the **project** display CRS; to permanently convert a layer use [reproject-vector-layer.md](reproject-vector-layer.md).

## Steps
1. (Optional quick test layer) Click in the status-bar **Coordinate** box, type `world`, press Enter. A layer named "World Map" is added [video qgis-introduction-to-qgis @07:40] [frame qgis-introduction-to-qgis @08:02].
2. Read the current project CRS on the status-bar button at bottom-right, e.g. **EPSG:4326** [frame qgis-crs @02:02].
3. Click that **EPSG:xxxx** button. "Project Properties — CRS" opens (same as `Project > Properties... > CRS`) [frame qgis-crs @02:22].
4. Pick the CRS:
   - from **Recently Used Coordinate Reference Systems**, or
   - type a name/code in **Filter** and select it under **Predefined Coordinate Reference Systems** (Filter use is general knowledge — not shown in course; the instructor picked from Recently Used).
   Values shown in the course:

   | CRS name (as listed) | Authority ID | Units / note |
   |---|---|---|
   | WGS 84 | EPSG:4326 | degrees; geographic lat/long; course default for global data |
   | WGS 84 / Pseudo-Mercator | EPSG:3857 | metres; Mercator; good for buffers/distances in metres |
   | NAD83 / Ontario MNR Lambert | EPSG:3161 | metres; Lambert Conformal Conic; low distortion for Ontario |
   | NAD83 / UTM zone 17N | EPSG:26917 | (listed in Recently Used) |
   | NAD83 / Canada Atlas Lambert | EPSG:3978 | (seen on a recent project, Topic 7) |
   [frame qgis-crs @02:22, @03:02, @04:02] [frame qgis-saving-a-project-file @01:12]
5. Check the properties pane below the list (e.g. "Units: meters", "Method: Mercator") [frame qgis-crs @03:02].
6. Click **Apply**, then **OK** [video qgis-crs @03:12].
7. If a **"Select Transformation for <layer>"** dialog appears (e.g. Source CRS EPSG:4326 - WGS 84 -> Destination CRS EPSG:3161 - NAD83 / Ontario MNR Lambert), keep the default first row ("Inverse of NAD83 to WGS 84 (1) + Ontario MNR Lambert", accuracy 4 m) and click **OK** [video qgis-crs @04:10] [frame qgis-crs @04:12].

## Verify
- Status-bar button now shows the new code (EPSG:3857 / EPSG:3161) [frame qgis-crs @03:22, @04:32].
- Coordinates in the Coordinate box switch from degrees (e.g. 137.8,-108.0) to metres (e.g. 7227107,-7971221) [frame qgis-crs @03:22].
- The map shape changes: Mercator enlarges Greenland/Antarctica; Ontario MNR Lambert distorts South America but shows Ontario with little distortion [video qgis-crs @03:12, @04:28].

## Pitfalls
- **Layers not appearing**: a layer whose CRS is wrong/mismatched may not show up where expected; check the CRS first ("one of the biggest tripping points") [video qgis-crs @00:42].
- Distances in EPSG:4326 are in **degrees**, hard to interpret; switch to a metre-based CRS before measuring or buffering [video qgis-crs @02:38].
- The first layer added to an empty project sets the project CRS (e.g. a QMS base map or REST layer makes it EPSG:3857) [frame qgis-base-maps @01:12] [video qgis-esri-rest-servers @03:30].
- The layer's own CRS is shown in Layer Properties > Information/Source and in the layer right-click menu `Layer CRS` [video qgis-introduction-to-qgis @10:29] [frame qgis-introduction-to-qgis @09:32].

## Related
- [reproject-vector-layer.md](reproject-vector-layer.md)
- [reproject-raster-warp.md](reproject-raster-warp.md)
- [interface-map.md](interface-map.md)
- [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md)
