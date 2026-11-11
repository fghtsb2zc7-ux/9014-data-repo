---
id: excel.ribbon-tour-course-features
tool: excel
title: Find the course's Excel tools on the ribbon (ribbon tour and lookup table)
keywords: [ribbon, tabs, where is, ribbon tour, home tab, insert tab, data tab, formulas tab, view tab, review tab, get data, from text/csv, pivottable button, pivotchart, slicer, timeline, conditional formatting, format as table, copilot, text to columns, remove duplicates, freeze panes, freeze top row, comments, macros, sheets, csv save warning, interface]
software_context: "Excel for Microsoft 365 desktop (Windows), ribbon as recorded in Fall 2026 course videos"
prerequisites: []
source_videos: [{video: transcripts/excel/excel-intro-to-excel.md, timestamps: "00:42-15:28"}, {video: transcripts/excel/excel-loading-data-into-excel.md, timestamps: "00:52-01:12"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: []
---
# Find the course's Excel tools on the ribbon (ribbon tour and lookup table)

## Purpose
Lookup sheet for where each ribbon command the course uses lives (Tab > Group > Button), taken from the intro tour video and confirmed in later videos. Use it to turn "go to X" into an exact click path. Covers workbook basics (lettered columns / numbered rows, multiple sheets), freezing the header row, and the CSV-saving warning.

## Steps
1. Start Excel desktop and click **Blank workbook** on the start screen (or open/import a file). [frame excel-intro-to-excel @00:42]
2. Find the command in the table below and click `Tab > Group > Button`.
3. To keep column headers visible while scrolling (the instructor's recommended "freeze panes" use): click **View > Window > Freeze Panes > Freeze Top Row**. [video excel-intro-to-excel @14:46; frame @14:52]
4. To add another worksheet, click the **+** next to the sheet tabs at the bottom left (Sheet1, Sheet2, ...). [frame @07:32]

## Lookup table (tab > group > button, exact labels from frames)

| Need | Click path | Evidence |
|---|---|---|
| Wrap text / alignment | Home > Alignment > Wrap Text / Merge & Center | [frame excel-intro-to-excel @01:22] |
| Change number format (General, $, %) | Home > Number > (format dropdown, default "General") | [frame @01:22] |
| Colour cells by a condition | Home > Styles > Conditional Formatting | [frame @01:22; video @02:35] |
| Turn a range into a table | Home > Styles > Format as Table (or Insert > Tables > Table) | [frame @01:22, @04:22] |
| Insert/delete rows or columns | Home > Cells > Insert / Delete / Format | [frame @01:22] |
| Sort & filter (Home version) | Home > Editing > Sort & Filter | [frame @01:22] |
| Copilot (AI prompt pane) | Home > Add-ins > Copilot | [frame @04:02] |
| PivotTable | Insert > Tables > PivotTable | [frame @04:22] |
| Charts / PivotChart | Insert > Charts > Recommended Charts / PivotChart | [frame @04:22] |
| Slicer / Timeline (filter tables, PivotTables visually; timeline for dates) | Insert > Filters > Slicer / Timeline | [frame @05:42] |
| Themes for a polished sheet | Page Layout > Themes > Themes / Colors / Fonts / Effects | [frame @06:12] |
| Function library (date & time, text, lookup, financial) | Formulas > Function Library > (category) | [frame @07:02] |
| Import a CSV | Data > Get & Transform Data > From Text/CSV | [frame @09:02; excel-loading-data-into-excel @01:12] |
| Import other sources / open Power Query | Data > Get & Transform Data > Get Data > (From File > From Text/CSV, From Excel Workbook, From PDF, From Folder ...; Launch Power Query Editor...) | [frame @08:02] |
| Table from a picture/screenshot | Data > Get & Transform Data > From Picture > Picture From File... / Picture From Clipboard | [frame @08:32] |
| Show query list | Data > Queries & Connections > Queries & Connections | [frame @09:02] |
| Quick sort / filter | Data > Sort & Filter > (Sort A to Z, Sort Z to A, Sort, Filter, Clear, Reapply, Advanced) | [frame @09:02] |
| Split text in a cell (e.g. "Ontario-Canada") without Power Query | Data > Data Tools > Text to Columns | [frame @09:02; video @09:18] |
| Flash Fill, Remove Duplicates, Data Validation, Data Model | Data > Data Tools > ... | [frame @09:02] |
| What-if / forecasting (Lesson 6) | Data > Forecast > What-If Analysis / Forecast Sheet | [frame @10:22] |
| Statistics add-in | Data > Analysis > Data Analysis (after enabling) | [frame @12:52] |
| Data model (Power BI-style) | Power Pivot > Data Model > Manage | [frame @14:02] |
| Record a macro | Developer > Code > Record Macro | [frame @11:42] |
| Add a comment for teammates | Review > Comments > New Comment | [frame @14:22] |
| Gridlines / headings on screen | View > Show > Gridlines / Headings | [frame @14:42] |
| Freeze header row | View > Window > Freeze Panes > Freeze Top Row | [frame @14:52] |

## Formulas / expressions / code
None.

## Verify
- The tab bar after the course's setup is: File, Home, Insert, Draw, Page Layout, Formulas, Data, Power Pivot, Developer, Review, View, Help. [frame @11:32]
- After Freeze Top Row, row 1 stays on screen when you scroll down. [frame @15:02]

## Pitfalls
- **CSV keeps only one sheet and no formatting.** Saving as CSV saves only the active sheet and drops all Excel formatting. Excel warns with a yellow bar: "POSSIBLE DATA LOSS Some features might be lost if you save this workbook in the comma-delimited (.csv) format. To preserve these features, save it in an Excel file format." - use **Save As...** and pick an Excel workbook format. [video excel-intro-to-excel @07:00; frame excel-loading-data-into-excel @00:52]
- Use the desktop app, signed in to Office 365 (profile picture top right) so you can save to OneDrive; working with the course data in the web version is much harder. [video excel-intro-to-excel @00:07-00:45]
- The Developer, Power Pivot and Analysis items are missing until you add them. [video excel-intro-to-excel @10:32]
- On narrower windows the ribbon collapses into a compact layout (e.g. Data tab shows From Text/CSV, From Web, From Table/Range as small buttons); labels are the same. [frame excel-loading-data-into-excel @01:12]
- Copilot results were "less than satisfactory" in the instructor's experience; the course still encourages trying it. [video excel-intro-to-excel @03:14]

## Related
- [Add the Developer and Power Pivot tabs](customize-ribbon-developer-power-pivot-tabs.md)
- [Enable the Analysis ToolPak](enable-data-analysis-toolpak.md)
- [Import a CSV as a table with Power Query](import-csv-as-table-power-query.md)
- [Create a PivotTable](create-pivottable-summarize-filter-sort.md)
- Transcript: [Excel - Intro to Excel](../../transcripts/excel/excel-intro-to-excel.md)
