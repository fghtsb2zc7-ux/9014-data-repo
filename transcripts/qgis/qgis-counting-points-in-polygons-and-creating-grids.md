---
title: "QGIS - Counting points in polygons and creating grids"
tool: qgis
duration: "09:58"
content_id: 200a0efd-dbe2-4c7f-928a-cac45a0dfa40
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=200a0efd-dbe2-4c7f-928a-cac45a0dfa40&revisionId=latest
---

# QGIS - Counting points in polygons and creating grids — transcript

Duration 09:58. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:52]** `lpr_000b16a_f` (provinces, grey) loaded, CRS `EPSG:3347`. `Layer` menu open (Data Source Manager Ctrl+L, Create Layer, Add Layer, ...). Processing Toolbox shows search "spatial" with "Create spatial index" in Recently used.
- **[01:02]** "Data Source Manager | Delimited Text": File name `...\Class materials\Topic lessons\Topic 7\NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv`; Encoding UTF-8; File Format CSV (comma separated values); Geometry Definition Point coordinates; X field dropdown open listing the bilingual columns incl. `Latitude / Latitude`, `Longitude / Longitude` (X = Longitude, Y = Latitude).
- **[01:12]** Layer `NPRI-INRP_GeolocationsGeolocalisation_1993-present` (tan points) on top of provinces.
- **[02:32]** "Query Builder — Set provider filter on NPRI-INRP_GeolocationsGeolocalisation_1993-present (provider: delimitedtext)": Fields list incl. `NAICS Code Title (English) / Titre Code SCIAN (Anglais)`; Values loaded with "All"; expression starts `"NAICS Code Title (English) / Titre Code SCIAN (Anglais)"`.
- **[02:42]** Values search "foss" returns `Fossil-Fuel Electric Power Generation` and `Fossil-fuel electric power generation` (two spellings).
- **[02:52]** Expression: `"NAICS Code Title (English) / Titre Code SCIAN (Anglais)" IN ('Fossil-Fuel Electric Power Generation','Fossil-fuel electric power generation')`.
- **[03:02]** Filtered layer (filter icon) shows far fewer points.
- **[03:12]** Toolbox search "count points": Vector analysis > "Count points in polygon".
- **[03:22]** "Vector Analysis - Count Points in Polygon": Polygons `lpr_000b16a_f [EPSG:3347]`; Points `NPRI-INRP_GeolocationsGeolocalisation_1993-present [EPSG:4326]`; Weight field [optional] empty; Class field [optional] empty; Count field name `NUMPOINTS`; Count `[Create temporary layer]`.
- **[03:52]** Log: `'CLASSFIELD': '', 'FIELD': 'NUMPOINTS', 'OUTPUT': 'TEMPORARY_OUTPUT', 'POINTS': 'delimitedtext://file:///...NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv?type=csv&...xField=Longitude / Longitude&yField=Latitude / Latitude&crs=EPSG:4326&...subset=..."IN ('Fossil-Fuel Electric Power Generation','Fossil-fuel electric power generation')"', 'POLYGONS': '.../Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp', 'WEIGHT': ''`.
- **[04:12]** Attribute table "Count — Features Total: 13": PRIDU, PRNOM, PRANOM, PRFNOM, PRAABREV, PRFABREV, NUMPOINTS. Visible counts: New Brunswick 8, Quebec 26, Ontario 59, Manitoba 7, Saskatchewan 14, Alberta 63, British Columbia 8, Yukon 9, Northwest Territories 29, Nunavut 24 (NL, PEI, NS hidden by cursor).
- **[04:32]** "Layer Properties - Count — Symbology": renderer dropdown with Graduated highlighted.
- **[04:42]** Graduated: Value `1.2 NUMPOINTS`; Legend format `%1 - %2`; Mode `Equal Count (Quantile)`; Classes 5; classes 2-8, 8-8.8, 8.8-23.2, 23.2-27.8, 27.8-63.
- **[04:52]** Color ramp changed to Viridis (purple→yellow), Classes 6: 2-8, 8-8, 8-14, 14-24, 24-29, 29-63.
- **[05:02]** Map: provinces coloured by count; Alberta and Ontario yellow (29-63).
- **[05:42]** `Count` layer unchecked; filtered NPRI points over grey provinces.
- **[05:52]** "Vector Creation - Create Grid": Grid type `Rectangle (Polygon)`; Grid extent empty; Horizontal spacing `1.000000 meters`; Vertical spacing `1.000000 meters`; Horizontal overlay `0.000000 meters`; Vertical overlay `0.000000 meters`; Grid CRS `EPSG:3347 - NAD83 / Statistics Canada Lambert`; Grid `[Create temporary layer]`.
- **[06:02]** Grid extent filled from the NPRI layer: `-140.883600000,-52.746800000,42.040000000,76.416700000 [EPSG:4326]`.
- **[06:22]** Spacing unit dropdowns changed from meters to `kilometers` (tooltip shows Python identifier 'VSPACING', default 1; 'HOVERLAY' default 0).
- **[06:32]** Horizontal spacing `100.000000 kilometers`, Vertical spacing `100.000000 kilometers`.
- **[06:42]** New `Grid` layer (green rectangle of square cells); toolbox search "grid": Vector creation > Create grid.
- **[07:02]** "Vector General - Create Spatial Index": Input layer dropdown with `Grid [EPSG:3347]` selected.
- **[07:12]** "Vector Overlay - Clip" opened (Input/Overlay both showing lpr_000b16a_f before Input is changed to Grid).
- **[07:22]** Clip Log: `'INPUT': 'memory://Polygon?crs=EPSG:3347&field=id:long&field=left:double&field=top:double&field=right:double&field=bottom:double&field=row_index:long&field=col_index:long...', 'OUTPUT': 'TEMPORARY_OUTPUT', 'OVERLAY': '.../Topic 7/lpr_000b16a_f/lpr_000b16a_f.shp'`.
- **[07:42]** `Clipped` grid (brown cells) follows Canada's outline; `Grid` unchecked.
- **[08:02]** Right-click context menu on `Clipped` (Rename Layer, Open Attribute Table, Filter..., Make Permanent..., Export, Properties...).
- **[08:12]** Layer renamed `100x100 grid`.
- **[08:32]** "Count Points in Polygon": Polygons `100x100 grid [EPSG:3347]`; Points `NPRI-INRP_GeolocationsGeolocalisation_1993-present [EPSG:4326]`; Count field name `NUMPOINTS`.
- **[08:52]** New `Count` layer Symbology > Graduated; Value dropdown lists id, left, top, right, bottom, row_index, col_index, NUMPOINTS.
- **[09:12]** Mode dropdown open: Equal Count (Quantile), Equal Interval, Fixed Interval, Logarithmic Scale, Natural Breaks (Jenks), Pretty Breaks, Standard Deviation; Equal Interval preview 0-1.6 ... 6.4-8.
- **[09:22]** Mode `Pretty Breaks`, Classes 5 → 4 classes 0-2, 2-4, 4-6, 6-8 (red ramp).
- **[09:32]** Map zoomed to southern Ontario: grid cells shaded by count.
- **[09:52]** Whole grid with NPRI points: darkest cells (6-8) in central Alberta; pink cells in southern Ontario and elsewhere.


