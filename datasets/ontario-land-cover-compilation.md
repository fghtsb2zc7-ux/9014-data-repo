# Ontario Land Cover Compilation v2 (OLCC) - `OntarioLandCoverComp-v2.zip`

- Original path: `sources/files/08 - Lesson 8/Case study/OntarioLandCoverComp-v2.zip` (1.06 GB, 84 entries);
  specification `sources/files/08 - Lesson 8/Case study/Ontario Land Cover Compilation - Data Specification Version.pdf`
  (19 pages, November 2014). Linked from [Case study #8](../course-pages/case-study-8.md).
- Members:
  - `OntarioLandCoverComp-v2/OLCC_V2_TIFF/OLCC_V2_TIFF.tif` (607 MB) with `.tfw`, `.tif.aux.xml` (histogram),
    `.tif.vat.dbf` (value attribute table: `VALUE`, `COUNT`), `.tif.xml` (ESRI metadata).
  - `OntarioLandCoverComp-v2/Ontario Land Cover Compilation - FGDB/Ontario_Land_Cover_Compilation_Version2.gdb`
    (ESRI file-geodatabase raster `OLCC_V2`, ~596 MB) and an ArcGIS `.lyr` file (not usable in QGIS).
- Raster properties (from `.tif.xml`): 127,262 columns x 111,008 rows, 15 m cells, 8-bit unsigned, LZW, NoData 255,
  thematic. CRS: `NAD_1983_Lambert_Conformal_Conic` with false easting 930,000, false northing 6,430,000, central
  meridian -85, standard parallels 44.5 and 53.5 (Ontario MNR Lambert parameters on NAD83). No `.prj` listed.
- Provenance (spec): Ontario Ministry of Natural Resources and Forestry, Science and Research Branch. Combines the
  Provincial Land Cover Database 2000 (25 m), Far North Land Cover v1.4 (30 m) and SOLRIS v1.2 (15 m), resampled to
  15 m, reprojected to NAD83 Lambert Conformal Conic and reclassified into 29 classes; landscape current to
  1999-2011; intended for 1:50,000-1:100,000 analysis.

## Class codes (spec Table 1)

| Code | Class | Code | Class |
|---|---|---|---|
| 1 | Clear Open Water | 15 | Coniferous Treed |
| 2 | Turbid Water | 16 | Plantations - Treed Cultivated |
| 3 | Shoreline | 17 | Hedge Rows |
| 4 | Mudflats | 18 | Disturbance |
| 5 | Marsh | 19 | Open Cliff and Talus |
| 6 | Swamp | 20 | Alvar |
| 7 | Fen | 21 | Sand Barren and Dune |
| 8 | Bog | 22 | Open Tallgrass Prairie |
| 10 | Heath | 23 | Tallgrass Savannah |
| 11 | Sparse Treed | 24 | Tallgrass Woodland |
| 12 | Treed Upland | 25 | Sand / Gravel / Mine Tailings |
| 13 | Deciduous Treed | 26 | Bedrock |
| 14 | Mixed Treed | 27 | Community / Infrastructure |
| | | 28 | Agriculture and Undifferentiated Rural Land Use |
| -99 | Other | -9 | Cloud / Shadow |

Wetland classes: 5 Marsh, 6 Swamp, 7 Fen, 8 Bog. Wooded classes: 11-16 (and 24 Tallgrass Woodland).

Note: the TIFF is 8-bit unsigned, so the negative codes cannot be stored as such; the histogram has populated bins at
157 and 247, which correspond to -99 and -9 wrapped into 0-255 (inference from the `.aux.xml` histogram, not
documented).

## Handling notes

1. Huge raster: clip to London / TTLT extent first (Raster > Extraction > Clip Raster by Extent or Mask Layer).
2. Use Paletted/Unique values symbology with the class table above.
3. Reproject (Warp) or reproject the vector parcels to match before zonal histograms; parcels are EPSG:26917.
4. Zonal histogram of OLCC within parcels gives pixel counts per class; multiply by 225 m2 for area.
5. The FGDB raster and `.lyr` duplicate the TIFF; use the TIFF in QGIS.
