---
id: qgis.processing-algorithms-reference
tool: qgis
title: Look up Processing Toolbox algorithms used in the course (name, group, parameters)
keywords: [processing toolbox, geoprocessing toolbox, algorithm, tool list, gear icon, search toolbox, parameters, algorithm id, reference, lookup]
software_context: "QGIS 3.22 (2025-26 recordings) and QGIS 3.44 (2026-27 recordings), Processing Toolbox"
prerequisites: []
source_videos:
  - {video: transcripts/qgis/qgis-reprojecting-a-vector-layer.md, timestamps: "01:22-03:30"}
  - {video: transcripts/qgis/qgis-join-attributes-by-nearest.md, timestamps: "02:33-10:15"}
  - {video: transcripts/qgis/qgis-sample-raster-values.md, timestamps: "03:11-04:20"}
  - {video: transcripts/qgis/qgis-join-attributes-by-location.md, timestamps: "01:18-02:42"}
  - {video: transcripts/qgis/qgis-creating-a-spatial-index.md, timestamps: "01:16-01:50"}
  - {video: transcripts/qgis/qgis-merging-vector-layers-and-features.md, timestamps: "01:16-01:54"}
source_pages: [course-pages/technical-skills-checklist.md, course-pages/case-study-5.md]
datasets_used: []
---
# Look up Processing Toolbox algorithms used in the course (name, group, parameters)

## Purpose
One `##` section per Processing Toolbox algorithm used in the course videos: toolbox group, what it does, the search term typed in the video, every parameter as set in the course, the output layer name, and the video timestamp. Other contributors append further algorithms as new `##` sections (keep the same layout). Open the toolbox with the gear (cog) icon on the toolbar or `Processing > Toolbox`; type the search term in the box at the top; double-click the algorithm. The dialog title is `<Group> - <Algorithm Name>` (e.g. `Vector General - Reproject Layer`). Algorithm IDs marked "(general knowledge)" were not shown on screen.

## Steps
1. Find the algorithm below by name or by task.
2. Open it via the search term (or menu path, where given).
3. Set the parameters listed; leave anything not listed at its default.
4. Follow the linked procedure file for the full click-by-click workflow.

## Formulas / expressions / code
None.

## Verify
Each section's "Output" line gives the layer name that appears in the Layers panel after `Run`.

## Pitfalls
- Most outputs are temporary (memory) layers named after the output parameter (`Reprojected`, `Joined layer`, `Sampled`, `Merged` ...). They disappear when QGIS closes unless saved.
- Distance/area tools compute in the layer CRS units: reproject to a metre CRS first.

## Related
- Procedure files linked in each section below.

---

## Reproject layer
- **Toolbox group:** Vector general. **Menu:** `Vector > Data Management Tools > Reproject Layer...`. **Dialog title:** `Vector General - Reproject Layer`. **ID:** `native:reprojectlayer` (general knowledge).
- **Purpose:** copy a vector layer with geometries transformed to a new CRS (attributes unchanged), e.g. degrees -> metres.
- **Search term / access used:** Vector menu. [video qgis-reprojecting-a-vector-layer @01:22] [video qgis-join-attributes-by-nearest @02:41]
- **Parameters as used:**
  - Input layer: `Parking lot [EPSG:4326]` / `Buckthorn observations_0 [EPSG:4326]`
  - Selected features only: unchecked
  - Target CRS: `EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert` (parking lot) or `Project CRS: EPSG:26917 - NAD83 / UTM zone 17N` (buckthorn)
  - Convert curved geometries to straight segments: unchecked
  - Advanced Parameters > Coordinate operation [optional]: default first entry (e.g. "Inverse of NAD83 to WGS 84 (1) + UTM zone 17N")
  - Reprojected: `[Create temporary layer]`
- **Output:** `Reprojected` (memory layer).
- **Procedure:** [reproject-vector-layer.md](reproject-vector-layer.md)

