---
id: qgis.print-layout-map-export
tool: qgis
title: "Build a print layout (map, scale bar, north arrow, grid, legend, title) and export a PNG"
keywords: [print layout, layout manager, new print layout, map composition, add map, scale bar, north arrow, legend, map grid, graticule, coordinates, title label, export image, PNG, 300 dpi, final map, story map figure]
software_context: "QGIS 3.44.13-Solothurn, Print Layout window"
prerequisites: [qgis.inverted-polygon-mask-symbology]
source_videos: [{video: transcripts/qgis/qgis-print-layout.md, timestamps: "03:49-14:20"}]
source_pages: [course-pages/topic-7.md, course-pages/technical-skills-checklist.md, course-pages/final-submission-arcgis-story-map.md, course-pages/exam-practice.md]
datasets_used: ["thames_river_watershed.gpkg (Topic 7 folder)", "ESRI Satellite base map"]
---
# Build a print layout and export a PNG

## Purpose
Turns the styled map canvas into a finished map image with a map frame, scale bar, north arrow, coordinate grid, legend and title, exported as PNG at 300 dpi — the kind of figure used in the ArcGIS StoryMap (10 QGIS maps required) or the NPRI report. Covers checklist items 37–42. [video qgis-print-layout @03:49, @13:56] [page technical-skills-checklist.md] [page final-submission-arcgis-story-map.md]
A condensed, tickable version is in [print-layout-checklist.md](print-layout-checklist.md).

## Steps
### A. Create the layout
1. In the main window: `Project > New Print Layout...`. In "Create Print Layout" type a unique title, e.g. `thames_watershed`, `OK`. [frame @04:02]
2. The layout window opens with a blank landscape page (default size; the 300 dpi export later was 3507 × 2480 px, i.e. A4 landscape). Panels on the right: Items, and tabs Item Properties / Layout / Atlas. [frame @04:12, @13:32]
   - To change page size/orientation: right-click the empty page > `Page Properties...` (general knowledge — not shown in course).

### B. Add and position the map
3. `Add Item > Add Map`, then click-drag a rectangle over the page (about 275 × 200 mm, nearly full page). Item `Map 1` appears. [frame @04:12, @04:22]
4. Map 1 Item Properties > Main Properties shows Scale `1166278`, Map rotation `0.00 °`, CRS `Use Project CRS`, Draw map canvas items checked; Layers: Follow map theme unchecked, `Lock layers` unchecked (left as is in the video). [frame @04:22]
5. Choose the "Move item content" tool (left toolbar, below Select/Move item), scroll the mouse wheel over the map to zoom and drag to centre the study area. Scale became `585553`. (You can also type a value in the `Scale` box.) [video qgis-print-layout @04:27] [frame @04:32, @04:42]
6. Switch back to the "Select/Move item" tool to move/resize the map frame itself on the page. [video qgis-print-layout @04:45]

### C. Scale bar
7. `Add Item > Add Scale Bar`, click/drag on the page (bottom-right). It links to `Map 1` and shows `0 10 20 km`. [frame @05:02]
8. Scale bar Item Properties as shown: Main Properties Map `Map 1`, Style `Single Box`; Units: Scalebar units `Kilometers`, Label unit multiplier `1.000000`, Label for units `km`, Method `Calculate along Middle of Map`; Segments: left `0`, right `2`, Fixed width `10.000000 units`, Height `3.00 mm`; Appearance: Box margin `1.00 mm`, Label margin `3.00 mm`, Distance label placement `Above Segment Edges`, Primary fill black, Secondary fill white; Frame unchecked; Background checked. [frame @08:32, @08:42, @08:52, @11:32]

### D. North arrow
9. `Add Item > Add North Arrow`, drag a small box (top-left). Item `North Arrow` (a Picture item). [frame @05:12]
10. Item Properties > Picture: `SVG image` selected; SVG browser > SVG Groups `svg > arrows`; click an arrow in SVG Images. The final choice was the circular compass rose with N/E/S/W letters; drag it to an empty area (upper-left). Resize with the handles if needed. [frame @05:12-06:02]

### E. Map frame and coordinate grid
11. Select `Map 1`; in Item Properties scroll down and tick `Frame` (black line around the map). [frame @06:12, @06:22]
12. Expand `Grids`, click the green `+` to add `Grid 1`, then `Modify Grid...`. [frame @06:52]
13. Map Grid Properties > `Enable grid` checked; Appearance: Grid type `Solid`, CRS `Use Map CRS`, Interval `Map Units`, X `1`, Y `1` (1° lines because the map CRS is EPSG:4326 degrees); Offset 0/0. [frame @06:32, @06:42]
14. Click the `Line style` button > colour: drag the opacity/alpha slider down so lines are semi-transparent; Width `0.30` Millimeters. [frame @07:02]
15. Frame section: Frame style `No Frame` (default). [frame @07:12]
16. Tick `Draw Coordinates`. Format `Decimal with Suffix` (gives 83°W / 43°N; "Degree, Minute" was previewed first). Left `Show All`, Right `Disabled`, Top `Disabled`, Bottom `Show All`; each with `Outside Frame` and `Horizontal`; Distance to map frame `1.00 mm`; Coordinate precision `0`. [frame @07:32-08:12]
17. Go back (blue arrow at top of Map Grid Properties) and shift the map item right/up so the outside-frame labels fit on the page. [frame @08:12]

