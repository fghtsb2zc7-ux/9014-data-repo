---
title: "QGIS - Reprojecting a vector layer"
tool: qgis
duration: "04:05"
content_id: bfc69f9a-69d7-4592-998c-39d66eb9ec93
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=bfc69f9a-69d7-4592-998c-39d66eb9ec93&revisionId=latest
---

# QGIS - Reprojecting a vector layer — transcript

Duration 04:05. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:02-00:32]** Empty "Untitled Project — QGIS" window; status bar shows `EPSG:4326`. QGIS 3.44.x interface (the processing log later shows GDAL 3.13.2, PROJ 9.8.1; the Creating-a-spatial-index video recorded the same month shows "QGIS version: 3.44.13-Solothurn").
- **[01:02]** Layers panel: `Parking lot` (light green polygon) above `ESRI Satellite` basemap; the polygon covers a parking lot on the Western campus.
- **[01:12]** "Layer Properties — Parking lot — Symbology" dialog briefly opened (Single Symbol, Simple Fill), then closed.
- **[01:22-01:32]** Parking lot selected in Layers panel (the Information tab check of EPSG:4326 is spoken but not captured in a frame).
- **[01:42]** Dialog "Vector General - Reproject Layer" (opened from `Vector > Data Management Tools > Reproject Layer...`): Input layer `Parking lot [EPSG:4326]`; Selected features only (unchecked); Target CRS currently `EPSG:4326 - WGS 84`; "Convert curved geometries to straight segments" unchecked; Advanced Parameters > Coordinate operation [optional] lists "Null geographic offset from WGS 84 to WGS 84". Help panel: "This algorithm reprojects a vector layer... Attributes are not modified by this algorithm."
- **[01:52]** Target CRS drop-down open, listing recently used CRSs: `EPSG:4326 - WGS 84`, `Project CRS: EPSG:4326 - WGS 84`, `Default CRS: EPSG:4326 - WGS 84`, **`EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert`** (highlighted/chosen), `EPSG:3161 - NAD83 / Ontario MNR Lambert`, `EPSG:3857 - WGS 84 / Pseudo-Mercator`, `EPSG:26917 - NAD83 / UTM zone 17N`, `EPSG:3467`, `EPSG:4956`, `EPSG:26909`, `ESRI:54030 - World_Robinson`.
- **[02:02]** Log tab after Run: input `.../Class materials/Topic lessons/Topic 5/Parking lot/Parking lot.shp`, `'OUTPUT' : 'TEMPORARY_OUTPUT'`, `'TARGET_CRS' : QgsCoordinateReferenceSystem('EPSG:3162')`, "Execution completed in 0.05 seconds", progress bar "Complete". New layer `Reprojected` (memory/temporary, scratch-layer icon) appears at top of Layers panel. Buttons: Change Parameters, Close.
- **[02:12]** `Reprojected` drawn in a new (tan) colour exactly over the original polygon.
- **[02:22]** "Layer Properties — Reprojected — Information": Provider `memory`, Storage "Memory storage", Geometry "Polygon (MultiPolygon)", Feature count 1, CRS Name `EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert`, Method "Lambert Conformal Conic".
- **[02:42]** Processing Toolbox opened (gear icon on the Attributes toolbar); groups listed (Cartography, Database, ..., Vector general, Vector geometry, Vector overlay, ...).
- **[02:52]** Search box `add geo` -> results "Vector geometry > Add geometry attributes".
- **[03:02-03:12]** Dialog "Vector Geometry - Add Geometry Attributes": Input layer `Reprojected [EPSG:3162]`; Calculate using `Cartesian Calculations in Layer's CRS`; Added geometry info `[Create temporary layer]`; "Open output file after running algorithm" checked; Run clicked.
- **[03:22-03:32]** Attribute table "Added geometry info — Features Total: 1": columns `id` = 2, `area` = `23683.200833305717`, `perimeter` = `617.407809975...`.
- **[03:52]** Layers panel: `Added geometry info` (new, green), `Reprojected`, `Parking lot`, `ESRI Satellite` (tooltip shows ESRI Satellite is `EPSG:3857`).

## Transcript

**[00:06]** Alright, so in this video we're talking about how you can reproject a vector layer. So we've been dealing a lot in the 4326 CRS which is great for latitude and longitude, but now that we want to start doing some processing, uh, on this spatial data, we want to have a better CRS to work with, one that's potentially in meters and give us a better understanding of things like distances and area. So we're gonna work on that, so I am actually just going to add the layer that we just uh made, which is our uh parking lot uh data, so I've got that, I'll drag the shape file in. OK, there's our parking lot, and

**[00:45]** we'll add our um, S3 satellite to the back of that as well. OK, so we've got our parking lot there. So let's say I want to understand how large is this parking lot, um, and let's, this would be good for planning purposes, so I want to have an idea of what's the total area covered by this parking lot. So right now, uh, if I did that, this is in 4326. So if I go to properties and I can see information. I can see that this is in 4326 right here. OK, so it's the coordinate reference system, so we're gonna click OK. Again, that

**[01:22]** would give us a measurement in sort of degrees, latitude and longitude. We want something that's in meters. So we're gonna um reproject that parking lot data that's in 4326 into another CRS. So we go to vector, data management tools, we're going to reproject layer. And it's in 4326. We're actually going to change this to one that actually measures in meters. So there's this one here, 3162. So this one is for Ontario, the Ministry of Natural Resources, um, and we can click on that. It will then

**[02:00]** Uh, convert that, hit close and create a new layer for us. OK? So they're in the same spot because it's been reprojected, but it's actually in a different CRS. It's showing us what it looks like in 4326, but the actual layer has been reprojected. So I go back in here, uh, this is just a transformation, so you can click OK. We can see that we're in 3162 for that layer, and we're still in. 4326 for this layer. OK. So now what we can do is we can try and use the geoprocessing toolbox to add some geometry to this

**[02:38]** new layer that we created. So the geoprocessing toolbox you can open up using the gear cog at the top here. Over here you can just add geometry. And you'll see this add geometry attributes will come up under the vector geometry options. So we go to add geometry attributes, it will for the projected layer, it will use the um the calculations based on that layer CRS which is 3162, and we will run that. OK, so it's now created a new layer for us, and when we open up the attributes

**[03:18]** table there, we can see that it's given us two measurements. It's given us the area and it's given us the perimeter. So this is 617 m, and then this, excuse me, 23,000 square meters, um, sorry, 23,683 square. Meters of um total area within that parking lot. So those are things so now that we can build that um vector file, reproject it, and now we've we can do things like add measurements into it in meters, um. And, and this is, this is pretty handy when we're trying to do distance and

**[03:55]** measurements like that. We're going to go in our next video, look at our Buckthorne data and how we can measure um distances to to other features in different layers.