## Transcript

**[00:05]** Alright, so in this video we're going to explore how we can actually count the number of points within an overlying polygon. So, uh, this is really helpful if you want to count the number of point features within a certain polygon layer, and then we can actually attach that count directly to the point layer. So let's, uh, let's give that a go. So we're going to bring in our, um, provincial data sets or provincial boundaries again. OK, let's go ahead and grab those.

**[00:39]** Right, we're gonna put a spatial index on that as well. Right. Great, so that's good. Now we're actually going to add in our um NPRI data set too. Add layer, add the limited text layer. OK, when we go down to NPR data sets. Longitude and latitude. OK, everything's looking good there. OK, close. OK, so now we've got our latitude and longitude points for all of our facilities, um, and where they are within the provinces. Now let's say

**[01:16]** I want to count how many, um, facilities are within each province because right now it's kind of, I know there's a lot, but it's kind of hard to. Tell maybe where they are most dense, uh, potentially because there's there's a lot of layers of points on top of here. So you can sort of see this, but there's points that are kind of overlaying each other. So certainly when you're looking at a distance, it's kind of hard to tell, OK, well, how many are there actually, uh, within each of these, uh, provinces. OK. So I'm just going to, uh, also put a spatial index on the points layer. OK.

**[01:56]** OK, good. OK, so now we're good to go. It's just loading that underlying provincial layer because that takes so much time and again we're we're uh we're we're using very large data sets now, so it takes a little bit of time to render. Um, OK, so what we're gonna do is we can actually also maybe identify. Identify the different sectors that we'd be interested in. So these are all the NPRI sectors. So let's go in and let's just do a bit of a quick filter. Uh, we can do that for our North American, um, industrial codes here. Click on that. Sample all, we're pretty used to doing this now. OK.

**[02:33]** So let's say we want to go fossil, OK, let's let's look at fossil fuel electric power generation, which we've done before, and again, we've, we've got both of those. So why don't we, this time, instead of using the equal sign, we'll use the in function. Um, and we'll, we'll select both of them. OK. So now we're gonna collect both of those. We'll filter for, um, either one of those now, click OK. OK, and there we go. So now we've limited our data set to just be fossil fuel, um, electric, uh, power generation. Now we can do something called count points and polygons.

