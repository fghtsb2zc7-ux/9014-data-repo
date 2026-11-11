---
title: "QGIS - ESRI Rest Servers"
tool: qgis
duration: "05:22"
content_id: 491f044a-3e36-42b5-b812-f8ce2bf91243
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=491f044a-3e36-42b5-b812-f8ce2bf91243&revisionId=latest
---

# QGIS - ESRI Rest Servers — transcript

Duration 05:22. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Browser (Edge) at `https://open.canada.ca/data/en/dataset/1439dcb3-82a6-40fd-a9a4-8f045b20ff5b`, "Data and Resources": "Updated Species Distribution Models for Marine Invasive Species Hotspot Identification" listed three times — tags (Dataset, TIFF), (English, Web Service, ESRI REST), (French, Web Service, ESRI REST) — plus "Data Dictionary" (English, French, Guide, PDF); each has an "Explore" button.
- **[00:32]** Top of the open.canada.ca page: title "Updated Species Distribution Models for Marine Invasive Species Hotspot Identification" (Fisheries and Oceans Canada).
- **[00:42]–[01:42]** Cursor on the English ESRI REST resource row.
- **[01:52]** ArcGIS REST Services Directory page listing layers, e.g. "... Styela clava Projection (48)", "Urosalpinx cinerea Projection (49)", "Pacific Projections (50)", "Carcinus maenas Projection (61)".
- **[02:02]** Top of the REST page; address bar `https://egisp.dfo-mpo.gc.ca/arcgis/rest/services/open_data_donnees_ouvertes/updated_species_distribution_models_marine_invasive_hotspot_id_en/MapServer` being copied; breadcrumb "Home > services > open_data_donnees_ouvertes > updated_species_distribution_models_marine_invasive_hotspot_id_en (MapServer)"; "Map Name: Updated_Species_Distribution_Models_Marine_Invasive_Hotspot_ID_EN"; links Legend, All Layers and Tables, Dynamic Legend, Dynamic All Layers.
- **[02:12]** Empty QGIS project (instructor's main install), Browser panel.
- **[02:22]** Dialog "Create a New ArcGIS REST Server Connection": Connection Details — Name (empty), URL (pasted, ends `...updated_species_distribution_models_marine_invasive_hotspot_id_en/MapServer`), Prefix; ArcGIS Portal Details — Community endpoint URL, Content endpoint URL; Authentication — Configurations / Basic tabs; OK greyed until a Name is entered.
- **[02:32]** "MapServer" at the end of the URL highlighted; tooltip "HTTP address of the Web Map Server".
- **[02:42]** Name field being typed: "Marine Invasive ..." (connection later shows as "Marine Invasive Species"); OK enabled.
- **[02:52]** "ArcGIS REST Servers" selected in the Browser.
- **[03:02]** Browser tree under ArcGIS REST Servers: London water, Marine Invasive Species (expanded: (All layers), Atlantic Predictions, Atlantic Projections, Pacific Predictions, Pacific Projections, ... Rasters), Marine Invasives, NPRI ("Connection failed: Network err..."), sedbed, Soil.
- **[03:12]** Species list inside a group: Ascidiella aspersa, Bonnemaisonia hamifera, Botrylloides violaceus, Botryllus schlosser, Caprella mutica, Carcinus maenas, Ciona intestinalis — each appears twice (one with a raster-tile icon, one with a different icon).
- **[03:32]** Carcinus maenas (raster-tile icon entry) double-clicked: layer "Carcinus maenas" with legend "High : 1 - Low : 0"; status bar EPSG:3857; Search NextGIS QMS panel opened.
- **[03:42]** "ESRI Ocean" added below; Carcinus maenas rendered in the service's own purple-to-green colours along the Atlantic coast.
- **[04:02]–[05:02]** Panning around eastern North America.
- **[05:12]** A second species, "Botrylloides violaceus" (High : 1 - Low : 0), added from the same Browser list above Carcinus maenas; tooltip from Advanced Digitizing visible.

## Transcript

**[00:06]** All right, so in this video we're going to talk about how you can use ERES servers to add data to QGIS. More and more now for uh open data availability. Um, providers are using what is called an arrest server. So, um, this is just the homepage of the open data site for the marine invasive species distribution we were working with for the raster data. So you can download the TIFS, which is what I did before, and then provide those to you in bright space, but you can actually also use what is. Called an entry rest server to

**[00:44]** load data into QGIS. Now, the benefit of this is that those are updated all the time. So you, if, if there's some updates or if there's some new species they've added, they would just add it to the rest server and your server would automatically update. So that's good if you want to have the most up to-date data. However, the downside of rest servers is typically they provide you like a rendered map, so it's not something you can manipulate. So if you find something that has an answer your rest server, that's good for possibly providing context or uh something you want to layer on top of or show the

**[01:22]** distribution of something and then you have vector data on top of that, but you can't manipulate it like we have been with vector files um or the raster tips that we were using before, right? It is handy, so I did, I did want to show you how to do it, it's very straightforward, um, so if you go and you see there's Eri Rest there, we'll do the English version, you can go to go to resource. And it brings up this kind of funky metadata page, OK, so there's lots of information about all the different species that are there, all the projections on the Atlantic side, Pacific side. So, um, yeah, so what

**[01:58]** we'll do is you just need to copy this piece at the top. So copy the actual URL. And go back into QGIS OK? On the left hand side in your browser pane, uh, you can scroll down to um uh RGIS rest servers, right click, go new connection. And now you can just copy that URL in there. This little part at the end means it is a map server. It's simply giving you a map. It's not giving you the kind of um vector data or raster data that you can manipulate. So that's

**[02:35]** OK. Uh, so let's go in here and we'll say marine invasive. Species, um, and that's basically all you need to do for now, you just click OK. And then you can open up the arrest servers in your browser window. I have many that I've used before, so you'll see all of those listed. Here's the one that we want, we can open that up. OK? And we have all these different options. You can see that tile means these are all kind of raster files. Um, so let's do our Atlantic kind of predictions again. We can go down to our green

**[03:13]** shore crab, double click on that. And then we'll load that data. It has it in the Veris color scheme here as well. We'll load that data directly into QGIS. OK. Now while we're waiting for that to load, it's downloading that from the server. So let's add our base map, our ocean base map. Then Now you can see that it's come in in pseudomercator, so 3857, that's because that's what it's downloading in the raster file and that was the first

**[03:46]** thing we opened up, um, but you can see that same uh data that we saw before, those um pixels and where they can be found. Now you can't, um, use the raster calculator on this particular file, it just is a rendering of where the distributions are. Now this is again. This is still useful depending on how you want to show your data. This might be something where you would have a vector file for shipping traffic where we can get, um, you know, ballast water can actually

**[04:21]** improve the probability that you're going to see an invasive species in that area. So we've got shipping traffic that's coming over, it's picking up water maybe in Europe, it's coming here, it's dumping it off over here. You might see it in um. You know, a higher probability of seeing uh green shore crab larvae there which would turn into green shore crab adults, so. You can still show all of that and you might have some vector data on top of that, so rest servers are are still good, um, but it's just that when we go to the raster calculator, those layers aren't available to manipulate or anything like that, so you can't filter them in the same way you can when you

**[04:57]** actually have the the raw data, right? So, really easy to bring in files, lots of different options, we can add lots of different species in there, um, and, and again, that's always updated, easy way to get that. If you can get the raw files, those are typically the best, but sometimes the rest servers are the only thing that they make available, so good to know how to bring those into QJS as well.
