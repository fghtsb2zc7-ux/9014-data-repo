---
title: "QGIS - Clipping vector layers"
tool: qgis
duration: "08:03"
content_id: 7c2b4e42-6e54-4e6d-8ee7-3d0195da4fcf
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=7c2b4e42-6e54-4e6d-8ee7-3d0195da4fcf&revisionId=latest
---

# QGIS - Clipping vector layers — transcript

Duration 08:03. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:42]** Empty "Untitled Project — QGIS", status bar `EPSG:4326`.
- **[01:02]** Layer `lpr_000b16a_f` (Statistics Canada provinces/territories, green) loaded; project CRS now `EPSG:3347`.
- **[01:22]** Second layer `municlow` (brown) added by drag and drop from File Explorer folder `municlow`.
- **[01:32]** Zoomed to southern Ontario: municipal polygons, some extending into the Great Lakes.
- **[01:42]** Identify Results `municlow`: NAME "CITY OF LONDON", DESCR "Single Tier Municipality", MUNID 39036, EXTENT_T "Mainland", ACCURACY "Within 50 metres", plus OBJECT_ID, GUT_NUMBER, LABEL, MAH_CODE, ASSESS_C, SENS_* and SYS_AREA fields.
- **[02:02]** Identify on a lake polygon: NAME "MUNICIPALITY OF CHATHAM-KENT", EXTENT_T "Water" (highlighted red in Lake Erie).
- **[02:32]** `ESRI Satellite` base map added under the layers; `lpr_000b16a_f` moved to the top so the green land polygon covers the land part of the municipalities.
- **[02:52]** "Query Builder — Set provider filter on lpr_000b16a_f (provider: ogr)": Fields PRIDU, PRNOM, PRANOM, PRFNOM, PRAABREV, PRFABREV; operators =, <, >, LIKE, %, IN, NOT IN, ...; "Enter a OGR SQL query to filter the layer".
- **[03:02]** Filter icon shown on `lpr_000b16a_f` in the Layers panel (only Ontario remains; filter text visible later in the Clip log as `"PRNOM" = 'Ontario'`).
- **[03:32]** Processing Toolbox search "clip": Recently used Clip, Extract/clip by extent; Vector overlay > Clip, Extract/clip by extent, Union; GDAL > Raster extraction > Clip raster by extent / by mask layer; GDAL > Vector geoprocessing > Clip vector by extent / by mask layer.
- **[03:42]** Toolbox search "spatial": Vector general > "Create spatial index".
- **[04:02]** "Vector General - Create Spatial Index": Input layer `municlow [EPSG:4269]`; help text "Creates an index to speed up access to the features in a layer based on their spatial location." (run once for each layer).
- **[04:22]** "Vector Overlay - Clip": Input layer `municlow [EPSG:4269]`; Overlay layer `lpr_000b16a_f [EPSG:3347]`; Clipped `[Create temporary layer]`; "Open output file after running algorithm" checked.
- **[04:32]** Clip Log: QGIS 3.44.13-Solothurn; `'INPUT': '.../Topic lessons/Topic 7/municlow/municlow.shp', 'OUTPUT': 'TEMPORARY_OUTPUT', 'OVERLAY': '.../Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp|subset="PRNOM" = \'Ontario\''`.
- **[04:42]** Red error in log: "Feature (129) from "municlow" has invalid geometry. Please fix the geometry or change the "Invalid features filtering" option for this input or globally in Processing settings." / "Execution failed after 13.21 seconds". A `Clipped` layer is still added to the Layers panel (incomplete).
- **[05:22]** "Vector Geometry - Fix Geometries": Input layer dropdown open (Clipped [EPSG:4269], lpr_000b16a_f [EPSG:3347], municlow [EPSG:4269]); Repair method `Structure`; Fixed geometries `[Create temporary layer]`. Help: "This algorithm attempts to create a valid representation of a given invalid geometry without losing any of the input vertices ... Always outputs multi-geometry layer. NOTE: M values will be dropped from the output."
- **[05:42]** Fix Geometries Log: `'INPUT': '.../Topic 7/municlow/municlow.shp', 'METHOD': 1, 'OUTPUT': 'TEMPORARY_OUTPUT'`, progress 34%.
- **[06:02]** New purple layer `Fixed geometries` (temporary/scratch icon). Toolbox search "fix geo": Fix geometry group tools and Vector geometry > Fix geometries.
- **[06:12]** `Fixed geometries` being renamed (typing "Muni").
- **[06:32]** Renamed to `Municipal boundaries`; toolbox "spatial" > Create spatial index used again on it.
- **[06:52]** "Vector Overlay - Clip": Input layer `Municipal boundaries [EPSG:4269]`; Overlay layer `lpr_000b16a_f [EPSG:3347]`.
- **[07:02]** New `Clipped` layer (red) at the top; municipal polygons now stop at the Ontario shoreline; purple unclipped parts visible over the lakes.
- **[07:22]** Zoomed into the north shore of Lake Huron/Georgian Bay comparing layers (hover tooltip shows municlow path `.../Topic 7/municlow/municlow.shp`, MultiPolygon).
- **[07:42]** Final view: red `Clipped` municipalities over brown `municlow`; the brown lake extensions are outside the clipped layer.


## Transcript

