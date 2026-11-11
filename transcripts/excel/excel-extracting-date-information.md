---
title: "Excel - Extracting date information"
tool: excel
duration: "04:03"
content_id: d4a64356-7e5b-43b1-af11-b1ac7ff15ef5
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=d4a64356-7e5b-43b1-af11-b1ac7ff15ef5&revisionId=latest
---

# Excel - Extracting date information — transcript

Duration 04:03. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12-00:42]** Blank workbook "Book3 - Excel", **Data** tab: Get & Transform Data group (Get Data), Queries & Connections, Data Types (Stocks, Currencies), Sort & Filter, Data Tools (Text to Columns, Clean Data), Forecast (What-If Analysis, Forecast Sheet), Outline, Analysis (Data Analysis).
- **[00:52]** "Import Data" file dialog, folder `... > EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > Topic 2`. Files: "OBIS - North Atlantic Right Whale full" (25,93x KB) and "OBIS - North Atlantic Right Whale reduced" (Type "Microsoft Excel...", 1,283 KB; i.e. a CSV associated with Excel). File name: `OBIS - North Atlantic Right Whale reduced`, filter "Text Files", Import.
- **[01:02]** Power Query Editor, title "OBIS - North Atlantic Right Whale reduced - Power Query Editor". Queries pane: "NPRI-INRP_IndustryI..." and "OBIS - North Atlantic..." (2 queries). Columns: `id`, `areas` (e.g. `[266, 272, 40006, 31912]`), `bathymetry` (1.2), `behavior`, `decimalLatitude`, `decimalLongitude`, `eventDate` (ABC text, values like `2010-03-20`). APPLIED STEPS: Source, Promoted Headers, Changed Type. Formula bar: `= Table.TransformColumnTypes(#"Promoted Headers",{{"id", type text}, {"areas", type text}, {"bathymetry", type number}, {"behavior", type text}, {"decimalLatitude", ...`.
- **[01:12-01:42]** Scrolled right: `eventDate` (text, ABC icon), `eventDate_standard` (calendar/date icon, values right-aligned e.g. `2010-03-20`), `month` (123, e.g. 3), `year` (123, e.g. 2010), `identifiedBy`, `identifiedByID`. Status bar: "16 COLUMNS, 999+ ROWS  Column profiling based on top 1000 rows".
- **[02:02]** `eventDate_standard` selected; Home ribbon shows "Data Type: Date". Cursor on `eventDate` header (still text type).
- **[02:52]** **Add Column** tab: groups General (Column From Examples, Custom Column, Invoke Custom Function, Conditional Column, Index Column, Duplicate Column), From Text (Format, Merge Columns, Extract, Parse), From Number (Statistics, Standard, Scientific, Trigonometry, Rounding, Information), From Date & Time (**Date**, Time, Duration).
- **[03:02-03:12]** `Date` dropdown open: Age, Date Only, Parse (greyed), Year >, Month >, Quarter >, Week >, Day >, Subtract Days (greyed), Combine Date and Time (greyed), Earliest (greyed), Latest (greyed). Month submenu: Month, Start of Month, End of Month, Days in Month, Name of Month. Week submenu: Week of Year, Week of Month, Start of Week, End of Week.
- **[03:22]** New column `Year.1` (123) at far right, values 2010, 2005, 2001...; step "Inserted Year"; formula bar `= Table.AddColumn(#"Changed Type", "Year.1", each Date.Year([eventDate_standard]), Int64.Type)`. Other visible columns: identifiedBy, identifiedByID, individualCount, institutionCode (DON, Virginia Aquarium Stranding Response Program, NEFSC, SEFSC, FWC), institutionID, species (`Eubalaena glacialis`).
- **[03:32]** `eventDate_standard` selected again, Add Column > Date menu reopened.
- **[03:42-04:02]** New column `Week of Year` (values 12, 10, 11, 6, 48...); step "Inserted Week of Year"; formula bar `= Table.AddColumn(#"Inserted Year", "Week of Year", each Date.WeekOfYear([eventDate_standard]), Int64.Type)`. Status bar "18 COLUMNS, 999+ ROWS". Final APPLIED STEPS: Source, Promoted Headers, Changed Type, Inserted Year, Inserted Week of Year.

## Transcript

**[00:06]** In this video, we're going to be looking at date data, um, particularly for your independent products, this is something that is so valuable. You might have the full date listed, um, but you maybe want to look at trends over years or over months or over days of the month or something like that. So being able to Kind of pull out and extract information from date data columns is really important. The other thing is date data often gives us the largest number of problems when we're trying to bring it in during the import stage. So talking about it early means that OK, let's see if we can sort some

**[00:42]** of that stuff out and make sure that we can extract that data. So we're going to load up our OBIS reduced data set. Here it is. And we're gonna use the power query editor, so the transform data. And just as a quick review again, we've got the ID we've got this is bathymetry, so the depth where the sighting took place, the decimal latitude and longitude. We've got the most important one for us, um, is this kind of event date standard. Um, so we're going to look at that one there. Um, and I sort

**[01:20]** of I Put that in there before um for you guys to use it in the last assignment, but we'll talk about how we can extract things out of there as well. OK? So here you've got month and year columns again, which I already extracted for us. Um, the original data doesn't come with these columns here, it just comes with the event date column. Um, so we're going to take a look at, uh, sort of extracting information from that event date standard. So that is now, um, categorized as a date. So you can see that little symbol at the top there. So that means that where it's recognized

**[01:59]** that it's a date, you can see because there are some errors within the event date column itself, that's why it's recognizing it as a character. So this is a big Problem when we bring data in, often there'll be some sort of issue. One of the dates might not be accurate or something like that, and we come up with an issue where we've got event date data that has now not being recognized as a date. This is a problem in Excel and particularly um in our. Not so much in QJS we don't necessarily do a lot of our date processing there,

**[02:35]** but um trying to get it straight in our and uh Excel is pretty important. OK, so we're going to now, I want to extract information from this date. So we're gonna go to add column, and there's a date option here, OK? So this is gonna add a new column to our data set based on date information that we want to extract. So here we can take the year, we can take the month. We can do we want the quarter of the year, we can take the week, OK, so we can select the day, so it will extract all of that information out and put it in a new

**[03:11]** column. OK. So let's start out with the year. And you see we now have a year column down here, now it's called year.1 because I already had a year column there, um, but that's extracted all of that information, OK, out of the event date column. So let's go back and say, OK, that was good, let me get the week as well. OK, so there you have the week of the year with of course earlier numbers representing um sort of the first week of the year and later numbers representing kind of the end of the year down here in terms of uh where it

**[03:47]** is in the calendar year. So there's all sorts of things you can extract out of that date information if it is properly formatted. Now, the next thing we're gonna do is take a look at what happens when you don't have a properly formatted date and how you can fix that up.
