---
id: qgis.field-calculator-case-when
tool: qgis
title: Classify a field into several categories with CASE WHEN in the Field Calculator
keywords: [case when, CASE, WHEN, THEN, ELSE, END, multiple conditions, bins, thresholds, classify continuous variable, categories, field calculator, conditionals]
software_context: "QGIS 3.x (Windows), Attributes toolbar > Field Calculator; Layer Properties > Symbology > Categorized"
prerequisites: [qgis.field-calculator-if-statement]
source_videos: [{video: transcripts/qgis/qgis-case-when-for-multiple-conditions.md, timestamps: "00:06-04:10"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv"]
---
# Classify a field into several categories with CASE WHEN in the Field Calculator

## Purpose
Splits a continuous (or categorical) field into more than two classes using ordered `WHEN ... THEN ...` rules plus an `ELSE` catch-all (course: latitude → Far North / North / South / Unknown). Same logic as `case_when()` in R [video qgis-case-when-for-multiple-conditions @00:06].

## Steps
1. With the NPRI geolocation point layer selected, click the Field Calculator button (abacus icon right of Identify Features on the Attributes toolbar) [frame @00:32].
2. `Output field name`: `Split latitudes` [frame @00:42].
3. `Output field type`: `Text (string)` (default was `Integer (32 bit)`) [frame @00:52]. `Create virtual field` stays ticked/greyed for this CSV layer [frame].
4. In the function list expand `Conditionals` (CASE, coalesce, if, nullif, regexp_match, try) and double-click `CASE` — a template is inserted: `CASE` / `WHEN condition THEN result` / `END` [video @00:44] [frame @00:52-01:02].
5. Replace `condition` with the field from `Fields and Values` (`Latitude / Latitude`) plus `> 55`, and `result` with `'Far North'` [video @00:44-01:28] [frame @01:22].
6. Copy the WHEN line twice and edit: `> 50 THEN 'North'`, `> 45 THEN 'South'` [video @01:28] [frame @02:02].
7. Add `ELSE 'Unknown'` on its own line before `END` [video @02:04] [frame @02:22].
8. Check `Preview:` shows a value (e.g. `'Far North'`), then `OK` [frame @02:42].
9. Open the attribute table and scroll right to the `Split latitudes` column (values South / Unknown / North ...) [video @02:37] [frame @03:02].
10. Optional: double-click layer > `Symbology` > `Categorized`, Value `Split latitudes`, `Classify`, `OK` [video @03:18] [frame @03:22].

## Formulas / expressions / code
```
CASE
WHEN  "Latitude / Latitude" > 55 THEN 'Far North'
WHEN  "Latitude / Latitude" > 50 THEN 'North'
WHEN  "Latitude / Latitude" > 45 THEN 'South'
ELSE 'Unknown'
END
```
Conditions are tested top-down and the first true one wins, so `> 50` only catches 50-55 because `> 55` was tested first; `ELSE` catches everything else (here latitude ≤ 45) [video @02:04-02:37] [frame @02:42]. Line breaks are only for readability [video @00:44].

## Verify
- Attribute table (Features Total: 24552) shows `Split latitudes` with Far North / North / South / Unknown [frame @03:02].
- Categorized map: Far North yellow (north of 55°), North pink, South purple, Unknown green (southern Ontario below 45°N) [frame @03:42].

## Pitfalls
- The unedited template shows "Eval Error: Field 'condition' not found" and "Expression is invalid" until every placeholder is replaced [frame @01:02].
- Order matters: putting `> 45` first would label everything above 45 as South.
- When copying lines, remember to change both threshold and label (the video briefly had three 'Far North' lines) [frame @01:42].
- Output type must be Text for word labels.

## Related
- [field-calculator-if-statement.md](field-calculator-if-statement.md)
- [expression-reference.md](expression-reference.md)
- Transcript: [QGIS - Case when for multiple conditions](../../transcripts/qgis/qgis-case-when-for-multiple-conditions.md)
