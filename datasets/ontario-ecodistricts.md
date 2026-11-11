# Ontario ecodistricts - `EcoDistrict` shapefile

- Original path: `sources/files/Topic 5.zip` > `Topic 5/EcoDistrict/` (`EcoDistrict.shp` 2.2 MB, `.dbf` 8.9 KB,
  `.shx`, `.prj`, `.cpg`, `EcoDistrict.xml` ISO 19115-3 metadata).
- CRS: `GCS_North_American_1983` (EPSG:4269). Metadata: "Grid CS = Geographic (Lat, Long) ... Horiz. Datum = NAD83".
- Provenance (from `EcoDistrict.xml`): Ontario government dataset "Ecodistricts" (`ECODISTR`), "Defines the
  ecodistricts in the province of Ontario", Open Government Licence - Ontario, dated 2007-01-01; used to assess
  biodiversity levels, define seed zones, map ecosystem types and set targets for natural heritage systems.
  Ecodistricts are the third tier of Ontario's Ecological Land Classification (ecozone > ecoregion > ecodistrict),
  as also described in the ELC readme of the [TPM practice exam data](tpm-practice-exam.md).
- Course use: QGIS "Join attributes by location" - PWQMN stations (base layer) take the ecodistrict attributes of the
  polygon they fall in, to give context to phosphate results [video qgis-join-attributes-by-location].
- Attribute fields: not profiled.

## Handling notes

1. Point-in-polygon join: Join attributes by location, geometric predicate intersects/within; base = stations,
   join = EcoDistrict.
2. Layers must share a CRS for reliable results (reproject both if mixing EPSG:4326 and EPSG:4269; offsets are small
   but the course reprojects for analysis).
