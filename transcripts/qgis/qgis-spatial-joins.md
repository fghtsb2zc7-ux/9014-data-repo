---
title: "QGIS - Spatial joins"
tool: qgis
duration: "08:36"
content_id: 6b56236c-92f7-4174-a99d-6db22ad18c17
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=6b56236c-92f7-4174-a99d-6db22ad18c17&revisionId=latest
---

# QGIS - Spatial joins — transcript

Duration 08:36. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
(Recorded in the 2025-26 offering, QGIS 3.22 interface; data folder `...\EnvrSust 9014\2025-2026\Student folder structure\Lesson 4\01 - Pre-class and lesson data\`.)
- **[01:02]** Menu `Layer > Add Layer > Add Delimited Text Layer...` (Ctrl+Shift+T).
- **[01:12]** "Data Source Manager | Delimited Text" empty: File Format CSV; Geometry Definition Point coordinates; Geometry CRS `EPSG:4326 - WGS 84`.
- **[01:22]** File name `...\Lesson 4\01 - Pre-class and lesson data\PWQMN_Stations.csv`; Layer name `PWQMN_Stations`; X field `LONGITUDE`, Y field `LATITUDE` auto-detected; Geometry CRS `EPSG:4326 - WGS 84`; Sample Data columns STATION, NAME, DESCRIPTION, LATITUDE, LONGITUDE, STATU...; Add.
- **[01:32]** `PWQMN_Stations` points (outline of southern Ontario).
- **[02:02]** QuickMapServices search panel; `Google Maps` basemap added; right-click on `PWQMN_Stations` -> `Open Attribute Table`.
- **[02:12-02:32]** Attribute table "PWQMN_Stations — Features Total: 2198": columns `STATION`, `NAME`, `DESCRIPTION`, `LATITUDE`, `LONGITUDE`, `STATUS`, `FIRST_YEAR`, `LAST_YEAR`, `TOTAL_YEARS`, `MISS_YEARS` (STATION e.g. 3007703502).
- **[02:42]** "Choose a Delimited Text File to Open": files `ANALYTE_PARM_LOOKUP_EN_2025`, `PWQMN_2010_2018_update5`, `PWQMN_data_2024` (11,003 KB), `PWQMN_FieldData_2021-2022_Final`, `PWQMN_Stations`.
- **[02:52]** File `...\PWQMN_data_2024.csv`, Layer name `PWQMN_data_2024`; X/Y fields blank; message "X and Y field names must be selected"; sample columns `_id`, `Year`, `Collection Site`, `Analyte`, `Collected`, `Collection_Time`, `Lab Workorder ID`, `Lab Sampl...`.
- **[03:02]** Geometry Definition set to `No geometry (attribute only table)`; Add.
- **[03:22]** Layers: `PWQMN_data_2024` (table icon), `PWQMN_Stations`, `Google Maps`.
- **[03:42-04:12]** Attribute table "PWQMN_data_2024 — Features Total: 112392": `_id`, `Year`, `Collection Site` (e.g. 18003303102), `Analyte` (Solids; suspended, Alkalinity, Phosphorus; phosphate, pH, Nitrate, Nitrogen; total, Phosphorus; total, Conductivity, Chloride ...), `Collected`, `Collection_Time`, `Lab Workorder ID`, `Lab Sample ID`, `Results` (values such as `3.6`, `<1.0`, `<0.02`), `Units`, `Result Call` (Detected / BDL), `Detection Limit`, `Method`, `Value Qualifier` (`<` or NULL), `Remark Code`.
- **[05:12]** Right-click `PWQMN_data_2024` -> `Filter...`.
- **[05:22]** "Query Builder — Set provider filter on PWQMN_data_2024": Fields list; expression started `"Analyte" =`; Values `All`.
- **[05:32-05:42]** Values search `phos` shows `Phosphorus; phosphate` and `Phosphorus; total`; expression `"Analyte" = 'Phosphorus; phosphate'`; Test clicked (narration: ~3600 rows); OK. Filter icon appears on the layer.
- **[06:02]** "Layer Properties — PWQMN_Stations — Joins" (empty list; + button at bottom).
- **[06:12-06:32]** "Add Vector Join": Join layer `PWQMN_data_2024`; Join field changed from `_id` to `Collection Site`; Target field `STATION`; `Cache join layer in memory` checked; Create attribute index on join field (greyed); Dynamic form unchecked; Editable join layer unchecked; Joined fields group unchecked (all fields joined); Custom field name prefix unchecked. OK.
- **[06:42]** Joins list shows "Join layer PWQMN_data_2024"; Apply / OK.
- **[06:52-07:12]** Attribute table "PWQMN_Stations — Features Total: 2198" (row count unchanged): new columns prefixed `PWQMN_data_2024_...` (e.g. `PWQMN_data_2024_Analyte`, `..._Results`); most stations NULL, matched stations show e.g. `63832`, `2024`, `Phosphorus; ...`, `11/26/2024`, `9:29:00`, `0.004`, `mg/L`, `Detected`; sorted view shows many matched rows (values like `<0.003` with `BDL`).
- **[07:32]** "Layer Properties — PWQMN_Stations — Symbology": `Categorized`, Value drop-down (STATION, NAME, DESCRIPTION, LATITUDE, ...).
- **[07:42]** Value `PWQMN_data_2024_Results` (abc = text), Color ramp Random colors; Classify.
- **[08:02]** Map: stations coloured by category; (narration) the empty-value category turned off.
- **[08:22]** Legend list of result categories (0.031 ... 2.97); only stations with phosphate values displayed.

## Transcript

**[00:06]** All right, so now we're going to look at how we can do what are called spatial joins. We're gonna take a data set that has spatial information, latitude, longitude, and then we're gonna take another data set that's related to that one, but doesn't have any of that spatial information. So the example that we're going through today is the provincial Water Quality Monitoring Network data. Uh, that has the stations and their coordinates, and then it also has the results from sampling that's done at those stations, and both of them have multiple sort of years that are going to be covered. So what we're going to do is we're going to take the results and give them the

**[00:41]** coordinates and bind those two things together, and then we're going to be able to look at the results within a spatial context. So, the first thing that we're going to do is we're going to load in the. that has the spatial data. Now we're going to be doing this with a delimited text layer, but you could also do this with a shape file. That's um the shape file doesn't necessarily have the latitude and longitude coordinates spelled out, but you will be able to add um non-spatial data to that shape file. But for today we're doing a delimited text layer. So we're getting pretty used to this now. We're going to add in the provincial Water Quality Monitoring Network

**[01:18]** stations. So let's take a look at that. Latitude longitude has come up great. Our, our, um, classic CRS there, uh, so we're just gonna click add. OK, great, so there's all our stations, you kind of see the outline of southwestern Ontario there. Let's go ahead and add a um base map, and Google Maps here. OK, we can sort of zoom in and see where those stations are relative um to places that we know, things like London and where those green dots are where

**[01:51]** all those um stations have are located and the samples that are being taken there. OK, great. So, let's take a look at the attributes table for the station's data. So we've got latitude, longitude, we've got the name of the station, we've got the description, we've got the first year it was sampled, last year it was sampled, total number of years that it's been sampled, um, and then we've got this station ID here, OK, and that's a unique code that is also found in the results table. So when you're gonna do some sort of a spatial drawing,

**[02:24]** you need some sort of common thread, uh, between them. In this case it's this unique station ID within the attributes table, OK? So let's add in the results data. Limited text layer. OK, this is the data from 2024. Now, this is interesting, there is no. X and Y field hasn't automatically populated because there is no um spatial data associated with that file. So in this case we're gonna go no geometry. It means it has no spatial

**[03:01]** data attached. You can still add it into QGIS, but there's no, there's no spatial data sitting in there that we, that we need. OK? So let's click add. Clothes, um, and let's take a look at the attributes table there. It's a big data file, so it's got a uh all of the sampling that's been going on and let's just look at the. Uh, all of a sudden it's going on in 2024, so it's starting in sort of

**[03:36]** February going all the way to December. So there's quite a lot of, um, samples in there. Now, where do we see that? Ah, OK. Collection site holds that unique ID. So this is one thing, um, sometimes in these data sets they won't have the exact same name for the column that holds that information, so you have to take a look out for that. Um, but in that case, the collection site is the station ID, um. Here we have, OK, what uh what they were actually measuring is over here is the analyt, so pH nitrate, and then the results are here. And then

**[04:13]** the units um will be in the next column and um here it's it's whether or not it was detected or if BDL is below the detectable limit as well. So we've got kind of all this information, the date, the time that it was collected, so we've got a lot of information in there and we want to join that to the collection site data. Now there's a lot of different analyts in here. You know, it actually probably crash our QGIS. We tried to bind all of them. So we're actually going to focus on phosphate, specifically on phosphate because that's something that we have a problem with here, typically from things like

**[04:51]** agricultural runoff, leading to high nutrient. in the freshwater systems and then causing mutrification or sort of typically then um algal blooms that lower the quality of the water. So we're going to focus just on phosphate and to do that we're going to filter as we normally have. OK, we're going to take the annule. We're down there equals now we can use analyt just press all. And we're gonna search for phos. OK, there we go, there's phosphate, so

**[05:27]** we're gonna click on that. So, similar to what we've done before in terms of filtering, um, let's test that. Great, OK, so there are about 3600 measurements of phosphate in our data set. Look OK. Now we're going to combine the data set um to the spatial data of the station. So in order to do that, we click on the vector layer, right click. Go to properties OK. The joins. It's down the list here. At, so we've got the provincial water

**[06:06]** quality monitoring network data, that's what we want to join it to. So that's the only other data set we have here, so it's automatically loaded it. Um, the join field on the target field, which is the vector data is station. Remember, like I was saying, that was collection site otherwise. So we're gonna add that in. Um, and then we're going to essentially add the rest of the data. So this will, will look at these two common columns, join them together, and give us a data set. OK, great. So let's click apply.

**[06:42]** OK. And now we can go into the attributes table here. And we can see wherever there has been a match, so for example, this station here, there has been a match, and because of that it has brought over that data here for us, OK, so we can see that that's actually joined to that data set and has and has. Across. Now if we kind of sort here, we can see that there's a number of different data sets, uh sorry, a number of different stations that have brought over the, uh, brought over and joined that data. So

**[07:19]** now that data is all together. So what we're going to do here is we're just going to change the symbology. OK, and we can take a look at, uh, we're just gonna do categorized for a second here. We're gonna look at that, um, the results that have come in here, the results that have come in have, uh, come in as text values, and I'll show you why in a second, because we do have a value here that includes a less than, so it's less than 0.003 that was detected. So that's why we're getting, uh, a text value there, but that's something we're gonna deal with in

**[07:52]** terms of making those values numeric a little bit later. You can click apply. OK. And we can see all of um stations, so let me just turn off that other one for us, uh, if we open this up. We can see that we've got these, these are stations that haven't did not record any values for phosphate. We'll just turn those off. Now we can see all the stations that measured phosphate here and are currently active and what levels their phosphate were. All right, so that's how we can do a bit of a

**[08:28]** spatial join. We've got that data connected. We've connected the results into the locations of the stations.
