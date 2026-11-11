---
id: qgis.print-layout-checklist
tool: qgis
title: "Checklist: produce a finished map export from a QGIS print layout"
keywords: [print layout checklist, map checklist, final map, export map, cartographic elements, scale bar, north arrow, legend, title, grid, frame, 300 dpi PNG, StoryMap map, NPRI report map]
software_context: "QGIS 3.44.13-Solothurn, Print Layout window"
prerequisites: [qgis.print-layout-map-export]
source_videos: [{video: transcripts/qgis/qgis-print-layout.md, timestamps: "00:05-14:20"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/final-submission-arcgis-story-map.md, course-pages/exam-practice.md, course-pages/topic-7.md]
datasets_used: ["any styled QGIS project (course example: thames_river_watershed.gpkg + ESRI Satellite)"]
---
# Checklist: produce a finished map export from a QGIS print layout

## Purpose
Ordered, tickable checklist an agent can follow to go from a styled map canvas to an exported map image. Each line gives the exact menu/field and the value used in the course video; details and screenshots-as-text are in [print-layout-map-export.md](print-layout-map-export.md). Course checklist items covered: 37 initiate a print layout, 38 add and position a map, 39 north arrow and appropriate scale bar, 40 legend (remove, rename, reorder, group items), 41 frame and coordinate system, 42 export at appropriate size and resolution. [page technical-skills-checklist.md]

## Steps
### 0. Before opening the layout (main window)
- [ ] All needed layers loaded; unneeded layers unchecked (they would otherwise print and appear in the legend). [video qgis-print-layout @01:12]
- [ ] Symbology final (e.g. outline + inverted-polygon mask, see [inverted-polygon-mask-symbology.md](inverted-polygon-mask-symbology.md)); point layers above polygons; base map at the bottom. [frame @03:32]
- [ ] Layer names meaningful (legend labels can also be renamed later). 
- [ ] Map canvas roughly zoomed to the study area.

### 1. Page setup
- [ ] `Project > New Print Layout...` → title (e.g. `thames_watershed`) → `OK`. [frame @04:02]
- [ ] Page: default landscape page was used (exports as 3507 × 2480 px at 300 dpi = A4 landscape). Change via right-click page > `Page Properties...` only if another size is required (general knowledge — not shown in course). [frame @13:32]

### 2. Map item
- [ ] `Add Item > Add Map`, drag across almost the full page (~275 × 200 mm). [frame @04:12]
- [ ] Item Properties: CRS `Use Project CRS`; Map rotation `0.00 °`. [frame @04:22]
- [ ] Use "Move item content" tool + mouse wheel (or type `Scale`) to frame the study area; video ended at scale 585553 (1:585,553). [frame @04:42]
- [ ] Back to "Select/Move item" tool for positioning the frame. [video qgis-print-layout @04:45]
- [ ] Tick `Frame` (map border). [frame @06:22]
- [ ] Optional: tick `Lock layers` once the map is final so later changes in the main window do not alter it (general knowledge — not shown in course; video left it unchecked). [frame @04:22]

### 3. Coordinate grid (map item > Grids)
- [ ] `+` → `Grid 1` → `Modify Grid...` → `Enable grid`. [frame @06:52]
- [ ] Grid type `Solid`; CRS `Use Map CRS`; Interval `Map Units`; X `1`, Y `1` (degrees, because map CRS is EPSG:4326 — pick an interval suited to your CRS units). [frame @06:42]
- [ ] Line style: lower opacity; width `0.30 mm`. [frame @07:02]
- [ ] `Draw Coordinates` on; Format `Decimal with Suffix`; Left `Show All`, Bottom `Show All`, Right `Disabled`, Top `Disabled`; `Outside Frame`, `Horizontal`; Distance to map frame `1.00 mm`; Coordinate precision `0`. [frame @07:32-08:12]
- [ ] Shift/shrink map so labels stay on the page. [frame @08:12]

### 4. Scale bar
- [ ] `Add Item > Add Scale Bar`, place bottom-right; Map `Map 1`. [frame @05:02]
- [ ] Style `Single Box`; Scalebar units `Kilometers`; Label for units `km`; Method `Calculate along Middle of Map`; Segments left `0` / right `2`; Fixed width `10 units`; Height `3.00 mm` → reads `0 10 20 km`. Adjust Fixed width so the bar is a sensible length for your scale. [frame @08:52, @11:32]
- [ ] Background checked, Frame unchecked (defaults kept). [frame @08:42]

### 5. North arrow
- [ ] `Add Item > Add North Arrow`; Picture > `SVG image` > SVG Groups `svg > arrows` > choose arrow (video: compass rose with N/E/S/W). [frame @05:12-06:02]
- [ ] Place where it does not cover data (upper-left in video). [frame @06:02]

### 6. Legend
- [ ] `Add Item > Add Legend`; Map `Map 1`; Arrangement `Symbols on Left`; Resize to fit contents ✓. [frame @09:12]
- [ ] Legend Items: untick `Auto update`. [frame @09:22]
- [ ] Remove base map and unused layers (red minus button). [frame @09:32, @09:42]
- [ ] Rename entries (double-click → Label), e.g. `PWQMN Stations`, `Thames River Watershed`. [frame @09:52, @10:02]
- [ ] Title, e.g. `Thames River Watershed`. [frame @10:22]
- [ ] Hide raw group heading (right-click group → `Hidden`). [frame @10:32]
- [ ] Fonts and Text Formatting: set Legend Title / Item Labels fonts (video: Arial, smaller). [frame @11:12, @11:22]
- [ ] Position (bottom-right with scale bar in video). [frame @11:32]

### 7. Title / text labels
- [ ] `Add Item > Add Label`; replace `Lorem ipsum` with the title text (video: `Water quality monitoring in the Thames river watershed`). [frame @12:02]
- [ ] Font button: font (video `Roboto Slab`, Regular), Size `21` pt, Color (video `#00ca00`); optional Buffer tab "Draw text buffer" for legibility over imagery. [frame @12:32-12:52]
- [ ] Position the label. [frame @13:02]

### 8. Final review
- [ ] All items inside the page; nothing overlapping important data.
- [ ] Legend matches visible layers; scale bar linked to `Map 1`.
- [ ] Data source/credit text added if required by the assignment (not shown in video).

### 9. Export
- [ ] `Layout > Export as Image...` → folder → File name → Save as type `PNG format (*.png *.PNG)` → `Save`. [frame @13:22]
- [ ] Image Export Options: Export resolution `300 dpi` (→ 3507 × 2480 px); Enable antialiasing ✓; Generate world file ✗; Crop to Content ✗ → `Save`. [frame @13:32]
- [ ] Confirm green "Successfully exported layout to ..." bar; open the PNG and inspect. [frame @13:42, @13:52]
- [ ] Optional: save the project so the layout is kept (`Project > Save`) — see [save-project-file.md](save-project-file.md).

## Formulas / expressions / code
None.

## Verify
- PNG exists at the chosen path, 3507 × 2480 px at 300 dpi, and shows map, frame, grid labels (2 sides), scale bar, north arrow, legend with clean names, and title. [frame @13:52]

## Pitfalls
- Editing legend items while `Auto update` is on is not possible. [video qgis-print-layout @09:15]
- Grid interval is in map CRS units: `1` = 1 degree in EPSG:4326 but 1 metre in a projected CRS (would draw an unusable dense grid).
- Coordinate labels "Outside Frame" need page margin. [video qgis-print-layout @08:06]
- The export resolution prompt can be accepted with Save; 300 dpi was the value shown. [video qgis-print-layout @13:30]

## Related
- [print-layout-map-export.md](print-layout-map-export.md)
- [inverted-polygon-mask-symbology.md](inverted-polygon-mask-symbology.md)
- Transcript: [qgis-print-layout.md](../../transcripts/qgis/qgis-print-layout.md)