## Add geometry attributes
- **Toolbox group:** Vector geometry. **Dialog title:** `Vector Geometry - Add Geometry Attributes`. **ID:** `native:exportaddgeometrycolumns` (general knowledge).
- **Purpose:** add geometry measures to a copy of the layer (polygons: `area`, `perimeter`; lines: length; points: coordinates - only polygons shown).
- **Search term:** `add geo`. [video qgis-reprojecting-a-vector-layer @02:38-03:10]
- **Parameters as used:**
  - Input layer: `Reprojected [EPSG:3162]`
  - Calculate using: `Cartesian Calculations in Layer's CRS`
  - Added geometry info: `[Create temporary layer]`; Open output file after running algorithm: checked
- **Output:** `Added geometry info` with `area` 23683.2 m², `perimeter` 617.4 m.
- **Procedure:** [add-geometry-attributes-area-perimeter.md](add-geometry-attributes-area-perimeter.md)

## Shortest line between features
- **Toolbox group:** Vector analysis. **Dialog title:** `Vector Analysis - Shortest Line Between Features`. **ID:** `native:shortestline` (general knowledge).
- **Purpose:** line layer joining each source feature to the nearest point of the nearest destination feature(s), with a `distance` field (Cartesian, layer CRS units).
- **Search term:** `shortest`. [video qgis-join-attributes-by-nearest @07:45-08:23]
- **Parameters as used:**
  - Source layer: `Reprojected [EPSG:26917]`
  - Destination layer: `Water_Edges [EPSG:26917]`
  - Method: `Distance to Nearest Point on feature`
  - Maximum number of neighbors: `1`
  - Maximum distance [optional]: `Not set` (`meters`)
  - Shortest lines: `[Create temporary layer]`
- **Output:** `Shortest lines` (source fields + destination fields + `distance`, e.g. 43.15 m).
- **Procedure:** [measure-distance-shortest-line-between-features.md](measure-distance-shortest-line-between-features.md)

## Join attributes by nearest
- **Toolbox group:** Vector general. **Dialog title:** `Vector General - Join Attributes by Nearest`. **ID:** `native:joinbynearest` (general knowledge).
- **Purpose:** copy of the input layer with attributes of the nearest feature(s) of a second layer plus distance fields.
- **Search term:** `joi`. [video qgis-join-attributes-by-nearest @08:59-10:12]
- **Parameters as used:**
  - Input layer: `Reprojected [EPSG:26917]`
  - Input layer 2: `Water_Edges [EPSG:26917]`
  - Layer 2 fields to copy (leave empty to copy all fields) [optional]: `0 field(s) selected` (=> all fields copied)
  - Discard records which could not be joined: unchecked
  - Joined field prefix [optional]: empty
  - Maximum nearest neighbors: `1`
  - Maximum distance [optional]: `Not set` (`meters`)
  - Joined layer [optional]: `[Create temporary layer]`; Unjoinable features from first layer [optional]: default
- **Output:** `Joined layer` (53 features) with layer-2 fields + `n`, `distance`, `feature_x`, `feature_y`, `nearest_x`, `nearest_y`.
- **Procedure:** [join-attributes-by-nearest.md](join-attributes-by-nearest.md)

## Sample raster values
- **Toolbox group:** Raster analysis. **Dialog title:** `Raster Analysis - Sample Raster Values`. **ID:** `native:rastersampling` (general knowledge).
- **Purpose:** copy of a point layer with the raster value(s) under each point (one column per band).
- **Search term:** `sample ras`. [video qgis-sample-raster-values @03:11-04:00]
- **Parameters as used:**
  - Input layer: `Joined layer [EPSG:26917]`
  - Raster layer: `1km17477047610SWOOP2015 [EPSG:26917]`
  - Output column prefix [optional]: `elevation` (default `SAMPLE_`)
  - Sampled: `[Create temporary layer]`
- **Output:** `Sampled` with new field `elevation1` (prefix + band number).
- **Procedure:** [sample-raster-values-at-points.md](sample-raster-values-at-points.md)

