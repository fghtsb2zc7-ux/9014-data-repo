---
title: "QGIS - Base maps"
tool: qgis
duration: "02:56"
content_id: fa1824b8-e200-4540-b7d1-2ef7749112f1
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=fa1824b8-e200-4540-b7d1-2ef7749112f1&revisionId=latest
---

# QGIS - Base maps — transcript

Duration 02:56. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Empty project; Browser has "XYZ Tiles" expanded (Bing VirtualEarth, CartoDb Dark Matter, CartoDb Positron, dsf, Esri Boundaries Places); status bar EPSG:4326.
- **[00:42]** Cursor clicks the third QuickMapServices globe icon on toolbar row 2 (Search QMS).
- **[00:52]** "Search QMS" panel docked on the right: search box "Search string..." (tooltip "Enter part of service's name"); "Last used:" Google Maps, ESRI National Geographic, ESRI Satellite (ArcGIS/...), each labelled "TMS details, report a problem" with an "Add" button; "Filter by extent" / "All" dropdown; "Download geodata for your project" link at bottom.
- **[01:12]** "Google Maps" added (Add button): layer "Google Maps" in Layers panel; world map in Google style; status bar now "EPSG:3857" (project CRS switched to Pseudo-Mercator).
- **[01:22]** Zoomed to south-western Ontario showing roads and towns (Sarnia, London, Toronto).
- **[01:42]** Layer removed (right-click > Remove Layer); status "1 legend entries removed."
- **[01:52]** "ESRI Satellite (ArcGIS/World_Imagery)" layer added: satellite imagery of Great Lakes.
- **[02:12]** Search box contains `ESRI`; results: ESRI, ESRI Boundaries&Places, ESRI Gray (dark), ESRI Gray (light), ESRI National Geographic (two entries), ESRI Ocean, ESRI Physical, ESRI Reference Overlay, ESRI Satellite (ArcGIS/..., ESRI Shaded Relief, Esri Shaded Relief, ESRI Standard, ESRI Terrain, Esri Transportation, ESRI World Hillshade, Esri World Imagery.
- **[02:32]–[02:52]** "ESRI Ocean" layer added (replaces satellite): shaded bathymetry along the Atlantic coast and continental shelf; EPSG:3857.

## Transcript

**[00:07]** So, here we're gonna talk about base maps, and base maps are really helpful for displaying your data with some context to where those data are actually located. So, uh, we don't do a lot of analysis necessarily with base maps, but it's more to provide kind of a frame of reference. So, something that we downloaded, uh, earlier was Quick map Services. So, that was back, um, in the intro to Uh, QGIS. So if you, if you, if you don't have that up here, then you should go back to that video and add it. Uh, if I click on this, uh,

**[00:44]** well, we can go search QMS and we get a search box that pops up here, OK? QuickMap Services allows us to look for a number of different base maps that might be helpful for us to display our data. For example, you can search in here, so I've, I've previously used Google Maps. So, let's add that. Boom, it'll add a layer for us. And you can see, remember, we're we're down in that pseudom Mercator projection, so that kind of one that stretches the world out a little bit. So, that's what, um, that's why we're seeing it like this. OK, so you can see now when we zoom in.

**[01:20]** But lots of information, um, Google Maps. This, this is kind of a lot of information, but if, if the road network is potentially relevant to the analysis that you're conducting, Google Maps is actually potentially a really good option. That shows up as um a layer over here. So we're just going to remove that layer now. So right click and remove layer, uh, and then why don't we just add the uh Ezri satellite one as well. Great. So, now we've got a different base map. It doesn't, uh, necessarily have the road infrastructure established or the population centers,

**[01:56]** but gives us an overnight, uh, overview, uh, from satellites. So, yeah, so, so there's a lot of different base base maps that you might be able to use. Let's just look at, uh, Ezri creates quite a, quite a lot of them. Uh, so you can see here, there's a lot of different options for you. So make sure that when you're choosing a base map for your analysis, that you want to choose something that's relevant. So, let's say we're doing some ocean work, that's that in the Ezri ocean. Cool. So now we have shaded bathymetry. All along um the, the coast here, OK, so the continental shelf, we can see

**[02:36]** the Mid-Atlantic Ridge. So, that's one that would be really good for showing things like satellite tracks of sharks, which we're gonna be talking about in lesson number 2. So, Quick map services, a really good way to get base maps loaded in, lots of different options for you, but make sure you align that um with the data that you're working with.
