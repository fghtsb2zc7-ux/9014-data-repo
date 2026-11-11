---
id: excel.filter-function-return-matching-rows
tool: excel
title: Return all rows that match a condition with the FILTER() function
keywords: [FILTER function, subset rows, extract matching rows, dynamic filter, slice of data, rows where column equals, spill, array include, if_empty, interactive view, return records for one category]
software_context: "Excel for Microsoft 365 (Windows) — dynamic-array function FILTER"
prerequisites: [excel.enter-formulas-and-cross-sheet-references, excel.data-validation-dropdown-list]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "15:10-18:25"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Return all rows that match a condition with the FILTER() function

## Purpose
Show, on another sheet, every full row of the data whose value in one column equals a chosen value (e.g. all 10 yearly rows for the industry picked in a dropdown), without summarising them. The result spills and updates when the chosen value changes. Unlike the AutoFilter/Power Query filter, this does not hide or remove rows from the source. Checklist item 26 [page technical-skills-checklist.md].

## Steps
1. On `Sheet2` click an empty cell with free space below and to the right (video: **A9**). [frame excel-using-excel-formulas @15:42]
2. Type `=filter(`; tooltip `FILTER(array, include, [if_empty])`. [frame @15:42]
3. **array**: click the data sheet tab `NPRI-INRP_IndustryIndustrie_Air` and drag across the column letters **A through F** (all columns) → `'NPRI-INRP_IndustryIndustrie_Air'!A:F`. Type `,`. [video @15:46-16:23; frame @16:22]
4. **include**: click column letter **A** on the data sheet → `'NPRI-INRP_IndustryIndustrie_Air'!A:A`, type ` = `, click the `Sheet2` tab and click **B2** (the selected industry) → `Sheet2!B2`. [video @16:23-17:49; frame @17:12, @17:32]
5. Type `)` and press **Enter**. [frame @17:52]
6. Result: the 10 Coal mining rows (A9:F18). [frame @17:52]
7. Add headers: on the data sheet select the header row A1:F1, **Ctrl+C**, go to Sheet2, click **A8**, **Ctrl+V** (Enter). [video @17:52; frame @18:02-18:12]
8. Change B2 with the dropdown: the spilled rows change to the new industry (Universities, Spring and wire product manufacturing...). [video @19:02-19:40; frame @19:12, @19:42]

## Formulas / expressions / code
```
=FILTER('NPRI-INRP_IndustryIndustrie_Air'!A:F,'NPRI-INRP_IndustryIndustrie_Air'!A:A = Sheet2!B2)
```
- `array` `'NPRI-INRP_IndustryIndustrie_Air'!A:F` = all six data columns.
- `include` `'...'!A:A = Sheet2!B2` = TRUE for rows whose industry equals the selection.
- `if_empty` omitted; it sets what to show when nothing matches, e.g. `"No match"` (general knowledge — not shown in course).
Multiple conditions (general knowledge — not shown in course): AND = `(cond1)*(cond2)`, OR = `(cond1)+(cond2)` inside `include`.

## Verify
Coal mining output rows (Year, Total releases): 2021 189942.2232; 2015 84638.96525; 2022 164684.1855; 2024 74045.90999; 2016 76562.97885; 2020 180374.8269; 2019 188100.5323; 2018 116351.9912; 2017 128595.2405; 2023 77385.08316 (NAICS 2121). [frame @17:52]

## Pitfalls
- The array and include ranges must have the same number of rows: A:F with A:A works; A2:F1323 would need A2:A1323 (general knowledge — not shown in course).
- First drag selected B:F and missed column A; re-select A:F. [video @15:46-16:23; frame @16:02]
- Pressing Enter before adding the include argument gave `#VALUE!`. [frame @16:42]
- **#SPILL!** if cells in the spill area are not empty (general knowledge — not shown in course).
- Copied headers are static text; they do not update if source headers change.

## Related
- [Filter rows in Power Query instead](filter-rows-power-query.md)
- [Conditional formatting colour scale on the result](conditional-formatting-color-scale.md)
- [Build the interactive industry summary sheet](build-interactive-summary-sheet-countif-filter.md)
- R equivalent: [../r-positron/filter-rows.md](../r-positron/filter-rows.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
