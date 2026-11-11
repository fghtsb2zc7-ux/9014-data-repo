---
id: qgis.add-base-map-quickmapservices
tool: qgis
title: Add a base map (Google Maps, ESRI Satellite, ESRI Ocean) with QuickMapServices
keywords: [base map, basemap, background map, QuickMapServices, QMS, Search QMS, Google Maps, ESRI Satellite, World Imagery, ESRI Ocean, bathymetry, satellite imagery, XYZ tiles, context map, remove layer]
software_context: "QGIS 3.x with the QuickMapServices plugin (Windows, instructor's install)"
prerequisites: [qgis.install-quickmapservices-plugin]
source_videos: [{video: transcripts/qgis/qgis-base-maps.md, timestamps: "00:07-02:56"}, {video: transcripts/qgis/qgis-raster-import.md, timestamps: "01:22-01:59"}, {video: transcripts/qgis/qgis-esri-rest-servers.md, timestamps: "03:22-03:46"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: []
---
# Add a base map with QuickMapServices

## Purpose
Base maps give spatial context (roads, towns, imagery, bathymetry) under your analysis layers; they are for display, not analysis. Choose one relevant to the data: roads/towns -> Google Maps; land cover -> ESRI Satellite; marine data -> ESRI Ocean [video qgis-base-maps @00:07, @01:20, @01:56]. Checklist skill "I can add a basemap to a QGIS project" [page technical-skills-checklist.md].

## Steps
1. Make sure QuickMapServices is installed (globe icons on toolbar row 2) [video qgis-base-maps @00:20].
2. Click the **Search QMS** globe icon (third QMS icon on toolbar row 2) or choose `Web > QuickMapServices > Search QMS` [frame qgis-base-maps @00:42] [frame qgis-introduction-to-qgis @04:52].
3. The **Search QMS** panel ("Search NextGIS QMS" in later recordings) docks on the right, with a "Search string..." box and a "Last used:" list [frame qgis-base-maps @00:52].
4. Type part of the service name, e.g. `Google` or `ESRI` [frame qgis-base-maps @02:12].
5. Click **Add** next to the service:
   - "Google Maps" -> layer "Google Maps" [frame qgis-base-maps @01:12]
   - "ESRI Satellite (ArcGIS/World_Imagery)" -> satellite imagery [frame qgis-base-maps @01:52]
   - "ESRI Ocean" -> shaded bathymetry (continental shelf, Mid-Atlantic Ridge); used under the marine invasive-species rasters and REST layers [frame qgis-base-maps @02:32] [video qgis-raster-import @01:22]
6. In the Layers panel drag the base map to the **bottom** so data layers draw on top [video qgis-raster-import @01:35].
7. To swap base maps: right-click the base-map layer > **Remove Layer...**, then add another [video qgis-base-maps @01:33]. Status bar shows "1 legend entries removed." [frame qgis-base-maps @01:42]

## Verify
- A new tile layer (e.g. "ESRI Ocean") is listed in the Layers panel and imagery fills the canvas.
- If the project was empty, the status bar CRS switches to **EPSG:3857** (WGS 84 / Pseudo-Mercator) because the first layer sets the project CRS [frame qgis-base-maps @01:12] [video qgis-base-maps @01:05].

## Pitfalls
- Base maps are web tiles in EPSG:3857 and stretch high latitudes; this is expected [video qgis-base-maps @01:05].
- Google Maps is visually busy; only use it when roads/settlements matter [video qgis-base-maps @01:20].
- Tiles need an internet connection; a blue progress bar in the status bar means tiles are still loading [frame qgis-base-maps @01:22].

## Related
- [install-quickmapservices-plugin.md](install-quickmapservices-plugin.md)
- [set-project-crs.md](set-project-crs.md)
- [add-raster-geotiff-and-style-pseudocolor.md](add-raster-geotiff-and-style-pseudocolor.md)
- [add-arcgis-rest-server-layer.md](add-arcgis-rest-server-layer.md)