**[00:05]** All right, so in this video, we're going to look at clipping vector layers. Clipping is a process where you pick one vector layer, you put an overlying vector layer on top of that, and then you use the extent of the overlying vector layer to cut or clip the one underneath. Right? This is really helpful when you have things you want to kind of clean up a vector data set or you want to sort of reduce it in some way. You can't do that through filter expressions because it's not in the attributes table. So we're actually going to use spatial data to try and do that. All right, so let's take a look

**[00:42]** at that. Um, first thing I'm going to do is just bring in my provincial sort of shape layer here. OK. And again this will outline all of the um all of the provinces as we were talking about in the last video, takes a little bit of time to render these because of the coastline so we are gonna create a spatial index for this um the next uh shape file that we're gonna load in is the is uh the municipal boundaries uh one. So there's this municipal one here, we're just

**[01:19]** gonna drop that shape file in. This is a shape file that has all the municipal boundaries in Ontario, so we'll just zoom in here, OK? And that will show where all the different municipalities are. So I'm just gonna take. The identify features button and click there on London, OK, you can see the City of London is there. Um, so, we, uh, what we want to do here is you can see that for many of these, uh, Sort of municipalities, there are kind of extensions off into um the waterways. So maybe I can I'll just put a little

**[01:56]** base map on there so we can see that. OK, let's take a look at our satellite layer. OK, so you can see it's actually extending out into Lake Erie here, um, I'm gonna turn that off and on, OK, so what we wanna do is we're gonna use this overlying provincial layer to actually cut and clip the. Line layers. We're going to clean up all of these ones that are going out into um the water bodies. We just want to focus on the ones that would be within the boundary layer here. So if I move this down, turn this on, you can see it's

**[02:30]** going to cut away anything that's outside of the green. Uh, polygon layer there. OK, so that's the purpose of our clipping for today. Uh, what we're gonna do first is I'm just going to, uh, do a bit of a filter because we have the provincial is doing all the provi the provinces and territories. Just gonna filter that. We've done this lots now. The provincial name. I'm gonna go equals and we're going to just select Ontario. OK. So, OK, so now we just have Ontario in the data set and that will make things a little bit uh

**[03:07]** smoother for us, OK? So, um, but what we wanna do is we wanna create a spatial index for both of those, uh, so that the, the processing can happen faster. Remember we, we've got a lot of really detailed lines, um, within that provincial data set along the coastline, so we wanna give it a spatial index to help with that, OK? So, I'm gonna open up the geoprocessing toolbox, gonna go to spatial index, OK. Connet

**[03:41]** Just give that a second to load. There we go. OK, now I'm gonna create that spatial index there. Great, that's all done. I'm gonna do this for my uh municipal leader as well, because you wanna have both of them have that uh spatial index. OK. Great. OK. Now, we are going to try and run that clip now. So, in order to do that, we can just go to clip. Um, and so this vector overlay clip takes this, uh, one layer, so the

**[04:18]** municipal values, and then we can overlay the provincial layer, and then it's gonna, it's gonna make sure it's gonna cut anything that's outside of that, OK? We are gonna get an error when we, uh, initially run this, um, but we'll just let that run for a second because it is a large data set. OK, so that finished, but we are getting an error here, and I wanted to make sure that you see this error because it is something that commonly comes up when you're trying to do processing on vector layers. So it's saying um the feature from the municipal layer has invalid geometry. So that typically means that there's some sort of issue with Uh, the way

**[04:57]** that the polygon was formed, like when the, the data set was initially formed, maybe the, the polygon wasn't properly closed off or, or something like that. So we're actually gonna go in and we're gonna fix those, um, geometries, and that's another, um, sort of function within the geoprocessing toolbox. OK, it's called fixed geometries. Um, and so what it does is it goes into the, uh, data sets, so we're gonna use that underlying, uh, municipal data set again. It's gonna go in, find any problems with the geometry, and coordinate and, and sort of automatically fix them up. So we're

**[05:31]** gonna allow that to run, that will fix up any problems with the geometry there, and we should be able to run a clipped layer, uh, at this point. So just let this finish up. All right, so we can see that's completed and it's created a new layer for us called fixed geometries. It looks very similar to um the underlying um municipal layer, but now all the geometries are fixed in here. You can see both of these are are scratch layers or temporary layers, but that's OK. So I'm just gonna rename this so we know uh what's going on there. So this

**[06:07]** is the uh municipal. Boundaries. OK, so I will leave that in there and now um that we created a new layer, we're gonna go back and create that spatial index. But now we're gonna do it on the new layer. OK, that's all done. OK, so that layer is now complete. So our, we've got our municipal boundaries, we've got our um provincial boundaries now have the the proper sort of um spatial indices. So let's go and do a clip now.

**[06:49]** OK, so I'm gonna do it on the municipal boundaries layer, I'm gonna do it on the provincial layer, OK, and run that. Great, so that's all finished up, I'll click close and we have a new clipped layer in there. So, if we uh zoom into one of these areas here. Ren And let's turn off our provincial boundary layer here, turn off this. Uh, we can see that we've got, uh, I'll turn off this to see where our municipal boundary was. OK. So you can see that the municipal boundary is in

**[07:26]** there, and what we've done is we've just gone along and we've clipped all of that now so that all we have remaining is ones that are on land. So the one where the provincial boundary was kind of um overlaid there. OK. So that's that's actually sort of created a new layer for us and now everything is kind of. On land, none of it's extending out into the water. OK? So that's uh one way to use clipping within QJS to kind of split up a data set or cut a data set uh based on the spatial extent of another layer.
