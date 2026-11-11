---
id: excel.split-column-power-query
tool: excel
title: Split one column into several in Power Query (by number of characters or by delimiter)
keywords: [split column, split by delimiter, split by number of characters, split by positions, separate column, extract first digits, NAICS 4 from NAICS 6, first 4 characters, duplicate column, copy column, hierarchy code, comma separated, digit to non-digit, split column by position, text to columns alternative]
software_context: "Excel for Microsoft 365 desktop (Windows), Power Query Editor"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-splitting-columns.md, timestamps: "00:05-04:21"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_DataDonnées_2024.csv)"]
---
# Split one column into several in Power Query (by number of characters or by delimiter)

## Purpose
Create new variables from information packed into one column. The course example derives the 4-digit NAICS industry code (e.g. 3221 "Pulp, paper and paperboard mills") from the 6-digit code (322112 "Chemical pulp mills") by splitting after 4 characters. Same tool splits "Canada, UK" style lists by a delimiter. Topic 2: "separate data out from a single column to create additional variables". [page topic-2-transforming-and-wrangling-data.md]

## Steps
1. **Data > From Text/CSV** > `NPRI-INRP_DataDonnées_2024.csv` > **Transform Data**. [video excel-splitting-columns @00:38; frame @00:42]
2. Scroll right to **SCIAN 6 chiffres / NAICS 6 Code** (values like 322112). [video excel-splitting-columns @00:50; frame @01:22]
3. Keep the original: right-click the column header > **Duplicate Column**. A new column "SCIAN 6 chiffres / NAICS 6 Code - Copy" appears at the far right and a **Duplicated Column** step is added. [video excel-splitting-columns @02:01; frame @02:02, @02:12]
4. With the copy selected, click **Home > Transform > Split Column**. Options: By Delimiter, By Number of Characters, By Positions, By Lowercase to Uppercase, By Uppercase to Lowercase, By Digit to Non-Digit, By Non-Digit to Digit. [video excel-splitting-columns @02:25; frame @03:02]
5. Choose **By Number of Characters**. In **Split Column by Number of Characters** enter **Number of characters** = `4`, choose Split = **Once, as far left as possible**, click **OK**. [video excel-splitting-columns @03:25; frame @03:42]
6. Result: two new columns "...Copy.1" (first 4 digits, e.g. 3221) and "...Copy.2" (remaining digits, e.g. 12); steps **Split Column by Position** and **Changed Type1** are added. [frame @03:52]
7. (Optional) Rename "...Copy.1" (right-click header > **Rename...** [frame @02:02]) and remove "...Copy.2" if not needed (see Related).
8. **Home > Close & Load**.

Variant - split by delimiter (narrated, not demonstrated): select the column > **Split Column > By Delimiter**, give the delimiter (e.g. comma) to separate entries such as "Canada, UK" into separate columns. [video excel-splitting-columns @02:25-02:41]

## Formulas / expressions / code
```
= Table.DuplicateColumn(#"Changed Type", "SCIAN 6 chiffres / NAICS 6 Code", "SCIAN 6 chiffres / NAICS 6 Code - Copy")
```
Duplicated Column - copies the column under a new name. [frame @02:12]
```
= Table.TransformColumnTypes(#"Split Column by Position",{{"SCIAN 6 chiffres / NAICS 6 Code - Copy.1", Int64.Type}, {"SCIAN 6 chiffres / NAICS 6 Code - Copy.2", Int64.Type}})
```
Changed Type1 - auto-typing of the two split columns as whole numbers. [frame @03:52] The formula of the "Split Column by Position" step itself was not shown.

## Verify
- New "SCIAN 6 chiffres / NAICS 6 Code - Copy.1" values equal the existing "SCIAN 4 chiffres / NAICS 4 Code" column (both 3221 for Alberta-Pacific Forest Industries rows). [frame @01:22, @03:52]

## Pitfalls
- Duplicate first so the original column is not altered ("we don't want to compromise our data"). [video excel-splitting-columns @02:01]
- The NAICS 6 column is numeric (Whole Number); Power Query still splits it by characters, and re-types the parts as whole numbers. Leading zeros would be lost in numeric codes (general knowledge - not an issue for NAICS).
- "Once, as far left as possible" splits once after the first N characters; **Repeatedly** would cut every N characters. [frame @03:42]
- The 2024 file already contains the 4-digit code; the technique matters for data sets that only have the 6-digit code. [video excel-splitting-columns @01:25]
- For splitting outside Power Query, `Data > Data Tools > Text to Columns` exists (example "Ontario-Canada"). [video excel-intro-to-excel @09:18]

## Related
- [Choose and remove columns](choose-and-remove-columns-power-query.md)
- [Power Query Editor basics](power-query-editor-basics.md)
- [Ribbon tour](ribbon-tour-course-features.md) (Text to Columns)
- Transcript: [Excel - Splitting columns](../../transcripts/excel/excel-splitting-columns.md)
