---
id: qgis.expression-reference
tool: qgis
title: QGIS expression and Raster Calculator syntax reference (as used in the course)
keywords: [expression, syntax, operators, functions, quotes, field name, if, CASE WHEN, IN, AND, OR, !=, LIKE, raster calculator syntax, band reference, @1, query builder, field calculator]
software_context: "QGIS 3.x — Query Builder (Filter...), Field Calculator, Raster Calculator"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-filter-vector-data-for-multiple-conditions.md, timestamps: "00:51-06:00"}, {video: transcripts/qgis/qgis-field-calculator.md, timestamps: "02:31-06:54"}, {video: transcripts/qgis/qgis-case-when-for-multiple-conditions.md, timestamps: "00:44-02:37"}, {video: transcripts/qgis/qgis-changing-column-types.md, timestamps: "00:05-01:26"}, {video: transcripts/qgis/qgis-raster-calculator.md, timestamps: "01:21-03:53"}, {video: transcripts/qgis/qgis-raster-calculator-with-two-raster-layers.md, timestamps: "02:36-07:41"}]
source_pages: [course-pages/technical-skills-checklist.md]
datasets_used: [NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv, PWQMN_Stations + PWQMN_data_2024, Carcinus maenas.tif, Ciona intestinalis.tif]
---
# QGIS expression and Raster Calculator syntax reference (as used in the course)

## Purpose
Lookup table for every expression element typed in the course's QGIS videos on filtering, the Field Calculator and the Raster Calculator, with the exact course example and where it appears. Elements that are only visible as buttons/list entries (not used) are listed separately.

## Steps
1. Find the element in the tables below.
2. Copy the course example, swapping in your own field/layer names exactly as they appear in the Fields list or Raster Bands list (double-click them to insert correctly quoted).
3. Check the dialog's validity indicator: Query Builder `Test` ("The where clause returned N row(s)."), Field Calculator `Preview:` (a value, not "Expression is invalid"), Raster Calculator "Expression valid".

## Formulas / expressions / code

### Quoting rules (vector expressions: Query Builder and Field Calculator)
| Syntax | Meaning | Course example | Source |
|---|---|---|---|
| `"..."` double quotes | field (column) name; required when the name has spaces or `/` | `"Province / Province"`, `"Latitude / Latitude"`, `"PWQMN_data_2024_Results"` | [filter @01:32 frame], [field-calc @04:20], [col-types @00:52 frame] |
| `'...'` single quotes | literal text value | `'ON'`, `'Breweries'`, `'North'`, `'Far North'` | [filter @01:32 frame], [field-calc @04:20] |
| bare number | numeric literal | `50`, `55`, `45` | [field-calc @04:32 frame], [case @02:42 frame] |
| `( ... )` | grouping / function arguments / value list for IN | `('AB','ON')` | [filter @04:12 frame] |

Instructor: "the column ... or the field goes in double quotation marks, what you actually want it to put into the new field goes in single quotation marks" [video qgis-field-calculator @04:20].

### Comparison and logical operators (vector)
| Operator | Meaning | Course example | Source |
|---|---|---|---|
| `=` | equals | `"Province / Province" = 'ON'` | [video qgis-filter-vector-data-for-multiple-conditions @01:34, frame @01:32] |
| `!=` | does not equal | `"NAICS Code Title (English) / Titre Code SCIAN (Anglais)" != 'Breweries'` | [video qgis-filter-vector-data-for-multiple-conditions @04:46-05:23, frame @05:12] |
| `>` | greater than | `"Latitude / Latitude" >50` | [video qgis-field-calculator @03:43, frame @04:32] |
| `<`, `<=`, `>=` | less than / ≤ / ≥ (mentioned for years etc., not typed) | — | [video qgis-filter-vector-data-for-multiple-conditions @05:23] |
| `AND` | both conditions true | `"Province / Province" = 'ON'  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'` | [video qgis-filter-vector-data-for-multiple-conditions @01:34-02:14, frame @02:22] |
| `IN (a, b)` | value is in the set ("in the set of"; like `%in%` in R) | `"Province / Province" IN ('AB','ON')` | [video qgis-filter-vector-data-for-multiple-conditions @02:53-04:10, frame @04:12] |
| `OR` | either condition (described as "you want A and you want B ... either or"; not typed) | — | [video qgis-filter-vector-data-for-multiple-conditions @05:23] |

Buttons visible in the Query Builder but not used: `LIKE`, `ILIKE`, `%`, `NOT IN`, `NOT` [frame filter @01:12]. Their meanings (general knowledge — not shown in course): `LIKE` pattern match with `%` wildcard (case-sensitive), `ILIKE` case-insensitive LIKE, `NOT IN` value not in set, `NOT` negates a condition.

