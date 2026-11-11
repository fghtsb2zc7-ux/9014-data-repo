---
title: "Excel - Data and variable types"
tool: excel
duration: "07:32"
content_id: 8d518f9a-4201-4e2d-9aac-2c2b4e982330
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=8d518f9a-4201-4e2d-9aac-2c2b4e982330&revisionId=latest
---

# Excel - Data and variable types — transcript

Duration 07:32. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:32]** Blank workbook "Book2"; tab bar includes Power Pivot and Developer (ribbon customized as in the intro video).
- **[00:42]** Data tab, pointer on `From Text/CSV`; Analysis group with "Data Analysis" present at right.
- **[00:52]** Import preview dialog titled "NPRI-INRP_DataDonnées_2024.csv": File Origin "1252: Western European (Windows)"; Delimiter "Comma"; Data Type Detection "Based on first 200 rows"; preview columns "Année / Year", "ID INRP / NPRI ID", "Entreprise / Company Name", "Nom de l'installation / Facility Name", "Ville / City", "SDR / CSD"...; buttons "Load" (with dropdown arrow), "Transform Data", "Cancel".
- **[01:12]** "NPRI-INRP_DataDonnées_2024 - Power Query Editor". Query Settings > APPLIED STEPS: Source, Promoted Headers, Changed Type. Formula bar: `= Table.TransformColumnTypes(#"Promoted Headers",{{"Année / Year", Int64.Type}, {"ID INRP / NPRI ID", Int64.Type}, {"Entreprise / Company Name", type text}, {"Nom de l'installation / Facility Name", type text}, ...`.
- **[01:32]** "Promoted Headers" step selected: formula `= Table.PromoteHeaders(Source, [PromoteAllScalars=true])`; at this step every column has the ABC (text) icon and numbers are left-aligned.
- **[02:22]** "Changed Type" selected and the formula bar expanded (chevron at right) showing the full type list, e.g. `{"Ville / City", type text}, {"SDR / CSD", type text}, {"AR ou RMR / CA or CMA", type text}, {"Région économique / Economic Region", type text}, {"Province / Province", type text}, {"Code postal / Postal Code", type text}, {"Écozone terrestre (Anglais) / Terrestrial ecozone (English)", type text}, ... {"Latitude / Latitude", type number}, {"Longitude / Longitude", type number}, {"SCIAN 4 chiffres / NAICS 4 Code", Int64.Type}, {"Nom de secteur SCIAN 4 (Anglais) / NAICS 4 Sector Name (English)", type text}, ... {"SCIAN 6 chiffres / NAICS 6 Code", ...`.
- **[03:02]** Clicked the 1²3 type icon on the "Année / Year" header: data type menu - Decimal Number, Currency, Whole Number, Percentage, Date/Time, Date, Time, Date/Time/Timezone, Duration, Text, True/False, Binary, Using Locale...
- **[03:32]** Cell selected; value preview pane at bottom ("Alberta-Pacific Forest Industries Inc.").
- **[03:52]** Status-bar menu opened at bottom left: "Column profiling based on top 1000 rows" (ticked) / "Column profiling based on entire data set".
- **[04:22]** After switching to entire data set: red/striped error segment in the quality bar under "Année / Year" and "ID INRP / NPRI ID". Hover card on Année / Year: "49 (< 1%) Error" with "Remove Errors" and "..." menu.
- **[04:32]** Right-click on the quality bar: Copy Quality Metrics, Keep Duplicates, Keep Errors, Remove Duplicates, Remove Empty, Remove Errors, Replace Errors, Show the column quality peek, Show the column distribution peek (greyed).
- **[04:42]** "Keep Errors" applied: new step "Kept Errors"; formula `= Table.SelectRowsWithErrors(#"Changed Type", {"Année / Year"})`. Rows show "Error" in Année / Year and ID INRP / NPRI ID; Company "Wood Buffalo", Facility "Wood Buffalo--Cold Lake", Ville / City "AB", SDR / CSD "T2P 3M9", AR ou RMR "Boreal Plain", Région économique "Plaines boréales" - i.e. values are shifted into the wrong columns for this facility.
- **[05:02]** Error cell clicked: yellow details pane "DataFormat.Error: We couldn't convert to Number. Details: Fort McKay".
- **[05:22]** Right-click on an Error cell shows only Copy, Number Filters >, Replace Values..., Drill Down, Add as New Query (Replace Errors comes from the quality-bar / column right-click menu instead).
- **[05:32]** "Replace Errors" dialog: "Enter the value which will replace errors in the selected columns." Field "Value"; OK, Cancel.
- **[05:42]** After entering 2024: new step "Replaced Errors"; formula `= Table.ReplaceErrorValues(#"Kept Errors", {{"Année / Year", 2024}})`; Année / Year shows 2024, ID INRP / NPRI ID still "Error".
- **[06:22]** "Kept Errors" step deleted (X beside it). Steps now Source, Promoted Headers, Changed Type, Replaced Errors; formula re-pointed automatically: `= Table.ReplaceErrorValues(#"Changed Type", {{"Année / Year", 2024}})`; full data set visible again.
- **[06:32]** Année / Year quality bar now fully green; ID INRP / NPRI ID still shows its red error segment.
- **[07:12]** After `Close & Load`: cell A1 "ExternalData_1: Getting Data ...", Queries & Connections "Loading data...", status bar "Running background query".
- **[07:22]** Loaded table on new sheet "NPRI-INRP_DataDonnées_2024" (Table Design tab, Table Name "NPRI_INRP_Data..." truncated); Queries & Connections: "59,605 rows loaded. 49 errors."

