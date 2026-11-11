---
title: "QGIS - Saving working layers to geopackages"
tool: qgis
duration: "05:03"
content_id: dbb0c014-7939-4619-a2bc-0b74665ddea7
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=dbb0c014-7939-4619-a2bc-0b74665ddea7&revisionId=latest
---

# QGIS - Saving working layers to geopackages — transcript

Duration 05:03. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]–[01:02]** Layer "wtrshter" (Ontario tertiary watersheds, red) with the merged Thames River watershed shown in yellow (selected); status bar EPSG:4269.
- **[01:12]** "Select Features by Area or Single Click" tool active on the Selection toolbar.
- **[01:22]** Watershed clicked; status "1 feature selected on layer wtrshter (Thames River Watershed)."
- **[01:32]** "Save Vector Layer as..." dialog (right-click > `Export > Save Selected Features As...`): Format "GeoPackage"; File name (empty); Layer name "wtrshter"; CRS "EPSG:4269 - NAD83"; Encoding UTF-8 (greyed); "Save only selected features" checked; field table OBJECT_ID (Integer64), DESCR (String), GUT_NUMBER (Integer), LABEL, IDENT, NAME (String) all ticked; "Use aliases for exported name", "Replace all selected raw field values by displayed values" unticked; "Persist layer metadata" checked; Geometry type "Automatic"; "Add saved file to map" checked.
- **[01:42]** "Save Layer As" file dialog at ... > Topic lessons > Topic 7; Save as type "GeoPackage (*.gpkg *.gpkg.zip *.GPKG *.GPKG.ZIP)".
- **[01:52]** File name `...\Topic 7\thames_river_watershed.gpkg`; Layer name still "wtrshter".
- **[02:02]** Layer name changed to `thames_river`; OK.
- **[02:12]** Green message bar "Layer Exported: Successfully saved vector layer to C:\Users\pmensin\OneDrive - The University of Western Ontario\Teaching\EnvrSust 9014\2026-2027\Class materials\Topic lessons\Topic 7\thames_river_watershed.gpkg"; new layer "thames_river_watershed — thames_river" (grey polygon); wtrshter unticked.
- **[02:32]** "Data Source Manager | Delimited Text": File name `...\Topic 7\PWQMN_Stations.csv`; CSV; X field "LONGITUDE", Y field "LATITUDE" (auto-filled); Geometry CRS "EPSG:4326 - WGS 84"; sample columns STATION (Integer (64 bit)), NAME, DESCRIPTION (Text), LATITUDE, LONGITUDE (Decimal (double)), STATUS; first row "03007703502 Uxbirdge Brook Davis Drive, Uxbridge Twp, 44.13775764 -79.11259961 A".
- **[02:42]** "PWQMN_Stations" point layer across southern Ontario.
- **[03:02]** "Vector Overlay - Clip" dialog: Input layer "PWQMN_Stations [EPSG:4326]"; Overlay layer "thames_river_watershed — thames_river [EPSG:4269]"; Clipped "[Create temporary layer]"; "Open output file after running algorithm" checked; Run.
- **[03:12]** Processing Toolbox search `clip` (Vector overlay > Clip); temporary layer "Clipped" shows only stations inside the watershed; PWQMN_Stations unticked.
- **[03:32]** Clipped renamed in the Layers panel to `pwqmn_station_thames`.
- **[03:42]** Right-click on pwqmn_station_thames: menu includes Make Permanent..., `Export > Save Features As...` (Save Selected Features As... greyed, Save as Layer Definition File..., Save as QGIS Layer Style File...).
- **[03:52]** "Save Vector Layer as...": Format GeoPackage; File name the same `...\Topic 7\thames_river_watershed.gpkg`; Layer name `pwqmn_station_thames`; CRS "EPSG:4326 - WGS 84"; fields STATION (int8), NAME, DESCRIPTION (string), LATITUDE, LONGITUDE (double), STATUS (string); OK.
- **[04:02]** New layer "thames_river_watershed — pwqmn_station_thames".
- **[04:22]** All layers removed ("5 legend entries removed."); gpkg dragged in → "Select Items to Add | thames_river_watershed": path `...\Topic 7\thames_river_watershed.gpkg`; items pwqmn_station_thames Point (97), thames_river MultiPolygon (1), thames_river_watershed MultiPolygon (1), wtrshter MultiPolygon (1); Select All / Deselect All / Options; "Add Layers".
- **[04:32]–[04:52]** Layers panel: group "thames_river_watershed" containing pwqmn_station_thames and thames_river_watershed (two items chosen); status bar EPSG:4326.

