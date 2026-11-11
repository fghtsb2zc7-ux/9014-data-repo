---
title: "Excel - Cleaning up date data"
tool: excel
duration: "03:59"
content_id: d0fb230a-00f4-4942-9dc2-8f8495c98011
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=d0fb230a-00f4-4942-9dc2-8f8495c98011&revisionId=latest
---

# Excel - Cleaning up date data — transcript

Duration 03:59. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:02-00:22]** Blank workbook "Book3 - Excel", Data tab (Get Data, Queries & Connections, Data Types, Sort & Filter, Data Tools, Forecast, Outline, Data Analysis).
- **[00:32]** Power Query Editor titled "OBIS - North Atlantic Right Whale reduced (2) - Power Query Editor" (second import of the same CSV; Queries pane lists two "OBIS - North Atlantic..." queries). APPLIED STEPS: Source, Promoted Headers, Changed Type. Columns visible: behavior, decimalLatitude, decimalLongitude, `eventDate` (ABC = text), `eventDate_standard` (date icon), month, year. Home ribbon "Data Type: Text".
- **[00:42]** `eventDate` column selected (text type, values left-aligned like `2010-03-20`).
- **[01:02]** Scrolled down rows 69-100 of `eventDate`: mixed formats, e.g. `2011-10-12 0:00`, `2012-02-19 0:00`, `2007-05-29 0:00` (date-times) alongside plain `2024-01-23`. behavior values shown: PORPOISING, BLOWING, FEEDING, SWIMMING, BLOW, NA, DIVING.
- **[01:32]** **Add Column** tab > **Date** dropdown opened with `eventDate` (text) selected: Age, Date Only, Parse (enabled), and greyed-out Year, Month, Quarter, Week, Day, Subtract Days, Combine Date and Time, Earliest, Latest (date-part extraction unavailable on a text column).
- **[01:52]** After Add Column > Date > Parse: new column `Parse` (date type) at right end; step "Inserted Parsed Date"; formula bar `= Table.AddColumn(#"Changed Type", "Parse", each Date.From(DateTimeZone.From([eventDate])), type date)`. Status "17 COLUMNS, 999+ ROWS".
- **[02:02]** Back in Excel after Close & Load: new sheet tab "OBIS - North Atlantic Right Wha" with green Excel table; **Table Design** and **Query** contextual tabs; Table Name "OBIS__North_Atl..."; Queries & Connections pane: "2 queries" — "OBIS - North Atlantic Right Whale reduced — Connection only." and "OBIS - North Atlantic Right Whale reduced (2) — 8,793 rows loaded. 1 error."
- **[02:22-02:32]** Column `Parse` in column Q. Filter dropdown on `eventDate` (sheet AutoFilter): Sort A to Z, Sort Z to A, Sort by Color, Sheet View, Clear Filter From "eventDate", Filter by Color, Text Filters, Search; checklist values like `1950-03-06`, `1953-01-07`, ... and further down `9/9/2019`, `Apr-64`, `Apr-82`, `Dec-74`, `Dec-81`, `Dec-82`, `Feb-79`, `Mar-76`, `Nov-74`, `(Blanks)`; OK / Cancel.
- **[03:02-03:32]** Filter applied to three sample rows (status bar "3 of 8793 records found"), rows 3755, 5232, 6127:
  - `eventDate` `1/28/2009` → `Parse` `2009-01-28` (eventDate_standard 2009-01-28)
  - `eventDate` `Apr-64` → `Parse` `1964-04-01` (eventDate_standard shows 1965-01-15, year 1965)
  - `eventDate` `2011-01-22` → `Parse` `2011-01-22` (eventDate_standard shows 2008-01-24, year 2008)
- **[03:42]** Black end frame.

## Transcript

**[00:05]** All right, so we're going to look at now how we can fix update data that comes in that's in a little bit of a weird format. So let's go ahead and add our reduced uh um OBIS data again. So let's import that. I'm gonna transform OK, as we can see again, that event date column, that's the original event date column that comes with the data set, is still registering as text or what we call characters. So This means we can't extract any useful date

**[00:44]** information out of it. If you put this into R and it doesn't recognize the dates, you won't be able to plot date information because R will natively plot date information if you have it in the correct format. Let's, let's see if we can figure out what's going on here. OK, there's a date time in there. There are also dates listed with, so some of them are dashes, some of them are slashes. So Excel hasn't been able to determine whether or not this is a form, kind of a formal date column. So we're going to try and ask and say, hey,

**[01:19]** just so you know, this is a date column, can you try and parse the dates out of that column? So to do that, we go to add column. We can go to date. Now because we don't have a standardized date format, we can't extract any information, but we can tell Excel this is a date column, try and pick out date information from that column. So let's go parse, and now it creates this kind of standardized date column over here, where it's put everything in the in the sort of correct year, month, day format. Let's take a closer look when we close

**[01:55]** and load that, um, about what it might look like when we actually do that. OK, so here we go, we've got that loaded. We've got our um event date column, that was the one that wasn't fully standardized. Now we have our parse column over here that is fully standardized, and that means that we can do things like extract months and and that sort of thing out of it. Let's take a look at what some of these issues were perhaps. So, um, and, and what, um, Excel did with them. So when I scroll down, you can see there's some that have slashes, right? We've got, um, other dates that are dashes, OK. So

**[02:35]** that's pretty easy to resolve. We've also got some down at the bottom here where it was only the month and the year were given. So I'm just gonna take Just some uh samples of these. So there's the um slashes, and let's go down and take uh where we just have the month listed. OK. So here's the original date format. It has extracted those and turned it into the standard date format 2009 January 28th, so it's understood that that is what that date format is and put it into a standard format. Didn't need to do anything for the dashes, but

**[03:13]** for this April '64, it said, OK, April 1st, we don't have a day. Value searches at the 1st of April in 1964 and that allows us to again have a standardized date column. You can bring that into R, you can plot that, you can manipulate the data here. So using that parse function allows us to take sort of inconsistent date formats, turn them into something that we can actually use effectively.