## Join attributes by location
- **Toolbox group:** Vector general. **Dialog title:** `Join Attributes by Location`. **ID:** `native:joinattributesbylocation` (shown in toolbox tooltip).
- **Purpose:** copy of a base layer with attributes from join-layer features that meet a spatial predicate (e.g. point intersects polygon).
- **Search term:** `join attr`. [video qgis-join-attributes-by-location @01:56-02:42]
- **Parameters as used (QGIS 3.22 labels):**
  - Base Layer: `PWQMN_Stations [EPSG:4326]`
  - Join Layer: `EcoDistrict [EPSG:4269]`
  - Geometric predicate: `intersects` only
  - Fields to add (leave empty to use all fields) [optional]: `0 options selected`
  - Join type: `Create separate feature for each matching feature (one-to-many)`
  - Discard records which could not be joined: unchecked
  - Joined field prefix [optional]: empty
  - Joined layer [optional]: `[Create temporary layer]`
- **Log:** `'METHOD' : 0, 'PREDICATE' : [0], 'JOIN_FIELDS' : [], 'DISCARD_NONMATCHING' : False`; `JOINED_COUNT : 2134`; warning "No spatial index exists for input layer, performance will be severely degraded".
- **Output:** `Joined layer` (2198 features) with EcoDistrict fields appended.
- **Related (not used):** `Join attributes by location (summary)`, `Join attributes by field value` appear in the same search results.
- **Procedure:** [join-attributes-by-location.md](join-attributes-by-location.md)

## Create spatial index
- **Toolbox group:** Vector general. **Dialog title:** `Vector General - Create Spatial Index`. **ID:** `native:createspatialindex` (general knowledge).
- **Purpose:** build a spatial index on a vector layer to speed up processing (not rendering) of large datasets.
- **Search term:** "Create Spatial Index" (course page wording; typing not captured in the video). [video qgis-creating-a-spatial-index @01:16] [page case-study-5.md]
- **Parameters as used:** Input layer: `lpr_000b16a_f` (only parameter).
- **Output:** no new layer; log "Execution completed in 0.32 seconds", OUTPUT = input layer.
- **Procedure:** [create-spatial-index.md](create-spatial-index.md)

## Merge vector layers
- **Toolbox group:** Vector general. **Menu:** `Vector > Data Management Tools > Merge Vector Layers...`. **Dialog title:** `Vector General - Merge Vector Layers`. **ID:** `native:mergevectorlayers` (general knowledge).
- **Purpose:** combine several layers of the same geometry type into one layer.
- **Search term / access used:** Vector menu. [video qgis-merging-vector-layers-and-features @01:16-01:54]
- **Parameters as used:**
  - Input layers: `municlow`, `indianre` (picked with the `...` button)
  - Destination CRS [optional]: empty (CRS of first input)
  - Add source layer information (layer name and path): checked
  - Merged: `[Create temporary layer]`
- **Output:** `Merged` (all fields + `layer`, `path`).
- **Procedure:** [merge-vector-layers.md](merge-vector-layers.md)

## Buffer
- **Toolbox group:** Vector geometry. **Menu:** `Vector > Geoprocessing Tools > Buffer...` (general knowledge). **Dialog title:** `Vector Geometry - Buffer`. **ID:** `native:buffer` (general knowledge).
- **Purpose:** polygon of fixed (or data-defined) distance around every input feature; attributes are carried over.
- **Search term:** `buffer`. [video qgis-buffer-creation-and-zonal-histograms @05:22-05:52]
- **Parameters as used:**
  - Input layer: `pwqmn_reproject [EPSG:26917]` (PWQMN stations reprojected to UTM 17N so distance is in metres)
  - Selected features only: unchecked
  - Distance: `500` `meters` (dialog default 10)
  - Segments: `5`; End cap style: `Round`; Join style: `Round`; Miter limit: `2.000000` (defaults)
  - Dissolve result: unchecked
  - Buffered: `[Create temporary layer]`
