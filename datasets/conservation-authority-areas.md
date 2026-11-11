# Conservation Authority administrative areas - `caadmin.zip`

- Original path: `sources/files/04 - Lesson 4/Pre-class work/caadmin.zip` (9.0 MB).
- Members: `caadmin/caadmin.shp` (12.7 MB), `.shx`, `.dbf` (37.5 KB), `.prj`, `.pck`, plus
  `cons_auth_admin_area.tbl` and `geog_unit.tbl` (Land Information Ontario style lookup tables).
- CRS: `GCS_North_American_1983` (geographic NAD83, EPSG:4269, degrees).
- Provenance: Ontario conservation authority administrative boundaries (Land Information Ontario packaging, inferred
  from the `.pck`/`.tbl` structure shared with other LIO layers in the course).
- Course use: [Case study #5](../course-pages/case-study-5.md) - "As conservation authorities help monitor and manage
  water quality, it would be helpful to assess water quality at the authority level boundaries" (e.g. join PWQMN
  stations to authority polygons with Join attributes by location, then summarise).
- Attribute fields: not profiled.

## Handling notes

1. Geographic CRS: reproject (e.g. EPSG:26917) before area or buffer calculations.
2. The `.tbl` files are not read by QGIS as part of the shapefile; ignore unless a lookup is needed.
3. If geometries are invalid, run Fix Geometries (checklist skill QGIS #9) before overlays.
4. The PWQMN field-data file already carries a `Conservation Authority` name column (with leading spaces) - an
   alternative to a spatial join.
