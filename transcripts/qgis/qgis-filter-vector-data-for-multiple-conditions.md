---
title: "QGIS - Filter vector data for multiple conditions"
tool: qgis
duration: "06:00"
content_id: 86b95952-6b3d-41b9-8564-fd460b460c3c
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=86b95952-6b3d-41b9-8564-fd460b460c3c&revisionId=latest
---

# QGIS - Filter vector data for multiple conditions — transcript

Duration 06:00. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Empty QGIS project, EPSG:4326.
- **[00:22]** "Data Source Manager | Delimited Text" with "Choose a Delimited Text File to Open" browser at ".../EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > NPRI data" listing NPRI-INRP_CommentsCommentaires_1997-present, NPRI-INRP_DataDonnées_2024, NPRI-INRP_GeolocationsGeolocalisation_1993-present, NPRI-INRP_IndustryIndustrie_Air_2015-2024, NPRI-INRP_ReleasesRejets_1993-present.
- **[00:32]** File name ...\NPRI data\NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv; Encoding UTF-8; File Format "CSV (comma separated values)"; Geometry Definition "Point coordinates", X field "Longitude / Longitude", Y field "Latitude / Latitude", Geometry CRS "EPSG:4326 - WGS 84". Sample Data columns "Year of last filed report / Année de déclaration la plus récente" (123 Integer (32 bit)), "NPRI ID / ID INRP", "Company Name / Raison Sociale".
- **[00:52]** Points loaded (layer "NPRI-INRP_GeolocationsGeoloca..."); "Search NextGIS QMS" panel with Google Maps, Google Roads, Google Terrain, ESRI Gray (light), ESRI Ocean; "ESRI Gray (light)" added below the points.
- **[01:02]** Right-click on layer: context menu Zoom to Layer(s), Zoom to Selection, Show in Overview, Show Feature Count, Show Labels, Copy Layer(s), Rename Layer, Duplicate Layer, Remove Layer..., Move to Bottom, Open Attribute Table, **Filter...** (highlighted), Change Data Source..., Set Layer Scale Visibility..., Layer CRS, Export, Styles, Add Layer Notes..., Properties...
- **[01:12]** "Query Builder": "Set provider filter on NPRI-INRP_GeolocationsGeolocalisation_1993-present (provider: delimitedtext)". Panels "Fields" (123 Year of last filed report..., 123 NPRI ID / ID INRP, abc Company Name / Raison Sociale, abc Facility Name / Nom de l'installation, abc Address line 1..., abc City / Ville, abc Province / Province...), "Values" (Search box, Sample, All buttons, "Use unfiltered layer" checkbox), "Operators" (= < > LIKE % IN NOT IN / <= >= != ILIKE AND OR NOT), "Provider Specific Filter Expression" ("Enter a QGIS expression to filter the layer"); buttons OK, Test, Clear, Save..., Load..., Cancel, Help.
- **[01:32]** Expression `"Province / Province" = 'ON'`; Values list (All) shows NULL, AB, BC, MB, NB, NL, NS, NT, NU, ON. "Query Result" popup: "The where clause returned 4394 row(s)." OK.
- **[01:52]** Map filtered to Ontario; expression `"Province / Province" = 'ON' ` (cursor after, about to add AND). Fields list scrolled: Latitude / Latitude (1.2), Longitude / Longitude (1.2), Datum / Datum, NAICS / Code SCIAN, NAICS Code Title (English) / Titre Code..., NAICS Code Title (French)..., Key Industrial Sector Code..., Key Industrial Sector (English)...
- **[02:12]** `... = 'ON'  AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)"`; Values (All) list: Ball and roller bearing manufacturing, Battery manufacturing, Battery Manufacturing, Beef cattle slaughtering, Boat Building, Breakfast Cereal Manufacturing, Breakfast cereal manufacturing, Breweries, Broad-Woven Fabric Mills, Bulk liquids trucking, local.
- **[02:22]** `... AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)" = 'Breweries'`; Test clicked; map shows a handful of points in southern Ontario (transcript: 8 rows).
- **[02:52]** Editing first clause: `"Province / Province"  'ON'  AND "NAICS Code Title (English) / Titre Code SC...` with pointer on IN button.
- **[03:12]** `"Province / Province"  IN  ('ON', ) AND ...`
- **[03:32]** `"Province / Province"  IN  ('ON', 'AB')  AND "NAICS Code Title (English) / T...`; Values list only shows "ON" because the layer is already filtered ("Use unfiltered layer" unticked) — 'AB' typed manually.
- **[03:52]** After Clear: expression restarted with `"Province / Province"`; map back to all of Canada.
- **[04:12]** `"Province / Province" IN ('AB','ON')`; Values list shows all provinces again.
- **[04:32]** Accidental `') AND 'Breweries'"NAICS Code Title (English) / Titre Code SCIAN (Anglais)"` (value inserted before field).
- **[04:42]** Corrected: `...rovince / Province" IN ('AB','ON')  AND "NAICS Code Title (English) / Titre...` then `... = 'Breweries'`; Test clicked (transcript: 10 rows).
- **[05:12]** `AND "NAICS Code Title (English) / Titre Code SCIAN (Anglais)"  != | 'Breweri...` — `=` replaced with `!=` (does not equal).
- **[05:32]** Test with != : map fills with many Ontario/Alberta points.
- **[05:52]** Final view of `... "NAICS Code Title (English) / Titre Code SCIAN (Anglais)"  != 'Breweries'` in the expression box.

## Transcript

**[00:05]** In this video, we're going to cover how we can filter vector data for multiple conditions. So, um, we're just going to load in our delimited text layer, so layer, add layer, add delimited text layer, we're going to go grab the NPRI data set with the geolocations. I'm going to assign the latitude and the longitude. OK, we've got 4326, that's good. We'll add that. OK, excellent. Um, so let's put a bit of a base map on there. OK, so we can do our as we like one again.

**[00:51]** OK, so we'll get that loading. Um, great. OK, so what we're gonna do now is we have already learned how to do a bit of filtering with the filter expressions. We're gonna introduce a few more operators here that allow us to, uh, kind of be more refined in our filtering. So I'm just gonna, uh, see if I can get this a little bit bigger for you. OK, so let's say we wanna look at um industries in a particular province, OK, so what we did before, we did province. All we can select um equal to Ontario, OK? And that will limit all of the um

**[01:34]** All of the facilities to Ontario, but let's say we want to get something that's in Ontario, but also is this a specific industry. So let's go down to Um, our, sorry, our, um, next code that we had in English, but right now what we're gonna do is we're gonna add in the and, um, operator, OK, so this is we want in Ontario and we want the, um, specific industry. So we're gonna click on that industry we're gonna say what are all the industries that we can access and we can. Scroll down and OK, let's look, breweries is a is a good

**[02:14]** one. so we want to say equal to um breweries. So this will give us all of the breweries in Ontario that um are registered on the NPRI data set. OK? OK, so now we can see there's 8 rows that are in Ontario that are um are that are registered on that data set. But let's say we're not just interested in Ontario breweries, but we want to know um in other provinces as well. So equals uh to in in this um expression means has to be equal to Ontario, but we can actually change that. To something called in and this is

**[02:53]** referred to as in the set of and we'll see this later in R as well so very similar um sort of terminology there in syntax and now we just have to put any province that we want inside brackets so um I just put a comma to separate those arguments. I go back up to province, OK. Um, and oh, sorry, because that's we've already filtered our our data set there, so I can just manually put in. A B for Alberta, um, and that will take Alberta and Ontario and any breweries

**[03:34]** that we have there. OK, so I'll just move this and you can see we've had a brewery pop up in Alberta now. So, uh, if you want to start that kind of from scratch, let's clear all this, OK? And I can take my province, and then I can do in, and then I can do province all, and I can select, OK, Alberta, and I'll do then Ontario. OK, so you still have to go in and kind of manually add. Ah, the brackets and put the column to separate the arguments in there, but this will

**[04:10]** say anything in Alberta and Ontario. I will do and then I'll go down to our code in English here. We'll go back down to our breweries again. uh oh whoops, sorry. Of course I have to put in the uh code first, get rid of that accidental breweries that I added, and I want that equal to. Um, breweries. OK. So that will give us any, any breweries that are in the

**[04:46]** province of Alberta or Ontario. Again, we've got our 10 rows again. OK. So, lots of options there in terms of being able to extract data, new data sets and filter them from that vector data. We've got things like this here, which is does not equal, so we can say, OK, we want everything, let's say, in Alberta and Ontario that is not a brewery. And that should be fairly large data set because that's everything else that's not a brewery so you can use that to say it does not equal this again we talked about our

**[05:23]** numeric operators before we can have greater than and less than or greater than or equal to in terms of years and things like that. Um, or you might want to have something where it will return both of those things, um, so you could do a kind of a wider expression that would say you want A and you want B at the same time, so it's either or within that data set. Um, so quick ways to, to kind of reduce your data, focus in on a topic of interest and do that within the vector filtering expressions.
