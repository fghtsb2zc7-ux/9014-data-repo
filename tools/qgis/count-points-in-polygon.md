---
id: qgis.count-points-in-polygon
tool: qgis
title: "Count points in each polygon"
keywords: [count points in polygon, point count per province, NUMPOINTS, facilities per region, density by polygon, native:countpointsinpolygon, Vector analysis, NPRI facilities count, weight field, class field]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (Vector analysis)"
prerequisites: [qgis.filter-vector-multiple-conditions]
source_videos: [{video: transcripts/qgis/qgis-counting-points-in-polygons-and-creating-grids.md, timestamps: "00:05-05:35"}]
source_pages: [course-pages/topic-7.md, course-pages/technical-skills-checklist.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv)", "sources/files/Topic 7.zip (lpr_000b16a_f/lpr_000b16a_f.shp)"]
---
# Count points in each polygon

## Purpose
Creates a copy of a polygon layer with a new field holding the number of points from a point layer that fall inside each polygon — e.g. number of NPRI fossil-fuel electric power generation facilities per province. Checklist item 27. [video qgis-counting-points-in-polygons-and-creating-grids @00:05] [page technical-skills-checklist.md]

## Steps
1. Add `lpr_000b16a_f.shp` (provinces, EPSG:3347) and create a spatial index on it (`Vector general > Create spatial index`). [video qgis-counting-points-in-polygons-and-creating-grids @00:39]
2. Add the NPRI points: `Layer > Add Layer > Add Delimited Text Layer...`; File name `NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv`; Encoding `UTF-8`; File format `CSV (comma separated values)`; Geometry definition `Point coordinates`; X field `Longitude / Longitude`; Y field `Latitude / Latitude`; Geometry CRS EPSG:4326; `Add`, `Close`. [frame @00:52, @01:02]
3. Create a spatial index on the points layer as well. [video qgis-counting-points-in-polygons-and-creating-grids @01:52]
4. (Optional) Filter the points to one sector: right-click the NPRI layer > `Filter...`; double-click field `NAICS Code Title (English) / Titre Code SCIAN (Anglais)`; click `IN`; under Values click `All`, search `foss`, double-click both spellings; finish the expression with `)`; `OK`. [frame @02:32-03:02]
5. Processing Toolbox, search `count points`, double-click `Vector analysis > Count points in polygon`. (Menu alternative: `Vector > Analysis Tools > Count Points in Polygon...` (general knowledge — not shown in course).) [frame @03:12]
6. In "Vector Analysis - Count Points in Polygon" set: [frame @03:22]
   - Polygons: `lpr_000b16a_f [EPSG:3347]`
   - Points: `NPRI-INRP_GeolocationsGeolocalisation_1993-present [EPSG:4326]`
   - Weight field [optional]: empty (could be used to sum a value instead of counting)
   - Class field [optional]: empty
   - Count field name: `NUMPOINTS` (default)
   - Count: `[Create temporary layer]`
7. `Run`, wait (large dataset), `Close`. A new layer `Count` is added. [video qgis-counting-points-in-polygons-and-creating-grids @03:48]
8. Right-click `Count` > `Open Attribute Table` to read `NUMPOINTS`. [frame @04:12]
9. Map the result: double-click `Count` > `Symbology` > renderer `Graduated`; Value `NUMPOINTS`; click `Classify`; add a class with the `Classes` spin box (5 → 6); Color ramp `Viridis`; Mode `Equal Count (Quantile)`; `Apply`, `OK`. [frame @04:32-05:02]

## Formulas / expressions / code
Sector filter used before counting:
```
"NAICS Code Title (English) / Titre Code SCIAN (Anglais)" IN ('Fossil-Fuel Electric Power Generation','Fossil-fuel electric power generation')
```
- `IN (...)` keeps rows matching either spelling; the dataset contains the same NAICS title with two capitalisations. [frame @02:52]

Log parameters: `'CLASSFIELD' : '', 'FIELD' : 'NUMPOINTS', 'WEIGHT' : '', 'OUTPUT' : 'TEMPORARY_OUTPUT'`.

## Verify
- Attribute table "Count — Features Total: 13" (13 provinces/territories) with `NUMPOINTS` as last column. For the fossil-fuel power filter the frame shows: Alberta 63, Ontario 59, Northwest Territories 29, Quebec 26, Nunavut 24, Saskatchewan 14, Yukon 9, New Brunswick 8, British Columbia 8, Manitoba 7. [frame @04:12]
- Graduated map: Alberta and Ontario in the top (yellow) class 29–63. [frame @05:02]

## Pitfalls
- Points in EPSG:4326 and polygons in EPSG:3347 work together (QGIS handles the transform), but processing large layers is slow; add spatial indexes. [video qgis-counting-points-in-polygons-and-creating-grids @01:52]
- Use `IN` rather than `=` when a category exists under several spellings. [video qgis-counting-points-in-polygons-and-creating-grids @02:33]
- If both a weight field and a class field are set, the weight field wins (algorithm help). [frame @03:22]
- Counts by province are not area-normalised; use a regular grid for spatial density ([create-grid-and-count-point-density.md](create-grid-and-count-point-density.md)).

## Related
- [create-grid-and-count-point-density.md](create-grid-and-count-point-density.md)
- [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#count-points-in-polygon)
- Transcript: [qgis-counting-points-in-polygons-and-creating-grids.md](../../transcripts/qgis/qgis-counting-points-in-polygons-and-creating-grids.md)
