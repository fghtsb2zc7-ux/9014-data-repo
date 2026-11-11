---
id: qgis.add-arcgis-rest-server-layer
tool: qgis
title: Connect to an ESRI ArcGIS REST server (MapServer) and add its layers
keywords: [ESRI REST, ArcGIS REST, REST server, MapServer, web service, new connection, open data, open.canada.ca, DFO, marine invasive species, species distribution models, SO4 deposition, acid rain, streaming layer, rendered map, browser panel]
software_context: "QGIS 3.x (Windows, instructor's install), Browser panel > ArcGIS REST Servers"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-esri-rest-servers.md, timestamps: "00:06-05:22"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/case-study-5.md]
datasets_used: ["DFO 'Updated Species Distribution Models for Marine Invasive Species Hotspot Identification' (https://open.canada.ca/data/en/dataset/1439dcb3-82a6-40fd-a9a4-8f045b20ff5b) — ESRI REST MapServer", "ECCC SO4 wet deposition MapServer (case study 5)"]
---
# Connect to an ESRI ArcGIS REST server and add its layers

## Purpose
Stream always-up-to-date layers from an open-data provider's ArcGIS REST service instead of downloading files. A **MapServer** returns a rendered map: good as context under your own vector data, but it cannot be manipulated (no Raster Calculator, no filtering) [video qgis-esri-rest-servers @00:44-01:22, @03:46]. Prefer raw files when available.

## Steps
1. Find the REST URL: on the open.canada.ca dataset page, in **Data and Resources**, open the resource tagged **English / Web Service / ESRI REST** (Explore > Go to resource) [video qgis-esri-rest-servers @01:22] [frame qgis-esri-rest-servers @00:12].
2. On the "ArcGIS REST Services Directory" page that opens, copy the full URL from the address bar [video qgis-esri-rest-servers @01:58] [frame qgis-esri-rest-servers @02:02]:
   ```
   https://egisp.dfo-mpo.gc.ca/arcgis/rest/services/open_data_donnees_ouvertes/updated_species_distribution_models_marine_invasive_hotspot_id_en/MapServer
   ```
3. In QGIS's Browser panel scroll to **ArcGIS REST Servers**, right-click > **New Connection...** [video qgis-esri-rest-servers @02:05].
4. In "Create a New ArcGIS REST Server Connection" paste the URL into **URL** [frame qgis-esri-rest-servers @02:22].
5. Type a **Name**: `Marine Invasive Species` [frame qgis-esri-rest-servers @02:42]. Leave Prefix, ArcGIS Portal Details and Authentication empty.
6. Click **OK** [video qgis-esri-rest-servers @02:35].
7. Expand **ArcGIS REST Servers > Marine Invasive Species**: (All layers), Atlantic Predictions, Atlantic Projections, Pacific Predictions, Pacific Projections, ... [frame qgis-esri-rest-servers @03:02].
8. Expand **Atlantic Predictions** and double-click the species entry with the raster-tile icon, e.g. **Carcinus maenas** (green shore crab) [video qgis-esri-rest-servers @03:05] [frame qgis-esri-rest-servers @03:12, @03:32].
9. Wait while it downloads; add an ESRI Ocean base map and keep it underneath [video qgis-esri-rest-servers @03:20] — see [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md).
10. Add more species the same way (e.g. Botrylloides violaceus) [frame qgis-esri-rest-servers @05:12].

## Verify
- Layer "Carcinus maenas" appears with legend "High : 1 - Low : 0", already coloured by the service (purple-to-green) [frame qgis-esri-rest-servers @03:32, @03:42].
- In an empty project the CRS becomes **EPSG:3857** (pseudo-Mercator), because that is what the service delivers [video qgis-esri-rest-servers @03:30].

## Pitfalls
- The `/MapServer` ending means a rendered map service: you get pixels to look at, not data values to analyse; REST layers are not available in the Raster Calculator and cannot be filtered [video qgis-esri-rest-servers @02:18, @03:46, @04:50].
- Some species appear twice in each group (different icons); the instructor used the raster-tile icon entry [frame qgis-esri-rest-servers @03:12].
- A connection can fail ("Connection failed: Network err...") if the server is down or the URL is wrong [frame qgis-esri-rest-servers @03:02].
- Name must be filled or OK stays greyed [frame qgis-esri-rest-servers @02:22].

## Related
- Case study 5 REST link for SO4 deposition (same procedure): `https://maps-cartes.ec.gc.ca/arcgis/rest/services/DMS/depot_xSO4_5YA_deposition/MapServer` [page case-study-5.md]
- [add-raster-geotiff-and-style-pseudocolor.md](add-raster-geotiff-and-style-pseudocolor.md)
- [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md)
- [raster-calculator-threshold-filter.md](raster-calculator-threshold-filter.md)