- **Log:** `'DISSOLVE' : False, 'DISTANCE' : 500, 'END_CAP_STYLE' : 0, 'JOIN_STYLE' : 0, 'MITER_LIMIT' : 2, 'SEGMENTS' : 5, 'SEPARATE_DISJOINT' : False`; "Execution completed in 0.17 seconds".
- **Related (not used):** Create wedge buffers, Multi-ring buffer (constant distance), Single sided buffer, Tapered buffers (`native:taperedbuffer`, shown in tooltip), Variable width buffer (by M value); GDAL Buffer vectors; GRASS v.buffer.
- **Output:** `Buffered` (one polygon per station, station fields kept).
- **Procedure:** [buffer-points-fixed-distance.md](buffer-points-fixed-distance.md)

## Warp (reproject)
- **Toolbox group:** GDAL > Raster projections. **Menu:** `Raster > Projections > Warp (Reproject)...` (general knowledge). **Dialog title:** `Raster Projections - Warp (Reproject)`. **ID:** `gdal:warpreproject` (general knowledge).
- **Purpose:** reproject a raster to another CRS (raster equivalent of Reproject layer) so it aligns with vector layers in calculations.
- **Search term:** `warp`. [video qgis-buffer-creation-and-zonal-histograms @03:52-04:42]
- **Parameters as used:**
  - Input layer: `aci_2018_on_v3 [EPSG:10820]` (Annual Crop Inventory 2018, Topic 5)
  - Source CRS [optional]: blank
  - Target CRS [optional]: `EPSG:26917 - NAD83 / UTM zone 17N`
  - Resampling method: default (`RESAMPLING: 0`, nearest neighbour)
  - Reprojected: `[Create temporary layer]`
- **Log / GDAL command:** `gdalwarp -overwrite -t_srs EPSG:26917 -r near -of GTiff <input>.tif <temp>/OUTPUT.tif`. Slow on the ~1.7 GB raster.
- **Output:** `Reprojected` raster, renamed `aci_warp` in the video.
- **Procedure:** [reproject-raster-warp.md](reproject-raster-warp.md)

## Zonal histogram
- **Toolbox group:** Raster analysis. **Dialog title:** `Raster Analysis - Zonal Histogram`. **ID:** `native:zonalhistogram` (general knowledge).
- **Purpose:** "appends fields representing counts of each unique value from a raster layer contained within zones defined as polygons" (help text) — pixel count per raster class per polygon.
- **Search term:** `zonal` (results: Raster layer zonal statistics, Zonal histogram, Zonal minimum/maximum point, Zonal statistics). [video qgis-buffer-creation-and-zonal-histograms @07:12-07:52]
- **Parameters as used:**
  - Raster layer: `aci_warp [EPSG:26917]`
  - Band number: `Band 1: aci_2018_on_v3 (Palette)`
  - Vector layer containing zones: `Buffered [EPSG:26917]`; Selected features only: unchecked
  - Output column prefix [optional]: `crop` (default `HISTO_`)
  - Output zones: `[Create temporary layer]`; Open output file after running algorithm: checked
- **Output:** `Output zones` (2198 features): zone fields + one field per class, `crop0`, `crop20`, ... `crop145`, `crop147`, ... `crop190` (pixel counts).
- **Procedure:** [zonal-histogram-raster-categories-in-polygons.md](zonal-histogram-raster-categories-in-polygons.md)

## Clip
- **Toolbox group:** Vector overlay. **Menu:** `Vector > Geoprocessing Tools > Clip...` (general knowledge). **Dialog title:** `Vector Overlay - Clip`. **ID:** `native:clip` (general knowledge).
- **Purpose:** keep only the parts of input features inside the overlay polygons; attributes unchanged (area/length fields not recalculated).
- **Search term:** `clip` (results also list Extract/clip by extent, GDAL Clip raster by extent / mask layer, Clip vector by extent / mask layer). [video qgis-clipping-vector-layers @04:22-07:02] [video qgis-counting-points-in-polygons-and-creating-grids @07:12-07:42]
- **Parameters as used:**
  - Input layer: `municlow [EPSG:4269]` → failed; then `Municipal boundaries [EPSG:4269]` (fixed geometries). Grid video: `Grid [EPSG:3347]`
  - Overlay layer: `lpr_000b16a_f [EPSG:3347]` (filtered `"PRNOM" = 'Ontario'` in the clipping video; unfiltered in the grid video)
  - Selected features only: unchecked (both)
  - Clipped: `[Create temporary layer]`
