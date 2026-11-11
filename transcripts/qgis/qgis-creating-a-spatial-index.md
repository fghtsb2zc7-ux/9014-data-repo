---
title: "QGIS - Creating a spatial index"
tool: qgis
duration: "01:54"
content_id: 891486b2-4283-4447-a784-982602ee286a
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=891486b2-4283-4447-a784-982602ee286a&revisionId=latest
---

# QGIS - Creating a spatial index — transcript

Duration 01:54. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:42]** File Explorer `OneDrive > Class materials > Topic lessons > Topic 7`: folders `ansi`, `ELC`, `lhy_000c16a_e`, `lpr_000b16a_f` (selected), `municlow`, `OGDE_INDIANRE`, `Ontario waterways`, `SOLRIS_Version_3...`, `wetlandu`, `woodarea`; files `buckthorn_updated`, `PWQMN_data_2024`, `PWQMN_Stations`. Status bar `EPSG:3347`.
- **[01:02-01:12]** Layer `lpr_000b16a_f` (Canadian provinces/territories, tan) drawing; Arctic coastline still rendering (progress bar in status bar).
- **[01:22]** Processing Toolbox open (search box still contains an earlier `clip` search; the instructor then searches for the spatial index tool, not captured).
- **[01:32]** Dialog "Vector General - Create Spatial Index", Log tab: "QGIS version: 3.44.13-Solothurn", GDAL 3.13.2, PROJ 9.8.1; "Algorithm 'Create spatial index' starting..."; Input parameters `{ 'INPUT' : 'C:/Users/.../Topic lessons/Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp' }`; "Execution completed in 0.32 seconds"; Results `OUTPUT: lpr_000b16a_f_...` (the same layer, no new layer added).
- **[01:42-01:52]** Map redrawing province by province - rendering is still slow (index does not speed rendering).

## Transcript

**[00:05]** Alright, so this week we're gonna be working with very large spatial data sets, and uh sometimes it's helpful to create what's known as a spatial index. We have large data sets, and that allows us to process that data much faster than we would without a spatial index. So, very short video here, we're gonna load in a layer, and then we're gonna set up um a spatial index for it, and that will, Help QJS understand where that layer is, and then when it's relating to other layers, it makes it a bit easier for it to complete that processing. So I'm just going to open up our file here in topic seven. This

**[00:42]** is the provincial boundary files here. I'm just going to grab that and pull and put that in. Uh, OK, so you can see that that's loaded our provincial boundary layers. It is taking some time, you can see down the progress bar down at the bottom, it's taking some time to do that, because up in Northern Canada here we have this really intricate coastline, so, um, Because that's so detailed, it it takes time for that to render. Certainly not very hard to uh render some of the prairie provinces in here, but when we've got these really detailed coastlines, it takes a little bit of time. OK. Uh, so all we're gonna

**[01:16]** do now to create a spatial index for this kind of large vector data set, go to the geoprocessing toolbox, OK? We're gonna go spatial, create spatial index. It's very simple. We just uh include the input layer, click run. Done. So that sets up our spatial index and it means that when we're going to be completing any processing on that data set, um, it will be easier for it to complete that processing. It doesn't help with the rendering, as you can see here, it's not that it's going to speed up the rendering process, but it is

**[01:50]** actually going to help when we're doing our processing.
