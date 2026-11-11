# Buckthorn field survey (Class 4) and Topic 5 support layers

> **Transect ID is text with inconsistent zero-padding** (`001`, `01`, `002` …): read it as text and normalise before grouping. See [id-columns-leading-zeros.md](id-columns-leading-zeros.md).

Data collected by students on 21 Sept 2026 in the riparian woodland behind the UWO soccer fields (Class 4
"Biodiversity and Invasive Species Assessment", [Lesson overview](../course-pages/lesson-overview.md)), entered in
an ArcGIS Survey123/Field Maps-style form (columns `GlobalID`, `Creator`, `EditDate` are ArcGIS export fields), then
enriched in QGIS during the Topic 5 videos.

| File | Original path (`sources/files/...`) | Size | Rows x cols | CRS |
|---|---|---|---|---|
| `Buckthorn observations_0.csv` (raw export) | `Buckthorn observations_0.csv`; same file in `Topic 5.zip` > `Topic 5/` | 12,102 B | 53 x 22 | x/y in WGS 84 degrees |
| `buckthorn_updated.csv` (after QGIS joins) | `buckthorn_updated.csv`; same file in `Topic 5.zip` > `Topic 5/` | 22,583 B | 53 x 36 | adds UTM 17N metre coordinates |
| `buckthorn_updated` shapefile | `Topic 5.zip` > `Topic 5/buckthorn_updated/` (.shp .shx .dbf .prj .cpg .qmd) | 145 KB dbf | 53 points | NAD83 / UTM zone 17N (EPSG:26917) |
| `Parking lot` shapefile | `Topic 5.zip` > `Topic 5/Parking lot/` | <1 KB | 1 polygon drawn in QGIS | WGS 84 (EPSG:4326) |
| `Sampling area` shapefile | `Topic 5.zip` > `Topic 5/Sampling area/` | <1 KB | 1 polygon drawn in QGIS | WGS 84 (EPSG:4326) |
| `Water_Edges` shapefile | `Topic 5.zip` > `Topic 5/Water_Edges/` | 16.4 MB shp | shoreline lines (Theme `Hydrography`, Layer `Map 2D - Hydrography - Shoreline`) | NAD83 / UTM zone 17N (EPSG:26917) |
| SWOOP 2015 elevation tile | `Topic 5.zip` > `Topic 5/1km17477047610SWOOP2015.img` | 1.05 MB | single-band DEM (point-cloud-derived elevation, per video) | not listed |

Sampling protocol (from `02 - Invasive species monitoring/Buclthorn sampling.pdf`): Phase I systematic plots along
transects through the woodland (5 m2 plots; record GPS of NW corner, distance to river, distance to trail, canopy
cover, % bare soil, % herbaceous cover, species richness, buckthorn %, honeysuckle %, largest stem circumference);
Phase II haphazard search for large seed-producing buckthorn (> 25 cm circumference at 1.4 m). Keep 5 m from moving
water. The CSV holds a subset of these measures (see below). The
[buckthorn fact sheet](../course-pages/pre-class-readings.md) covers identification (common buckthorn *Rhamnus
cathartica* vs glossy buckthorn *Frangula alnus* and native alder-leafed buckthorn).

## Buckthorn observations_0.csv (22 columns)

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `OBJECTID` | int64 | 53 | 53 | 1, 2 | row ID |
| `GlobalID` | object | 53 | 53 | `ac78f0eb-17c6-...` | ArcGIS GUID |
| `CreationDate` | object | 53 | 53 | `9/21/2026 1:45:11 PM` | M/D/YYYY h:mm:ss AM/PM text |
| `Creator` | object | 53 | 19 | `hfishma2@uwo.ca_westernu` | student account (personal data - do not publish) |
| `EditDate` | object | 53 | 53 | `9/21/2026 2:15:40 PM` | |
| `Editor` | object | 53 | 19 | as Creator | personal data |
| `Section` | object | 53 | 2 | `Section 1`, `Section 2` | class section |
| `Group members` | object | 53 | 22 | `Sickies`, `Bucky Busters`, `BADT` | team name (free text) |
| `Transect ID` | object | 53 | 18 | `001`, `1`, `01`, `30` | inconsistent formatting of the same IDs |
| `Quadrat ID` | int64 | 53 | 6 | 1-6 | plot number along transect |
| `Distance along transect` | float64 | 53 | 20 | 0.0, 5.0, 17.5 | metres along transect, 0-77.5 |
| `Buckthorn Percent` | int64 | 53 | 20 | 20, 0, 40 | % cover, 0-80 |
| `Sapling Percent` | int64 | 53 | 17 | 100, 0, 70 | % of buckthorn that is saplings |
| `Bare Soil Percent` | int64 | 53 | 20 | 80, 70 | % cover |
| `Adult Percent` | int64 | 53 | 15 | 0, 10, 50 | % of buckthorn that is adult |
| `Non-buckthorn Vegetation Percent` | int64 | 53 | 25 | 70, 30 | % cover |
| `Canopy Cover` | int64 | 53 | 19 | 80, 97 | % canopy, 3-97 |
| `Reproducing Buckthorn` | object | 53 | 2 | `No`, `Yes` | |
| `Notes` | object | 14 | 14 | `Honeysuckle is seedling value`, `50% is in the creek` | free text |
| `Honeysuckle Percent` | int64 | 53 | 8 | 0, 20, 100 | % cover (mostly 0) |
| `x` | float64 | 53 | 53 | -81.27139317589 | longitude (WGS 84) |
| `y` | float64 | 53 | 53 | 43.0048043684168 | latitude (WGS 84) |

