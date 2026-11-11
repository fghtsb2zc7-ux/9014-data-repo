---
title: "QGIS - Adding a delimited text layer"
tool: qgis
duration: "03:03"
content_id: 81f3f567-2270-4bba-a44e-9727b7423f24
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=81f3f567-2270-4bba-a44e-9727b7423f24&revisionId=latest
---

# QGIS - Adding a delimited text layer — transcript

Duration 03:03. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Newer QGIS install (no SCP menu), empty "Untitled Project — QGIS"; status "Ready".
- **[01:02]** "Data Source Manager | Delimited Text" (opened via `Layer > Add Layer > Add Delimited Text Layer...`). Left list: Browser, Vector, Raster, Mesh, Point Cloud, Delimited Text, GeoPackage, GPS, SpatiaLite, PostgreSQL, MS SQL Server, Oracle, Virtual Layer, SAP HANA, WMS/WMTS, WFS / OGC API - Features. Fields: File name (empty, "..." browse button), Encoding "UTF-8"; File Format: "CSV (comma separated values)" (selected), "Regular expression delimiter", "Custom delimiters"; "Record and Fields Options" (collapsed); Geometry Definition: "Point coordinates" (selected), "Well known text (WKT)", "No geometry (attribute only table)", X field, Y field, Z field, M field, "DMS coordinates" checkbox, Geometry CRS "EPSG:4326 - WGS 84"; Layer Settings; Sample Data; message "Please select an input file"; buttons Close, Add (greyed), Help.
- **[01:12]** File dialog "Choose a Delimited Text File to Open": path Paul Mensink > OneDrive - The University of Western Ontario > Teaching > EnvrSust 9014 > 2026-2027 > NPRI data; files NPRI-INRP_DataDonnées_2024, NPRI-INRP_GeolocationsGeolocalisation_1993-present (selected), NPRI-INRP_IndustryIndustrie_Air_2015-2024, NPRI-INRP_ReleasesRejets_1993-present; type filter "Text files (*.txt *.csv *.dat *.wkt ...)"; Open.
- **[01:22]** File name now `C:\Users\pmensin\OneDrive - The University of Western Ontario\Teaching\EnvrSust 9014\2026-2027\NPRI data\NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv`; X/Y empty; message "X and Y field names must be selected". Sample Data columns: "Year of last filed report / Ann�e de d�claration la plus r�cente" (123 Integer (32 bit)), "NPRI ID / ID INRP" (123 Integer (32 bit)), "Company Name / Raison Sociale" (abc Text (string)); rows "1994 4636 ICI SUPERIOR EXPLOSIVES - CONISTON SITE", "1994 4638 Teledyne Harfac". (Accented characters display as replacement symbols.)
- **[01:32]** Field dropdown open listing all columns (... Physical Land Survey Description, National Topographical Description, Latitude / Latitude (highlighted), Longitude / Longitude, Datum / Datum, NAICS Code / Code SCIAN, ... Census Division, Economic Region, Ecozone, Major Drainage Area ...).
- **[01:52]** X field = "Longitude / Longitude", Y field = "Latitude / Latitude", Geometry CRS "EPSG:4326 - WGS 84"; Add button enabled.
- **[02:12]** Add clicked (dialog then closed).
- **[02:32]** Layers panel: "World Map" and point layer "NPRI-INRP_Geolocations..." ; grey facility points across Canada; World Map being dragged below the point layer.
- **[02:52]** Right-click on the NPRI layer: Zoom to Layer(s), Zoom to Selection, Show in Overview, Show Feature Count, Show Labels, Copy Layer(s), Rename Layer, Duplicate Layer, Remove Layer..., Move to Bottom, Open Attribute Table (highlighted), Filter..., Change Data Source..., Set Layer Scale Visibility..., Layer CRS, Export, Styles, Add Layer Notes..., Properties...

## Transcript

**[00:06]** All right, so we can add shape files, which are kind of these prepackaged spatial data files that have kind of database files in behind them, and then we've got the, the factor data with them, so points, lines and polygons. You can do that by just navigating to your browser uh here and going to wherever you downloaded them. One of the things I want to talk about here is adding CSV files that have coordinates in them. Uh, so, they're not a shaped file, so QJS doesn't recognize them yet, you need to add them as a delimited text layer. We'll be doing this quite a lot. A lot of the openly available data

**[00:42]** we have is gonna be in this format of CSV with normally latitude and longitude coordinates. So, really easy to do, uh, but pretty common thing that we're gonna be doing. So, we're gonna go up here, select layer, to add layer, add delimited text layer. We're gonna go navigate and find where that file name is. So, we're gonna go over here uh with the MRI data that we downloaded. The geolocations for our different facilities can be found here in this data set that you downloaded. So just open that up, OK? Now, it's gonna say

**[01:22]** that we've got point coordinates here. It needs to know which field is the X and which field is the Y. So, when we scroll down, we've got a lot of different um columns, obviously in, in the MRI. data set, which is one of the reasons we choose it to kind of work through with our data. Um, so our X field, that's going to be our longitude. You think about this kind of going east west on our X, Y field is going to be our latitude. So that's kind of going north south. Just normally, In a, in a kind of a regular data set that doesn't have a kind of somewhat ambiguous longitude latitude, it will

**[02:01]** automatically find it. So, if it's called lat long, it will automatically load that for you, um, and it shouldn't be a problem, uh, because they, because they have the slash here, that's why it's not automatically detecting it. We're in 4326 here, which is that kind of global projection, so we'll leave it there for now. Now, this is gonna be all the different locations over time, so there's gonna be a lot. OK. So there we go. You can obviously because of the detect the shape of Canada here. Let's put our world map underneath, shift that down, and now we've got that, uh, vector data. So now this is his point data as it's come in

**[02:39]** because it has those point coordinates. So, really easy way for us to take CSV files that have latitude longitude coordinates, um, and just add them into QJS and then we can work through them from there. So, if we go look at the attributes table. Right, it's got all that information in there, including that latitude and longitude, but we can now work with it inside of QGIS.
