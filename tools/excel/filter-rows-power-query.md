---
id: excel.filter-rows-power-query
tool: excel
title: Filter rows in the Power Query Editor (keep one year, or selected categories)
keywords: [filter, filter rows, subset, power query filter, keep year, select year, 2024 only, filter by category, filter industry, table.selectrows, filtered rows, select all, load more, list may be incomplete, number filters, text filters, remove filter, basic filtering]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-basic-filtering.md, timestamps: "00:07-02:08"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv)"]
---
# Filter rows in the Power Query Editor (keep one year, or selected categories)

## Purpose
Reduce a loaded table to the rows you need (e.g. only reporting year 2024, or only two industries) so that the loaded data set itself changes - unlike a sheet filter, which only hides rows. The filter is recorded as a **Filtered Rows** step that can be removed later. Checklist item: "I can filter data using Power Query." [page technical-skills-checklist.md]

## Steps
1. Load the CSV as a table via Power Query (prerequisite). The video uses `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv`. [video excel-basic-filtering @00:07]
2. Open the editor: click in the table, then **Query > Edit**, or **Data > Get Data > Launch Power Query Editor...**. [video excel-basic-filtering @00:20-00:41; frame @00:42]
3. Click the dropdown arrow on the header of the column to filter, e.g. **Year / Année**. [video excel-basic-filtering @00:52; frame @01:02]
4. If the menu says the list may be incomplete, click **Load more** so all values are listed. [video excel-basic-filtering @01:05]
5. Untick **(Select All)**, then tick only the value(s) to keep, e.g. **2024**. [video excel-basic-filtering @01:13; frame @01:12]
6. Click **OK**. A step **Filtered Rows** appears in APPLIED STEPS and the header shows a filter icon. [frame @01:22]
7. (Optional) Filter further on another column, e.g. **Industry (English) / Industrie (Anglais)**: untick (Select All), tick "Aerospace product and parts manufacturing" and "Agricultural supplies merchant wholesalers", **OK**. [video excel-basic-filtering @01:45; frame @01:52]
8. Click **Home > Close & Load**. [video excel-basic-filtering @01:20]

## Formulas / expressions / code
Formula bar after step 6 [frame excel-basic-filtering @01:22]:
```
= Table.SelectRows(#"Changed Type", each ([#"Year / Année"] = 2024))
```
`Table.SelectRows` keeps rows of the previous step (`#"Changed Type"`) for which the condition after `each` is true; `[#"Year / Année"]` refers to the column (the `#"..."` quoting is needed because the name has spaces/slashes).

## Verify
- Editor status bar: "6 COLUMNS, 132 ROWS" after keeping 2024. [frame @01:22]
- In Excel, Queries & Connections shows "132 rows loaded." for 2024 only [frame @01:32], and "2 rows loaded." after also filtering to the two industries [frame @02:02].

## Pitfalls
- To undo a filter, delete its step with the **X** beside "Filtered Rows" in APPLIED STEPS ("just exit out"). [video excel-basic-filtering @00:45, @01:20; frame @00:52]
- The filter list is built from a sample; without **Load more** some values (e.g. older years) may be missing. [video excel-basic-filtering @01:05]
- Filters on several columns combine with AND - the second filter applies to the already-filtered rows. [frame @02:02]
- The menu also offers **Remove Empty** and **Number Filters >** / **Text Filters >** for conditions such as greater than; these were visible but not used. [frame @01:12, @01:52]

## Related
- [Power Query Editor basics](power-query-editor-basics.md)
- [Remove rows, blanks and duplicates](remove-rows-blanks-duplicates-power-query.md)
- [Create a PivotTable](create-pivottable-summarize-filter-sort.md) (filter inside a PivotTable instead)
- Transcript: [Excel - Basic filtering](../../transcripts/excel/excel-basic-filtering.md)
