---
id: qgis.install-quickmapservices-plugin
tool: qgis
title: Install the QuickMapServices (QMS) plugin
keywords: [plugin, install plugin, QuickMapServices, QMS, NextGIS, base map plugin, Plugins menu, Manage and Install Plugins, web map services]
software_context: "QGIS 3.x (Windows, instructor's install), Plugins dialog"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "02:32-03:45"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md]
datasets_used: []
---
# Install the QuickMapServices (QMS) plugin

## Purpose
QuickMapServices adds a searchable list of web base maps (Google Maps, ESRI Satellite, ESRI Ocean, OSM ...). The course installs it in the intro video and uses it whenever a base map is needed [video qgis-introduction-to-qgis @02:32] [page topic-1-loading-cleaning-and-exploring-data.md].

## Steps
1. Open `Plugins > Manage and Install Plugins...`. The dialog title is "Plugins | All (1949)" (count varies) [frame qgis-introduction-to-qgis @02:52]. (Menu item label is general knowledge — not shown in course; the video shows the Plugins menu then the dialog.)
2. If the dialog does not appear, look for it behind other windows (common on Mac) [video qgis-introduction-to-qgis @02:32].
3. Stay on the **All** tab and type `QMS` in the search box [video qgis-introduction-to-qgis @03:06] [frame].
4. Click **QuickMapServices** in the result list; the right pane describes it ("Convenient list of services, search for finding data sets and base maps") [video qgis-introduction-to-qgis @03:20].
5. Click **Install Plugin** (button label general knowledge — not shown in course; the instructor had already installed it).
6. Click **Close** [video qgis-introduction-to-qgis @03:40].

## Verify
- Three new globe icons appear on the second toolbar row [frame qgis-introduction-to-qgis @03:42].
- `Web > QuickMapServices` exists with Landsat, MapSurfer.NET, NASA, OSM, eAtlas Mos, Search QMS, Add to Search, Set proper scale, Settings, About [frame qgis-introduction-to-qgis @04:52].
- `View > Panels` now lists "Search QMS" [frame qgis-introduction-to-qgis @07:22].

## Pitfalls
- Only a few providers are in the default menu; use **Search QMS** to find Google/ESRI layers (see the base-map procedure). Enabling the full contributed list via `Web > QuickMapServices > Settings > More services > Get contributed pack` is general knowledge — not shown in course; the instructor's search already returned Google and ESRI services.

## Related
- [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md)
- [interface-map.md](interface-map.md)
