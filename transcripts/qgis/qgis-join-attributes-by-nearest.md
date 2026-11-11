---
title: "QGIS - Join attributes by nearest"
tool: qgis
duration: "11:05"
content_id: 867c6eb9-9684-4b90-b95a-97eb79276bf2
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=867c6eb9-9684-4b90-b95a-97eb79276bf2&revisionId=latest
---

# QGIS - Join attributes by nearest — transcript

Duration 11:05. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12-00:32]** Empty QGIS project, status bar `EPSG:4326`.
- **[00:42]** Layer `Buckthorn observations_0` (red points) loaded; QuickMapServices menu (globe toolbar icon) open at `Google > Google Road`.
- **[00:52]** "Layer Properties — Buckthorn observations_0 — Information": Path `...\Class materials\Topic lessons\Topic 5\Buckthorn observations_0.csv`; Source `...csv?type=csv&maxFields=10000&detectTypes=yes&xField=x&yField=y&crs=EPSG:4326&spatialIndex=no...`; Provider `delimitedtext`; Geometry Point; Feature count `53`; CRS `EPSG:4326 - WGS 84`, Units "Geographic (uses latitude and longitude for coordinates)".
- **[01:02-01:22]** Map zoomed out to the whole world in EPSG:4326 with `Google Road` basemap.
- **[01:22]** Cursor on the `EPSG:4326` button at the right end of the status bar (this opens Project Properties CRS).
- **[01:32]** "Project Properties — CRS": Recently Used Coordinate Reference Systems list (`EPSG:4326 - WGS 84`, `EPSG:26917 - NAD83 / UTM zone 17N`, `EPSG:3162 - NAD83(CSRS) / Ontario MNR Lambert`, ...); bottom-right preview map shows the area of use.
- **[01:52]** `EPSG:26917 - NAD83 / UTM zone 17N` selected; properties panel: "Units: meters", "Method: Universal Transverse Mercator (UTM)"; preview shows a narrow N-S strip. OK.
- **[02:12-02:22]** Status bar now `EPSG:26917`; yellow message bar "Used a ballpark transform from EPSG:4326 to EPSG:26917"; the world map is distorted.
- **[02:42]** Zoomed back to the sampling plots by the Thames River (Western campus, beside the soccer fields).
- **[02:52]** Cursor on the `Vector` menu (Data Management Tools > Reproject Layer).
- **[03:02]** "Vector General - Reproject Layer": Input layer `Buckthorn observations_0 [EPSG:4326]`; Target CRS `Project CRS: EPSG:26917 - NAD83 / UTM zone 17N`; Coordinate operation list: 1 "Inverse of NAD83 to WGS 84 (1) + UTM zone 17N" (accuracy 4, selected), 2-5 other NAD83-to-WGS 84 variants; Run.
- **[03:12-03:22]** "Layer Properties — Reprojected — Information": Provider `memory`, Point, Feature count 53, CRS `EPSG:26917 - NAD83 / UTM zone 17N`, Units `meters`, Type Projected. Layers panel: `Reprojected` (checked), `Buckthorn observations_0` (unchecked), `Google Road`.
- **[03:32]** "Layer Properties — Reprojected — Symbology": Single Symbol, Marker > Simple Marker; symbol `diamond green` chosen; Size `4.40000` `Millimeters`.
- **[03:42-04:02]** Zooming out: diamonds stay the same size on screen.
- **[04:12]** Symbology again: Size unit changed to `Meters at Scale` (size then set to 5 per narration).
- **[04:32]** Diamonds now drawn ~5 m across, spaced ~10 m apart.
- **[04:52-05:12]** Browser: "City of London Open Data" (`https://opendata.london.ca/search?tags=Environment`), then the "Water Edges" dataset page (Records: 27,968; Dataset, Feature Layer; buttons "View Full Details", "Download").
- **[05:32]** File Explorer at `OneDrive > Class materials > Topic lessons > Topic 5`: folders `aci_2018_on_v3`, `EcoDistrict`, `OntarioDEM_ImageryDerived_TileIndex`, `Parking lot`, `Sampling area`, `Water_Edges`; files `1km17477047610SWOOP2015`, `ANALYTE_PARM_LOOKUP_EN_2025`, `Buckthorn observations_0`, `PWQMN_2010_2018_update5`, `PWQMN_data_2024`, `PWQMN_FieldData_2021-2022_Final`.
- **[05:42-06:12]** `Water_Edges` line layer added (drag-and-drop of the shapefile); thin purple lines along the river and small channels through the plots.
- **[06:22]** `Reprojected` and `Google Road` unchecked; `Water_Edges` selected; cursor on the "Toggle Editing" (pencil) button.
- **[06:32]** Editing on (digitizing toolbar active); status bar "1 feature(s) deleted." after selecting small channel lines and pressing Delete.
- **[06:52]** Only the main Thames shoreline lines remain; layers turned back on.
- **[07:02]** "Layer Properties — Water_Edges — Information": Path `...\Topic 5\Water_Edges\Water_Edges.shp`, Storage ESRI Shapefile, Geometry "Line (MultiLineString)", Feature count 27,973, CRS `EPSG:26917 - NAD83 / UTM zone 17N`, meters.
- **[07:42]** Processing Toolbox open (gear icon).
- **[07:52]** Search `shortest` -> "Vector analysis > Shortest line between features" (also Network analysis shortest-path tools, GRASS v.net.*).
- **[08:02-08:12]** Dialog "Vector Analysis - Shortest Line Between Features": Source layer `Reprojected [EPSG:26917]` (drop-down also offered `Buckthorn observations_0 [EPSG:4326]`); Destination layer `Water_Edges [EPSG:26917]`; Method `Distance to Nearest Point on feature`; Maximum number of neighbors `1`; Maximum distance [optional] `Not set` `meters`; Shortest lines `[Create temporary layer]`; Run.
- **[08:22]** New layer `Shortest lines`: orange lines from every plot to the nearest shoreline point.
- **[08:32-08:42]** Identify Results on one line: source-plot fields (Section, Group members, Transect ID, Quadrat ID, Buckthorn Percent ...) then water-edge fields (`OBJECTID_2` 255204, `Theme` Hydrography, `Layer` "Map 2D - Hydrography - Shoreline", `FeatureCod` GA27110000, `WaterEdgeT` 2, `LastEditDa` 2025-07-31, `ShapeSTLen`) and `distance` = `43.15379647444893`.
- **[09:12]** Toolbox search `joi`: Vector analysis (Count points in polygon, Join by lines (hub lines)), Vector creation (Points to path), Vector general (Flatten relationship, Join attributes by field value, Join attributes by location, Join attributes by location (summary), Join attributes by nearest), Vector selection (Extract by location, Select by location).
- **[09:22]** Dialog "Vector General - Join Attributes by Nearest" opens with defaults Input layer and Input layer 2 = `Shortest lines [EPSG:26917]`.
- **[09:32]** Set: Input layer `Reprojected [EPSG:26917]`; Input layer 2 `Water_Edges [EPSG:26917]`; Layer 2 fields to copy (leave empty to copy all fields) [optional] `0 field(s) selected`; Discard records which could not be joined unchecked; Joined field prefix [optional] empty; Maximum nearest neighbors `1`; Maximum distance [optional] `Not set` `meters`.
- **[09:42]** Field picker opened showing Water_Edges fields (`...ID`, `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen`) with Select All / Clear Selection / Toggle Selection; closed with nothing ticked.
- **[09:52]** Scrolled: Joined layer [optional] `[Create temporary layer]`; Open output file after running algorithm checked; "Unjoinable features from first layer [optional]" output below. Run.
- **[10:02-10:22]** Attribute table "Joined layer — Features Total: 53": all buckthorn columns, then ALL Water_Edges fields (`OBJECTID_2`, `Theme`, `Layer`, `FeatureCod`, `WaterEdgeT`, `LastEditDa`, `ShapeSTLen`) followed by added fields `n`, `distance`, `feature_x`, `feature_y`, `nearest_x`, `nearest_y` (e.g. distance 86.629..., 77.655..., 18.745...).
- **[10:42-11:02]** Layers: `Joined layer`, `Shortest lines`, `Water_Edges`, `Reprojected`, `Buckthorn observations_0`, `Google Road`.

