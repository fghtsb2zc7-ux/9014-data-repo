---
title: "Excel - Pivot tables and charts"
tool: excel
duration: "03:11"
content_id: 58ee9260-7675-47e0-bd85-3c6930fe7978
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=58ee9260-7675-47e0-bd85-3c6930fe7978&revisionId=latest
---

# Excel - Pivot tables and charts — transcript

Duration 03:11. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:22]** Workbook "Book2" with the NPRI-INRP_IndustryIndustrie_Air table (loaded through Power Query; Queries & Connections "1,323 rows loaded."); Table Design and Query contextual tabs present.
- **[00:52]** `Insert > PivotTable` with a cell in the table selected: dialog "PivotTable from table or range". "Select a table or range" Table/Range: `NPRI_INRP_IndustryIndustrie_Air_2015_2024` (the table name, auto-filled). "Choose where you want the PivotTable to be placed": New Worksheet (selected) / Existing Worksheet, Location. "Choose whether you want to analyze multiple tables": "Add this data to the Data Model" (unchecked). OK, Cancel.
- **[01:02]** New sheet tab "Sheet4" inserted to the left of the data sheet.
- **[01:12]** Sheet4 with empty "PivotTable3" placeholder ("To build a report, choose fields from the PivotTable Field List"). Contextual tabs "PivotTable Analyze" and "Design". PivotTable Analyze groups: PivotTable (PivotTable Name "PivotTable3", Options), Active Field, Group, Filter (Insert Slicer, Insert Timeline, Filter Connections), Data (Refresh, Change Data Source), Actions (Clear, Select, Move PivotTable), Calculations (Fields, Items, & Sets; OLAP Tools; Relationships), Tools (PivotChart, Recommended PivotTables), Show (Field List, +/- Buttons, Field Headers). "PivotTable Fields" pane: "Choose fields to add to report:", Search, fields "Industry (English) / Industrie (Anglais)", "Industry (French) / Industrie (Français)", "Year / Année", "NAICS Number / Numéro SCIAN", "Total - Releases to Air (tonnes) / Total - Rejets dans l'air...", "Facility Count / Nombres d'installations", "More Tables..."; "Drag fields between areas below:" Filters, Columns, Rows, Values; "Defer Layout Update".
- **[01:32]** "Year / Année" and "Total - Releases to Air (tonnes)..." ticked. Rows: "Year / Année"; Values: "Sum of To..." Pivot: header "Row Labels" | "Sum of Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes)"; 2015 3074826.391; 2016 3032880.318; 2017 3076243.857; 2018 2931739.565; 2019 2895114.283; 2020 2723519.547; 2021 2755602.542; 2022 2733149.652; 2023 2660257.051; 2024 2591038.961; (blank); Grand Total 28474372.17.
- **[01:42]** Pointer on `PivotTable Analyze > Tools > PivotChart`. (The Insert Chart dialog is not captured in any frame.)
- **[01:52]** Clustered column PivotChart inserted beside the pivot: chart title "Total", value field button "Sum of Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes)", legend "Total", axis field button "Year / Année", categories 2015-2024 and "(blank)". Contextual tabs PivotChart Analyze, Design, Format (Format shows Chart Area, Size 7.62 cm x 12.7 cm). Pane renamed "PivotChart Fields" with areas Filters, Legend (Series), Axis (Categories), Values.
- **[02:12]** Year unticked, "Industry (English) / Industrie (Anglais)" ticked into Rows: long list of industries with summed releases (rows past 138).
- **[02:22]** Row Labels dropdown: Sort A to Z, Sort Z to A, More Sort Options..., Clear Filter From "Industry (English..."", Label Filters >, Value Filters >, Search, checklist "(Select All)", blank, Aerospace product and parts manufacturing, ...; OK, Cancel.
- **[02:32]** Filter demo: "(Select All)" cleared and only "Animal food manufacturing" ticked; pivot shows one value 21736.44826 (Grand Total identical); funnel icon next to the Industry field in the field list.
- **[02:42]** Filter cleared; "More Sort Options..." dialog "Sort (Industry (English) / Industrie (Anglais))": Sort options - "Manual (you can drag items to rearrange them)", "Ascending (A to Z) by:" with dropdown listing "Industry (English) / Industrie (Anglais)" and "Sum of Total - Releases to Air (tonnes) / Total - Rejets..."; "Descending (Z to A) by:"; buttons More Options..., OK, Cancel.
- **[02:52]** Sorted ascending by the sum; bottom of list: Metal ore mining 1940299.581; Electric power generation, transmission and distribution 3665565.856; Alumina and aluminum production and processing 4612271.886; Oil and gas extraction 8212153.277; Grand Total 28474372.17 (row 152).
- **[03:02]** Cell A151 "Oil and gas extraction" selected (largest emitter).

## Transcript

**[00:06]** All right, so the next thing that we're gonna do is talk about creating a pivot table and a pivot chart. Pivot tables allow us to aggregate and summarize data, uh, in a way that allows us to quickly make visualizations and explore it. Excel is excellent for this in terms of, it's very easy to summarize data and aggregate it, and plot it quickly, great way. To have a quick look at the data and what's going on, right? So this is the NRI industry air releases, data set that we've been working with before. It's already in a table, so we've got it in that table format because we loaded it like that. So, all

**[00:41]** we're going to do to try and aggregate and summarize that data is go insert, we're going to go to pivot table. If you've already got it in a table format, it recognizes the full table range. So, it'll say, everything that's in that table, we're gonna grab. We're gonna say, yep, that sounds good. It's gonna put it into a new worksheet, you'll see it's opened up down here in sheet 4, so it's separate from the original data set. You can put it in the same worksheet, but I find it's a lot easier to put it in a new worksheet, OK. So, Here you can see all the different, uh, column titles, column headings, and that's what we can use for our pivot chart. So, these four boxes here allow

**[01:19]** us to sort of combine data and aggregate it in a way that we want. So, let's say we want our, uh, Year value, and we want to see how releases have changed over those years, OK? So here we've got, uh, each year, total number of releases, OK? And it's really easy for us to from that pivot table, we're just gonna add a pivot chart. Click, OK, and you can see here, so really quickly, we're able to say, oh, you know what, we've got, um, the releases are actually going down over

**[01:55]** time, so that's, that's really encouraging. So, it's easy for us to kind of pick that apart and see that. Now, let's say we wanted to look at something else. Maybe we could look at the industry, OK? So, here are all the industries, and there are all their remissions for those years as well. So, we get kind of a Good idea of what those emissions are. Within a pivot table, um, as well, we can do things like filter that data, because we can filter for specific industries if we want to, OK? And that will give us those values. Um, so we can also do things like sort that data as well. So

**[02:34]** we can grab that, we can sort, do more sort options, we can do ascending by different values. So, let's say we wanna know what was the largest emitter out of all the uh industries, we can sort it by some, OK? So we can scroll all the way down to the bottom. OK, the biggest industry, maybe not, not so surprising, it's oil and gas extraction, OK? So, this gives us pivot tables. We're gonna be working with them a lot more throughout the term, but this kind of gives you a quick introduction to how do we get import data, get to a pivot table, get to a pivot chart, get some insights immediately.
