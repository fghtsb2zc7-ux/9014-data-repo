---
id: excel.build-interactive-summary-sheet-countif-filter
tool: excel
title: Build an interactive one-industry summary sheet (dropdown + COUNTIF + FILTER + MAX/MIN + SUMIF)
keywords: [interactive worksheet, summary sheet, dashboard sheet, supervisor sheet, dropdown selector, industry summary, years reported, maximum release, minimum, total releases, countif, filter, sumif, unique, data validation, conditional formatting, NPRI air releases, worked example]
software_context: "Excel for Microsoft 365 (Windows), worksheet formulas, Data Validation, Conditional Formatting"
prerequisites: [excel.enter-formulas-and-cross-sheet-references]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "08:45-22:42"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Build an interactive one-industry summary sheet (dropdown + COUNTIF + FILTER + MAX/MIN + SUMIF)

## Purpose
End-to-end recreation of the worked example in "Excel - Using Excel Formulas": a sheet where a user picks an industry from a dropdown and immediately sees years reported, max/min/total releases and the industry's yearly rows (colour-scaled). Each piece has its own procedure file; this file gives the exact layout and order. [video excel-using-excel-formulas @08:45-09:27]

## Steps
Final workbook sheets: `NPRI-INRP_IndustryIndustrie_Air` (data table, 1,323 rows, columns A-F), `Unique industries`, `Sheet2`. [frame @22:52]

1. Load `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv` with `Data > From Text/CSV > Load` (no transforms). [frame @00:52]
2. On `Sheet1`, cell A1: `=UNIQUE('NPRI-INRP_IndustryIndustrie_Air'!A2:A1323)` → 147 industries. Rename the sheet `Unique industries` (right-click tab > Rename). → [unique-distinct-values-formula.md](unique-distinct-values-formula.md) [frame @08:42, @09:42]
3. Add a sheet with **+** (`Sheet2`). Type labels A2 `Industry`, A3 `Years reported`, A4 `Maximum release`, A5 `Minimum`, A6 `Total releases` (bold optional). [frame @09:32, @10:22]
4. B2: `Data > Data Tools > Data Validation`, Allow `List`, Source = the Unique industries list (select all 147 cells). The video's selection was `='Unique industries'!$A$1:$A$145`, which misses the last two industries; select to A147. → [data-validation-dropdown-list.md](data-validation-dropdown-list.md) [frame @14:32-14:52]
5. Pick an industry in B2 (e.g. Coal mining). [frame @15:22]
6. B3: `=COUNTIF('NPRI-INRP_IndustryIndustrie_Air'!A:A, Sheet2!B2)` → 10. [frame @15:22]
7. A9: `=FILTER('NPRI-INRP_IndustryIndustrie_Air'!A:F,'NPRI-INRP_IndustryIndustrie_Air'!A:A = Sheet2!B2)`; copy the data headers A1:F1 into A8:F8. → [filter-function-return-matching-rows.md](filter-function-return-matching-rows.md) [frame @18:22]
8. Select column E and apply `Home > Conditional Formatting > Color Scales >` red(high)-yellow-green(low). → [conditional-formatting-color-scale.md](conditional-formatting-color-scale.md) [frame @18:52]
9. B4: `=MAX(` column E `)`; B5: `=MIN(` column E `)`. → [countif-sumif-max-min-formulas.md](countif-sumif-max-min-formulas.md) [frame @20:12-21:12]
10. B6: `=SUMIF('NPRI-INRP_IndustryIndustrie_Air'!A:A,Sheet2!B2, 'NPRI-INRP_IndustryIndustrie_Air'!E:E)`. [frame @22:02]
11. Test by switching B2 (Universities, Spring and wire product manufacturing, Other food manufacturing, Other non-metallic mineral product manufacturing). [frame @19:12-21:12]

## Formulas / expressions / code
| Cell (Sheet2) | Formula | Coal mining | Other non-metallic mineral product mfg |
|---|---|---|---|
| B3 Years reported | `=COUNTIF('NPRI-INRP_IndustryIndustrie_Air'!A:A, Sheet2!B2)` | 10 | 10 |
| B4 Maximum release | `=MAX(E:E)` (reconstructed) | — | 3293.630534 |
| B5 Minimum | `=MIN(E:E)` (reconstructed) | — | 1813.214394 |
| B6 Total releases | `=SUMIF('NPRI-INRP_IndustryIndustrie_Air'!A:A,Sheet2!B2, 'NPRI-INRP_IndustryIndustrie_Air'!E:E)` | — | 23772.02889 |
| A9 (spill) | `=FILTER('NPRI-INRP_IndustryIndustrie_Air'!A:F,'NPRI-INRP_IndustryIndustrie_Air'!A:A = Sheet2!B2)` | 10 rows | 10 rows |

Values from [frame @15:22, @21:12, @22:12]. "Spring and wire product manufacturing" has only 8 reported years. [video @19:32]

## Verify
- Changing B2 updates B3-B6, the spilled rows and the colours together. [video @19:02-19:40]
- B6 equals the sum of the spilled column E values. [video @22:06]

## Pitfalls
- Order matters: build the FILTER spill before MAX/MIN on column E, because MAX/MIN read the spill.
- See the pitfalls in each linked file (typos in B2 → 0; partial validation range; #SPILL!; whole-column MAX picking up stray numbers).

## Related
- [Formulas and cross-sheet references](enter-formulas-and-cross-sheet-references.md)
- [Formula reference](formula-reference.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
