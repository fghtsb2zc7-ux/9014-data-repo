---
id: excel.if-or-multiple-conditions
tool: excel
title: Classify rows that match any of several values with IF + OR (and IF + AND)
keywords: [IF OR, IF AND, OR function, AND function, multiple conditions, any of several values, group categories, combine categories, nested function, logical operators, mining and foundries, recode several values into one group]
software_context: "Excel for Microsoft 365 (Windows), formula in a new column of an Excel table"
prerequisites: [excel.if-classify-rows-new-column]
source_videos: [{video: transcripts/excel/excel-if-statements.md, timestamps: "03:00-05:26"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Classify rows that match any of several values with IF + OR (and IF + AND)

## Purpose
Put several categories into one basket: OR returns TRUE if any of its tests is TRUE, so `IF(OR(test1, test2), "yes-label", "no-label")` labels rows matching either value (e.g. "Coal mining" or "Foundries" → "Mining"). AND (TRUE only if all tests are TRUE) is listed in the checklist but not demonstrated. Checklist item 25 [page technical-skills-checklist.md].

## Steps
1. With the table from [if-classify-rows-new-column.md](if-classify-rows-new-column.md) open, type a new header in the next empty column (video: H1 `Mining`). [video excel-if-statements @03:26; frame @03:52]
2. Click H2 and type `=if(OR(`; tooltips `IF(logical_test, ...)` then `OR(logical1, [logical2], ...)`. [video @03:33-03:53; frame @03:52, @04:02]
3. Click A2 → `[@[Industry (English) / Industrie (Anglais)]]`, then type `= "Coal mining", `. [video @04:09-04:20; frame @04:02]
4. Click A2 again → second structured reference, type `= "Foundries")` to close OR. [video @04:22-04:33; frame @04:32]
5. Type `, "Mining", "Non-mining")` and press **Enter**; the column auto-fills. [video @04:39-04:53; frame @04:52, @05:02]
6. Check: filter the `Mining` column to "Mining" → 20 of 1323 records (rows 157-166 Coal mining NAICS 2121, rows 361-370 Foundries NAICS 3315). Clear the filter afterwards. [video @05:02; frame @05:12]

## Formulas / expressions / code
```
=IF(OR([@[Industry (English) / Industrie (Anglais)]]= "Coal mining", [@[Industry (English) / Industrie (Anglais)]]= "Foundries"), "Mining", "Non-mining")
```
- `OR(...)`: TRUE when the industry is Coal mining **or** Foundries.
- TRUE → "Mining"; FALSE → "Non-mining".

AND version (general knowledge — not shown in course): TRUE only when all tests hold, e.g. coal-mining rows with 20 or more facilities:
```
=IF(AND([@[Industry (English) / Industrie (Anglais)]]="Coal mining", [@[Facility Count / Nombres d''installations]]>=20), "Large coal", "Other")
```

## Verify
- Filter shows only "Mining" and "Non-mining"; "Mining" = 20 rows (10 years x 2 industries). [frame @05:02, @05:12]

## Pitfalls
- Each OR argument must be a complete comparison (`[@[col]]="A", [@[col]]="B"`); `[@[col]]="A","B"` does not work (general knowledge — not shown in course).
- Close the OR bracket before the IF's value_if_true argument (`..."Foundries"), "Mining", ...`). [frame @04:52]
- Spelling must match the data exactly ("Foundries" — ASR transcript says "found trees").

## Related
- [Simple IF](if-classify-rows-new-column.md)
- [IFS thresholds](ifs-categorize-numeric-thresholds.md)
- QGIS multi-condition filter: [../qgis/filter-vector-multiple-conditions.md](../qgis/filter-vector-multiple-conditions.md)
- Transcript: [../../transcripts/excel/excel-if-statements.md](../../transcripts/excel/excel-if-statements.md)
