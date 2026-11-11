---
id: qgis.interface-map
tool: qgis
title: Orient yourself in the QGIS window (panels, toolbars, menus, status bar)
keywords: [interface, layout, window, GUI, menu bar, toolbar, browser panel, layers panel, map canvas, status bar, processing toolbox, identify results, panels, where is, orientation, tour, menus, coordinate box, EPSG, project CRS]
software_context: "QGIS 3.x on Windows. Two installs appear in the course videos: (a) the instructor's main install with the SCP (Semi-Automatic Classification) plugin menu; (b) a newer install without SCP whose Browser shows STAC, Cloud, Scenes, SensorThings and whose Layer > Add Layer menu has 'Add Layer from STAC Catalog...'. Processing logs in the 2026 recordings show QGIS 3.44.13-Solothurn, and the 2025 recordings (Spatial joins, Join attributes by location) use QGIS 3.22.3-Białowieża with older parameter labels; a Topic 7 recording also shows the banner 'New QGIS version available ... version 3.44.15', so the instructor runs an earlier 3.4x release. Course page recommends the Long Term Release (LTR)."
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-introduction-to-qgis.md, timestamps: "00:12-11:46"}, {video: transcripts/qgis/qgis-crs.md, timestamps: "00:12-02:42"}, {video: transcripts/qgis/qgis-base-maps.md, timestamps: "00:12-00:52"}, {video: transcripts/qgis/qgis-adding-a-shapefile.md, timestamps: "00:12"}, {video: transcripts/qgis/qgis-basic-filter-in-qgis.md, timestamps: "00:42"}, {video: transcripts/qgis/qgis-saving-a-project-file.md, timestamps: "01:12"}]
source_pages: [course-pages/getting-started-with-course-software.md, course-pages/topic-1-loading-cleaning-and-exploring-data.md]
datasets_used: []
---
# Orient yourself in the QGIS window

## Purpose
A map of the QGIS main window exactly as it appears in the ENVRSUST 9014 videos, so an agent can find a menu, panel, button or status-bar control before running any other procedure. Install QGIS from https://qgis.org/ and choose the **Long Term Release (LTR)** [page getting-started-with-course-software.md].

## Window layout (default arrangement used in the course)

```
+--------------------------------------------------------------------------------+
| Title bar: "*Untitled Project — QGIS"  (asterisk = unsaved changes)            |
| Menu bar: Project Edit View Layer Settings Plugins Vector Raster Database Web  |
|           Mesh [SCP] Processing Help                                           |
| Toolbar rows 1-4 (see below)                                                   |
+------------------+---------------------------------------------+---------------+
| Browser panel    |                                             | Right dock:   |
| (top-left)       |              Map canvas                     | Processing    |
+------------------+          (centre, white when empty)         | Toolbox /     |
| Layers panel     |                                             | Identify      |
| (bottom-left)    |                                             | Results /     |
|                  |                                             | Search QMS    |
+------------------+---------------------------------------------+---------------+
| Status bar: [Type to locate (Ctrl+K)] [messages] Coordinate | Scale | Magnifier |
|             | Rotation | Render [x] | EPSG:xxxx (project CRS button) | log icon |
+--------------------------------------------------------------------------------+
```
[frame qgis-introduction-to-qgis @00:12]

In the instructor's Raster-import / REST-server / Topic 7 recordings the left dock also shows **GPS Information** and **Advanced Digitizing** panels between Browser and Layers [frame qgis-raster-import @00:12]. Panels can be docked/undocked; the right-hand dock is where Processing Toolbox, Identify Results and the QuickMapServices search panel open.