### Field Calculator functions
| Function | Meaning | Course example | Source |
|---|---|---|---|
| `if(condition, result_when_true, result_when_false)` | two-way conditional | `if( "Latitude / Latitude" >50, 'North', 'South')` (Output: `Latitude_measurement`, Text (string)) | [video qgis-field-calculator @03:08-04:20, frame @04:12 signature, @04:32] |
| `CASE WHEN condition THEN result ... ELSE result END` | multi-way conditional; first true WHEN wins; ELSE = everything else | see block below (Output: `Split latitudes`, Text (string)) | [video qgis-case-when-for-multiple-conditions @00:44-02:37, frame @02:42] |
| field reference alone + numeric Output field type | type conversion (text → number); non-numbers become NULL | `"PWQMN_data_2024_Results"` with Output `phosphate`, `Decimal number (double)` | [video qgis-changing-column-types @00:05-01:26, frame @01:02] |

```
CASE
WHEN  "Latitude / Latitude" > 55 THEN 'Far North'
WHEN  "Latitude / Latitude" > 50 THEN 'North'
WHEN  "Latitude / Latitude" > 45 THEN 'South'
ELSE 'Unknown'
END
```
[frame qgis-case-when-for-multiple-conditions @02:42]

Other Field Calculator content shown but not used: Conditionals group `CASE, coalesce, if, nullif, regexp_match, try` [frame case @00:52]; variables `feature, geometry, id, row_number`; groups Aggregates, Arrays, Color, Conditionals, Conversions, CRS, Date and Time, Fields and Values, Files and Paths, Fuzzy Matching, General, Geometry, Map Layers, Maps [frame field-calc @02:02]; Geometry functions incl. `$area, area, buffer, centroid, $length, length` [frame field-calc @06:12-06:32]; operator buttons `= + - / * ^ || ( ) '\n'` [frame field-calc @02:02].

### Raster Calculator syntax
| Syntax | Meaning | Course example | Source |
|---|---|---|---|
| `"layer name@N"` | band N of a raster layer (double-click in "Raster Bands" to insert) | `"Carcinus maenas@1"`, `"Ciona intestinalis@1"` | [video qgis-raster-calculator @01:57, frame @02:02] |
| `>` comparison | returns 1 where true, 0 where false (binary raster) | `"Carcinus maenas@1" > 0.5` | [video qgis-raster-calculator @01:57-02:38, frame @02:22] |
| `*` multiply | cell-by-cell product; with a 1/0 mask keeps original values | `("Carcinus maenas@1" > 0.5) * "Carcinus maenas@1"` | [video qgis-raster-calculator @02:38-03:17, frame @03:12] |
| `AND` | 1 where both conditions are true | `("Carcinus maenas@1" > 0.5) AND ("Ciona intestinalis@1" > 0.5)` | [video qgis-raster-calculator-with-two-raster-layers @03:55-04:33, frame @04:22] |
| `+` add | cell-by-cell sum; summing 1/0 masks counts how many are true (0/1/2) | `("Carcinus maenas@1" >0.5) + ("Ciona intestinalis@1" > 0.5)` | [video qgis-raster-calculator-with-two-raster-layers @06:24-07:02, frame @06:52] |
| `( )` | grouping; required around each comparison before combining | as above | [frames] |

Raster Calculator operator buttons shown but not used: `- / < = <= >= != ^ min max abs IF OR sqrt cos sin tan acos asin atan log10 ln` [frame qgis-raster-calculator @01:42].

## Verify
Each dialog validates live: Raster Calculator "Expression valid"/"Expression invalid" under the box [frame raster @02:02, @03:02]; Field Calculator "Preview: 'North'" or "Expression is invalid (more info)" [frame field-calc @03:32, @04:32]; Query Builder `Test` → "Query Result: The where clause returned 4394 row(s)." [frame filter @01:32].

## Pitfalls
- Two raster comparisons placed side by side without an operator → "Expression invalid" [frame two-rasters @04:12].
- Unreplaced CASE template → "Eval Error: Field 'condition' not found" [frame case @01:02].
- Typing a value before the field in the Query Builder produced `'Breweries'"NAICS Code Title ..."` (invalid) [frame filter @04:32].
- Field names in this NPRI file are bilingual and contain ` / `; always insert them from the Fields list to get the exact spelling.

## Related
- [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md)
- [field-calculator-if-statement.md](field-calculator-if-statement.md)
- [field-calculator-case-when.md](field-calculator-case-when.md)
- [field-calculator-change-column-type.md](field-calculator-change-column-type.md)
- [raster-calculator-threshold-filter.md](raster-calculator-threshold-filter.md)
- [raster-calculator-combine-two-rasters.md](raster-calculator-combine-two-rasters.md)