## Transcript

**[00:05]** All right, so in this video we're going to use our Buckthorne data to do a couple of different things. We're going to load it in. We're going to reproject a vector layer into a CRS that uses meters. We're then going to add. In a new line vector file, we're going to do distance measurements between our points and our uh our line paths as well. So, um, let's get started. So we'll do layer, add layer, delimited text layer, add in our Buckthorne observations. OK, we're going to add in our uh base map. OK, so now we kind of

**[00:44]** know where we are. OK, now we're in 4326 here, and remember the way that you can also check that is you see the information here, we're in 4326, the coordinate reference system for our Buckthorne observations because we, that's how they were added when we first loaded it, OK? Um, I just want to show you the way that 4326 looks at sort of the at the global scale here. OK? So that's how um 4326, it does the kind of the best job of of naturally kind of displaying the 2D flat map that that covers the the entire globe. When we pick. Another CRS, those different coordinate reference systems will often

**[01:25]** focus on a specific area. So see down here in this window, it gives it gives us a preview of the area that this particular CRS is good for projecting. So when we look at 3162, what we did in the last video, you can see that covers all of Ontario. There's also one here which is UTM zone 17 North, that covers just this this kind of strip here of longitude, um, that also covers what covers well, Southwestern Ontario. So we're going to use that one. You can see here that it's, it's done in meters, uh, so that's good for us when we want

