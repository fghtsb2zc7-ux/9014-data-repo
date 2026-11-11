---
id: excel.if-classify-rows-new-column
tool: excel
title: Create a category column with IF (true/false classification) in an Excel table
keywords: [IF, if statement, conditional logic, classify, recode, new column, category column, true false, value_if_true, value_if_false, calculated column, structured reference, coal mining vs non-mining, ifelse equivalent, nested if]
software_context: "Excel for Microsoft 365 (Windows), formula in a new column of an Excel table"
prerequisites: [excel.import-csv-as-table-power-query, excel.enter-formulas-and-cross-sheet-references]
source_videos: [{video: transcripts/excel/excel-if-statements.md, timestamps: "00:06-03:00"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Create a category column with IF (true/false classification) in an Excel table

## Purpose
Add a column that labels each row by testing a condition: one value when the test is TRUE, another when FALSE (e.g. "Coal mining" vs "Non-mining industries"). The new category can then be used in PivotTables to compare groups. Equivalent of R `ifelse()` and the QGIS Field Calculator IF. [video excel-if-statements @00:15-02:57]

## Steps
1. Load `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv` via `Data > From Text/CSV > Load` so it lands as an Excel table (green banded, filter arrows) on sheet `NPRI-INRP_IndustryIndustrie_Air`. [video @00:36-00:54; frame @01:02]
2. Click the first empty cell to the right of the header row (G1) and type the new column name, `Mining`, then **Enter**. The table expands to include column G. [video @01:05; frame @01:12]
3. Click G2 and type `=if(`; tooltip `IF(logical_test, [value_if_true], [value_if_false])`. [video @01:11; frame @01:32]
4. For the test, click cell A2 (same row, industry name). Excel inserts `[@[Industry (English) / Industrie (Anglais)]]`. [video @01:32-01:38; frame @01:42]
5. Continue typing: ` = "Coal mining", "Coal mining", "Non-mining industries")`. [video @01:43-02:05; frame @02:02]
6. Press **Enter**. The formula fills down the whole column automatically. [video @02:20; frame @02:22]
7. Check with the filter arrow on the new header: values listed are "Coal mining" and "Non-mining industries". [video @02:20; frame @02:32]
8. (Video then renames this header to `Coal mining` before adding a broader `Mining` column; see [if-or-multiple-conditions.md](if-or-multiple-conditions.md).) [frame @03:22]

## Formulas / expressions / code
```
=IF([@[Industry (English) / Industrie (Anglais)]] = "Coal mining", "Coal mining", "Non-mining industries")
```
- `logical_test`: this row's English industry name equals the text "Coal mining".
- `value_if_true`: "Coal mining".
- `value_if_false`: "Non-mining industries".
Outside a table the same test would read `=IF(A2="Coal mining","Coal mining","Non-mining industries")` filled down (the narrator says "G2, A2"). [video @01:38]

Nested IF (several outcomes; general knowledge — not shown in course; the course uses IFS for this, see [ifs-categorize-numeric-thresholds.md](ifs-categorize-numeric-thresholds.md)):
```
=IF([@[Facility Count / Nombres d''installations]]<10,"Low",IF([@[Facility Count / Nombres d''installations]]<20,"Medium","High"))
```

## Verify
- Every row in the new column has one of the two labels; the filter list shows exactly those two. [frame @02:32]
- Rows 157-166 (Coal mining, NAICS 2121) show "Coal mining". [frame excel-if-statements @05:12]

## Pitfalls
- Text in a formula must be in double quotes (`"Coal mining"`); the comparison is case-insensitive but must match spelling and spaces exactly.
- Type the header first so the column becomes part of the table; otherwise the formula will not auto-fill and you get A1-style references (general knowledge — not shown in course).
- If auto-fill did not happen, double-click the fill handle or use the "Overwrite all cells in this column with this formula" lightning-bolt option (general knowledge — not shown in course).
- The transcript (Whisper) renders "Coal mining" as "whole mining"/"pool mining".

## Related
- [Summarize the new categories in a PivotTable](create-pivottable-summarize-filter-sort.md)
- [IF with OR (several matching values)](if-or-multiple-conditions.md)
- [IFS (numeric thresholds: low/medium/high)](ifs-categorize-numeric-thresholds.md)
- R equivalent: [../r-positron/classify-with-ifelse.md](../r-positron/classify-with-ifelse.md)
- QGIS equivalent: [../qgis/field-calculator-if-statement.md](../qgis/field-calculator-if-statement.md)
- Transcript: [../../transcripts/excel/excel-if-statements.md](../../transcripts/excel/excel-if-statements.md)
