---
title: "QGIS - Raster import"
tool: qgis
duration: "05:16"
content_id: 81dd69e3-60d9-4ee7-9697-6c91c784bb95
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=81dd69e3-60d9-4ee7-9697-6c91c784bb95&revisionId=latest
---

# QGIS - Raster import — transcript

Duration 05:16. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Instructor's main install (SCP menu present), empty project; panels Browser, GPS Information, Advanced Digitizing, Layers; status bar EPSG:4326.
- **[01:12]** Windows File Explorer: OneDrive > Paul - The University of Western Ontario > Teaching > EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > Topic 2, containing GeoTIFFs "Carcinus maenas" and "Ciona intestinalis".
- **[01:22]** Both files dragged onto QGIS: Layers panel shows "Carcinus maenas" (legend "Band 1 (Gray)" 0.932818 to 0) and "Ciona intestinalis"; grayscale rasters along the North American coast; EPSG:4326.
- **[01:42]** "Search NextGIS QMS" panel open (Last used: Google Maps, Google Roads, Google Terrain, ESRI Gray (light), ESRI Ocean); ESRI Ocean loading.
- **[01:52]** ESRI Ocean base map below the rasters; Ciona intestinalis being unticked.
- **[02:12]** Double-click on Carcinus maenas opens "Layer Properties - Carcinus maenas — Symbology": Render type "Singleband gray", Gray band "Band 1 (Gray)", Color gradient "Black to White", Min 0, Max 0.932818, Contrast enhancement "Stretch to MinMax"; Layer Rendering (Blending mode Normal, Brightness, Contrast, Gamma 1.00, Saturation, Grayscale Off); Resampling Nearest Neighbour, Oversampling 2.00. Left tabs: Information, Source, Symbology, Transparency, Labels, Histogram, Rendering, Temporal, Pyramids, Elevation, Metadata, Legend, Display, Attribute Tables, QGIS Server.
- **[02:22]** Render type changed to "Singleband pseudocolor": Band "Band 1 (Gray)", Min 0, Max 0.9328175, Interpolation "Linear", Color ramp dark blue to yellow (ramp name not shown), Label precision 4, value/colour table (0, 0.0036439, 0.0072876, ...), Mode "Continuous", Classes 5, Classify button, "Clip out of range values"; Apply then OK.
- **[02:42]** Carcinus maenas drawn blue-to-yellow; legend 0 to 0.932817; yellow (high probability) along Nova Scotia / Gulf of Maine.
- **[03:02]–[03:42]** Zoomed in until individual square pixels are visible.
- **[04:02]** Identify Features: clicked cell outlined red; Identify Results "Carcinus maenas > Band 1 0.1156265"; Mode Current Layer, View Tree.
- **[04:22]** Another identify shows Band 1 0.847169; Ciona intestinalis now visible and selected (grayscale, legend 1 to 0); layer order Ciona intestinalis, ..., ESRI Ocean.
- **[04:42]** Ciona intestinalis switched to Singleband pseudocolor (legend 0 to 1).
- **[05:02]** Identify on Ciona: "Band 1 0.00729797" near the continental shelf.

## Transcript

**[00:05]** OK, so in this video we're going to look at adding raster data to QGIS. We have been dealing a lot in vector files, which are sort of lines, points, and polygons, um, but we're going to be looking at raster data which is often used for things like wide scale climate predictions or other types. species distribution models where we're looking at the probability of a species being in an individual location that you're trying to target. So raster data can be really helpful for those types of broader scale

**[00:41]** spatial predictions. So we'll see them come up quite a bit. Um, you can, uh, just add in through the browser raster file, but I find it's quite easy to actually just go to the place where you download it. I've asked you to download two species distribution models for marine invasive species, um, Carsinus minus, which is a green shore crab, and Ciona intestinalis, which is called a C vase. These are two species we saw when I was out, uh, in New Brunswick. So I've just downloaded those now and we can just add those into the um browser here by just dragging and dropping. That's typically the easiest way to add

**[01:22]** those. Both of those layers are turned on now. They're both. Kind of gray scale. So um it's not super easy to see where the differences are. First, let's add a little bit of a um a base map. So ocean base map is probably good for these particular species. Get that off, OK. Um, so our base map's down there below. OK, let's turn off Ciona intestinalis, which is our C vase for a second, and we can look at the species distribution model for Carsinus minus, which is a greenish short crab.

**[01:59]** So, what we're gonna do first is just kind of make this a little bit easier to see. So, um, if you double click on that, we'll bring up the uh layer properties and it goes right to symbology. Symbology against how we changed the appearance of any of those layers. Uh, and single band pseudo color allows us to give it a bit more of a color ramp. So instead of that kind of gray, we give it a bit more of a color ramp. Now with species distribution models, zero is, you know, almost no possibility that species will be present in that area, and all the way up to 1 is, well, very high

**[02:35]** probability that you will find that species in that area. Click apply and click OK. So we can see now it's changed and we can see now very easily that there are really on the um East Coast here really high probability of seeing um invasive green shore crab. Now the thing about rasters is that um they are essentially pixels. So as I zoom further in here. You can see that those pixels um actually representing values in different areas. So sometimes those pixels will have a different sort of

**[03:12]** spatial resolution that might be really fine scale. This is fairly large scale pixels. That does mean that sometimes rasters are very large files, so they. be upwards of like 0.5 gig sometimes if you're trying to upload those. That's why in our later lessons we're going to try and do some work um in Positron with Python to analyze very large um sort of raster files because it's a lot for QJS to take in. But you can see in raster data each there are individual pixels that represent the data underneath of it. So let's just use the

**[03:50]** identify features button here. We can zoom in and we can actually highlight individual cells to understand what the probability is from that species distribution model. So very unlikely here, pretty likely up here, OK, so you can see that change much higher to a probability of one that they were going to be there. So that's kind of um a, you know, an introduction to rasters there, but let's, we'll turn this one off. Let's go back and do seone intestinalis. OK, we'll double click again, take that to single band pseudocolor, OK? And we'll

**[04:29]** click apply. OK, and now we can see um if I just zoom out here, where the expected distribution of um that particular species as well, right? Again, we can identify features. And zoom in and see all those pixels that are there, really high probability of occurring here, less so further off the coast and certainly less so much further near the continental shelf. OK. Alright, so that's a quick introduction to importing thing, uh, rasters through geoTIFs. Uh, you can think about these as basically geolocated pictures, and

**[05:07]** those pixels have information that we can access. We're gonna talk about how we can kind of manipulate rasters, uh, in some later videos.
