---
id: excel.enter-formulas-and-cross-sheet-references
tool: excel
title: Enter worksheet formulas, use the Function Library, and reference cells on other sheets
keywords: [formula, function, equals sign, formula bar, function library, insert function, autocomplete, tooltip arguments, SUM, cell reference, range, whole column reference, A:A, cross-sheet reference, sheet name in quotes, relative reference, absolute reference, dollar sign, structured reference, table column, rename sheet, add sheet, formulas tab]
software_context: "Excel for Microsoft 365 (Windows), worksheet cells and Formulas tab"
prerequisites: [excel.import-csv-as-table-power-query]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "00:06-09:50"}, {video: transcripts/excel/excel-if-statements.md, timestamps: "01:05-02:20"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Enter worksheet formulas, use the Function Library, and reference cells on other sheets

## Purpose
Basics every other formula procedure relies on: typing `=FUNCTION(arguments)` in a cell, browsing functions by category on the Formulas tab, referencing ranges (including whole columns and ranges on another sheet), and how the three reference styles seen in the course look (relative `A2:A1323`, absolute `$A$1:$A$145`, table structured `[@[Column]]`). Checklist items 21-22 [page technical-skills-checklist.md].

## Steps
### A. Get the data in (as in the video)
1. `Data > Get & Transform Data > From Text/CSV` > `NPRI-INRP_IndustryIndustrie_Air_2015-2024` > **Load** (no transformations). Data lands as a table on sheet `NPRI-INRP_IndustryIndustrie_Air` (1,323 rows; columns A-F: Industry (English), Industry (French), Year, NAICS Number, Total - Releases to Air (tonnes), Facility Count). An empty `Sheet1` also exists. [video excel-using-excel-formulas @00:06-00:45; frame @00:52]

### B. Browse functions
2. Click the **Formulas** tab. The **Function Library** group has: Insert Function, AutoSum, Recently Used, Financial, Logical, Text, Date & Time, Lookup & Reference, Math & Trig, More Functions. [video @01:22; frame @01:32]
3. Click a category (e.g. **Date & Time**, **Math & Trig**, **Logical**) to see its functions; hover a name to see its syntax and description; "Insert Function..." at the bottom opens the full dialog. [frame @01:52-03:32] (Lists are in [formula-reference.md](formula-reference.md).)

### C. Type a formula
4. Click an empty cell (video: E1327, below the table which ends at row 1323). [frame @04:32]
5. Type `=` then the start of a function name, e.g. `=sum`. An autocomplete list appears; type `(` and a tooltip shows the arguments, e.g. `SUM(number1, [number2], ...)` (square brackets = optional). [video @04:40; frame @05:02]
6. Supply the range by dragging over cells (video drags column E from row 1323 up to row 2) or by typing it: `=sum(E2:E1323`. [video @05:00-05:17; frame @05:22]
7. Type `)` and press **Enter**. Result: `28474372.17` (total air releases, all industries, all years). Lower-case typing is fine; Excel converts names to upper case. [frame @05:32]

### D. Reference another sheet
8. Add a sheet with the **+** next to the sheet tabs; rename a sheet by right-clicking its tab > **Rename** (video renames `Sheet1` to `Unique industries`). [video @09:27; frame @09:32-09:42]
9. While typing a formula on one sheet, click the other sheet's tab and select cells/columns; Excel writes the sheet-qualified reference. Sheet names containing spaces or hyphens are wrapped in single quotes, followed by `!`:
   - `'NPRI-INRP_IndustryIndustrie_Air'!A2:A1323` (a range) [frame @07:12]
   - `'NPRI-INRP_IndustryIndustrie_Air'!A:A` (a whole column, made by clicking the column letter) [video @11:28; frame @11:32]
   - `Sheet2!B2` (a single cell on a sheet without spaces) [frame @11:52]
10. Press **Enter**; Excel returns to the sheet where the formula lives.
11. To see which cells a formula uses, click the formula cell and then click in the formula bar: the referenced cells are highlighted. [video @13:19]

### E. Formulas inside an Excel table (structured references)
12. When the formula is typed in a column of an Excel table and you click a cell in the same row, Excel inserts a structured reference such as `[@[Industry (English) / Industrie (Anglais)]]` ("this row's value in that column") instead of `A2`. [video excel-if-statements @01:32-01:38; frame @01:42]
13. On **Enter**, the formula auto-fills the whole table column (calculated column). [video excel-if-statements @02:20; frame @02:22]

## Formulas / expressions / code
```
=sum(E2:E1323)
```
Adds all release values (as typed; Excel displays `=SUM(E2:E1323)`).
```
=UNIQUE('NPRI-INRP_IndustryIndustrie_Air'!A2:A1323)
```
Relative range on another sheet (see [unique-distinct-values-formula.md](unique-distinct-values-formula.md)).
```
='Unique industries'!$A$1:$A$145
```
Absolute range (with `$`) — produced automatically when a range is picked in the Data Validation Source box. [frame excel-using-excel-formulas @14:42]
```
=IF([@[Industry (English) / Industrie (Anglais)]] = "Coal mining", "Coal mining", "Non-mining industries")
```
Structured reference to the same row of a table column.

Reference styles (general knowledge — not shown in course, kept minimal): `A2` relative (shifts when copied/filled), `$A$2` absolute (never shifts), `$A2`/`A$2` mixed; pressing **F4** while the cursor is on a reference cycles through these. Whole-column `A:A` and table structured references do not need `$`.

## Verify
- The cell shows a value, the formula bar shows the formula. [frame @05:32]
- Wrong function name → `#NAME?`; wrong argument shape → `#VALUE!` (seen with FILTER at [frame @16:42]).

## Pitfalls
- Typing a reference by hand to a table that grows misses new rows; whole-column references (`A:A`, `E:E`) used later in the video avoid this. [video @11:28]
- A formula placed under the data table inside the same column (E1327) is outside the table and will not move if the table grows; the instructor deletes it afterwards. [frame @06:12]
- Pressing Enter before the formula is complete records an incomplete formula and returns an error (`#VALUE!`); click the cell, fix in the formula bar. [frame @16:42]
- Apostrophes inside table column names are doubled in structured references: `[@[Facility Count / Nombres d''installations]]`. [frame excel-if-statements @06:12]

## Related
- [Formula reference table](formula-reference.md)
- [COUNTIF, SUMIF, MAX, MIN](countif-sumif-max-min-formulas.md)
- [UNIQUE](unique-distinct-values-formula.md), [FILTER](filter-function-return-matching-rows.md)
- [IF classification](if-classify-rows-new-column.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
