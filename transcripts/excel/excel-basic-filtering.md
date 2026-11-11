---
title: "Excel - Basic filtering"
tool: excel
duration: "02:08"
content_id: 503cd3d5-4034-42b5-b04a-7add42473f89
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=503cd3d5-4034-42b5-b04a-7add42473f89&revisionId=latest
---

# Excel - Basic filtering — transcript

Duration 02:08. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Workbook "Book4" with the NPRI-INRP_IndustryIndustrie_Air table already filtered to 2024 from an earlier take. "Query" contextual tab active: Edit (Edit, Properties, Delete), Load (Refresh, Load To), Reuse (Duplicate, Reference), Combine (Merge, Append), Share (Export Connection File). Queries & Connections pane: "NPRI-INRP_IndustryIndustrie_Air_2015-... 132 rows loaded."
- **[00:32]** Home tab showing; pointer moving to the "Query" contextual tab (one route into the editor is `Query > Edit`).
- **[00:42]** Alternative route: `Data > Get Data` dropdown (top item "Get Data (Preview)", then From File, From Database, From Azure, From Fabric & Power Platform, From Online Services, From Other Sources, Combine Queries), pointer on "Launch Power Query Editor..." with tooltip "Launch Power Query Editor - Open the Power Query Editor window to create or modify queries."
- **[00:52]** Power Query Editor. Query Settings pane: PROPERTIES Name "NPRI-INRP_IndustryIndustrie_Air_2015-20..."; APPLIED STEPS: Source, Promoted Headers, Changed Type (selected) - the earlier filter step has been deleted with the X beside it. Status "6 COLUMNS, 999+ ROWS".
- **[01:02]** "Year / Année" column selected (ribbon shows "Data Type: Whole Number"); pointer on its header dropdown arrow.
- **[01:12]** Column filter menu: Sort Ascending, Sort Descending, Clear Sort, Clear Filter, Remove Empty, Number Filters >, Search box, checklist "(Select All)", "(null)", ..., 2018, 2019, 2020, 2021, 2022, 2023, 2024 (all checked); OK, Cancel. (The "List may be incomplete / Load more" prompt mentioned in narration is not captured in a frame.)
- **[01:22]** After unticking (Select All) and ticking only 2024: new applied step "Filtered Rows"; formula bar `= Table.SelectRows(#"Changed Type", each ([#"Year / Année"] = 2024))`; filter icon on the Year / Année header; status "6 COLUMNS, 132 ROWS".
- **[01:32]** Back in Excel after Close & Load: table rows 65-90 all show 2024; Queries & Connections "132 rows loaded."
- **[01:42]** Top of the filtered table (row 2 "Aerospace product and parts manufacturing", 2024).
- **[01:52]** Back in the editor; "Industry (English) / Industrie (Anglais)" dropdown open: Sort Ascending, Sort Descending, Clear Sort, Clear Filter, Remove Empty, Text Filters >, Search; "(Select All)" unticked, "Aerospace product and parts manufacturing" ticked and "Agricultural supplies merchant wholesalers" being ticked; OK, Cancel.
- **[02:02]** Excel result: 2 table rows - "Aerospace product and parts manufacturing / Fabrication de produits aérospatiaux et de leurs pièces / 2024 / 3364" and "Agricultural supplies merchant wholesalers / Grossistes-marchands de fournitures agricoles / 2024 / 4183"; Queries & Connections "2 rows loaded."

## Transcript

**[00:07]** All right, so now we're gonna talk about how to use the power query editor to actually filter the data set that we have. If you filter a data set, um, without using tables, it kind of, it filters the view for you, but doesn't actually alter the data set. So, here we go. We're actually going to go into, so if if this is, if you were on the home tab, for example, you're at, you're at this, um, You've got the table here, you could either do query over here which should open up or uh alternatively go to data, and typically there's something down here that's like launch power query editor, so something

**[00:41]** like that will, will bring you to the same, uh, same spot, OK? So it's got our uh data set that we have here. Here's what it's done already. I'm just gonna get rid of that, um. And what we can do is just click on these drop, any of these drop-down boxes up here for anything that we want to filter. So, this is the year that that uh those emissions were recorded and released, and here what we can actually do, OK, so here it says the list may be incomplete, so let's do load more. These are all the years of data that we have. So we're gonna

**[01:13]** click select all, go to 2024, the latest year, click OK, and you can see that it's now recorded that over here. If you want to get rid of that, you can just exit out as I did before. Now you just go close and load. OK, now we've got a data set that is just the values from 2024, OK? So now we can work off of that data set as well. So, really simple way to do a basic filter using the Power query editor, you could of course do that across multiple. Things as well. So if we go back into the query editor, let's say I want to change something over here. I just want to look at aerospace and agricultural

**[01:53]** emissions. OK, well, there's only 2, but let's close and load that, and then it'll reduce our data set down, um, to, to those filters. So, really easy in Excel to, to play around and filter data.