## Menu bar (as shown)
| Menu | Items the course uses (exact labels) |
|---|---|
| `Project` | New (Ctrl+N), New from Template, Open... (Ctrl+O), Open From, Open Recent, Close, Save (Ctrl+S), Save As... (Ctrl+Shift+S), Save To, Revert..., Properties... (Ctrl+Shift+P), Snapping Options..., Import/Export, New Print Layout... (Ctrl+P), New Report..., Layout Manager..., Layouts, Exit QGIS (Ctrl+Q) [frame qgis-introduction-to-qgis @00:32] |
| `Edit` | (not opened in these videos) |
| `View` | New Map View (Ctrl+M), New 3D Map View, Pan Map, Zoom In/Out, Identify Features (Ctrl+Shift+I), Measure, Statistical Summary, Zoom Full (Ctrl+Shift+F), Zoom to Layer(s), Zoom Last/Next, Decorations, Preview Mode, Show Map Tips, Spatial Bookmarks, Refresh (F5), Layer Visibility, **Panels**, **Toolbars**, Toggle Full Screen Mode (F11), Toggle Panel Visibility (Ctrl+Tab), Toggle Map Only (Ctrl+Shift+Tab) [frame qgis-introduction-to-qgis @07:22] |
| `Layer` | Data Source Manager (Ctrl+L), Create Layer >, Add Layer >, Embed Layers and Groups..., Add from Layer Definition File..., (newer install: Georeferencer...), Copy/Paste Style, Copy Layer, Paste Layer/Group, Open Attribute Table (F6), Filter Attribute Table, Toggle Editing, Save Layer Edits, Current Edits, Save As..., Save As Layer Definition File..., Remove Layer/Group (Ctrl+D), Duplicate Layer(s), Set Scale Visibility of Layer(s), Set CRS of Layer(s) (Ctrl+Shift+C), Set Project CRS from Layer, Layer Properties..., Filter... (Ctrl+F), Labeling, Show in Overview, Show All in Overview, Hide All from Overview [frame qgis-introduction-to-qgis @00:52] |
| `Layer > Create Layer` | New GeoPackage Layer... (Ctrl+Shift+N), New Shapefile Layer..., New SpatiaLite Layer..., New Temporary Scratch Layer..., New Mesh Layer..., New GPX Layer..., New Virtual Layer... [frame qgis-introduction-to-qgis @01:42] |
| `Layer > Add Layer` | Add Vector Layer... (Ctrl+Shift+V), Add Raster Layer... (Ctrl+Shift+R), Add Mesh Layer..., **Add Delimited Text Layer... (Ctrl+Shift+T)**, Add PostGIS Layers... (Ctrl+Shift+D), Add SpatiaLite Layer... (Ctrl+Shift+L), Add MSSQL Spatial Layer..., Add Oracle Spatial Layer... (Ctrl+Shift+O), Add SAP HANA Spatial Layer..., Add/Edit Virtual Layer..., Add WMS/WMTS Layer... (Ctrl+Shift+W), Add XYZ Layer..., Add raster for interactive georeferencing, Add WCS Layer..., Add WFS Layer... (newer: Add WFS / OGC API - Features Layer...), **Add ArcGIS REST Server Layer...**, Add Vector Tile Layer..., Add Point Cloud Layer..., (newer: Add GPX Layer..., Add Layer from STAC Catalog...) [frame qgis-introduction-to-qgis @02:02; frame qgis-basic-filter-in-qgis @00:42] |
| `Settings` | (not opened) |
| `Plugins` | Manage and Install Plugins... opens "Plugins \| All (N)" [frame qgis-introduction-to-qgis @02:52] |
| `Vector` | KML Tools, Points2One, Sort and Number (plugin menus), Geoprocessing Tools, Geometry Tools, Analysis Tools, Research Tools, Data Management Tools [frame qgis-introduction-to-qgis @04:02] |
| `Vector > Analysis Tools` | Count Points in Polygon..., Line Intersections..., Mean Coordinate(s)..., Nearest Neighbour Analysis..., Sum Line Lengths..., Basic Statistics for Fields..., Distance Matrix..., List Unique Values... |
| `Vector > Geometry Tools` | Centroids..., Collect Geometries..., Densify by Count..., Extract Vertices..., Multipart to Singleparts..., Polygons to Lines..., Simplify..., Check Validity..., Delaunay Triangulation..., Add Geometry Attributes..., Lines to Polygons..., Voronoi Polygons... [frame qgis-introduction-to-qgis @04:12] |
| `Raster` | Raster Calculator..., Align Rasters..., Georeferencer..., Freehand Raster Georeferencer, KML Tools, Analysis, Projections, Miscellaneous, Extraction, Conversion [frame qgis-introduction-to-qgis @04:22] |
| `Web` | MetaSearch, **QuickMapServices** > Landsat, MapSurfer.NET, NASA, OSM, eAtlas Mos, Search QMS, Add to Search, Set proper scale, Settings, About (appears only after installing the plugin) [frame qgis-introduction-to-qgis @04:52] |
| `SCP` | Semi-Automatic Classification Plugin (instructor's install only; not used in these videos) |
| `Processing` | Toolbox (toggle the Processing Toolbox panel) |

## Toolbars (instructor's main install, top to bottom)
1. **Row 1**: Project toolbar (New, Open, Save, Save As, Print layout, Style manager), Map Navigation (Pan hand, Pan to selection, Zoom In, Zoom Out, Zoom Full, Zoom to selection/layer/native, Zoom Last/Next, New Map View, Temporal controller, Refresh), Attributes toolbar: **Identify Features** (tooltip "Identify Features (Ctrl+Shift+I)", the "i" cursor), Open Attribute Table, **Processing Toolbox gear icon** (toggles the toolbox panel), Σ Statistical Summary, Measure, Map Tips, ... [frame qgis-introduction-to-qgis @05:32] [video qgis-introduction-to-qgis @04:58]
2. **Row 2**: Manage Layers / Data Source buttons (Open Data Source Manager, new GeoPackage/shapefile layer, etc.), Digitizing toolbar (pencil = Toggle Editing; greyed until a layer is selected), Label toolbar, then plugin buttons: three **QuickMapServices globe icons** (the third one opens the **Search QMS** panel), Python console, ... [frame qgis-base-maps @00:42]
3. **Row 3**: Advanced Digitizing / Shape Digitizing (greyed until editing) [video qgis-introduction-to-qgis @05:32]
4. **Row 4**: Selection toolbar (**Select Features by Area or Single Click**, yellow square with cursor), attribute/vertex tools, and in the main install the **SCP** toolbar ("RGB =", "ROI", "Dist", "Min", "Max", "Preview"); also KML/KMZ/HTML export buttons from a plugin [frame qgis-saving-working-layers-to-geopackages @01:12]

The newer install used in the shapefile / delimited text / basic filter videos has only two toolbar rows (no SCP) [frame qgis-adding-a-shapefile @00:12].

## Browser panel (top-left)
- Lists drives/folders (Favorites, Spatial Bookmarks, Home, C:\, network drives such as S:\ (ITSsoftware$), W:\ (enswork$)) followed by data-source categories: GeoPackage, SpatiaLite, PostGIS / PostgreSQL, SAP HANA, (STAC), MSSQL / MS SQL Server, Oracle, WMS/WMTS, (Cloud, Scenes, SensorThings), Vector Tiles, XYZ Tiles, WCS, WFS / OGC API - Features, **ArcGIS REST Servers**, GeoNode [frame qgis-introduction-to-qgis @00:12; frame qgis-adding-a-shapefile @00:12].
- Use it to: navigate to files and double-click/drag them into the map; expand **XYZ Tiles** (e.g. Bing VirtualEarth, CartoDb Dark Matter, CartoDb Positron, Esri Boundaries Places) [frame qgis-base-maps @00:12]; right-click **ArcGIS REST Servers > New Connection...** to add a REST service [video qgis-esri-rest-servers @01:58].
- If the panel is missing: `View > Panels > Browser` [video qgis-introduction-to-qgis @07:05].

## Layers panel (bottom-left)
- Lists every layer in the project; checkbox = visible; order = drawing order (top layer draws on top). Drag a layer to move it (e.g. put the World Map or base map **underneath** point data) [video qgis-adding-a-delimited-text-layer @02:20].
- Legend appears beneath each layer (e.g. raster "Band 1 (Gray)" with min/max; REST layer "High : 1 - Low : 0").
- Layers loaded from one GeoPackage appear inside a group named after the .gpkg file [frame qgis-saving-working-layers-to-geopackages @04:32].
- A funnel icon to the right of a layer name means a filter is active [frame qgis-basic-filter-in-qgis @01:52].
- **Right-click a layer** (context menu as shown): Zoom to Layer(s), Zoom to Selection, Show in Overview, Show Feature Count, Show Labels, Copy Layer, Rename Layer, Update SQL Layer..., Duplicate Layer, Remove Layer..., (newer: Move to Bottom), Open Attribute Table, Toggle Editing, Filter..., Change Data Source..., Set Layer Scale Visibility..., Layer CRS >, (temporary layers: Make Permanent...), Export > (Save Features As..., Save Selected Features As..., Save as Layer Definition File..., Save as QGIS Layer Style File...), Styles >, Add Layer Notes..., Properties... [frame qgis-introduction-to-qgis @09:32; frame qgis-saving-working-layers-to-geopackages @03:42]
- **Double-click a layer** = open Layer Properties (goes to Symbology) [video qgis-raster-import @01:59].
- If the panel is missing: `View > Panels > Layers`.

## Layer Properties dialog
Title "Layer Properties — <layer> — <tab>". Vector tabs: Information, Source, Symbology, Labels, Masks, 3D View, Diagrams, Fields, Attributes Form, Joins, Auxiliary Storage, Actions, Display, Rendering, Temporal, Variables, Metadata, Dependencies, Legend, QGIS Server [frame qgis-introduction-to-qgis @10:42]. Raster tabs: Information, Source, Symbology, Transparency, Labels, Histogram, Rendering, Temporal, Pyramids, Elevation, Metadata, Legend, Display, Attribute Tables, QGIS Server [frame qgis-raster-import @02:12]. Buttons: Style, OK, Cancel, Apply, Help. The course mainly uses **Symbology**, **Labels**, **Source/Information** (to read the CRS) and **Joins**.

## Map canvas (centre)
Main viewing window; blank white until a layer is added. Scroll to zoom, drag with the Pan hand to move [video qgis-introduction-to-qgis @07:23].

## Right dock panels
- **Processing Toolbox** (gear icon or `Processing > Toolbox`): search box at top plus groups Recently used, Cartography, Database, File tools, GPS, Interpolation, Layer tools, Mesh, Network analysis, Plots, Raster analysis, Raster creation, Raster terrain analysis, Raster tools, Vector analysis, Vector creation, Vector general, Vector geometry, Vector overlay, Vector selection, Vector table, Vector tiles, GDAL, GRASS, KML tools, SAGA [frame qgis-introduction-to-qgis @05:02]. Typing e.g. `clip` filters tools (Vector overlay > Clip) [frame qgis-saving-working-layers-to-geopackages @03:12].
- **Identify Results**: opens when you click a feature/pixel with Identify Features; columns Feature / Value; Mode "Current Layer"; View "Tree" [frame qgis-introduction-to-qgis @08:52].
- **Search QMS / Search NextGIS QMS**: QuickMapServices base-map search [frame qgis-base-maps @00:52].
- `View > Panels` list (to show/hide any panel): Advanced Digitizing, Browser, Browser (2), Debugging/Development Tools, GPS Information, Layer Order, Layer Styling, Layers, Log Messages, Overview, Processing Toolbox, Results Viewer, SCP Dock, Spatial Bookmark Manager, Statistics, Temporal Controller, Tile Scale, Undo/Redo, Search QMS [frame qgis-introduction-to-qgis @07:22].

## Status bar (bottom)
- Left: **locator** "Type to locate (Ctrl+K)"; then message area (e.g. "1 legend entries removed.", "1 feature selected on layer ...", "Saved project to: ...").
- Right: **Coordinate** box (shows cursor coordinates in project-CRS units; you can also type into it — typing `world` + Enter adds the built-in "World Map" layer) [video qgis-introduction-to-qgis @07:23] [frame qgis-introduction-to-qgis @08:02]; **Scale** (e.g. 1:906106); lock; **Magnifier** 100%; **Rotation** 0.0°; **Render** checkbox; **EPSG:xxxx** button = current project CRS — click it to open `Project Properties — CRS` [frame qgis-crs @02:22]; message/log icon.

## Start page
With no project open QGIS shows **Recent Projects** (thumbnail, path, CRS) and **Project Templates** ("New Empty Project EPSG:4326 - WGS 84"); update notices appear in a green banner at the bottom [frame qgis-saving-a-project-file @01:12].

## Verify
- The menu bar shows `Project ... Processing Help` and the status bar shows an `EPSG:` code at bottom-right.
- Browser and Layers panels are visible on the left (restore via `View > Panels`).

## Pitfalls
- **Hidden pop-up windows (especially on Mac)**: QGIS opens many separate windows (plugin manager, dialogs) that can end up behind other windows; if nothing seems to happen, look for the new window [video qgis-introduction-to-qgis @02:32].
- Icon/text size differs between recordings because the instructor enlarged them for video [video qgis-crs @00:06].
- The SCP menu/toolbar and KML/KMZ buttons come from plugins on the instructor's machine; a fresh install will not have them.

## Related
- [install-quickmapservices-plugin.md](install-quickmapservices-plugin.md)
- [explore-layer-identify-attribute-table-properties.md](explore-layer-identify-attribute-table-properties.md)
- [set-project-crs.md](set-project-crs.md)
- [add-delimited-text-layer-csv.md](add-delimited-text-layer-csv.md)
- [save-project-file.md](save-project-file.md)
