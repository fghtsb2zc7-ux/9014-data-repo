# LIO Wooded Area and Wetland Unit layers (Ontario) - `woodarea.zip`, `wetlandu.zip`

| Dataset | Original path (`sources/files/...`) | Zip size | Main members | CRS (.prj) |
|---|---|---|---|---|
| Wooded Area | `woodarea.zip` | 957 MB | `woodarea/woodarea.shp` (1.31 GB), `.dbf` (143 MB), `.shx` (3.3 MB), `.prj`, `.pck`, `alias_name.tbl`, `geog_unit.tbl` (99.5 MB), `wooded_area.tbl` (31.1 MB) | GCS_North_American_1983 (EPSG:4269) |
| Wetland Unit | `wetlandu.zip` | 1.04 GB | `wetlandu/wetlandu.shp` (1.40 GB), `.dbf` (916 MB), `.shx` (7.0 MB), `.prj`, `.pck`, `alias_name.tbl` (5.2 MB), `evaluated_wetland.tbl`, `eval_wet_biological_scoring.tbl`, `eval_wet_hydrological_scoring.tbl`, `eval_wet_social_scoring.tbl`, `eval_wet_special_feat_scoring.tbl`, `wetland_unit_ft.tbl` (217 MB), `wetland_unit_source.tbl` (83.7 MB) | GCS_North_American_1983 (EPSG:4269) |

- Provenance: Land Information Ontario (Ontario Ministry of Natural Resources) province-wide layers, packaged with
  `.pck` and `.tbl` lookup tables (LIO naming; the course does not state the publisher).
- Course page ([Case study #8](../course-pages/case-study-8.md)): `woodarea.zip` "Coverage of wooded area in
  Ontario"; `wetlandu.zip` "Map of wetland areas in Ontario". The wetland evaluation tables
  (biological/hydrological/social/special-feature scoring) could inform a parcel scoring system.
- Attribute fields: not profiled.

## Handling notes

1. **Size:** province-wide shapefiles of 1.3-1.4 GB load slowly. First create a spatial index
   [video qgis-creating-a-spatial-index], then clip to the London / TTLT extent [video qgis-clipping-vector-layers]
   and save the clipped layer to a GeoPackage [video qgis-saving-working-layers-to-geopackages].
2. **Geographic CRS:** reproject clipped results to NAD83 / UTM 17N (EPSG:26917) to match the parcels before area
   calculations.
3. Unzipping needs about 2.5 GB free space for wetlandu.
4. `.tbl` tables are pipe- or comma-delimited LIO lookups (format not verified); QGIS does not need them to draw
   the layer.
5. Invalid geometries are common in large polygon layers; run Fix Geometries if overlays fail.