### F. Legend
18. `Add Item > Add Legend`, drag a box on the page. Legend Item Properties > Main Properties: Map `Map 1`, Arrangement `Symbols on Left`, Resize to fit contents checked. [frame @09:02, @09:12]
19. Legend Items: untick `Auto update` (otherwise items mirror the Layers panel and cannot be edited). [frame @09:22]
20. Select unwanted entries (`thames_river`, `wtrshter`, `ESRI Satellite`) and remove each with the red minus button under the list. [frame @09:32, @09:42]
21. Double-click an entry to edit its label in "Legend Item Properties > Label": `pwqmn_station_thames` → `PWQMN Stations`; `thames_river_watershed` → `Thames River Watershed`. [frame @09:52, @10:02]
22. Main Properties > Title: `Thames River Watershed`. [frame @10:22]
23. Right-click the group heading `thames_river_watershed` in the Legend Items tree and set it to `Hidden` so the group name is not printed. [video qgis-print-layout @10:08] [frame @10:32]
24. Fonts and Text Formatting: Legend Title / Group Headings / Subgroup Headings / Item Labels each have a Font button; open Legend Title font and pick `Arial`, reduce size. [frame @11:02-11:22]
25. Drag the legend to the bottom-right corner beside the scale bar. [frame @10:42, @11:32]

### G. Title label
26. `Add Item > Add Label`, drag a box. In Label > Main Properties replace `Lorem ipsum` with `Water quality monitoring in the Thames river watershed`. Render as HTML unchecked. [frame @11:42-12:02]
27. Appearance > Font button > Label Font: Font `Roboto Slab`, Style `Regular`, Size `21` Points; Color → green (`#00ca00`, H 120°, S 100%, V 79%). Buffer tab: "Draw text buffer" available (left off). [frame @12:22-12:52]
28. Drag the label to its final place (bottom-centre over Lake Erie in the video). [frame @13:02]

### H. Export
29. `Layout > Export as Image...`. In "Save Layout As" go to the output folder (Topic 7), File name `thames_watershed`, Save as type `PNG format (*.png *.PNG)`, `Save`. [video qgis-print-layout @13:16] [frame @13:22]
30. "Image Export Options": Export resolution `300 dpi` (gives Page width `3507 px`, Page height `2480 px`); Enable antialiasing checked; Generate world file unchecked; Crop to Content unchecked; `Save`. [frame @13:32]
31. Confirm the green bar "Export layout: Successfully exported layout to ...\Topic 7\thames_watershed.png" and open the file to check. [frame @13:42, @13:52]

## Formulas / expressions / code
None (all settings are dialog values).

## Verify
- The exported PNG contains: satellite map with highlighted watershed and stations, compass rose, 1° grid labelled 83°W/82°W/81°W (bottom) and 42°N/43°N (left), scale bar `0 10 20 km`, legend titled "Thames River Watershed" with "PWQMN Stations" and "Thames River Watershed", and the green title. [frame @13:52]
- Image size 3507 × 2480 px at 300 dpi.

## Pitfalls
- Moving map *content* (Move item content tool) versus moving the map *item* (Select/Move tool) are different tools; using the wrong one shifts the frame instead of panning. [video qgis-print-layout @04:27-04:45]
- Legend with `Auto update` on lists every layer (including base map) under raw names; turn it off before editing. [video qgis-print-layout @09:15]
- Full-strength black grid lines are visually heavy; lower opacity. Labels on all four sides are "overkill" — disable Right/Top. [video qgis-print-layout @06:50, @07:28]
- Outside-frame labels can fall off the page; leave a margin or shrink/shift the map. [video qgis-print-layout @08:06]
- `Lock layers` was left unchecked; if layers are toggled in the main window afterwards the layout map changes too. Tick `Lock layers` once the map is final (general knowledge — not shown in course).
- The instructor calls this map "a little goofy" — the video demonstrates options, not cartographic best practice.

## Related
- [print-layout-checklist.md](print-layout-checklist.md)
- [inverted-polygon-mask-symbology.md](inverted-polygon-mask-symbology.md)
- Transcript: [qgis-print-layout.md](../../transcripts/qgis/qgis-print-layout.md)
- Base maps: [add-base-map-quickmapservices.md](add-base-map-quickmapservices.md)
