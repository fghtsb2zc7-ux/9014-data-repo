---
id: excel.countif-sumif-max-min-formulas
tool: excel
title: Count, sum, and find max/min with COUNTIF, SUMIF, MAX and MIN (conditional calculations across sheets)
keywords: [countif, sumif, count if, sum if, conditional count, conditional sum, max, min, maximum, minimum, how many rows match, years reported, total releases for one category, criteria, range, sum_range, cross-sheet calculation, maxifs, sumifs]
software_context: "Excel for Microsoft 365 (Windows), worksheet formulas"
prerequisites: [excel.enter-formulas-and-cross-sheet-references]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "10:09-22:42"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Count, sum, and find max/min with COUNTIF, SUMIF, MAX and MIN

## Purpose
Calculate per-category numbers without a PivotTable: how many rows match a value (COUNTIF — here, number of reporting years for an industry), the total of a column for matching rows (SUMIF — total releases for an industry), and the largest / smallest value in a range (MAX / MIN). The criteria can live on another sheet. Checklist items 21-22 [page technical-skills-checklist.md]. The instructor notes PivotTables are usually the tool for summaries; these formulas give quick snapshots. [video @05:52, @20:54]

## Steps
Layout used in the video (sheet `Sheet2`): A2 `Industry`, A3 `Years reported`, A4 `Maximum release`, A5 `Minimum`, A6 `Total releases`; B2 = selected industry (dropdown, see [data-validation-dropdown-list.md](data-validation-dropdown-list.md)). [frame excel-using-excel-formulas @10:22]

### COUNTIF (Years reported, B3)
1. Click B3, type `=countif(`; tooltip `COUNTIF(range, criteria)`. [video @11:28; frame @11:32]
2. For **range**, click the data sheet tab `NPRI-INRP_IndustryIndustrie_Air` and click the column letter **A** (industry names) → `'NPRI-INRP_IndustryIndustrie_Air'!A:A`. [video @11:28; frame @11:32]
3. Type `,`; for **criteria** click the `Sheet2` tab and click B2 → `Sheet2!B2`. [video @11:55; frame @11:52]
4. Type `)` and press **Enter**. For "Coal mining" the result is `10` (10 rows = 10 years reported). [video @12:06; frame @12:12]

### MAX and MIN (B4, B5)
5. Click B4, type `=max` (autocomplete: MAX, MAXA, MAXIFS, DMAX; "Returns the largest value in a set of values. Ignores logical values and text"), type `(`, click the column letter **E** on the same sheet (the release column of the filtered slice), `)`, **Enter**. [video @20:17; frame @20:12]
6. Click B5 and do the same with `=min(` on column E. [video @20:40; frame @20:32]
7. Because column E holds the FILTER output for the selected industry ([filter-function-return-matching-rows.md](filter-function-return-matching-rows.md)), MAX/MIN update when B2 changes: Other food manufacturing max `1865.3029`; Other non-metallic mineral product manufacturing max `3293.630534`, min `1813.214394`. [frame @20:22, @21:12]

### SUMIF (Total releases, B6)
8. Click B6, type `=sumif(`; tooltip `SUMIF(range, criteria, [sum_range])`. [video @21:29; frame @21:22]
9. **range**: data sheet column A → `'NPRI-INRP_IndustryIndustrie_Air'!A:A`; `,` [frame @21:42]
10. **criteria**: `Sheet2!B2`; `,` [frame @21:52]
11. **sum_range**: data sheet column **E** (Total - Releases to Air) → `'NPRI-INRP_IndustryIndustrie_Air'!E:E`; `)`; **Enter**. [video @21:40; frame @22:02]
12. Result for Other non-metallic mineral product manufacturing: `23772.02889`; the instructor confirms it equals a plain SUM of the filtered E values. [video @22:06; frame @22:12]

## Formulas / expressions / code
```
=COUNTIF('NPRI-INRP_IndustryIndustrie_Air'!A:A, Sheet2!B2)
```
Counts rows in data column A equal to the industry in Sheet2!B2.
```
=sumif('NPRI-INRP_IndustryIndustrie_Air'!A:A,Sheet2!B2, 'NPRI-INRP_IndustryIndustrie_Air'!E:E)
```
Sums column E (releases, tonnes) on rows whose column A equals Sheet2!B2. (As typed; Excel shows `=SUMIF(...)`.)
```
=MAX(E:E)
=MIN(E:E)
```
Largest / smallest value in column E of Sheet2 (the filtered slice). Exact text not legible in frames; the transcript says "give it all of column E" on "our own sheet" — reconstructed. [video @20:17-20:40]
```
=SUM(E2:E1323)
```
Plain total, from earlier in the video. [frame @05:22]

## Verify
- COUNTIF for Coal mining = 10, matching the 10 highlighted Coal mining rows (status bar "Count: 10") on the data sheet. [frame @12:22]
- SUMIF total equals SUM of the FILTER output's release column. [video @22:06]

## Pitfalls
- COUNTIF/SUMIF match the text exactly (case-insensitive, but spaces matter): `Coal  mining` with an extra space returned `0`. Use a dropdown for the criteria cell. [video @12:43; frame @13:12]
- MAX/MIN over all of column E on Sheet2 includes anything else typed in column E (e.g. a check SUM in E21 or the header text). Text is ignored by MAX/MIN, but a numeric check-total placed in column E would be picked up as the max (general knowledge — not shown in course). Prefer a dedicated range such as `E9#` or `MAXIFS(data!E:E, data!A:A, B2)` (general knowledge — not shown in course).
- Whole-column references (`A:A`) keep working when the table grows. [video @11:28]

## Related
- [PivotTable alternative for summaries](create-pivottable-summarize-filter-sort.md)
- [Build the interactive industry summary sheet (end-to-end)](build-interactive-summary-sheet-countif-filter.md)
- [IF / IFS classification](if-classify-rows-new-column.md)
- [Formula reference](formula-reference.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