## Transcript

**[00:05]** All right, so in this video, we're gonna take a look at data types within Excel. Um, there, when we load data into Excel, it categorizes data in different ways, and that's important for later analysis. We'll see this is the same thing for Uh, QGIS and the same thing for R, we can often get these kind of mismatches between the data type that we're bringing in and what the program's actually recognizing. So we're going to go through that in Excel, but we will be doing that within QGIS and within R. So if you go to data, When we go to from Tech CSV we can upload the 2024 data for the MPRI data

**[00:47]** set that automatically brings us to the sort of preview page and it looks at the different data types here. If we go to load data, it would load it directly into a table format. We're going to go to transform data to open up the power query editor. You can see on the right hand side here under applied steps. The power query editor has already taken a number of steps once we've brought the data into it. So, um, the first thing is it's loading it up from the source, then it is promoting the column headers. So for almost all of our CSVs, the

**[01:24]** column headers are is the are the first row of the data set, so that will be moved up then and represented as the column headers. That's good because that's how we're going to reference columns, that's how we're going to. Filter them, so it just takes that initial step. For almost all of the CSVs we use, that should be fine. Sometimes you'll find a CSV that has like a block of text explaining the data above the CSV uh where the the the column rows start, and what you need to do is bring that into Excel, and then you promote the headers up so that that that first row of headers is all the

**[02:00]** way up uh at the top, or you can remove those top rows of data and get rid of those rows and then promote the headers. So. Um, that's that kind of sets us up nicely there for working with that data set, and then it also has changed the type, and in the background, um, Excel is using its own coding language, it's different from our, uh, we don't need to know this one, but it has gone through and has identified columns and it has changed their column type. So you can see here these curly brackets for latitude, it's, it's changed the type to number. Longitude to number for

**[02:35]** facility name to text. So this is what we mean when we talk about different data types and you can see kind of an example of this if you go over to the year column here. Click on the little uh symbol that's at the top here, you can see, here are a list of the different data types that you will see uh within Excel. So there's decimal number, there's whole numbers, percentages, there's all these date times in here, there's text, um, so we want to make sure that those data columns have appropriately categorized the data types. This is important for Excel, but it's much more important for

**[03:15]** QGIS and R, um, and we'll see that later and how to adjust those. So right now we are, everything seems to be looking good, we've got numbers for our year here, numbers for our NPRIID and text for our other columns that have text within them. So that's good, everything's sort of matched up there nicely. Now the bottom left here you can see that the column profiling, and the profiling is of identifying data types within the columns, is only based on the top 1000 rows. When we're working with larger data sets, that's not enough to pick up or detect any errors. So you can click on this right

**[03:52]** at the bottom, change that to column profiling based on entire data set. You can see the uh under each of the columns here, they've kind of got a progress bar moving back and forth. It has now analyzed the entire data set um for the type of data within each of the columns, OK? Now we've had a little uh sort of errors pop up on these two data, uh, columns here. So we'll look at the year one first, but this sort of gives you an idea of how much of the data set is not matching with our column types. So when we look at this, We can right

**[04:29]** click on that little bar there, that little bar that it's the striped and and red bar, and we're gonna click on keep errors, right? So that will filter the data set just to show the the rows that have errors within them. You can see over here that that's been added to our applied steps, and if we click on. On one of the columns, you can see here's where the errors are being thrown. OK, so it's for this particular um facility name, Wood Buffalo Cold Lake. So we will click on that. In the bottom here, it shows us what the issue is. So we can see that it couldn't convert it to a number because it was

**[05:05]** actually text in that field. So in this case we've got Fort MacKay, so that doesn't match with the year column, so that's simply a data entry quality issue that we can then adjust um and make sure that we fix it. So you can again right click on this, and sorry, right click on that, a little red bar. What we're going to do is we're going to replace the errors there. We're just gonna say put in 2024 because we know that that's the year that we're dealing with it within this data set, click OK. Now if we were

**[05:41]** gonna replace the NPRI uh ID name, we'd have to go figure out what the NPRI ID was for this particular facility and we could do that from the whole data set, but we're just gonna leave that for now, um, because we can now analyze based on the year, like we we've got some information in there that we can still work with, so, uh, we would go back and find the NPRID to enter that. OK, so now that has, that will have gotten rid of any of the errors there. So if we go back, and this is kind of a nice thing within the applied, uh, steps criteria, is that here I can just remove that uh sort of kept errors now, and it will go

**[06:20]** back and we'll analyze the full data set for any errors again that we have removed that. Uh, and we should see that there we go. Our year column now has no errors associated with it. Our NPR ID still does, but that's because we haven't replaced those. Um, but we have been able to clean up the data set there. So Excel is a good way to sort of bring that data in. clean it up a little bit, maybe get it ready for analysis in other areas as well. Um, it does have some problems with really large data sets. So when we're working with our Million Row data set, which has the full MPRI data scope, it's,

**[06:55]** it's a little bit more challenging, but Um, this is, this is how Excel can help us sort of clean up that data and identify different data types for later analysis. So to get this into um our table format, we just go close and load. And that will actually load up our data. Here we can see it's loading up all of our rows, um, it is finding those 49 errors that were associated with the NPRI ID column, but otherwise, um, we've got everything else in there as we need it to carry on with the pivot table or pivot chart or further

**[07:29]** analysis. OK.
