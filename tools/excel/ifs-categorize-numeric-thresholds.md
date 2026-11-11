---
id: excel.ifs-categorize-numeric-thresholds
tool: excel
title: Break a numeric column into Low/Medium/High classes with IFS
keywords: [IFS, multiple conditions, thresholds, cutoffs, bins, classes, categorize continuous variable, low medium high, facility thresholds, nested if alternative, case when, greater than or equal]
software_context: "Excel for Microsoft 365 (Windows), formula in a new column of an Excel table"
prerequisites: [excel.if-classify-rows-new-column]
source_videos: [{video: transcripts/excel/excel-if-statements.md, timestamps: "05:26-08:15"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Break a numeric column into Low/Medium/High classes with IFS

## Purpose
Turn a continuous variable into ordered categories using cut-offs: IFS checks tests in order and returns the value for the **first** TRUE test. Video: facility count <10 → "Low", <20 → "Medium", ≥20 → "High". The same pattern works for release totals. Checklist item 23 ("IFS or nested IF") [page technical-skills-checklist.md].

## Steps
1. In the NPRI table, type a new header in the next empty column (video: I1 `Facility thresholds`). [video excel-if-statements @05:53; frame @05:52]
2. Click I2, type `=ifs(`; tooltip `IFS(logical_test1, value_if_true1, [logical_test2, value_if_true2], ...)`. [video @05:55; frame @06:12]
3. Click F2 (Facility Count) → `[@[Facility Count / Nombres d''installations]]`, type `<10, "Low", `. [video @06:04-06:17; frame @06:12, @06:32]
4. Click F2 again, type `< 20, "Medium", `. [video @06:17-06:30; frame @06:32]
5. Click F2 again, type `>=20, "High")`. [video @06:30-06:48; frame @06:52]
6. Press **Enter**; the column fills: e.g. 36 facilities → High, 5 → Low, 9-12 → Medium. [video @07:15; frame @07:12]

## Formulas / expressions / code
```
=IFS([@[Facility Count / Nombres d''installations]]<10, "Low", [@[Facility Count / Nombres d''installations]]< 20, "Medium", [@[Facility Count / Nombres d''installations]]>=20, "High")
```
- Test 1 `<10` → "Low".
- Test 2 `<20` → "Medium" (only reached when test 1 is FALSE, so it means 10-19).
- Test 3 `>=20` → "High". `>=` includes 20 itself. [video @06:38]
Equivalent nested IF (general knowledge — not shown in course): `=IF(x<10,"Low",IF(x<20,"Medium","High"))`.

## Verify
- Values are only Low / Medium / High; spot-check: Aerospace rows (31-37 facilities) = High; Agricultural supplies 2024 (5 facilities) = Low. [frame @07:12]

## Pitfalls
- Order tests from most restrictive to least (or make ranges non-overlapping); IFS stops at the first TRUE. [video @06:48-07:15]
- If no test is TRUE IFS returns `#N/A`; end with a catch-all such as `TRUE, "High"` (general knowledge — not shown in course). The video's third test (`>=20`) covers the rest, so no #N/A except for blank/text cells.
- The apostrophe in "Nombres d'installations" is written `d''installations` inside the structured reference (Excel inserts this automatically when you click the cell). [frame @06:12]
- The transcript's "R / Rager then 20" = "greater than 20".

## Related
- [Simple IF](if-classify-rows-new-column.md), [IF + OR](if-or-multiple-conditions.md)
- QGIS equivalent: [../qgis/field-calculator-case-when.md](../qgis/field-calculator-case-when.md)
- R equivalent: [../r-positron/classify-with-ifelse.md](../r-positron/classify-with-ifelse.md)
- Transcript: [../../transcripts/excel/excel-if-statements.md](../../transcripts/excel/excel-if-statements.md)
