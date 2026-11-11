---
id: excel.create-pivotchart-from-pivottable
tool: excel
title: Create a PivotChart from a PivotTable
keywords: [pivot chart, pivotchart, chart from pivot table, column chart, quick chart, visualize pivot, releases over time, trend by year, pivotchart fields, axis categories, legend series, field buttons, insert chart]
software_context: "Excel for Microsoft 365 desktop (Windows), PivotTable Analyze > Tools > PivotChart"
prerequisites: [excel.create-pivottable-summarize-filter-sort]
source_videos: [{video: transcripts/excel/excel-pivot-tables-and-charts.md, timestamps: "01:32-02:12"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv)"]
---
# Create a PivotChart from a PivotTable

## Purpose
Turn a PivotTable into a chart in one click for a first look at the data (e.g. total releases to air per year, showing a decline 2015-2024). The chart stays linked to the PivotTable, so changing fields changes the chart. Checklist items 19-20 and 30-31 (field buttons). [page technical-skills-checklist.md]

## Steps
1. Build the PivotTable first (e.g. Rows = **Year / Année**, Values = **Sum of Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes)**). [frame excel-pivot-tables-and-charts @01:32]
2. Click inside the PivotTable, then **PivotTable Analyze > Tools > PivotChart**. [video excel-pivot-tables-and-charts @01:35; frame @01:42]
3. In the chart dialog keep the default chart and click **OK**. [video excel-pivot-tables-and-charts @01:45] (The dialog is not captured in a frame; the result was a clustered column chart.)
4. The chart appears on the same sheet beside the PivotTable; move/resize it by dragging its border. [frame @01:52]
5. Use the pane (now titled **PivotChart Fields**, areas **Filters, Legend (Series), Axis (Categories), Values**) or the grey field buttons on the chart ("Year / Année" axis button, "Sum of ..." value button) to change what is plotted. [frame @01:52]

## Formulas / expressions / code
None.

## Verify
- Column chart titled "Total", legend "Total", x-axis categories 2015 ... 2024 and "(blank)", y-axis about 2,300,000-3,200,000; bars decline over time. Contextual tabs **PivotChart Analyze**, **Design**, **Format** appear when the chart is selected. [frame @01:52]

## Pitfalls
- The "(blank)" category comes from blank values in the source; filter it out in the PivotTable (Row Labels dropdown) or clean the data first. [frame @01:52]
- Default chart axis does not start at zero (here from 2,300,000), which exaggerates the decline - check the axis before interpreting (observation from frame; axis editing not shown).
- Field buttons should be removed before presenting a chart (checklist item 31): PivotChart Analyze > Show/Hide > Field Buttons (general knowledge - not shown in this video).

## Related
- [Create a PivotTable, filter and sort](create-pivottable-summarize-filter-sort.md)
- [Ribbon tour](ribbon-tour-course-features.md) (Insert > Charts > PivotChart is the other entry point)
- Transcript: [Excel - Pivot tables and charts](../../transcripts/excel/excel-pivot-tables-and-charts.md)