## buckthorn_updated.csv (adds 14 columns)

Same 22 columns (`Reproducing Buckthorn` now boolean `True`/`False`) plus fields produced by QGIS
"Join attributes by nearest" (to `Water_Edges`) and "Sample raster values" (from the SWOOP DEM):

| Column | dtype | Unique | Example values | Meaning |
|---|---|---|---|---|
| `OBJECTID_2`, `Theme`, `Layer`, `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen` | mixed | 1 each | 255204, `Hydrography`, `Map 2D - Hydrography - Shoreline`, `GA27110000`, 2, `2025/07/31`, 453.72 | attributes copied from the nearest Water_Edges feature (all plots matched the same shoreline feature) |
| `n` | int64 | 1 | 1 | neighbour rank from Join attributes by nearest |
| `distance` | float64 | 53 | 86.63, 77.66 | distance (m) from plot to nearest water edge |
| `feature_x`, `feature_y` | float64 | 53 | 477880.9, 4761384.0 | plot coordinates in UTM 17N metres |
| `nearest_x`, `nearest_y` | float64 | 17 | 477919.5, 4761306.5 | nearest point on the water edge (UTM 17N) |
| `elevation1` | float64 | 51 | 237.80 | sampled elevation (m) from the SWOOP raster (column prefix `elevation` + band 1) |

## Data-quality issues an agent must handle

1. **Personal data:** `Creator`/`Editor` hold student UWO accounts; drop them from any shared output.
2. **Inconsistent `Transect ID`** (`1`, `01`, `001`) - text column; standardise (`as.numeric()`) before grouping.
3. **Team names are free text** and differ by section; the Topic 7 script asks to filter teams such as "Buckstreet
   boys" and "Love islanders" (names must match exactly).
4. **Dates as US-format text with AM/PM**: `mdy_hms()` in R.
5. **Boolean vs Yes/No**: raw file has `Yes`/`No`, updated file has `TRUE`/`FALSE`. Note a bug in `Topic 7.R`:
   `ifelse(reproducing_buckthorn > TRUE, 1, 0)` is always 0; use `ifelse(reproducing_buckthorn, 1, 0)`.
6. **Percent columns do not sum to 100** (sapling/adult are % of buckthorn, others % of plot).
7. **CRS:** raw x/y are degrees (EPSG:4326) - reproject to NAD83 / UTM 17N (EPSG:26917) before distance work
   [video qgis-reprojecting-a-vector-layer]; Water_Edges is already UTM 17N.
8. **Small sample** (53 plots) - regression results in Class 7 are weak (`Topic 7.R` comment: canopy cover vs
   buckthorn is not significant).
9. After `clean_names()`: `buckthorn_percent`, `canopy_cover`, `non_buckthorn_vegetation_percent`,
   `reproducing_buckthorn`, `group_members`, `quadrat_id`, `elevation1`, `distance`.

## Course procedures that use it

- QGIS (Topic 5 videos): Introduction to QGIS, Creating a new layer (Parking lot, Sampling area polygons),
  Reprojecting a vector layer, Join attributes by nearest (Water_Edges), Sample raster values (SWOOP DEM),
  Exporting attribute table to CSV (produces `buckthorn_updated.csv`).
- R: `Topic 5 in-class script.R` (scatter + `geom_smooth`, pivot_longer cover types, mean cover bar chart);
  `Topic 7.R` (histograms by section, `lm(buckthorn_percent ~ canopy_cover)`, `lm(... ~ section)`,
  `lm(... ~ section + distance)`, `lm(... ~ section * distance)`, boxplots, life-stage pivot and stacked columns).
