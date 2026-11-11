---
id: qgis.readme
tool: qgis
title: QGIS in ENVRSUST 9014 — overview and procedure index
keywords: [index, overview, QGIS, GIS, start here]
---
# QGIS in ENVRSUST 9014

**Software context:** QGIS 3.44.x (2026 recordings; "3.44.13-Solothurn" visible in some frames) and QGIS 3.22.3 in two 2025
recordings (Spatial joins, Join attributes by location), Windows. Plugin used: QuickMapServices. Analysis tools are almost
always opened by **searching the Processing Toolbox** (Processing > Toolbox, then type the algorithm name) rather than menus.

**Orientation first:** [interface-map.md](interface-map.md) describes the window, panels, menus and status bar as the course shows them.

**Typical workflow an agent should follow:**
1. Set the project CRS (course uses EPSG:4326 for loading, EPSG:26917 NAD83 / UTM 17N for Ontario measurement, EPSG:3347 for Canada-wide grids) → [set-project-crs.md](set-project-crs.md).
2. Load data: CSV with coordinates (Delimited Text), shapefiles, GeoTIFF rasters, ArcGIS REST services, base maps.
3. Filter (Query Builder) / compute fields (Field Calculator, CASE WHEN) / raster maths.
4. Geoprocess: reproject → (spatial index, fix geometries) → buffer / clip / join / count / sample / zonal histogram.
5. Save outputs to a GeoPackage, export CSV, save the .qgz project, build a print layout and export the map.

**Course datasets used in QGIS videos:** NPRI Geolocations CSV (Class 1 `NPRI data.zip`), Topic 2 species rasters, Topic 5 / Topic 7 zips
(PWQMN stations and data, buckthorn, ACI 2018 crop raster, municipal/provincial boundaries, EcoDistricts, watershed layers).
See [../../datasets/README.md](../../datasets/README.md).

## Reference files

- [interface-map](interface-map.md) — QGIS window layout, menus, toolbars, panels and status bar as shown in the course
- [expression-reference](expression-reference.md) — QGIS expression and Raster Calculator syntax used in the course
- [processing-algorithms-reference](processing-algorithms-reference.md) — every Processing Toolbox algorithm used, with parameters as set in the videos
- [print-layout-checklist](print-layout-checklist.md) — tick-box checklist for producing and exporting a finished map

## Interface, CRS and base maps

| Procedure | Keywords |
|---|---|
| [Explore a layer with Identify Features, the attribute table and Layer Properties](explore-layer-identify-attribute-table-properties.md) | identify, identify features, info button, attribute table, open attribute table, F6 |
| [Check and change the project coordinate reference system (CRS)](set-project-crs.md) | CRS, coordinate reference system, projection, project CRS, EPSG, EPSG:4326 |
| [Install the QuickMapServices (QMS) plugin](install-quickmapservices-plugin.md) | plugin, install plugin, QuickMapServices, QMS, NextGIS, base map plugin |
| [Add a base map (Google Maps, ESRI Satellite, ESRI Ocean) with QuickMapServices](add-base-map-quickmapservices.md) | base map, basemap, background map, QuickMapServices, QMS, Search QMS |

## Loading data

| Procedure | Keywords |
|---|---|
| [Add a CSV with latitude/longitude as a point layer (Add Delimited Text Layer)](add-delimited-text-layer-csv.md) | CSV, delimited text, add delimited text layer, import csv, latitude, longitude |
| [Add an ESRI Shapefile (.shp) to QGIS](add-shapefile-drag-and-drop.md) | shapefile, shp, add vector layer, load shapefile, drag and drop, browser panel |
| [Add a raster (GeoTIFF) and display it with a Singleband pseudocolor ramp](add-raster-geotiff-and-style-pseudocolor.md) | raster, GeoTIFF, tif, add raster layer, import raster, drag and drop |
| [Connect to an ESRI ArcGIS REST server (MapServer) and add its layers](add-arcgis-rest-server-layer.md) | ESRI REST, ArcGIS REST, REST server, MapServer, web service, new connection |
| [Create a new polygon shapefile layer and draw (digitize) features](create-shapefile-layer-and-digitize-polygon.md) | create layer, new shapefile layer, new vector layer, digitize, draw polygon, toggle editing |

## Filtering, expressions and attribute calculation

| Procedure | Keywords |
|---|---|
| [Filter a vector layer on one condition with the Query Builder (basic filter)](filter-vector-single-condition-query-builder.md) | filter, basic filter, query builder, provider filter, single condition, equals |
| [Filter a vector layer on multiple conditions (AND, IN, !=) in the Query Builder](filter-vector-multiple-conditions.md) | filter, query builder, provider filter, multiple conditions, AND, OR |
| [Create a new classified field with an if() expression in the Field Calculator](field-calculator-if-statement.md) | field calculator, new field, new column, if statement, conditional, classify |
| [Classify a field into several categories with CASE WHEN in the Field Calculator](field-calculator-case-when.md) | case when, CASE, WHEN, THEN, ELSE, END |
| [Convert a text field to numeric with the Field Calculator](field-calculator-change-column-type.md) | change column type, data type, text to number, string to decimal, convert field, numeric |
| [Calculate polygon area and perimeter in metres with Add geometry attributes](add-geometry-attributes-area-perimeter.md) | area, perimeter, square metres, geometry attributes, add geometry attributes, measure polygon |