**[02:00]** to do things like distance measurements. So we're going to click OK. OK. And you can see now that it's it's, it's done something quite different with the rest of the globe. So basically it's, it's saying, hey, you only want to work in this particular area, fine, I will, I will make this sort of projection in a way that is most beneficial for that area. And really everything else is going to be out of proportion. So that's what we're

**[02:33]** kind of seeing here. So it's really handy, um, to do that. So let's just zoom in here back to our locations. OK. Now, this is still, let's just click on this. This is still in 4326. So what we're going to do is we're going to reproject that layer, the data management tools, reproject layer. And now instead of 4326, we're going to use that UTM zone 17. OK, we're going to run that, we're going to close. It's now given us a reprojected layers that are in the same location, but when we

**[03:08]** click on the properties, we can see that now it's being measured in meters and it's in UTM zone 17. OK? OK, so that's good now, uh, one quick thing we can do in that reprojective layer is maybe just change the symbology a little bit. So we used, uh, well right now it's using just kind of a, a point, but we can actually change that, so let's send it to a sort of a green diamond here. And then we can change what it represents on the map. So right now, at 4.4 millimeters, it is going to maintain that size on the screen at any zoom level that you're at. So let's click apply. As I zoom out, it changes,

**[03:50]** you see the, the, um, those are getting larger and larger as I zoom out because it's maintaining that that size across the screen. Um, in this case though, we actually maybe we could have these represent our actual sizes of our plots. So, uh, in order to do that, I'm just going to go in here, double click. Instead of millimeters, let's change that to meters at scale. We wanted ours to be kind of 5 m across. So if we do 5 m, we take that, we click apply, click OK. OK, now that's going to maintain its size because it's actually 5 m. So

**[04:28]** you can see that our spaced out distances, we did 10 m between plots, so you can sort of see that that that makes sense. So we've got that all there now kind of looks a little bit more like our plots, which is, which is nice. Now, um, I grabbed some open data from the City of London, so we've talked about this a little bit in in our class, but they've got an open data set, we can go to the environment, uh, we're just gonna put water. I'm Ah, and sorry, we're gonna go to water and they've got water edges. OK, so this represents um all of I zoom in on the location here. They have

