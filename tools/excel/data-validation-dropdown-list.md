---
id: excel.data-validation-dropdown-list
tool: excel
title: Add a dropdown list to a cell with Data Validation (List)
keywords: [data validation, dropdown, drop-down list, in-cell dropdown, pick list, restrict input, validation list source, prevent typos, data tools, interactive worksheet, selector cell]
software_context: "Excel for Microsoft 365 (Windows), Data tab > Data Tools > Data Validation"
prerequisites: [excel.unique-distinct-values-formula]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "12:43-15:22"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Add a dropdown list to a cell with Data Validation (List)

## Purpose
Restrict a cell to values from a list and give it a dropdown arrow, so a user (e.g. a supervisor using your summary sheet) cannot type a value that breaks formulas that depend on it. In the video, a typo (an extra space in "Coal mining") made COUNTIF return 0; the dropdown removes that risk. [video excel-using-excel-formulas @12:43-13:56]

## Steps
1. Make the list of allowed values first, e.g. a UNIQUE list on sheet `Unique industries` ([unique-distinct-values-formula.md](unique-distinct-values-formula.md)).
2. Click the input cell (video: `Sheet2!B2`, labelled `Industry` in A2) and clear any typed value. [video @13:52; frame @14:02]
3. Click `Data > Data Tools > Data Validation` (the icon in the Data Tools group next to Text to Columns / Clean Data). [video @13:56; frame @14:02]
4. In the "Data Validation" dialog, **Settings** tab, set **Allow:** = `List`. "Ignore blank" and "In-cell dropdown" become ticked (leave both ticked). [video @14:20; frame @14:12, @14:32]
5. Click the collapse button (up-arrow) at the right of the **Source:** box; the dialog shrinks to one line. [video @14:33; frame @14:42]
6. Click the `Unique industries` sheet tab and drag over the list cells. The box shows the absolute reference, e.g. `='Unique industries'!$A$1:$A$145`. [frame @14:52]
7. Click the collapse button again to restore the dialog and click **OK**. [video @14:45]
8. Click the cell: a dropdown arrow appears at its right; pick a value (video: Coal mining). Dependent formulas update (COUNTIF returns 10 again). [video @14:52-15:10; frame @15:02, @15:22]

## Formulas / expressions / code
```
='Unique industries'!$A$1:$A$145
```
Source as written by Excel when the range was selected (absolute `$` references). Other tabs in the dialog: **Input Message**, **Error Alert** (not used). [frame @14:02]

## Verify
- The cell shows a dropdown arrow when selected; the list matches the source values. [frame @19:42, dropdown open listing industries]
- Typing a value not in the list is rejected with an error message (default Error Alert behaviour; general knowledge — not shown in course).

## Pitfalls
- Select the **entire** source list. The video's `$A$1:$A$145` omits the last two of 147 industries. Use the full spill range (or `='Unique industries'!$A$1#`, general knowledge — not shown in course). [frame @14:52]
- Data Validation does not fix values already typed in the cell; clear the cell first, as the video does. [video @13:52]

## Related
- [Build the interactive industry summary sheet](build-interactive-summary-sheet-countif-filter.md)
- [COUNTIF / SUMIF / MAX / MIN](countif-sumif-max-min-formulas.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
