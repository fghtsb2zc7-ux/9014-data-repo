---
title: "QGIS - Basic filter in QGIS"
tool: qgis
duration: "02:15"
content_id: b40f2799-0b65-43fd-87f6-de61428320c5
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=b40f2799-0b65-43fd-87f6-de61428320c5&revisionId=latest
---

# QGIS - Basic filter in QGIS — transcript

Duration 02:15. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Newer QGIS install (no SCP menu) with "World Map" loaded, North America in view.
- **[00:42]** `Layer > Add Layer > Add Delimited Text Layer...` (Ctrl+Shift+T) highlighted. This install's Add Layer submenu also lists Add WFS / OGC API - Features Layer..., Add Point Cloud Layer..., Add GPX Layer..., Add Layer from STAC Catalog...; Layer menu includes Georeferencer...
- **[00:52]** "Data Source Manager | Delimited Text" with the NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv path; X field dropdown open, "Longitude / Longitude" highlighted.
- **[01:02]** Point layer "NPRI-INRP_Geolocations..." added above World Map (purple points).
- **[01:12]** "Query Builder" dialog (from right-click > Filter...): header "Set provider filter on NPRI-INRP_GeolocationsGeolocalisation_1993-present (provider: delimitedtext)". Fields list: 123 Year of last filed report / Ann�e de d�claration la plus r�cente; 123 NPRI ID / ID INRP; abc Company Name / Raison Sociale; abc Facility Name / Nom de l'installation; abc Address line 1 / ...; abc Address line 2 / ...; abc City / Ville; abc Province / Province; abc Postal Code / Code postal; abc Physical Land Survey Description / ... . Values panel: Search box, "Sample" and "All" buttons, "Use unfiltered layer" checkbox. Operators: `=` `<` `>` `LIKE` `%` `IN` `NOT IN` `<=` `>=` `!=` `ILIKE` `AND` `OR` `NOT`. "Provider Specific Filter Expression" box ("Enter a QGIS expression to filter the layer"). Buttons OK, Test, Clear, Save..., Load..., Cancel, Help.
- **[01:22]** Year field double-clicked into the expression box; "All" pressed: Values list shows 2011 ... 2022.
- **[01:32]** Values scrolled to 2014 ... 2025.
- **[01:42]** Expression reads `"Year of last filed report / Ann�e de d�claration la plus r�cente" = 2025`; OK clicked.
- **[01:52]–[02:12]** Map now shows only a few dozen facility points (BC, prairies, southern Ontario/Quebec); a filter icon appears to the right of the layer name in the Layers panel.

## Transcript

**[00:06]** All right, so we're just gonna go through the process now of learning how to filter our vector data. So, filtering is a really important skill. As soon as you get your data, especially when we're dealing with MPRI data, there's a lot of it. So we're trying to maybe filter that down. Um, there's substances, there's facilities, there's years. So, we want to try and kind of filter that and get into a manageable size or of an area that we're trying to focus on. Filtering across our QGS and Excels really straightforward, but a really important skill to have. So I'm just gonna quickly add our Delimited text layer as we've done before. OK. So let me go

**[00:44]** find that in the NRI data set. OK, so let's do our geolocations again. Remember, we've got to set our latitude and longitude is not automatically recognizing those. OK. Now we've got a data set there. All right. So, all we have to do is right click on the actual vector layer, go to filter. OK. Let's do year, year of last filed report, uh, could be interesting for us, OK? So, let's click on that, uh, and then we're going to ask it to sample that. So we're gonna say, OK, well, we can say all, that will provide us all the years

**[01:22]** in the data set that have uh Um, reported values. So let's say we want to just look at 2025. We go down here, OK, into the filter expression. So this is last year of blast filed report. We just said we want that to be equal to, and that adds a little equal sign down here. 2025. And then we can just click OK. And see, these are the facilities that have a report that was filed in 2025. OK? So it's, it's kind of shrunk that data set down to just be within 2025. There are many different types of filters that we're gonna go through,

**[01:57]** but this is just your basic, simple, straight filter that allow you to select for any uh year or number value. If you say you wanted something greater than 2020, so everything after 2020, you can do that as well. We'll get into some more of that later on, but there's your straightforward filter.
