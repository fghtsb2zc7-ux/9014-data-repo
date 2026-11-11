# City of London parcels and Thames Talbot Land Trust area

| Dataset | Original path (`sources/files/...`) | Size | Members | CRS (.prj) |
|---|---|---|---|---|
| Parcels | `08 - Lesson 8/Case study/Parcels.zip` | 11.3 MB | `Parcels.shp` (20.4 MB), `.shx`, `.dbf` (7.8 MB), `.prj`, `.cpg`, `Parcels.xml` | NAD_1983_UTM_Zone_17N (EPSG:26917) |
| TTLT area | `08 - Lesson 8/Case study/TTLT_Area 1 (2).zip` | 421 KB | `TTLT_Area.shp` (814 KB), `.shx`, `.dbf` (173 B), `.prj`, `.cpg`, `.sbn`, `.sbx`, `.shp.xml` | NAD_1983_UTM_Zone_17N (EPSG:26917) |

## Parcels

- Provenance (`Parcels.xml`, INSPIRE/ISO metadata dated 2023-03-03): "a general representation of parcel mapping
  used by the City of London. The mapping is derived from assessment and ownership data but is not sanctioned by
  either MPAC or Teranet. The geospatial accuracy is not to be relied upon ..."; credit "Corporation of the City of
  London, Prepared by and maintained by Development Services and Geomatics"; source service
  `https://maps.london.ca/arcgisa/rest/services/OpenData/OpenData_BaseMaps/MapServer/53`; updated continually.
- Course page: "Parcel information from London, Ontario open data".
- Attribute fields: not profiled (`.dbf` 7.8 MB; about 112,000 parcels judging by the 896 KB `.shx` at 8 bytes per
  record - estimate).

## TTLT area

- Course page: "Thames Talbot Land Trust Boundaries". The `.dbf` is 173 bytes, so the layer holds one or very few
  polygons (estimate); the `.shp` (814 KB) is a detailed boundary.

## Case study #8 objectives (from the course page)

1. Identify parcels in London, Ontario that have wooded and wetland areas and areas of wetland loss.
2. In R, develop a scoring system for each parcel based on what you consider important.
3. Create a map of the highest-scoring parcels and show R figures of the score distribution.

Typical workflow (course skills): clip layers to the TTLT/London area; Join attributes by location or Overlap
Analysis between parcels and [wooded area / wetland units](lio-wooded-area-and-wetland-units.md) and
[SOLRIS wetland loss](solris-3-land-use-change.md); zonal histogram of the [OLCC raster](ontario-land-cover-compilation.md);
export the attribute table to CSV; score in R; join back and map with graduated symbology; print layout.

## Handling notes

- Both layers are in UTM 17N metres (good for area); reproject the EPSG:4269 LIO layers and the EPSG:3162 SOLRIS
  layer to match.
- `.sbn/.sbx` are ESRI spatial index files; QGIS ignores them.
- Parcel accuracy disclaimer: results are indicative only.
