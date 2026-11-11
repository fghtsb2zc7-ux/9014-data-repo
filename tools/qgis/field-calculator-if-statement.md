---
id: qgis.field-calculator-if-statement
tool: qgis
title: Create a new classified field with an if() expression in the Field Calculator
keywords: [field calculator, new field, new column, if statement, conditional, classify, categorize, virtual field, attribute table, expression, North South, latitude]
software_context: "QGIS 3.x (Windows), Attributes toolbar > Field Calculator (abacus icon); Layer Properties > Symbology > Categorized"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-field-calculator.md, timestamps: "00:06-06:54"}, {video: transcripts/qgis/qgis-case-when-for-multiple-conditions.md, timestamps: "00:32"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv"]
---
# Create a new classified field with an if() expression in the Field Calculator

## Purpose
Adds a column computed from existing fields, here a two-way classification with `if(condition, true, false)` (e.g. facilities north/south of 50°N). Useful when the data cannot easily round-trip through Excel (polygons/lines) [video qgis-field-calculator @00:40-01:53]. Checklist items 15-16 [page technical-skills-checklist.md].

## Steps
1. Load the NPRI geolocation CSV as a point layer (X `Longitude / Longitude`, Y `Latitude / Latitude`, EPSG:4326) and add the `ESRI Gray (light)` basemap via QuickMapServices [video qgis-field-calculator @00:06-00:40] [frame @01:42].
2. Select the layer in the Layers panel, then click the Field Calculator button (abacus icon on the Attributes toolbar, just right of the Identify Features button) [frame qgis-case-when-for-multiple-conditions @00:32]. Dialog: "<layer name> — Field Calculator" [frame @02:02]. (Ctrl+I or the attribute-table toolbar also open it — general knowledge — not shown in course.)
3. Leave `Create a new field` selected. For a delimited-text layer `Create virtual field` is ticked and greyed out, with the message "This layer does not support adding new provider fields. You can only add virtual fields." [frame @02:02].
4. `Output field name`: `Latitude_measurement` [frame @03:02].
5. `Output field type`: `Text (string)` (dropdown options: Integer (32 bit), Decimal (double), Text (string), Date, Time, Date & Time, Text, unlimited length (text), Boolean, Binary Object (BLOB)) [frame @03:02-03:12]. Output field length shows 0 for text here [frame @03:12].
6. In the Expression tab type `if(`; expand `Fields and Values` and double-click `Latitude / Latitude` to insert it [video @03:08-03:43] [frame @03:52].
7. Complete the expression: `if( "Latitude / Latitude" >50, 'North', 'South')` [frame @04:32].
8. Check `Preview:` shows a value (e.g. `'North'` for the first feature "Aduro Resources Ltd.") rather than "Expression is invalid" [frame @04:32].
9. Click `OK` [video @04:20].
10. Right-click the layer > `Open Attribute Table`, scroll right: new column with North/South [video @04:20-05:00] [frame @05:02].
11. Optional map: double-click layer > `Symbology` > `Categorized`, Value `Latitude_measurement`, `Classify`, `Apply` [video @05:00-05:41] [frame @05:32].

## Formulas / expressions / code
```
if( "Latitude / Latitude" >50, 'North', 'South')
```
`if(condition, result_when_true, result_when_false)` (signature hint shown in the editor) [frame @04:12]. Field names go in double quotes; the text you want written into the new field goes in single quotes [video @04:20]. See [expression-reference.md](expression-reference.md).

## Verify
- Attribute table title "Features Total: 24552, Filtered: 24552, Selected: 0" and a `Latitude_measurement` column filled with North/South (e.g. Toronto rows = South, Edmonton = North) [frame @05:02].
- Categorized map: red points north of 50°N, blue south [frame @05:42].

## Pitfalls
- Swapping quote types (e.g. `'Latitude / Latitude'`) makes QGIS treat the field name as text; double quotes = field, single quotes = string [video @04:20].
- Output type must be Text for word results; the default is `Integer (32 bit)` [frame @02:02].
- Virtual fields live in the project, not in the source CSV; export the layer to keep them (see [export-layer-to-csv-or-shapefile](export-layer-to-csv-or-shapefile.md)) (general knowledge — not shown in course).
- The function list is long (Geometry group: $area, area, buffer, centroid, $length ...); many operations also exist as tools in the Processing Toolbox (gear icon) [video @05:41-06:54] [frame @06:12-06:42].

## Related
- [field-calculator-case-when.md](field-calculator-case-when.md)
- [field-calculator-change-column-type.md](field-calculator-change-column-type.md)
- [expression-reference.md](expression-reference.md)
- Transcript: [QGIS - Field calculator](../../transcripts/qgis/qgis-field-calculator.md)