- **Error seen:** `Feature (129) from "municlow" has invalid geometry. Please fix the geometry or change the "Invalid features filtering" option ...` → run Fix geometries first.
- **Output:** `Clipped` (renamed `100x100 grid` in the grid video).
- **Procedure:** [clip-vector-layer-to-boundary.md](clip-vector-layer-to-boundary.md)

## Fix geometries
- **Toolbox group:** Vector geometry. **Menu:** `Vector > Geometry Tools > Fix Geometries...` (general knowledge). **Dialog title:** `Vector Geometry - Fix Geometries`. **ID:** `native:fixgeometries` (general knowledge).
- **Purpose:** repair invalid geometries without losing vertices; always outputs multi-geometry; drops M values (help text).
- **Search term:** `fix geo`. [video qgis-clipping-vector-layers @05:22-06:02]
- **Parameters as used:**
  - Input layer: `municlow [EPSG:4269]`
  - Repair method: `Structure` (log `METHOD : 1`)
  - Fixed geometries: `[Create temporary layer]`
- **Output:** `Fixed geometries` (renamed `Municipal boundaries`).
- **Procedure:** [fix-invalid-geometries.md](fix-invalid-geometries.md)

## Count points in polygon
- **Toolbox group:** Vector analysis. **Menu:** `Vector > Analysis Tools > Count Points in Polygon...` (general knowledge). **Dialog title:** `Vector Analysis - Count Points in Polygon`. **ID:** `native:countpointsinpolygon` (general knowledge).
- **Purpose:** copy of a polygon layer with a field counting the points inside each polygon (optionally weighted sum, or count of unique classes).
- **Search term:** `count points`. [video qgis-counting-points-in-polygons-and-creating-grids @03:12-03:52, @08:32]
- **Parameters as used:**
  - Polygons: `lpr_000b16a_f [EPSG:3347]`; second run `100x100 grid [EPSG:3347]`
  - Points: `NPRI-INRP_GeolocationsGeolocalisation_1993-present [EPSG:4326]` (filtered to fossil-fuel electric power generation)
  - Weight field [optional]: empty; Class field [optional]: empty
  - Count field name: `NUMPOINTS`
  - Count: `[Create temporary layer]`
- **Log:** `'CLASSFIELD' : '', 'FIELD' : 'NUMPOINTS', 'WEIGHT' : ''`.
- **Output:** `Count` (13 features for provinces; e.g. Alberta 63, Ontario 59).
- **Procedure:** [count-points-in-polygon.md](count-points-in-polygon.md)

## Create grid
- **Toolbox group:** Vector creation. **Menu:** `Vector > Research Tools > Create Grid...` (general knowledge). **Dialog title:** `Vector Creation - Create Grid`. **ID:** `native:creategrid` (general knowledge).
- **Purpose:** vector grid (points, lines, rectangles, diamonds or hexagons) covering an extent at a given spacing.
- **Search term:** `grid`. [video qgis-counting-points-in-polygons-and-creating-grids @05:52-06:42]
- **Parameters as used:**
  - Grid type: `Rectangle (Polygon)`
  - Grid extent: calculated from the NPRI points layer → `-140.883600000,-52.746800000,42.040000000,76.416700000 [EPSG:4326]`
  - Horizontal spacing: `100` `kilometers`; Vertical spacing: `100` `kilometers` (defaults 1 meters)
  - Horizontal overlay: `0` meters; Vertical overlay: `0` meters
  - Grid CRS: `EPSG:3347 - NAD83 / Statistics Canada Lambert`
  - Grid: `[Create temporary layer]`
- **Output:** `Grid` with fields `id, left, top, right, bottom, row_index, col_index`.
- **Procedure:** [create-grid-and-count-point-density.md](create-grid-and-count-point-density.md)
