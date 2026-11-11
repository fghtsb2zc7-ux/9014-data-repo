---
title: "Categories, Sub-Types and Properties of Spatial Data (QGIS Demo 2)"
publisher: Statistics Canada
catalogue: 89200005, issue 2020001
release_date: 2020-02-17
source_page: https://www.statcan.gc.ca/en/wtc/online-lectures/qgis/2020001
video_file: https://publications.gc.ca/collections/collection_2020/statcan/892-00005/CS892-00005-2020-1-eng.mp4
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
course_link_text: "Types of Spatial Data (Statistics Canada)"
transcript_source: publisher HTML transcript (paraphrased)
---

# Categories, Sub-Types and Properties of Spatial Data - Statistics Canada QGIS Demo 2

> **Provenance note:** This file comes from the publisher's web page, not from Brightspace. Verbatim retrieval was not possible through the available fetch tool (it returned a detailed paraphrase only), so the text below is a faithful point-by-point **paraphrase of the published transcript**, with UI names quoted as they appear in the transcript. It is not an auto-caption and not verbatim.

1. QGIS is installed but has no data yet. Part 1: definitions and categories of spatial data; part 2: downloading from Open Maps (the federal geospatial archive) - the published transcript covers part 1 only.
2. Spatial data is linked to places by coordinates. Three properties: **map projection**, **datum**, **coordinate reference system (CRS)**.
3. Map projection: converts the curved 3D Earth to a flat 2D map; every projection distorts something and preserves a chosen property (distance, direction, angle, area, shape). Families: Cylindrical, Conical, Planar.
4. Geodetic datum: reference points anchoring features to the Earth (horizontal datums here). WGS84 = best global fit; North American Datum fits North America more closely; NAD27 is outdated, replaced by NAD83.
5. CRS: grid of meridians and parallels locating features by XY. **Geographic** CRS - large areas, angular units (decimal degrees or DMS). **Projected** CRS - derived from geographic, smaller areas, linear units (metres), suited to overlays and measurement.
6. Layers used together should share projection, datum and CRS; mismatches cause wrong measurements/overlays or tool failures.
7. Vector data ("table data with geometry", QGIS User Manual): discrete features as points (rail stations, grain elevators), lines (roads, rivers), polygons (land-cover boundaries); attributes in the **attribute table**. Formats: shapefiles, file geodatabases (can mix geometry types; some layers must be exported before editing), **Geopackage** (QGIS default, combines features of both).
8. Raster data (continuous phenomena): single-band (elevation, slope, precipitation, hillshade, aspect); composite/remotely sensed (e.g. Landsat 8, bands combined); thematic (classified land cover, e.g. Annual Crop Inventory).
9. Raster appearance depends on scale and cell/pixel size (spatial resolution); each cell holds a number. Formats: GeoTIFF (.tif), JPEG2000 (.jp2). Public rasters are often 15-30 m.
10. Part 1 ends; Open Maps download section not in the transcript.
