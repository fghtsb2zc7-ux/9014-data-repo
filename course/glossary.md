# Glossary (ENVRSUST 9014)

One-line definitions grounded in course material; the bracket says where the term is used.

| Term | Definition |
|---|---|
| ACI (Annual Crop Inventory) | AAFC 30 m raster of crop types (e.g. code 147 corn, 158 soybeans); the instructor calls it the "agricultural crop index" [Topic 5, buffers/zonal histogram video] |
| ANSI | Areas of Natural and Scientific Interest, Ontario polygon layer `ansi` in Topic 7.zip [Class 7 map exercise] |
| Anti join | R `anti_join()`: keeps rows of the first table with no match in the second (e.g. PWQMN results without a station) [Topic 5] |
| APEI | Air Pollutant Emissions Inventory; ECCC inventory that adds non-point sources (transport, agriculture) the NPRI omits [NPRI deck] |
| Attribute join | Joining a table to a layer on a shared field (QGIS Layer Properties > Joins; Power Query Merge; R `left_join`) [Topic 5] |
| Attribute table | Table of a vector layer's fields (columns) and features (rows) [QGIS videos] |
| Basemap | Background map tiles (e.g. ocean basemap via the QuickMapServices plugin) [QGIS - Base maps] |
| BDL | "Below detection limit" in PWQMN `Result Call`; `Results` then holds text such as `<2` [PWQMN] |
| Bind rows | Stacking tables with the same variables (`bind_rows()`), e.g. PWQMN 2000-2009 + 2010-2018 [Topic 5] |
| Buffer | Polygon at a set distance around features (e.g. 5 km around facilities, 1/2 km around a ferry route); needs a metre CRS [Topic 5, practice exams] |
| Buckthorn | Invasive shrub (common buckthorn *Rhamnus cathartica*; also glossy buckthorn) surveyed in Class 4 and removed on Oct 9 [Class 4] |
| CAC | Criteria Air Contaminants, NPRI Part 4 substances (combustion pollutants linked to acid rain and smog) [NPRI deck] |
| CASE WHEN | QGIS expression for multiple conditions creating a new classed field [QGIS - Case when] |
| CEPA | Canadian Environmental Protection Act, 1999 - legal basis of the NPRI [NPRI] |
| clean_names() | janitor function converting headers to snake_case (e.g. `Collection Site` -> `collection_site`) [all R scripts] |
| CMR (capture-mark-recapture) | Tagging animals and recording recaptures to study site fidelity, movement, mortality and population size [Topic 2 slides] |
| Conservation Authority | Ontario watershed-based agency managing water quality; `caadmin` boundaries [Case study #5] |
| CPUE (catch per unit effort) | Catch divided by effort; example calculation in Class 3 objectives; crab counts per tow distance [Class 3, practice set 2] |
| CRS (coordinate reference system) | Coordinate grid that locates features; geographic (degrees, e.g. EPSG:4326) or projected (metres, e.g. EPSG:26917) [QGIS - CRS] |
| Data validation dropdown | Excel list-restricted cell (with `UNIQUE()` values) driving `COUNTIF` / `FILTER` lookups [Excel formulas, E.1.7] |
| Delimited text layer | QGIS import of a CSV with X/Y (longitude/latitude) columns as points [QGIS videos] |
| Deterministic model | Model that applies fixed rules or equations to data (no randomness), e.g. classifying or projecting values with formulas [Topic 3] |
| DNMC | "Does Not Meet Criteria" NPRI report for a facility that reported previously but no longer qualifies [NPRI deck] |
| Double counting | Summing overlapping NPRI quantities (PM2.5 within PM10 within TPM; VOC totals and individual VOCs) [NPRI] |
| ECCC | Environment and Climate Change Canada, runs the NPRI and partners on the group assignment [NPRI] |
| EcoDistrict / ecoregion / ecozone | Tiers 3 / 2 / 1 of Ontario's Ecological Land Classification [Topic 5, TPM exam] |
| ELC | Ecological Land Classification shapefile (Ecozone, Ecoregion, Ecodistrict fields) [TPM practice exam] |
| EPSG code | Numeric CRS identifier: 4326 WGS 84; 4269 NAD83; 26917 NAD83 / UTM 17N; 26920 NAD83 / UTM 20N; 3162 NAD83(CSRS) Ontario MNR Lambert; 3857 pseudo-Mercator [QGIS videos, practice set 1] |
| ESRI REST server | Web map service added in QGIS (Browser > ArcGIS REST Servers > New Connection); usually rendered tiles that cannot be edited [QGIS - ESRI Rest Servers, case study #5] |
| Estimation method | How an NPRI quantity was derived (M1-M3 monitoring/testing, C mass balance, E1/E2 emission factors, O engineering estimate, SP, RQ) [NPRI deck, TPM CSV] |
| Facet | Splitting a ggplot into panels with `facet_wrap()` [R] |
| Field Calculator | QGIS tool to create/update fields with expressions (IF, CASE WHEN, `$area`, type conversion) [Topic 3, Topic 5] |
| GeoPackage | Single-file multi-layer spatial format (.gpkg), QGIS default [QGIS - Saving working layers to geopackages] |
| Germany PRTR (thru.de) | German pollutant release and transfer register; comparison dataset for the NPRI assignment [NPRI assignment] |
| GHGRP | ECCC Greenhouse Gas Reporting Program (GHGs are not in the NPRI) [NPRI deck] |
| Join attributes by location | QGIS tool transferring attributes between layers that intersect/contain each other [Topic 5] |
| Join attributes by nearest | QGIS tool adding the nearest feature's attributes and the distance [Topic 5, Q.1.4] |
| Left join | R `left_join()`: keep all rows of the first table, add matching columns; duplicates in the key table multiply rows [Topic 5] |
| Long vs wide | Long: one row per observation with a key column (e.g. year); wide: one column per key value (years across). Power Query Pivot/Unpivot Columns; R `pivot_wider`/`pivot_longer` [Topic 2] |
| MPO | "Manufactured, processed or otherwise used" - basis of NPRI thresholds [NPRI deck] |
| NACE / NAICS | European (NACE) and North American (NAICS) industry classification codes; the assignment matches sectors between them [NPRI assignment] |
| NPRI | National Pollutant Release Inventory: Canada's PRTR of releases, disposals and transfers reported annually by facilities; the course's foundational dataset [The NPRI Dataset] |
| OBIS | Ocean Biodiversity Information System, open repository of marine species occurrences; source of the right-whale data [Class 1, Topic 2] |
| OLCC | Ontario Land Cover Compilation v2, 15 m 29-class land-cover raster [Case study #8] |
| Pivot table / PivotChart | Excel aggregation (sum, count, average) by row/column fields and its chart [Topic 1] |
| Power Query | Excel's import/transform editor (Data > From Text/CSV > Transform Data): types, splitting, filtering, pivoting, merging [Topics 1-5] |
| PRTR | Pollutant Release and Transfer Register (NPRI is Canada's) [NPRI deck] |
| PWQMN | Provincial (Stream) Water Quality Monitoring Network, Ontario's long-term river and stream water-quality program [Topic 5, Case study #5] |
| Raster / vector | Raster = grid of cells with values (e.g. SDM probabilities, land cover); vector = points, lines, polygons with attributes [QGIS videos] |
| Raster Calculator | QGIS tool computing new rasters from expressions (thresholds, combining two rasters) [Topics 2-3] |
| Reproject / Warp | Changing a layer's CRS: Reproject Layer for vectors, Warp (Reproject) for rasters [Topic 5] |
| Right whale (NARW) | North Atlantic right whale *Eubalaena glacialis*, critically endangered; threats are entanglement and ship strikes [Class 1] |
| Sample raster values | QGIS tool attaching raster cell values (e.g. elevation) to points [Topic 5] |
| SDM (species distribution model) | Raster of predicted occurrence probability 0-1 (green shore crab, sea vase) [Topic 2] |
| Semi join | R `semi_join()`: keep rows of the first table that have a match, adding no columns [Topic 5] |
| Shapefile | ESRI vector format made of several files (.shp, .shx, .dbf, .prj ...) that must stay together [QGIS - Adding a shapefile] |
| SOLRIS | Southern Ontario Land Resource Information System; SOLRIS 3.0 change polygons 2000-2015 [Case study #8] |
| Spatial index | Index (e.g. .qix) that speeds processing of large vector layers; Processing Toolbox > Create Spatial Index [Topic 7, case study #5] |
| Spatial join | In the course: joining a table without geometry (PWQMN results) to a layer with coordinates (stations), and location-based joins [QGIS - Spatial joins] |
| StoryMap | ArcGIS StoryMaps web narrative combining text, figures, maps, dashboards - the independent project deliverable [Assessments] |
| SWOOP | South Western Ontario Orthophotography Project; the 2015 elevation tile in Topic 5.zip (expansion is general knowledge) [Topic 5] |
| Systematic vs haphazard sampling | Regularly spaced plots along gradients vs unstructured searching for targets (large buckthorn) [Class 4 protocol] |
| TPM | Total particulate matter (NPRI threshold 20 tonnes; PM10 0.5 t; PM2.5 0.3 t) [Class 1 R lesson, TPM practice exam] |
| TTLT | Thames Talbot Land Trust, London-area land trust; case study #8 client [Class 8] |
| UTM zone 17N / 20N | NAD83 / UTM projected CRSs in metres used for Ontario (EPSG:26917) and the Bay of Fundy (EPSG:26920) [Topic 5, practice set 1] |
| xSO4 | Non-sea-salt sulphate wet deposition (kg/ha/yr), acid-rain indicator from ECCC [Case study #5] |
| Zonal histogram | QGIS tool counting raster class pixels inside each polygon (e.g. crop types within station buffers) [Topic 5] |
