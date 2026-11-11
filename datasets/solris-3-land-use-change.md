# SOLRIS 3.0 land-cover change, southern Ontario 2000-2015 - `SOLRIS 3.0.zip`

> `CHANGE_PERIOD` is a zero-padded code (`01`, `02`, `03`); read it as text. See [id-columns-leading-zeros.md](id-columns-leading-zeros.md).

- Original path: `sources/files/06 - Ecosystem services/SOLRIS 3.0.zip` (7.9 MB). Linked from
  [Case study #8](../course-pages/case-study-8.md): "Records of land use change throughout Southern Ontario".
- Members: `SOLRIS 3.0.shp` (27.2 MB), `.shx`, `.dbf` (46.7 MB), `.prj`, `.cpg`, `SOLRIS 3.0.qmd` (QGIS metadata,
  identifier `SOLRIS_Version_3_0_Changes_2000to2015_LAMBERT`, written by QGIS 3.32.3), `SOLRIS 3.0.csv` (10.5 MB,
  the attribute table, 69,836 x 11).
- CRS: `NAD_1983_CSRS_Ontario_MNR_Lambert` = NAD83(CSRS) / Ontario MNR Lambert, EPSG:3162 (metres).
- Provenance: Ontario Ministry of Natural Resources, Southern Ontario Land Resource Information System (SOLRIS)
  version 3.0, change polygons 2000-2015. Folder name "06 - Ecosystem services" is from an older course layout.
- Course use: case study #8 (Thames Talbot Land Trust): identify London parcels with wooded and wetland areas and
  areas of wetland loss, then score parcels in R.

## Attribute table (SOLRIS 3.0.csv / .dbf)

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `OBJECTID` | int64 | 69,836 | 69,836 | 1 | |
| `CHANGE_DIRECTION` | object | 69,836 | 114 | `Woodland to Undifferentiated`, `Woodland to Extraction-Aggregate` | from-class to to-class |
| `CHANGE_TYPE` | object | 69,835 | 5 | `Woodland Loss`, `Wetland Loss`, `Non-Vegetation Transition`, `Vegetation Transition` | filter `Wetland Loss` for the case study |
| `CHANGE_PERIOD` | float64 | 69,835 | 4 | 0, 1, 2, 3 | period code (meaning not documented in course) |
| `CHANGE_DATES` | object | 69,835 | 24 | `2011-2015`, `2010-2017` | text range |
| `CHANGE_CAUSE` | object | 69,835 | 5 | `Other-Anthropogenic`, `Cut`, `Weather`, `Other-Natural` | |
| `CONFIDENCE_EXISTENCE` | object | 69,835 | 4 | `Confirmed`, `High`, `Medium`, `Low` | |
| `CONFIDENCE_CAUSE` | object | 69,835 | 4 | same levels | |
| `VERIFICATION` | object | 69,836 | 1 | `True Change` | constant |
| `Shape_Length` | float64 | 69,836 | 2,412 | 300.0 | perimeter, m |
| `Shape_Area` | float64 | 69,836 | 10,875 | 5400.0 | area, m2 (225 - 1,542,600) |

## Handling notes

1. One row has blank change fields (69,835 vs 69,836 non-null).
2. `CHANGE_DATES` ranges overlap (e.g. 2011-2015 vs 2010-2017); `CHANGE_PERIOD` is coarser.
3. Reproject to the parcels' CRS (NAD83 / UTM 17N, EPSG:26917) or vice versa before intersecting.
4. Areas in the CSV are in m2 of the Lambert CRS; recompute after clipping to parcels (`$area` in Field Calculator).
