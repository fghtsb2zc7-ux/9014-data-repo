# Topic 7 Ontario boundary layers - `Topic 7.zip`

- Original path: `sources/files/Topic 7.zip` (179 MB, 40 entries). Linked from [Topic 7](../course-pages/topic-7.md)
  ("Added topic 7 data for the videos") and [Lesson 7 Overview](../course-pages/lesson-7-overview.md) ("Recreate the
  map below using ... ansi, municlow" - target `test1.png`, a map of London).

| Layer folder | Main files | Size (.shp) | Content | CRS (.prj) |
|---|---|---|---|---|
| `ansi/` | `ansi.shp/.shx/.dbf/.prj/.pck` + `alias_name.tbl`, `ansi.tbl`, `area_and_species.tbl`, `geog_unit.tbl`, `site_access.tbl`, `site_access_method_list.tbl` | 13.5 MB | Areas of Natural and Scientific Interest (ANSI), Ontario (LIO; name expansion is general knowledge) | GCS_North_American_1983 (EPSG:4269) |
| `indianre/` | `indianre.shp...` + `indian_reserve.tbl`, `geog_unit.tbl` | 8.1 MB | Indian Reserve boundaries, Ontario (LIO) | EPSG:4269 |
| `lpr_000b16a_f/` | `lpr_000b16a_f.shp/.shx/.dbf/.prj/.qix` + `92-160-g2016002-fra.pdf`, `province_territoire.html` | 54.4 MB | Statistics Canada 2016 Census provinces/territories boundary file, French edition (`_f`), 13 polygons (dbf 4.4 KB) | NAD83 Lambert Conformal Conic: CM -91.8667, std parallels 49 and 77, lat of origin 63.390675, FE 6,200,000, FN 3,000,000 (this is Statistics Canada Lambert, EPSG:3347 - code from general knowledge) |
| `municlow/` | `municlow.shp...qix` + `geog_unit.tbl`, `munic_bnd_lower_and_single.tbl` | 82.2 MB | Municipal boundaries, lower and single tier, Ontario (LIO) | EPSG:4269 |
| `wtrshter/` | `wtrshter.shp...` + `geog_unit.tbl`, `watershed_tertiary.tbl` | 139 MB | Tertiary watersheds, Ontario (LIO) | EPSG:4269 |

Attribute fields: not profiled (only file listings and `.prj` available).

## Course use (Topic 7 QGIS videos)

- Creating a spatial index (large layers render/process faster) - provinces layer [video qgis-creating-a-spatial-index].
- Clipping vector layers - provinces layer filtered by province name, used to clip other layers
  [video qgis-clipping-vector-layers].
- Counting points in polygons and creating grids - NPRI facility points per province and per 100 km2 grid cell
  [video qgis-counting-points-in-polygons-and-creating-grids].
- Merging vector layers and features; Saving working layers to geopackages; Print layout; Saving a project file -
  watershed layer (`wtrshter`) [videos qgis-merging-vector-layers-and-features, qgis-saving-working-layers-to-geopackages,
  qgis-print-layout]. Note from the course page: at the end of the merging video, toggle editing off (pencil) to save
  changes to the watershed shapefile.
- Class 7 exercise: map of London from `ansi` + `municlow`.

## Handling notes

1. `lpr_000b16a_f` is in a projected Lambert CRS while the others are geographic NAD83: set a common project CRS or
   reproject before clipping/joining.
2. French edition: attribute names/values for provinces are in French (e.g. `province_territoire.html` guide);
   filters must use the French names (inferred from the `_f` suffix; field values not profiled).
3. Large layers (wtrshter 139 MB, municlow 82 MB): create a spatial index before heavy processing (the course
   recommends this; `.qix` already exists for municlow and lpr).
4. `.tbl` and `.pck` files are LIO extras that QGIS does not need.