**[05:09]** provided a line vector layer that has all the edges of waterways within London. OK. So I've already downloaded that for us, and that is um in our kind of topic 5 file. So I'm just going to go back here. Topic 5, OK. And I've already downloaded that for us in this water edges, so you just have to drag that shape file in. OK, cool. So you can see they actually have the water edges also from um where we had that kind of uh stormwater outfall as well. So you'll see that uh along there too, which is kind of cool, OK? Uh, now

**[05:51]** one thing we might want to do, so let's just say we want these are kind of, you know, secondary water, small waterways, but this is the Thames River main waterway, so maybe we want to take distance to that main waterway, and we don't want these other pieces in there, so. Uh, what we're going to do is we're going to turn off the water edges first, sorry, turn off the reprojected layer for a second. We're going to turn off the road layer. And when we're going to just select water edges, we're going to click up here and go to edit. OK? And then we can actually select features that we want there, OK? And we can just

**[06:29]** press delete. So we can actually do a wider selection, delete those features, delete that feature. OK. Now I can save that. All right, so now we've gotten rid of the kind of those small waterways, we're just focusing on the main one here, we'll turn back on our reprojected layer and our base map, uh, and now we're gonna go in and just make sure that our uh water edges, let's see, um, Which CRS those are in, uh, those are in uh UTM 17M and because we, we changed the project uh CRS as well, so that's loaded that way as well, so

**[07:07]** we're good. OK, so now what we might want to do is actually take a measurement from. Each of our um points here, each of our sampling plots to the closest water's edge. So obviously, these ones will be further away, these ones will be closer, but we can actually use QGIS to complete all of those measurements for us. So, I'm just gonna zoom out a little bit here and uh so what we're gonna do is we're gonna open up the geoprocessing toolbox, so that's that little gear icon up here, OK, and last time we were adding the geometry for our parking lot, but here, we're gonna actually be um measuring

**[07:45]** distances. So we're going to, first of all, I just want to use this shortest, Uh, line between features just to show you how this will work, um, in practice. So our source layer is going to be our reprojected points, and then our destination layer is the water edges. So it will draw a line between each of our sampling plots to the water's edge here, OK? OK, cool. So you can see how there's this little bump out there of the river that a lot those ones are closer to and these ones are being closer to this

**[08:23]** edge. So we'll take the shortest distance and then we use the information um tool here. I can click on that, it will give us what that distance actually is here. So when we look at that, there's that distance, it's 43 m. So it's 43 m to the water's edge from here, from this one. It's actually much closer. OK. And this is 18.74, OK? So we will do all of those measurements for us, but now what we want to do is we actually want to add that data to our sampling plots because we want to be able to work with that

**[08:59]** data later on, OK? So, uh, what we're gonna do is another geoprocessing feature called join attributes by nearest. So this is gonna say take one layer and it's gonna join attributes based on the nearest uh feature in that other, the other layer that you're interested in. So now we're getting into kind of combining information from different layers, right? So we're going to start with our reprojected points again, and this time we're going to be using our water edges again. So what it's going to do is it's going to actually join information from

**[09:35]** the water's edge. Now in this case, there's not a lot of information in the water's edge that is really interesting to us, so we don't necessarily want to select anything that gets pulled over, but it will give us the distance to that feature automatically. OK? So let's just run that. OK, it's created a new layer called this join layer here, which you can see, let's uh open the attributes table for that. Scroll on over and we can see it's actually measured the distance to that nearest attribute. So just like we did with those lines, it's done that, but

**[10:12]** it's added it. To the data that we collected. So now we have just automatically calculated what our distance for each sampling plot was based on the latitude and longitude that we took through field maps to the nearest water body feature. OK, so now this is something that we could use to do some additional analysis later. Right, so the next thing that we're going to do is we're actually going to take data from raster layers and add it to vectors. So this is two vectors together and we and later on there's also the join um. Attributes when

**[10:52]** you're by location, so that's a later video, but right now we're going to use a digital elevation model to actually pull elevation information and add it to this file as well.
