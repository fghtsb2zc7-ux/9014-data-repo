---
title: "Excel - Loading data into Excel"
tool: excel
duration: "02:40"
content_id: e4e17515-1c14-48a1-ac5b-120f549c203d
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=e4e17515-1c14-48a1-ac5b-120f549c203d&revisionId=latest
---

# Excel - Loading data into Excel — transcript

Duration 02:40. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Blank workbook "Book3 - Excel", Home tab. In this recording the tab bar is File, Home, Insert, Draw, Page Layout, Formulas, Data, Review, View, Automate, Help (no Power Pivot / Developer tabs).
- **[00:32]** `File > Open > Browse`: Windows "Open" dialog in folder "Teaching > EnvrSust 9014 > 2026-2027 > NPRI data". File-type dropdown (next to File name) set to "All Files". Files listed: NPRI-INRP_CommentsCommentaires_1997-present, NPRI-INRP_DataDonnées_2024, NPRI-INRP_GeolocationsGeolocalisation_1993-present, NPRI-INRP_IndustryIndustrie_Air_2015-2024, NPRI-INRP_ReleasesRejets_1993-present. Buttons Tools, Open, Cancel.
- **[00:42]** "NPRI-INRP_IndustryIndustrie_Air_2015-2024" selected in File name; Open.
- **[00:52]** CSV opened directly (title "NPRI-INRP_IndustryIndustrie_Air_2015-2024"). Yellow message bar: "POSSIBLE DATA LOSS  Some features might be lost if you save this workbook in the comma-delimited (.csv) format. To preserve these features, save it in an Excel file format." with buttons "Don't show again" and "Save As...". Columns A-F: "Industry (English) / Industrie (Anglais)", "Industry (French) / Industrie (Français)", "Year / Année", "NAICS Number / Numéro SCIAN", "Total - Releases to Air (tonnes) / Total - ...", "Facility Count / Nombres d'installations". Whole sheet selected and column widths widened (status bar "Count: 7938"). Sheet tab "NPRI-INRP_IndustryIndustrie_Air". Plain range: no banding or filter buttons.
- **[01:12]** New workbook "Book4", Data tab (compact layout). Get & Transform Data group: Get Data, From Text/CSV, From Web, From Table/Range, From Picture, Recent Sources, Existing Connections. Data Tools group in this layout: Text to Columns, Clean Data, Flash Fill, Remove Duplicates, Data Validation, Consolidate, Data Model, Analyze Data.
- **[01:22]** Tooltip "From Web - Import data from a web page." (pointer moving to From Text/CSV). The import preview dialog that follows is not captured in this video's frames (see excel-data-and-variable-types @00:52 for the same dialog).
- **[01:42]** Power Query Editor window opening: "NPRI-INRP_IndustryIndustrie_Air_2015-2024 - Power Query Editor". Tabs File, Home, Transform, Add Column, View. Home groups: Close (Close & Load), Query (Refresh Preview, Properties, Advanced Editor, Manage), Manage Columns (Choose Columns, Remove Columns), Reduce Rows (Keep Rows, Remove Rows), Sort, Transform (Split Column, Group By, Data Type, Use First Row as Headers, Replace Values), Combine (Merge Queries, Append Queries, Combine Files), Parameters (Manage Parameters), Data Sources (Data source settings), New Query (New Source, Recent Sources, Enter Data).
- **[01:52]** Preview loaded. Left "Queries [1]" pane with the query. Formula bar: `= Table.TransformColumnTypes(#"Promoted Headers",{{"Industry (English) / Industrie (Anglais)", type text}, {"Industry (French) / Industrie (Français)", type text}, {"Year / Année", Int64.Type}, {"NAICS Number / Nu...` (truncated). Column type icons: ABC, ABC, 1²3 (Year / Année), 1²3 (NAICS Number / Numéro SCIAN), 1.2 (Total - Releases to Air (tonnes) / Total - Rejets dans l'air (ton...)), 1²3 (Facility Count). Status bar: "6 COLUMNS, 999+ ROWS", "Column profiling based on top 1000 rows".
- **[02:02]** After `Close & Load`: data in Excel as a green banded table with filter arrows on every header; sheet tab "NPRI-INRP_IndustryIndustrie_Air" plus "Sheet1". Contextual tabs "Table Design" and "Query". Table Design: Properties (Table Name "NPRI_INRP_Indus..." truncated, Resize Table), Tools (Summarize with PivotTable, Remove Duplicates, Convert to Range, Insert Slicer), External Table Data (Export, Refresh, Properties, Open in Browser, Unlink), Table Style Options (Header Row checked, Total Row, Banded Rows checked, First Column, Last Column, Banded Columns, Filter Button checked), Table Styles gallery. "Queries & Connections" pane on the right: Queries tab, "1 query", "NPRI-INRP_IndustryIndustrie_Air_2015-... 1,323 rows loaded."
- **[02:32]** Same table; status bar shows "Accessibility: Investigate".

## Transcript

**[00:06]** All right, so we're just gonna go over now some quick ways to bring data into Excel. So, you may be familiar with sort of double clicking on a CSV file, double clicking on an Excel workbook, um, and that, that's an easy way to bring data into Excel to explore. So, we'll just do an example of that now. So, I've got a new, uh, book here, I've opened it up, I'm go to open, browse, I'm in my MPRI data set, and we can then open up that data. So, if yours opened up as Uh, Excel files only, you won't see anything here. So, when you have CSVs, open up all files, and then you can click on those files and bring

**[00:43]** them in. Really easy. We've got all our data in here. If you want to sort of open that up a little bit, you can do this, and it will kind of change the column widths. Now, this is good for exploring Excel data quickly if you want to see it, but Excel is a lot more powerful if you use Excel tables. OK? So, let's try that again. OK. So, instead of bringing it in by double clicking it or bringing it in through the open window browser, we're gonna go to data, we're gonna get uh from CSV. Now, for some of you, you, uh you may have to do that down in this

**[01:18]** column for Macs, particularly, sometimes they change around where these, uh, different options are. But let's do get, get text CSV. We're gonna do that same uh thing that we had releases to air, OK? Now, it brings in sort of an import window, OK? So this is really handy because it allows us to load the data in. One of the things we can do is say we want to transform that data. This brings up the Power query editor, and we've got a ton of different options now at the top here to transform, uh, and filter that data, so it's a really handy way to kind of bring that data in in a more proper

**[01:55]** format. Now, let's say we're not just going to leave that there for now, we're gonna close and load. It will bring us back in here. Now you can see it's a little bit different, we've got an example of how a table is set up and how it looks uh when it's actually within Excel, you can see the different um rows are different colors, and it's really easy to access all of the information uh from the dropdown menus. So, bringing it in via a table often allows you to manipulate it a lot more, it also keeps track of all your manipulation, so if we had filtered it, that would be kept track of over here.

**[02:29]** So, bringing it through a table allows us to do many of the things we want to do later in terms of transforming our data. So that's probably the best way uh that you want to bring that data in.
