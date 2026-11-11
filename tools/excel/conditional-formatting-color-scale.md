---
id: excel.conditional-formatting-color-scale
tool: excel
title: Colour cells by value with a Conditional Formatting colour scale
keywords: [conditional formatting, color scale, colour scale, heat map cells, red high green low, highlight values, data bars, icon sets, highlight cells rules, top bottom rules]
software_context: "Excel for Microsoft 365 (Windows), Home > Styles > Conditional Formatting"
prerequisites: [excel.import-csv-as-table-power-query]
source_videos: [{video: transcripts/excel/excel-using-excel-formulas.md, timestamps: "18:25-19:02"}]
source_pages: [course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv"]
---
# Colour cells by value with a Conditional Formatting colour scale

## Purpose
Shade a column of numbers from green (low) to red (high) so the largest values stand out; in the video it is applied to the release column of the FILTER output, and it re-colours whenever the selected industry changes. The instructor presents it as a lead-in to conditional logic (IF statements). [video excel-using-excel-formulas @18:25]

## Steps
1. Select the cells to format — the video clicks the column letter **E** on Sheet2 (Total - Releases to Air in the filtered slice). [video @18:35; frame @18:42]
2. Click `Home > Styles > Conditional Formatting`. Menu: Highlight Cells Rules >, Top/Bottom Rules >, Data Bars >, **Color Scales >**, Icon Sets >, New Rule..., Clear Rules >, Manage Rules... [frame @18:52]
3. Point to **Color Scales** and click the red-yellow-green swatch where red = high and green = low (top row, second swatch in the gallery as shown; the instructor describes it as "red as high and green as low"). [video @18:40; frame @18:52]
4. Values are shaded immediately (e.g. Coal mining: 189942 red, 74045 green). [frame @18:52, @19:02]

## Formulas / expressions / code
None (rule-based formatting). To edit or remove: `Home > Styles > Conditional Formatting > Manage Rules...` or `Clear Rules >` [frame @18:52].

## Verify
Highest values red, lowest green, middle yellow/orange; colours update when the FILTER output changes (Universities: 2877.56679 and 2755.959247 red, 1660.75811 green). [frame @19:12]

## Pitfalls
- Applying it to the whole column includes the header and any other numbers placed in that column (e.g. a check total), which shifts the scale (general knowledge — not shown in course). Select just the data cells for a cleaner result.
- Swatch position in the gallery is described from the frame; hover a swatch to see its name ("Red - Yellow - Green Color Scale" vs "Green - Yellow - Red Color Scale") before clicking (tooltip names are general knowledge — not shown in course).

## Related
- [FILTER rows](filter-function-return-matching-rows.md)
- [Build the interactive industry summary sheet](build-interactive-summary-sheet-countif-filter.md)
- Transcript: [../../transcripts/excel/excel-using-excel-formulas.md](../../transcripts/excel/excel-using-excel-formulas.md)
