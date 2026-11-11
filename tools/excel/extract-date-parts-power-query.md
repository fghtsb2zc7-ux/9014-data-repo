---
id: excel.extract-date-parts-power-query
tool: excel
title: Extract year, month, quarter, week or day from a date column in Power Query
keywords: [extract year, extract month, week of year, quarter, day, name of month, date parts, add column date, Date.Year, Date.WeekOfYear, Date.Month, eventDate_standard, OBIS, right whale, power query, new column from date]
software_context: "Excel for Microsoft 365 (Windows), Power Query Editor > Add Column tab > From Date & Time group"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics, excel.parse-inconsistent-dates-power-query]
source_videos: [{video: transcripts/excel/excel-extracting-date-information.md, timestamps: "00:42-04:03"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 2/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Extract year, month, quarter, week or day from a date column in Power Query

## Purpose
Create new columns holding the year, month, quarter, week or day of an existing **date-typed** column so you can analyse trends by year, month or week. Works only when the column is recognised as a date (calendar icon); if it is text (ABC icon), first parse it ([parse-inconsistent-dates-power-query.md](parse-inconsistent-dates-power-query.md)). Checklist item 12 [page technical-skills-checklist.md].

## Steps
1. `Data > Get & Transform Data > Get Data / From Text/CSV`, select `OBIS - North Atlantic Right Whale reduced` (folder "Topic 2"), click **Import**, then **Transform Data**. [video excel-extracting-date-information @00:42; frame @00:52]
2. In the Power Query Editor scroll to the date columns. Check the type icon in each header: `eventDate` shows ABC (text — contains bad values), `eventDate_standard` shows a calendar icon (date). Selecting it shows "Data Type: Date" on the Home tab. [video @01:20-02:00; frame @01:12, @02:02]
3. Click the header of the date column, `eventDate_standard`. [frame @03:32]
4. Click `Add Column > From Date & Time > Date`. [video @02:35; frame @02:52]
5. In the dropdown choose the part you want. Menu as shown: Age, Date Only, Parse, **Year >**, **Month >**, **Quarter >**, **Week >**, **Day >**, Subtract Days, Combine Date and Time, Earliest, Latest. [frame @03:02]
   - `Year > Year` → new column (named `Year`, or `Year.1` if a `year` column already exists). [video @03:11; frame @03:22]
   - `Month >` Month, Start of Month, End of Month, Days in Month, Name of Month. [frame @03:12]
   - `Week >` Week of Year, Week of Month, Start of Week, End of Week. [frame @03:12]
   - `Quarter >` and `Day >` submenus: items not shown in frames.
6. Repeat steps 3-5 for each additional part (the video adds `Week > Week of Year`). [video @03:22; frame @03:42]
7. `Home > Close & Load` to load the table to a sheet (general knowledge — the video ends in the editor).

## Formulas / expressions / code
```
= Table.AddColumn(#"Changed Type", "Year.1", each Date.Year([eventDate_standard]), Int64.Type)
```
Step "Inserted Year": adds column `Year.1` = year of `eventDate_standard`, typed whole number.
```
= Table.AddColumn(#"Inserted Year", "Week of Year", each Date.WeekOfYear([eventDate_standard]), Int64.Type)
```
Step "Inserted Week of Year": week number 1-53 (low = start of year).

Worksheet-function equivalents listed in the Formulas tab (shown, not used): `YEAR(serial_number)`, `MONTH`, `DAY(serial_number)`, `WEEKNUM`, `ISOWEEKNUM`, `HOUR`, `MINUTE`, `SECOND` — see [formula-reference.md](formula-reference.md). [frame excel-using-excel-formulas @01:52-02:32]

## Verify
- A new whole-number column appears at the far right (`Year.1` with values like 2010, 2005, 2001; `Week of Year` with 12, 10, 11, 6, 48). [frame @03:22, @03:42]
- Status bar column count increases by one per added column (16 → 18 COLUMNS). [frame @03:42]

## Pitfalls
- If the column is text, Year/Month/Quarter/Week/Day are **greyed out** in the Date menu; only Age, Date Only and Parse are enabled. Parse first. [frame excel-cleaning-up-date-data @01:32]
- A column is left as text when even some values are malformed (mixed separators, date-times, month-year only). [video @01:59]
- The `month` and `year` columns already in the course CSV were pre-extracted by the instructor; the raw OBIS download only has `eventDate`. [video @01:20]

## Related
- [Check and fix data types](check-and-fix-data-types-power-query.md)
- [Parse inconsistent date text into a date column](parse-inconsistent-dates-power-query.md)
- R equivalent: [../r-positron/parse-dates-and-extract-month.md](../r-positron/parse-dates-and-extract-month.md)
- Transcript: [../../transcripts/excel/excel-extracting-date-information.md](../../transcripts/excel/excel-extracting-date-information.md)
