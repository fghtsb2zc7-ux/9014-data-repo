---
id: qgis.field-calculator-change-column-type
tool: qgis
title: Convert a text field to numeric with the Field Calculator
keywords: [change column type, data type, text to number, string to decimal, convert field, numeric, double, field calculator, graduated symbology, PWQMN, phosphate, BDL, below detection limit]
software_context: "QGIS 3.x (newer UI: type names 'Whole number (integer)', 'Decimal number (double)'), Attributes toolbar > Field Calculator"
prerequisites: [qgis.field-calculator-if-statement]
source_videos: [{video: transcripts/qgis/qgis-changing-column-types.md, timestamps: "00:05-01:58"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/PWQMN_Stations.csv", "sources/files/PWQMN_data_2024.csv", "sources/files/Topic 5.zip"]
---
# Convert a text field to numeric with the Field Calculator

## Purpose
When a numeric column was imported as text (e.g. PWQMN `Results`, which contains values like `<0.003`), create a new numeric copy so it can be used in graduated symbology and calculations. Checklist item 8 [page technical-skills-checklist.md].

## Steps
1. Context: layer `PWQMN_Stations` already joined to `PWQMN_data_2024` (joined fields are prefixed `PWQMN_data_2024_`) — see [QGIS - Spatial joins](../../transcripts/qgis/qgis-spatial-joins.md) [frame @00:12, @00:42].
2. (Alternative the instructor mentions: set the column type in the Sample Data preview when adding the delimited text layer [video @00:05].)
3. Select `PWQMN_Stations`, click the Field Calculator button (Attributes toolbar, right of Identify) [video @00:05] [frame @00:32].
4. In the Fields and Values list double-click `PWQMN_data_2024_Results` → expression `"PWQMN_data_2024_Results"` [video @00:05-00:46] [frame @00:52].
5. `Output field name`: `phosphate` [frame @01:02].
6. `Output field type`: `Decimal number (double)` (length shows -1, precision 3) [frame @01:02].
7. `OK` [video @00:46].
8. Open the attribute table, scroll right: `phosphate` column is numeric; entries such as `<0.003` became `NULL` [video @00:46-01:26] [frame @01:22].
9. Optional: right-click layer > `Properties...` > `Symbology` > `Graduated`, Value `phosphate`, `Classify`, `OK` (course: Mode "Equal Count (Quantile)", 5 classes, white-to-red ramp) [video @01:26] [frame @01:42].

## Formulas / expressions / code
```
"PWQMN_data_2024_Results"
```
Just the field reference; the conversion comes from the Output field type `Decimal number (double)` [frame @01:02]. Non-numeric strings become NULL. An explicit `to_real("PWQMN_data_2024_Results")` would also work (general knowledge — not shown in course).

## Verify
- Attribute table "PWQMN_Stations — Features Total: 2198" has a right-aligned `phosphate` column (0.039, 0.026, ...) with NULL where Results had `<0.003` [frame @01:22].
- In Symbology > Graduated the field is listed as `1.2 phosphate` (numeric icon) [frame @01:42].

## Pitfalls
- Below-detection-limit values (`<0.003`, Result Call `BDL`) are lost (NULL); decide whether that is acceptable [video @00:46-01:26].
- The new field is virtual on a CSV-based layer ("You can only add virtual fields") [frame @00:42].
- Older QGIS builds label the type `Decimal (double)` instead of `Decimal number (double)` [frame field-calculator @03:02].

## Related
- [field-calculator-if-statement.md](field-calculator-if-statement.md)
- [export-layer-to-csv-or-shapefile.md](export-layer-to-csv-or-shapefile.md)
- Transcript: [QGIS - Changing column types](../../transcripts/qgis/qgis-changing-column-types.md)
