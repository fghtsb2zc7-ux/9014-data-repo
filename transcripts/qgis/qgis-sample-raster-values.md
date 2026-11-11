---
title: "QGIS - Sample raster values"
tool: qgis
duration: "05:23"
content_id: 547c3825-1c27-4c5e-89ed-4f9bfde50dc4
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=547c3825-1c27-4c5e-89ed-4f9bfde50dc4&revisionId=latest
---

# QGIS - Sample raster values — transcript

Duration 05:23. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:32-00:52]** Continues the Join-attributes-by-nearest project (status bar `EPSG:26917`): layers `Joined layer`, `Shortest lines`, `Water_Edges`, `Reprojected`, `Buckthorn observations_0`, `Google Road`; Processing Toolbox still showing the `joi` search.
- **[01:12-01:32]** Other layers unchecked, only `Joined layer` (red dots) and basemap visible.
- **[01:52]** File Explorer `Topic lessons > Topic 5`, file `1km17477047610SWOOP2015` selected (the DEM; `.img` in the course zip).
- **[02:02]** Raster added as `1km17477047610SWOOP2015` (grey), legend "Band 1: Layer_1" 233.126663 – 273.100006.
- **[02:12]** "Layer Properties - 1km17477047610SWOOP2015 — Symbology": Render type `Singleband pseudocolor`, Band `Band 1: Layer_1`, Min `233.1266632`, Interpolation Linear, Mode Continuous; Color ramp menu `All Color Ramps > BrBG` chosen.
- **[02:22]** DEM tile (brown = low, teal = high) over London basemap.
- **[02:42]** `Joined layer` moved above the raster; Identify tool active.
- **[02:52]** Identify Results with the raster layer selected: `Band 1: Layer_1` = `236.25375`.
- **[03:12-03:22]** Zoomed in so individual pixels are visible; Identify values `238.50626`, `238.37813` (red square = clicked pixel).
- **[03:32]** Toolbox search `sample ras` -> "Raster analysis > Sample raster values" (also Raster tools > Align rasters, Vector geometry > Drape / Set M value from raster, GDAL Warp, GRASS r.resamp.*, v.sample).
- **[03:42]** Dialog "Raster Analysis - Sample Raster Values": Input layer drop-down offers `Buckthorn observations_0 [EPSG:4326]` and `Joined layer [EPSG:26917]` (chosen); Output column prefix [optional] default `SAMPLE_`.
- **[03:52]** Input layer `Joined layer [EPSG:26917]`; Raster layer `1km17477047610SWOOP2015 [EPSG:26917]`; Output column prefix `elevation`; Sampled `[Create temporary layer]`; Open output file checked. Help: "If the raster layer has more than one band, all the band values are sampled." Run.
- **[04:02]** New layer `Sampled`; right-click menu on it (Open Attribute Table highlighted).
- **[04:12]** Attribute table "Sampled — Features Total: 53": same columns as Joined layer (..., `distance`, `feature_x`, `feature_y`, `nearest_x`, `nearest_y`) plus last column **`elevation1`** (e.g. 237.802673339..., 238.449371337..., 235.125).
- **[04:32]** "Layer Properties — Sampled — Symbology": `Graduated`, Value `1.2 elevation1`, Legend format `%1 - %2`, Method Color, red colour ramp, Mode `Equal Count (Quantile)`, Classes `5`, Classify -> classes 234.31-235.2, 235.2-235.69, 235.69-236.03, 236.03-236.7, 236.7-238.63. Apply (dialog briefly "Not Responding").
- **[05:02]** Map: darker red points upslope (west), pale points toward the river; legend under `Sampled` shows the 5 classes.

## Transcript

**[00:05]** All right, so we're just going to pick up from where we were last time. Um, remember what we've done is we've taken the distance to the water bottom, we've added that to our actual sampling data for Buckthorn. So now we have an idea of how far away were each of our sampling plot plots from, uh, the water's edge. That's great, we can use that later in analysis. So, um, what we're going to do now is we're going to layer a raster file there. So here where we were connecting to, Vector layers based on their distance from each other. There's also joint attributes by location, which we're

**[00:40]** looking at in a later video where we can take two vector layers that are right on top of each other. And here what we're going to do is we're going to take a raster and a vector layer. So now we're really getting into this, like, we're combining data for multiple layers, which is the real strength of GIS. So, I'm just going to turn off these other um layers here just to make it clear. This is our joined layer. Let's go in and open up the attributes table. This is the one that has our distance column here that we're interested in, um, so that's great, and all of our other measurements here, which is perfect. OK. All right, so I've downloaded a digital elevation

**[01:17]** model. This is kind of point cloud data that's been turned into Um, measurements of elevation, and we can use that now to look at what is the elevation across all of our points here? How does that actually change, um, the exposure of Buckthorn in those areas? OK. So, let's take a look at that. So I'm going to just go grab that digital elevation model. It's in our topic five here. It's just this file, big long file name here. This is part of Um, Southwestern Ontario, sort of digital elevation model creation, and that was,

**[01:54]** I got this from open data from the province. So it's going to drop that in. OK, so there we can see there's our raster file, right, those tiles. We're going to go in and make that look a little bit nicer. So single band pseudocolor, and I've used something like this sort of brown, blue-green kind of ramp here. So we click on that, click OK. I'm going to zoom out. We can see that um really what we're seeing here is a lot of the flood plains, so really high areas, low areas down here, certainly low areas where the uh the river is, so if we put that down underneath our joined layer, we can see

**[02:32]** where our points are. And remember to sample from a raster layer, you can use that info button, you can see the little pixels that are making up that raster layer here. We can click on those, so you're going to highlight the layer first, click on those and it will tell us kind of what that elevation is above sea level. OK? So these are all in meters, so 236, 235, down in the middle of the river 234. OK, so what we want to do now is we want to draw all of those, uh, the information that's in the pixel into the vector layer. So here we can see that this, uh, pixel and that point are kind of overlapping,

**[03:11]** this pixel and that point are overlapping, that pixel and that point are overlapping, so we're going to take that value 238 and we're going to attach it to the vector layer. So in order to do that, um, we can use something in the geoprocessing uh toolbox here, I'm just gonna close the feature layer, um, we can do sample raster values. So we click on that. Now, it will say, what is our raster layer, we only have one raster layer, so it's automatically populated it there, and we want to use our joined layer, which is the one that also has distances in it, and it's just gonna

**[03:45]** pull that through. So we're gonna, um, let's call this elevation. OK, and we're just gonna run that. Alright, it's given us yet another uh layer, but this time it's a sampled layer, so let's turn this one off. Same value, same attributes table, but now, What we've got at the end is the elevation that's been sampled. So here, now we have information about the elevation that's been sampled, the distance to nearest water body, and we've done that all through interacting with vector layers and raster layers within the QGIS. So just for fun, let's

**[04:20]** turn this off for a second now. Uh, I'll change the symbology on this to represent that, um, elevation value. OK. So we've got a bit of an idea there now, click apply. Look OK. There we go, sorry, um, and now you can see, OK, this, this makes total sense, right? Darker red is representing higher elevations, and we've got all that data attached now, so we can see where we were sampling up high on the

**[04:58]** slope and then we went down and sampled, you know, to the riverbed, we were going down that, uh, distance. Elevation, um, about a change of a few meters going down that elevation. So now we've grabbed, uh, information from raster layers, from vector layers, both by location and by proximity. So, um, yeah, we've, we've got a lot of tools now that we can use to bind that information together and make new useful data sets.