## Raster analysis and styling

| Procedure | Keywords |
|---|---|
| [Filter a raster to cells above a threshold with the Raster Calculator](raster-calculator-threshold-filter.md) | raster calculator, threshold, cutoff, filter pixels, reclassify, binary raster |
| [Combine two rasters with conditions (AND / +) in the Raster Calculator](raster-calculator-combine-two-rasters.md) | raster calculator, two rasters, overlay, combine layers, AND, add rasters |
| [Make zero (or any single value) transparent in a pseudocolour raster](raster-set-value-transparent.md) | raster transparency, hide zeros, opacity, no data look, singleband pseudocolor, colour ramp |
| [Reproject a raster layer with Warp (reproject)](reproject-raster-warp.md) | warp, gdalwarp, reproject raster, raster CRS, change raster projection, align raster and vector |
| [Add raster values (e.g. DEM elevation) to point features with Sample raster values](sample-raster-values-at-points.md) | sample raster values, raster to points, extract raster values, elevation at points, DEM, digital elevation model |
| [Count raster categories inside polygons with Zonal histogram](zonal-histogram-raster-categories-in-polygons.md) | zonal histogram, zonal statistics categorical, land cover in buffer, crop types around station, pixel count per class, raster categories in polygons |

## Reprojection, joins and geometry tools

| Procedure | Keywords |
|---|---|
| [Reproject a vector layer to a metre-based CRS (Reproject Layer)](reproject-vector-layer.md) | reproject, reprojection, transform, change CRS, coordinate reference system, projection |
| [Speed up processing of a large vector layer with Create spatial index](create-spatial-index.md) | spatial index, create spatial index, performance, slow processing, large dataset, qix |
| [Fix invalid geometries before geoprocessing](fix-invalid-geometries.md) | fix geometries, invalid geometry, has invalid geometry error, Invalid features filtering, repair polygons, native:fixgeometries |
| [Join a non-spatial table to a point layer by a shared ID (Layer Properties > Joins)](join-table-to-layer-by-attribute.md) | attribute join, table join, join by field, vector join, Add Vector Join, Layer Properties Joins |
| [Add polygon attributes to points that fall inside them with Join attributes by location](join-attributes-by-location.md) | join attributes by location, spatial join, point in polygon, intersects, within, contains |
| [Add distance-to-nearest-feature and nearest-feature attributes with Join attributes by nearest](join-attributes-by-nearest.md) | join attributes by nearest, nearest neighbour, nearest neighbor, distance to nearest, distance to water, proximity join |
| [Draw and measure the shortest line from points to the nearest feature of another layer](measure-distance-shortest-line-between-features.md) | distance, shortest line, nearest, distance to river, distance to water, proximity |
| [Create fixed-distance buffers around vector features](buffer-points-fixed-distance.md) | buffer, buffers, buffer zone, radius, distance around points, 500 m buffer |
| [Clip a vector layer to a boundary polygon](clip-vector-layer-to-boundary.md) | clip, clipping, cut layer to study area, trim to boundary, remove water portions, municipalities clipped to Ontario |
| [Count points in each polygon](count-points-in-polygon.md) | count points in polygon, point count per province, NUMPOINTS, facilities per region, density by polygon, native:countpointsinpolygon |
| [Create a 100 km grid and map point density per cell](create-grid-and-count-point-density.md) | create grid, fishnet, vector grid, hexagon grid, 100 km grid, grid cells |
| [Combine several vector layers into one layer with Merge vector layers](merge-vector-layers.md) | merge vector layers, combine layers, append layers, union of layers, stack layers, merge shapefiles |
| [Merge selected polygons within one layer into a single feature (Merge Selected Features)](merge-selected-features.md) | merge features, merge selected features, dissolve selected, combine polygons, join polygons, edit mode |

## Saving, exporting and map making

| Procedure | Keywords |
|---|---|
| [Export a layer's attribute table to CSV or save it as a permanent shapefile](export-layer-to-csv-or-shapefile.md) | export, save features as, attribute table to csv, csv export, shapefile export, make permanent |
| [Save selected features or working layers into one GeoPackage (.gpkg) and reload them](save-layers-to-geopackage.md) | geopackage, gpkg, save features as, save selected features as, export layer, save vector layer as |
| [Save and reopen a QGIS project file (.qgz)](save-project-file.md) | save project, project file, qgz, qgs, save as, open recent |
| [Highlight a study area with an outline and an inverted-polygon mask](inverted-polygon-mask-symbology.md) | inverted polygons, mask outside polygon, fade surroundings, highlight study area, transparent fill, outline only |
| [Build a print layout (map, scale bar, north arrow, grid, legend, title) and export a PNG](print-layout-map-export.md) | print layout, layout manager, new print layout, map composition, add map, scale bar |