## Transcript

**[00:06]** All right, so in a previous video we successfully merged the Upper Thames River watershed with the Lower Thames River watershed to make a single vector feature that has the entire Thames River watershed within it. Um, now we're going to try and export just that feature layer. So before, basically we had the um edit feature on, when I turned off the editing, it prompted me to save that. So it has saved this merged sort of um vector features in the new shape file, but we're going to export just those. Vector features as a

**[00:46]** um as a what's called a geo package we've been working a lot with shape files that's really good because they're open access they're the files we deal with most often they're we wanna understand their structure and everything like that so that's really good but when you're doing things for your own projects you can either save things as shape files which are single layers or you can save them as geo packages so I'll just show you how we can do that. So to select a feature, you can just use this um button here. You can click on any feature that you want, but we're gonna we're gonna click on our um combined watershed that we created, right click. Export

**[01:27]** Save selected features as, OK. Here's the layer name, here's the CRS we're gonna save it as a geo package which you can access from the dropdown button. Remember we've been doing some CSV things and shape files, so we're gonna use the geo package, we're gonna click on that, it's gonna bring up our browser window, I'm gonna save it as the Thames River uh watershed and just click on save. OK. Uh, so now that will save a geopackage there with this layer name. So let's call this the Thames River, um, and that will be the layer name within there, OK? So we're going to click OK, yay, OK, so now we can see that we have

**[02:08]** in that file that layer name is there, so that's great. So when we unclick that, we've got just now that single feature in a layer on its own. Let's go ahead and add the provincial water quality monitoring network stations from add layer, add delimited text layer. Gonna go down and add our station data. OK, latitude, longitude have auto populated there, click OK, click close. OK, awesome. So one of the things I want to do here, here's all of our stations, but I want to clip it to the stations that are just found um within

**[02:44]** the um kind of Thames River watershed that we've created. So, we know how to do that from our previous video, we can go to clip. We're gonna skip the spatial index now because we don't have huge files. The input layer is gonna be those stations, and we're gonna, the overlying layer is gonna be the the Thames River watershed we just created. Like run, we've got a new clipped layer here, we turn that off, it's only the ones that are located within the uh Thames River watershed. OK, so now we've got a couple of different layers, we've got our Thames

**[03:18]** River watershed polygon layer, and we've got this clipped, um, sort of points. So let's rename this, just so it's clear. Uh, provincial water quality monitoring station. Station, and we'll call that Thames. OK, great. So, now what we want to do is we're going to add that to our geo package. So we're going to right click, OK, we're going to export, we're going to save features as, we're going to go to our um file name, we're going to go down and select our geo package, OK? And then we're just going to, we have given it this new layer name. Um, and so what we're going to do is just

**[03:56]** click OK. And now that has saved that layer in there, OK? So let's go down, we're gonna, we're gonna remove everything. OK, and we're just going to load in that new layer that we created, so here's that geopackage that we created, let's go ahead and just drag and drop that in there. OK, and we can select the items that we want to add to it, so we can say uh this one and this one are the ones that we want, we can go add layers. Great, OK, and now we've got those layers back there um within our um QGIS so we can,

**[04:39]** we can manipulate them just as we always can, and they're just kind of stored within that one geo package. So, an easy way to save multiple manipulated layers into one file. Alternatively, you can save them into separate shape files, but this is a way that if you've got lots of different layers, you can save them, store them. The geo package load everything back up and and go from there.
