---
id: excel.parse-inconsistent-dates-power-query
tool: excel
title: Convert inconsistent date text into a proper date column with Date > Parse in Power Query
keywords: [parse date, fix dates, date stored as text, mixed date formats, slashes and dashes, month-year only, date time, clean dates, Date.From, DateTimeZone.From, inserted parsed date, eventDate, OBIS, date not recognized, locale, power query]
software_context: "Excel for Microsoft 365 (Windows), Power Query Editor > Add Column > Date > Parse; result checked in an Excel table"
prerequisites: [excel.import-csv-as-table-power-query, excel.power-query-editor-basics]
source_videos: [{video: transcripts/excel/excel-cleaning-up-date-data.md, timestamps: "00:05-03:59"}]
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md]
datasets_used: ["sources/files/Topic 2/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Convert inconsistent date text into a proper date column with Date > Parse in Power Query

## Purpose
When a date column imports as text (ABC icon) because values mix formats (`2010-03-20`, `1/28/2009`, `2011-10-12 0:00`, `Apr-64`), use **Add Column > Date > Parse** to create a new standardised date column (yyyy-mm-dd). Afterwards you can extract year/month/week from it, and R will plot it as a date. Checklist items 8 and 12 ("parse data and then extract the year and month") [page technical-skills-checklist.md].

## Steps
1. Import `OBIS - North Atlantic Right Whale reduced` via `Data > Get Data / From Text/CSV`, click **Transform Data**. [video excel-cleaning-up-date-data @00:05; frame @00:32]
2. Click the header of the text date column `eventDate` (Home tab shows "Data Type: Text"). [frame @00:42]
3. Scroll the column to see the problem values: date-times like `2011-10-12 0:00`, slash dates like `1/28/2009`, month-year like `Apr-64`. [video @00:44-01:19; frame @01:02, @02:22]
4. With `eventDate` selected click `Add Column > From Date & Time > Date > Parse`. [video @01:19-01:35; frame @01:32]
5. A new column `Parse` (date type) is added at the far right; step "Inserted Parsed Date". [frame @01:52]
6. `Home > Close & Load`. The query loads to a new sheet as a table. [video @01:55; frame @02:02]
7. Optional check: use the table's filter arrow on `eventDate` to pick sample bad values and compare with `Parse`. [video @02:22-03:13; frame @03:02]
8. Optional: rename `Parse` (double-click header in Power Query) to something like `eventDate_parsed` (general knowledge — not shown in course), then extract date parts ([extract-date-parts-power-query.md](extract-date-parts-power-query.md)).

## Formulas / expressions / code
```
= Table.AddColumn(#"Changed Type", "Parse", each Date.From(DateTimeZone.From([eventDate])), type date)
```
Step "Inserted Parsed Date": reads each `eventDate` text as a date-time-zone value, converts it to a date, types the column `date`.

## Verify
Sample results shown after loading (rows 3755, 5232, 6127; "3 of 8793 records found"): [frame @03:12]

| eventDate (text) | Parse (date) |
|---|---|
| `1/28/2009` | `2009-01-28` |
| `Apr-64` | `1964-04-01` (missing day set to the 1st) |
| `2011-01-22` | `2011-01-22` (unchanged) |

Queries & Connections showed "8,793 rows loaded. 1 error." for this query — check for the error row (see Pitfalls). [frame @02:02]

## Pitfalls
- Month-year values get day = 1 (`Apr-64` → 1964-04-01): fine for monthly analysis, wrong for day-level work. [video @03:13]
- Two-digit years: `Apr-64` was read as 1964; values like `Dec-74`, `Feb-79` will be 1974/1979. Check any that could be 20xx (general knowledge — not shown in course).
- Slash dates were read month/day/year (`1/28/2009`). Parsing follows the locale; if your system locale is day/month (e.g. en-GB) ambiguous dates like `3/4/2010` would flip. Use `Transform > Data Type > Using Locale...` to force a locale if needed (general knowledge — not shown in course).
- The load reported **1 error**; one value could not be parsed. In Power Query, `Home > Keep Rows > Keep Errors` on `Parse` shows it (general knowledge — not shown in course).
- In the course CSV the pre-made `eventDate_standard` column does not always agree with `eventDate` (row 5232: eventDate `Apr-64` but eventDate_standard 1965-01-15; row 6127: `2011-01-22` vs 2008-01-24). Use the column the assignment specifies. [frame @03:12]

## Related
- [Check and fix data types](check-and-fix-data-types-power-query.md)
- [Import CSV](import-csv-as-table-power-query.md)
- [Extract year, month, week from a date column](extract-date-parts-power-query.md)
- R equivalent: [../r-positron/parse-dates-and-extract-month.md](../r-positron/parse-dates-and-extract-month.md)
- Transcript: [../../transcripts/excel/excel-cleaning-up-date-data.md](../../transcripts/excel/excel-cleaning-up-date-data.md)
