---
id: excel.unique-distinct-values-formula
tool: excel
title: List the distinct values of a column with UNIQUE()
keywords: [unique, distinct values, list of categories, remove duplicates formula, dynamic array, spill, how many industries, count categories, UNIQUE function, lookup list for dropdown]
software_context: "Excel for Microsoft 365 (Windows) — dynamic-array function UNIQUE"
prerequisites: [excel.enter-formulas-and-cross-sheet-references]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "06:27-09:50"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# List the distinct values of a column with UNIQUE()

## Purpose
Return each different value of a column once (e.g. each of the industries that report air releases, which repeat once per year in the data). The list "spills" down from the formula cell and updates when the source changes. Useful for counting categories and as the source of a dropdown list. Checklist item 24 ("Added") [page technical-skills-checklist.md].

## Steps
1. Go to an empty sheet (video: `Sheet1`) and click cell **A1**. [frame excel-using-excel-formulas @04:42, @08:42]
2. Type `=uniq`; autocomplete shows **UNIQUE** "Returns the unique values from a range or array". Press **Tab** or type `(`; tooltip `UNIQUE(array, [by_col], [exactly_once])`. [video @07:01; frame @07:12]
3. Click the data sheet tab `NPRI-INRP_IndustryIndustrie_Air` and select the industry names A2 down to the last row A1323 (formula becomes `=unique('NPRI-INRP_IndustryIndustrie_Air'!A2:A1323`). [video @07:41-08:17; frame @07:22]
4. Type `)` and press **Enter**. [frame @08:22]
5. Result spills down column A: Aerospace product and parts manufacturing, Agricultural supplies merchant wholesalers, ... — 147 distinct industries. [video @08:17; frame @08:22-08:42]
6. Optional: rename the sheet (right-click tab > **Rename**, video: `Unique industries`) so other formulas/validation can refer to it clearly. [video @09:27; frame @09:42]

## Formulas / expressions / code
```
=UNIQUE('NPRI-INRP_IndustryIndustrie_Air'!A2:A1323)
```
`array` = the industry-name column on the data sheet, rows 2-1323 (header excluded). Optional `by_col` (compare columns instead of rows) and `exactly_once` (return only values that occur once) were not used.

## Verify
- Only the top-left cell (A1) holds the formula; the other cells show the formula greyed in the formula bar (spilled). [frame @08:42]
- The last spilled row number = number of distinct values (147 here). [video @08:17]

## Pitfalls
- **#SPILL!** appears if cells below the formula are not empty (general knowledge — not shown in course). Put UNIQUE on its own sheet or empty column, as the video does.
- A fixed range like `A2:A1323` does not grow if rows are added; `'NPRI-INRP_IndustryIndustrie_Air'!A:A` would include the header and blank rows (general knowledge — not shown in course).
- Values differing only by spaces or spelling count as different items.
- When this list is later used as a dropdown source, select the whole spill (A1:A147). The video picked `$A$1:$A$145`, which leaves out the last two industries (Waste treatment and disposal; Water, sewage and other systems). [frame @14:42; dataset rows in frame @07:22] Using `='Unique industries'!$A$1#` (spill reference) avoids this (general knowledge — not shown in course).

## Related
- [Make a dropdown list with Data Validation](data-validation-dropdown-list.md)
- [Formulas and cross-sheet references](enter-formulas-and-cross-sheet-references.md)
- R equivalent `unique()`: [../r-positron/find-duplicates-and-keep-distinct.md](../r-positron/find-duplicates-and-keep-distinct.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
