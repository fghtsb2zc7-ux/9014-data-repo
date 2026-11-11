---
id: excel.formula-reference
tool: excel
title: Look up an Excel worksheet function or Power Query transformation used in the course
keywords: [function list, formula reference, cheat sheet, syntax, SUM, UNIQUE, COUNTIF, SUMIF, MAX, MIN, FILTER, IF, OR, IFS, AND, YEAR, DAY, power query steps, M code, Table.Pivot, Table.UnpivotOtherColumns, Table.NestedJoin, Table.ExpandTableColumn, Date.Year, Date.WeekOfYear, Date.From, Table.SelectRows, Table.RemoveColumns, Table.ReorderColumns, Table.AddColumn, Table.TransformColumnTypes]
software_context: "Excel for Microsoft 365 (Windows): worksheet functions and Power Query Editor"
prerequisites: []
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "00:06-23:04"}, {video: transcripts/excel/excel-if-statements.md, timestamps: "00:06-08:15"}, {video: transcripts/excel/excel-pivoting-columns.md, timestamps: "01:22-07:42"}, {video: transcripts/excel/excel-extracting-date-information.md, timestamps: "02:35-04:03"}, {video: transcripts/excel/excel-cleaning-up-date-data.md, timestamps: "01:19-03:59"}, {video: transcripts/excel/excel-merging-data.md, timestamps: "01:12-04:34"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv", "sources/files/Topic 2/OBIS - North Atlantic Right Whale reduced.csv", "sources/files/PWQMN_Stations.csv", "sources/files/PWQMN_data_2024.csv"]
---
# Look up an Excel worksheet function or Power Query transformation used in the course

## Purpose
One table per kind of tool: every worksheet function and Power Query transformation that appears in the six videos "Pivoting columns", "Extracting date information", "Cleaning up date data", "Using Excel Formulas", "IF statements" and "Merging data", with what it does, the syntax exactly as used on screen, and where to see it. Video abbreviations: **FRM** = excel-using-excel-formulas, **IF** = excel-if-statements, **PIV** = excel-pivoting-columns, **EXT** = excel-extracting-date-information, **CLN** = excel-cleaning-up-date-data, **MRG** = excel-merging-data. Timestamps are mm:ss in that video. Functions from other Excel videos (loading, filtering, PivotTables, data types, splitting, removing columns/rows) are in those procedure files.

## Steps
1. Find the function or step below.
2. Open the linked procedure for click-by-click use.
3. Sheet/column names in the examples come from the course datasets; replace them with yours.

## Worksheet functions USED in formulas

| Function | What it does | Syntax as used (exact on-screen text) | Where |
|---|---|---|---|
| `SUM` | Adds numbers in a range | `=sum(E2:E1323)` → 28474372.17 (tooltip `SUM(number1, [number2], ...)`) | FRM @04:32-05:32; [enter-formulas-and-cross-sheet-references.md](enter-formulas-and-cross-sheet-references.md) |
| `UNIQUE` | Returns the distinct values of a range (spills) | `=UNIQUE('NPRI-INRP_IndustryIndustrie_Air'!A2:A1323)` (tooltip `UNIQUE(array, [by_col], [exactly_once])`) → 147 industries | FRM @07:12-08:42; [unique-distinct-values-formula.md](unique-distinct-values-formula.md) |
| `COUNTIF` | Counts cells in a range that meet a criterion | `=COUNTIF('NPRI-INRP_IndustryIndustrie_Air'!A:A, Sheet2!B2)` (tooltip `COUNTIF(range, criteria)`) → 10 | FRM @11:32-12:12, @15:22; [countif-sumif-max-min-formulas.md](countif-sumif-max-min-formulas.md) |
| `FILTER` | Returns the rows of an array where `include` is TRUE (spills) | `=FILTER('NPRI-INRP_IndustryIndustrie_Air'!A:F,'NPRI-INRP_IndustryIndustrie_Air'!A:A = Sheet2!B2)` (tooltip `FILTER(array, include, [if_empty])`) | FRM @15:42-18:22; [filter-function-return-matching-rows.md](filter-function-return-matching-rows.md) |
| `MAX` | Largest number in a range (ignores text/logicals) | `=max(` column E of Sheet2 `)` — exact text not legible; reconstructed `=MAX(E:E)` → 3293.630534 | FRM @20:12-21:12; [countif-sumif-max-min-formulas.md](countif-sumif-max-min-formulas.md) |
| `MIN` | Smallest number in a range | `=MIN(E:E)` (reconstructed, same way as MAX) → 1813.214394 | FRM @20:32-21:12 |
| `SUMIF` | Adds `sum_range` cells whose `range` cell meets the criterion | `=sumif('NPRI-INRP_IndustryIndustrie_Air'!A:A,Sheet2!B2, 'NPRI-INRP_IndustryIndustrie_Air'!E:E)` (tooltip `SUMIF(range, criteria, [sum_range])`) → 23772.02889 | FRM @21:22-22:12; [countif-sumif-max-min-formulas.md](countif-sumif-max-min-formulas.md) |
| `IF` | One value if a test is TRUE, another if FALSE | `=IF([@[Industry (English) / Industrie (Anglais)]] = "Coal mining", "Coal mining", "Non-mining industries")` (tooltip `IF(logical_test, [value_if_true], [value_if_false])`) | IF @01:32-02:22; [if-classify-rows-new-column.md](if-classify-rows-new-column.md) |
| `OR` | TRUE if any argument is TRUE | `=IF(OR([@[Industry (English) / Industrie (Anglais)]]= "Coal mining", [@[Industry (English) / Industrie (Anglais)]]= "Foundries"), "Mining", "Non-mining")` (tooltip `OR(logical1, [logical2], ...)`) | IF @03:52-05:02; [if-or-multiple-conditions.md](if-or-multiple-conditions.md) |
| `IFS` | Returns the value paired with the first TRUE test | `=IFS([@[Facility Count / Nombres d''installations]]<10, "Low", [@[Facility Count / Nombres d''installations]]< 20, "Medium", [@[Facility Count / Nombres d''installations]]>=20, "High")` (tooltip `IFS(logical_test1, value_if_true1, [logical_test2, value_if_true2], ...)`) | IF @06:12-07:12; [ifs-categorize-numeric-thresholds.md](ifs-categorize-numeric-thresholds.md) |

Reference forms seen: relative range `A2:A1323`; whole column `A:A`, `E:E`, `A:F`; other sheet `'Sheet name'!A:A` / `Sheet2!B2`; absolute `='Unique industries'!$A$1:$A$145` (Data Validation source); table structured reference `[@[Column name]]` (apostrophes doubled: `d''installations`). Operators used: `=`, `<`, `>=`.

## Worksheet functions SHOWN in menus/tooltips but not used

| Where shown | Functions visible (exact list) | Notes |
|---|---|---|
| Formulas > Date & Time (FRM @01:52-02:32) | DATE, DATEVALUE, DAY, DAYS, DAYS360, EDATE, EOMONTH, HOUR, ISOWEEKNUM, MINUTE, MONTH, NETWORKDAYS, NETWORKDAYS.INTL, NOW, SECOND, TIME, TIMEVALUE, TODAY, WEEKDAY, WEEKNUM, WORKDAY, WORKDAY.INTL, YEAR, YEARFRAC | Tooltips: `DAY(serial_number)` "Returns the day of the month, a number from 1 to 31."; `YEAR(serial_number)` "Returns the year of a date, an integer in the range 1900 - 9999." Instructor mentions DAY, week number, YEAR, HOUR/MINUTE/SECOND (hour of day, e.g. ozone patterns). [video FRM @01:59-02:38] |
| Formulas > Math & Trig (FRM @03:12-03:22) | ... ATAN2, ATANH, BASE, CEILING.MATH, COMBIN, COMBINA, COS, COSH, COT, COTH, CSC, CSCH, DECIMAL, DEGREES, EVEN, EXP ... SERIESSUM, SIGN, SIN, SINH, SQRT, SQRTPI, SUBTOTAL, SUM, SUMIF, SUMIFS, SUMPRODUCT, SUMX2MY2, SUMX2PY2, SUMXMY2, TAN | Tooltip `SUMIF(range,criteria,sum_range)` "Adds the cells specified by a given condition or criteria." |
| Formulas > Logical (FRM @03:32) | AND, BYCOL, BYROW, FALSE, IF, IFERROR, IFNA, IFS, LAMBDA, LET, MAKEARRAY, MAP, NOT, OR, REDUCE, SCAN, ... | `AND` is in the checklist (item 25) but not demonstrated; see [if-or-multiple-conditions.md](if-or-multiple-conditions.md) |
| `=max` autocomplete (FRM @20:12) | MAX, MAXA, MAXIFS, DMAX | MAX: "Returns the largest value in a set of values. Ignores logical values and text" |
| Function Library group (FRM @01:32) | Insert Function, AutoSum, Recently Used, Financial, Logical, Text, Date & Time, Lookup & Reference, Math & Trig, More Functions | Lookup & Reference tooltip: "Add a lookup or reference function to your worksheet." |

## Power Query transformations (menu path → step name → M code)

| Transformation | Menu path | Applied step name | M code as shown | Where |
|---|---|---|---|---|
| Promote headers / detect types (automatic on import) | (automatic) | Source, Promoted Headers, Changed Type | `= Table.TransformColumnTypes(#"Promoted Headers",{{"Industry (English) / Industrie (Anglais)", type text}, ..., {"Year / Année", Int64.Type}, ...` | PIV @01:22; EXT @01:02; MRG @01:12 |
| Filter out nulls | column filter arrow > untick (null) > OK | Filtered Rows | `= Table.SelectRows(#"Changed Type", each ([#"Year / Année"] <> null))` (keeping only nulls gives `= ... = null))`) | PIV @03:52-04:12; [pivot-unpivot-columns-power-query.md](pivot-unpivot-columns-power-query.md) |
| Remove a column | Home > Manage Columns > Remove Columns (column selected) | Removed Columns | `= Table.RemoveColumns(#"Filtered Rows",{"Facility Count / Nombres d'installations"})` | PIV @05:52 |
| Pivot Column (long → wide) | Transform > Any Column > Pivot Column; dialog "Values Column" | Pivoted Column | `= Table.Pivot(Table.TransformColumnTypes(#"Removed Columns", {{"Year / Année", type text}}, "en-CA"), List.Distinct(Table.TransformColumnTypes(#"Removed Columns", {{"Year / Année", type text}}, "en-CA")[#"Year / Année"]), ...` | PIV @02:32-03:12, @06:42 |
| Reorder columns | drag column headers | Reordered Columns | `= Table.ReorderColumns(#"Pivoted Column",{"Industry (English) / Industrie (Anglais)", "Industry (French) / Industrie (Français)", "NAICS Number / Numéro SCIAN", "2019", "2018", ...` | PIV @04:32, @06:52 |
| Unpivot Columns (wide → long) | select columns (Shift+click) > Transform > Any Column > Unpivot Columns (also: Unpivot Other Columns, Unpivot Only Selected Columns) | Unpivoted Columns | `= Table.UnpivotOtherColumns(#"Reordered Columns", {"Industry (English) / Industrie (Anglais)", "Industry (French) / Industrie (Français)", "NAICS Number / Numéro SCIAN"}, "Attribute", "Value")` | PIV @07:12-07:32 |
| Extract year from a date | Add Column > From Date & Time > Date > Year > Year | Inserted Year | `= Table.AddColumn(#"Changed Type", "Year.1", each Date.Year([eventDate_standard]), Int64.Type)` | EXT @03:02-03:22; [extract-date-parts-power-query.md](extract-date-parts-power-query.md) |
| Extract week of year | Add Column > From Date & Time > Date > Week > Week of Year | Inserted Week of Year | `= Table.AddColumn(#"Inserted Year", "Week of Year", each Date.WeekOfYear([eventDate_standard]), Int64.Type)` | EXT @03:42 |
| Other date parts (menu only) | Add Column > Date > Month > (Month, Start of Month, End of Month, Days in Month, Name of Month); Week > (Week of Year, Week of Month, Start of Week, End of Week); also Age, Date Only, Quarter, Day, Subtract Days, Combine Date and Time, Earliest, Latest | — | not shown | EXT @03:02-03:12 |
| Parse text into dates | Add Column > From Date & Time > Date > Parse (text column selected) | Inserted Parsed Date | `= Table.AddColumn(#"Changed Type", "Parse", each Date.From(DateTimeZone.From([eventDate])), type date)` | CLN @01:32-01:52; [parse-inconsistent-dates-power-query.md](parse-inconsistent-dates-power-query.md) |
| Merge Queries (join) | Home > Combine > Merge Queries; Join Kind "Left Outer (all from first, matching from second)" | Merged Queries | `= Table.NestedJoin(#"Changed Type", {"Collection Site"}, PWQMN_Stations, {"STATION"}, "PWQMN_Stations", JoinKind.LeftOuter)` | MRG @02:02-02:52; [merge-queries-left-outer-join-power-query.md](merge-queries-left-outer-join-power-query.md) |
| Expand merged table column | expand icon in the nested column header > Expand, tick columns, "Use original column name as prefix" | Expanded PWQMN_Stations | `= Table.ExpandTableColumn(#"Merged Queries", "PWQMN_Stations", {"NAME", "DESCRIPTION", "LATITUDE", "LONGITUDE"}, {"PWQMN_Stations.NAME", ...` | MRG @03:12-03:22 |
| Close & Load | Home > Close > Close & Load | — | — | CLN @02:02; MRG @03:32 |

## Excel (non-formula) features used alongside the formulas

| Feature | Path | Where |
|---|---|---|
| Data Validation dropdown list | Data > Data Tools > Data Validation > Settings > Allow: List, Source | FRM @14:02-14:52; [data-validation-dropdown-list.md](data-validation-dropdown-list.md) |
| Conditional Formatting colour scale | Home > Styles > Conditional Formatting > Color Scales | FRM @18:52; [conditional-formatting-color-scale.md](conditional-formatting-color-scale.md) |
| Table filter (check categories) | header filter arrow > checklist | IF @02:32, @05:02; CLN @02:22 |
| Rename / add sheet | right-click tab > Rename; + button | FRM @09:32-09:42 |

## Formulas / expressions / code
All exact formula and M-code text is in the tables above.

## Verify
Results quoted in the tables (28474372.17, 147, 10, 3293.630534, 1813.214394, 23772.02889) let an agent check a reproduction against the course data.

## Pitfalls
- `MAX`/`MIN` exact formula text was not legible in the frames; the version given is reconstructed from narration.
- Long M-code lines are cut off on screen; `...` marks the unseen remainder.

## Related
- [Formulas and cross-sheet references](enter-formulas-and-cross-sheet-references.md)
- [Interactive summary sheet worked example](build-interactive-summary-sheet-countif-filter.md)
- R function reference: [../r-positron/function-reference.md](../r-positron/function-reference.md)
