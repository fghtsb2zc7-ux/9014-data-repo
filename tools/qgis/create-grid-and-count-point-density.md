---
id: qgis.create-grid-and-count-point-density
tool: qgis
title: "Create a 100 km grid and map point density per cell"
keywords: [create grid, fishnet, vector grid, hexagon grid, 100 km grid, grid cells, point density, density map, count points per grid cell, native:creategrid, Vector creation, Pretty Breaks]
software_context: "QGIS 3.44.13-Solothurn, Processing Toolbox (Vector creation, Vector overlay, Vector analysis)"
prerequisites: [qgis.count-points-in-polygon, qgis.clip-vector-layer-to-boundary]
source_videos: [{video: transcripts/qgis/qgis-counting-points-in-polygons-and-creating-grids.md, timestamps: "05:35-09:58"}]
source_pages: [course-pages/topic-7.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv)", "sources/files/Topic 7.zip (lpr_000b16a_f/lpr_000b16a_f.shp)"]
---
# Create a 100 km grid and map point density per cell

## Purpose
Builds a regular polygon grid (100 km × 100 km cells), trims it to the country outline and counts points per cell, giving a spatially even density map ("what is the density per 100 square kilometers of NPRI stations across the country" — the cells are actually 100 km × 100 km = 10,000 km²). [video qgis-counting-points-in-polygons-and-creating-grids @07:29]

## Steps
1. Start with the provinces layer `lpr_000b16a_f` (EPSG:3347) and the (filtered) NPRI point layer loaded, as in [count-points-in-polygon.md](count-points-in-polygon.md). [frame @05:42]
2. Processing Toolbox, search `grid`, double-click `Vector creation > Create grid`. (Menu alternative: `Vector > Research Tools > Create Grid...` (general knowledge — not shown in course).) [frame @06:42]
3. In "Vector Creation - Create Grid" set: [frame @05:52-06:32]
   - Grid type: `Rectangle (Polygon)`
   - Grid extent: click the extent button at the right of the field > `Calculate from Layer` > the NPRI points layer → `-140.883600000,-52.746800000,42.040000000,76.416700000 [EPSG:4326]`
   - Horizontal spacing: `100` and unit dropdown `kilometers` (default 1 meters)
   - Vertical spacing: `100` `kilometers`
   - Horizontal overlay: `0` meters; Vertical overlay: `0` meters
   - Grid CRS: `EPSG:3347 - NAD83 / Statistics Canada Lambert` (project CRS, metres)
   - Grid: `[Create temporary layer]`
4. `Run`, `Close`. A layer `Grid` appears (rectangular block of square cells). [frame @06:42]
5. Create a spatial index on `Grid` (`Vector general > Create spatial index`, Input layer `Grid [EPSG:3347]`, `Run`). [frame @07:02]
6. Clip the grid to the country: `Vector overlay > Clip`, Input layer `Grid [EPSG:3347]`, Overlay layer `lpr_000b16a_f [EPSG:3347]`, `Run` (slow), `Close`. Uncheck `Grid`. [frame @07:12-07:42] — see [clip-vector-layer-to-boundary.md](clip-vector-layer-to-boundary.md)
7. Right-click the `Clipped` layer > `Rename Layer` > `100x100 grid`. [frame @08:02, @08:12]
8. `Vector analysis > Count points in polygon`: Polygons `100x100 grid [EPSG:3347]`; Points the NPRI layer `[EPSG:4326]`; Weight/Class fields empty; Count field name `NUMPOINTS`; `Run`, `Close` → layer `Count`. [frame @08:32]
9. Symbolize: double-click `Count` > `Symbology` > `Graduated`; Value `NUMPOINTS`; Mode `Pretty Breaks` (others offered: Equal Count (Quantile), Equal Interval, Fixed Interval, Logarithmic Scale, Natural Breaks (Jenks), Standard Deviation); Classes `5`; `Classify`; `Apply`, `OK`. Result classes 0–2, 2–4, 4–6, 6–8. [frame @08:52-09:22]
10. Move the NPRI points layer above the grid to see points over cells. [video qgis-counting-points-in-polygons-and-creating-grids @09:26]

## Formulas / expressions / code
Grid output fields (seen in the Clip log): `id, left, top, right, bottom, row_index, col_index`; Count adds `NUMPOINTS`. [frame @07:22, @08:52]

## Verify
- `100x100 grid` cells follow Canada's outline (no cells over open ocean outside the provinces). [frame @07:42]
- `Count` layer's Value list contains `NUMPOINTS`; with the fossil-fuel power filter the maximum class is 6–8 facilities per cell, highest in central Alberta, with some 2–4 cells in southern Ontario. [frame @09:22, @09:52]

## Pitfalls
- Default spacing is 1 metre — running with it would create an enormous number of cells; change the units to kilometres first. [video qgis-counting-points-in-polygons-and-creating-grids @06:15]
- Grid spacing is interpreted in the Grid CRS units; use a projected CRS in metres (EPSG:3347 here), not EPSG:4326.
- Many cells have 0 points, so Equal Count classes collapse; Pretty Breaks (or Equal Interval) gives readable classes. [video qgis-counting-points-in-polygons-and-creating-grids @08:49]
- Clipping a large grid against detailed coastlines takes a while.

## Related
- [count-points-in-polygon.md](count-points-in-polygon.md)
- [clip-vector-layer-to-boundary.md](clip-vector-layer-to-boundary.md)
- [processing-algorithms-reference.md](processing-algorithms-reference.md#create-grid)
- Transcript: [qgis-counting-points-in-polygons-and-creating-grids.md](../../transcripts/qgis/qgis-counting-points-in-polygons-and-creating-grids.md)