**[03:11]** It's under vector analysis here, and what this does is it allows us to take uh the polygon layer of provinces, has a point layer which is our NPRI data. You can have a weight field. So, um, currently we don't have that, but you could potentially have a weight field by, uh, sort of tiers of how much is released, uh, by any given station, we'd have to do a spatial joint to do that. But right now we'll just leave that empty. Um, this will give us a new field name called numb points, and we'll count all the fossil fuel electric power generation happening within each province. OK, so let's run

**[03:48]** that. Let's take a second because we do have quite a large data set. Great, that's all finished up. Now we've got a new layer, let's go click on that, look at the attributes table. OK, and now for each province, territory, there is a number of different NPRI uh reporting facilities that are in the sector of fossil fuel electric power generation. So, uh, one

**[04:22]** super easy thing for us to do is obviously change the symbology on that to give us a little bit of a better idea of what that, Uh, looks like, so let's, we would do graduated here because we're dealing with numbers. Value numb points is the only number that's available there. We're gonna classify it, OK. Let's, we, one thing we can do is we can add a few more classes. So let's add another class. Uh, I'm just gonna change the, uh, color ramp here. Let's go with, uh, veridis, OK. And, OK, all right, so now we've got that. Let's go apply. We've got equal count here, so it's putting. Uh,

**[04:58]** trying to put the number of provinces each in a category there. Cool. OK, so now we can see the bright yellow is where we have really high counts of facilities. So Alberta and Ontario, both very high, and, uh, BC, uh, Manitoba are, are, are quite low in this case. So, um, this gives us a really good overview of where the reporting facilities are coming from, OK. Right, so that's really great. So, uh, in this case we have a polygon layer that is overlapping and we, uh, it's easy for us to count the points in

**[05:35]** the polygons. One quick thing I wanted to show you as well, I'm just gonna turn this off, uh, is that we can also create a grid ourselves. So if I go to, um, grid. Alright, so click on create grid, we're going to create this as a rectangle polygon, so it's going to create polygons in our grid shape for the grid extent, like how large we want the grid to be. We're gonna select and calculate from layer. We're gonna do NPRI, uh, point data, so it's automatically put in the full extent, the, the widest, uh, uh, points, um, of where our NPRI points are showing up. Uh, so we're allowed to do longitude

**[06:15]** automatically in there. 1 m is pretty tight for, uh, spacing, so that would make a 1 m by 1 m grid, which would be a lot. So we're gonna change this. We're gonna take that over to 100 kilometers. Each, OK, so 100 kilometers in any direction, um, and then we'll create that polygon for us, let's look at that. Great. So now we've got these grids, they're 100 kilometer by 100 kilometer grids. Because it's done it in sort of a rectangular way here, um, we want to actually clip, we're going to clip that grid now, um, based on, um, the kind of outline of the provincial layer. OK, so let's go back, let's go

**[06:54]** to clip. Well first let's set our spatial index for a new layer. OK, there's our grid. I'll run that, good, um, and now we're just gonna clip that. We're gonna click, uh, the input layer is gonna be our grid, the overlying layer is gonna be the provinces, let's give that a run. Should then just clip the outside of um those grids now. Let's give that a second. Alright, so that took a little bit of time because we're dealing with such a

**[07:29]** large data set, but in the end, to turn off my grid has created a clipped layer here, um, that is kind of matched to the outline of the provincial data sets. OK, so now we've got our own little grid, we're looking at, you know, what is the density per 100 square kilometers. Of NPRI stations across the country. So before we, uh, in this data set here, we've got it, uh, within each province. What's the density within each province, but that's not set spatially. So here we are going to use this clipped layer. So let's just rename this again. OK, so this is, uh, 100 by 100. Grids, OK, so we've got

**[08:11]** that and what we're gonna do now is we're gonna count the number of NPRI stations that are within, uh, each of those points so we can see where we have, uh, the highest density, uh, spatially. So we're gonna go back to our accounts. Count points and polygons. Now we've got our points, but we're gonna use our grid to to calculate that, so we're gonna run. OK, awesome. So now we've got that new count, we're gonna go in.

**[08:49]** Change the symbology of the graduated. Number of points we're gonna classify it, OK, because, uh, we have a lot of really high, um, you know, there's lots of zero story and sort of fewer places where they actually have facilities um we can do what's called we can change the classification system where it's like equal interval uh we can also change it to a fixed interval or a lot of raw rhythmics fail we can do something called pretty breaks which changes it and just does it by twos um so let's take a look at that. We'll apply. OK, so you can see now across

**[09:26]** the country, mostly there's fairly low density, um, but there's a couple of very high density areas where we can see where we have, um, you know, 6 to 8 facilities reporting there. So, uh, let me just move this above. OK, so you can see where there's potentially very high densities, so kind of a cool way to um plot data at different levels using a spatial grid that allows you to look specifically at at density.
