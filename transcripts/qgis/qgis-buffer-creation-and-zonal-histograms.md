---
title: "QGIS - Buffer creation and zonal histograms"
tool: qgis
duration: "09:39"
content_id: 3f9af1b9-f315-49a8-8e5c-2766fe918577
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=3f9af1b9-f315-49a8-8e5c-2766fe918577&revisionId=latest
---

# QGIS - Buffer creation and zonal histograms — transcript

Duration 09:39. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:02]** Title card: "ENVRSUST 9014 — Environmental Data Analysis and Visualization — QGIS - Buffers and zonal histograms".
- **[00:42]** Empty "Untitled Project — QGIS"; status bar shows `EPSG:4326`.
- **[00:52]** "Data Source Manager | Delimited Text" with the "Choose a Delimited Text File to Open" file dialog browsing `... > EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > Topic 5` (folder `aci_2018_on_v3`, files `ANALYTE_PARM_LOOKUP_EN_2025`, `Buckthorn observations_0`, ...).
- **[01:02]** `PWQMN_Stations` points loaded across Ontario. Windows File Explorer open at `Topic 5 > aci_2018_on_v3` showing `aci_2018_on_v3` (GeoTIFF) and `aci_crop_classifications_iac_classifications_des_cultures` (CSV); the TIFF is dragged onto the map canvas.
- **[01:12]** Raster `aci_2018_on_v3` rendered (crop classes in yellow/green/pink, water in blue).
- **[01:32]** Identify tool on the raster near London: Identify Results panel `aci_2018_on_v3 > Band 1: aci_2018_on_v3 = 145`. Layers panel: `aci_2018_on_v3`, `PWQMN_Stations`.
- **[01:52]** Excel showing `aci_crop_classifications_iac_classifications_des_cultures.csv` (column A "Code"): 145 = Winter wheat / Blé d'hiver, 146 = Spring wheat, 147 = Corn / Maïs, 158 = Soybeans / Soya, 153 = Canola/rapeseed.
- **[02:22]** `PWQMN_Stations` dragged above the raster in the Layers panel.
- **[02:42]** "Layer Properties - PWQMN_Stations — Symbology": Single Symbol, Marker > Simple Marker, Color changed to pink/magenta, Size 2.00000 Millimeters.
- **[03:02]** "Vector General - Reproject Layer": Input layer `PWQMN_Stations [EPSG:4326]`; Target CRS `EPSG:26917 - NAD83 / UTM zone 17N`; Advanced Parameters > Coordinate operation [optional] list, row 1 "Inverse of NAD83 to WGS 84 (1) + UTM zone 17N" (accuracy 4) highlighted; buttons Run / Close.
- **[03:12]** "Select Transformation for the vector layer" dialog (Source CRS EPSG:26917 - NAD83 / UTM zone 17N, Destination CRS EPSG:4326 - WGS 84), first row "Inverse of UTM zone 17N + NAD83 to WGS 84 (1)" selected, OK clicked. New layer `Reprojected` appears; `PWQMN_Stations` unchecked.
- **[03:42]** Processing Toolbox panel open, search "buffer": Vector geometry > Buffer, Create wedge buffers, Multi-ring buffer (constant distance), ...; GDAL > Vector geoprocessing > Buffer vectors; GRASS r.buffer / v.buffer.
- **[03:52]** Toolbox search "warp": GDAL > Raster projections > "Warp (reproject)". Dialog "Raster Projections - Warp (Reproject)": Input layer `aci_2018_on_v3 [EPSG:10820]`; Source CRS [optional] blank; Target CRS [optional] dropdown open listing `EPSG:26917 - NAD83 / UTM zone 17N`, EPSG:4326, EPSG:3162/3161 Ontario MNR Lambert, ...
- **[04:02]** Warp Log tab: QGIS version 3.44.13-Solothurn; GDAL 3.13.2; parameters `'RESAMPLING': 0, 'TARGET_CRS': QgsCoordinateReferenceSystem('EPSG:26917'), 'OUTPUT': 'TEMPORARY_OUTPUT'`; GDAL command `gdalwarp -overwrite -t_srs EPSG:26917 -r near -of GTiff ".../Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif" .../OUTPUT.tif`. Progress 5% → 27% (04:12) → 45% (04:22) → 75% (04:42); slow on the large raster.
- **[04:42]** While warp runs, toolbox "buffer" results hovered (tooltip "Algorithm ID: 'native:taperedbuffer'").
- **[05:02]** Warp output renamed in Layers panel to `aci_warp`; original `aci_2018_on_v3` unchecked.
- **[05:12]** `Reprojected` being renamed to `pwqmn_reproject`.
- **[05:22]** "Vector Geometry - Buffer": Input layer `pwqmn_reproject [EPSG:26917]`; Distance `10.000000` `meters`; Segments `5`; End cap style `Round`; Join style `Round`; Miter limit `2.000000`; Dissolve result unchecked; Advanced Parameters collapsed.
- **[05:42]** Distance changed to `500` (meters).
- **[05:52]** Buffer Log: `'DISSOLVE': False, 'DISTANCE': 500, 'END_CAP_STYLE': 0, 'JOIN_STYLE': 0, 'MITER_LIMIT': 2, 'SEGMENTS': 5, 'SEPARATE_DISJOINT': False`; input fields STATION, NAME, DESCRIPTION, LATITUDE, LONGITUDE, STATUS, FIRST_YEAR, LAST_YEAR, TOTAL_YEARS, MISS_YEARS; "Execution completed in 0.17 seconds"; new layer `Buffered` added. (Narration says "0.5 kilometer" then "5 kilometer"; the log confirms 500 m.)
- **[06:22]** Zoomed in near London: circular buffers around station points. Identify Results on `Buffered`: NAME Thames River, STATION 4001301302, DESCRIPTION "Sanatorium Rd, London,", LATITUDE 42.96307301, LONGITUDE -81.33185761, STATUS I, FIRST_YEAR 1967, LAST_YEAR 1971.
- **[06:52]** `pwqmn_reproject` unchecked; single buffer over cropland.
- **[07:02]** Identify on `aci_warp` inside the buffer: Band 1 = 147.
- **[07:12]** "Raster Analysis - Zonal Histogram" (toolbox group Raster analysis): Raster layer `aci_warp [EPSG:26917]`; Band number `Band 1: aci_2018_on_v3 (Palette)`; Vector layer containing zones (empty); Output column prefix [optional] `HISTO_`; Output zones `[Create temporary layer]`; "Open output file after running algorithm" checked. Help: "This algorithm appends fields representing counts of each unique value from a raster layer contained within zones defined as polygons."
- **[07:22]** Vector layer containing zones set to `Buffered [EPSG:26917]`.
- **[07:32]** Output column prefix replaced with `crop`.
- **[07:52]** Attribute table "Output zones — Features Total: 2198, Filtered: 2198, Selected: 0": columns crop149, crop153, crop154, crop157, crop158, crop162, ... crop190 containing pixel counts (mostly 0; e.g. crop158 = 83 in row 1).
- **[08:02]** Same table scrolled left: STATUS, FIRST_YEAR, LAST_YEAR, TOTAL_YEARS, MISS_YEARS, crop0, crop20, crop30, crop34, crop35, crop50, crop80, crop110, crop120, crop122, crop131.
- **[08:22]** Identify Results on `Output zones` feature: crop0 0, crop20 0, crop30 13, crop34 28, crop35 0, crop50 0, crop80 1, crop110 0, crop120 0, crop122 20, crop131 0. Toolbox search "zonal": Raster analysis > Raster layer zonal statistics, Zonal histogram, Zonal minimum/maximum point, Zonal statistics; GRASS r.stats.zonal.
- **[08:52]** Output zones table left-most columns: STATION, NAME, DESCRIPTION, LATITUDE, LONGITUDE, STATUS, FIRST_YEAR, ... (e.g. 3007703502 Uxbridge Brook).
- **[09:32]** Identify Results scrolled: crop145 = 159, crop147 = 461 (corn dominant), others 0.


## Transcript

**[00:06]** All right, so here we're going to talk about how we can create buffers around vector features. Um, so we're going to use the provincial water quality monitoring stations, we're going to create a buffer around those stations, and we're going to look at, um, then the agricultural crop index, pull through data from that raster file into those. Buffers to identify what is the crop sort of distribution around each of the provincial water quality monitoring stations. And that's really helpful if you want to look at things like agricultural runoff around the stations and how that potentially changes water quality, maybe how that changes over seasons. So there's a lot

**[00:42]** of use to be able to kind of bind these two data sets together. So let's do layer, add layer, add delimited text layer, we're gonna go in, we're gonna grab our provincial water quality monitoring stations, I'm gonna click add close. We're also going to add in, in the topic five folder, there's also a GeoTI uh in this folder here called ACI agricultural cropping Next 2018. OK, we'll drag and drop that in, and then we can, uh, I'll just pull this off for a second. And we'll go in and we can see that there are pixels associated

**[01:18]** with this. Let's go around to London. OK. Let's take a look at this. We'll use our identify button. OK, this is this bright yellow is 147. OK, 145, 158, there's 147 again. It's 158 again. OK, so I've also included a CSV that has all the metadata for the agricultural crop index. So when we look in here, you can see here's the code. And so we were looking at 147, which is corn, 158, which is soybeans, which is pretty um classic

**[01:58]** for this area. So there's a lot of corn and soybean uh surrounding um London, and you may have noticed this on your trips out to the field this week. OK. Um, OK, so. What we're gonna do now then is we're gonna create some buffers for our provincial water quality monitoring stations, so they're kind of uh kind of the same color as the crops there, so I'm just gonna change the symbology here. Let's change that to something like a bright. OK, there we can see that a little bit better now. Um, alright, so what we're gonna do is

**[02:32]** we're gonna go to the geoprocessing toolbox and we're gonna use something called a buffer, but the first thing is we want to check that CRS so right now, let's check that CRS. Uh, 4326. So it's measured in latitude and longitude. That's gonna be tough for you can do buffers in degrees, but it, it's tough for us to make sense of that. So, uh, what are we gonna do? Well, we're gonna, um, reproject that, uh, layer. So we're gonna grab our vintual water cooling monitoring stations. Let's go with that UTM zone 17 for this particular area. Click run, OK, turn those ones off, and we now have, uh, we're in that UTM zone 17.

**[03:12]** Click, OK. There we go. OK, so, um, 26917. Alright, so now that we've got that done, we wanna make sure that the agricultural crop index is also in the same projection, because if it's not in the same projection, they're not gonna line up properly, even if we're seeing them lined up here. It won't light up properly when we do our calculations. So for raster files, it's a little bit different. So um it's something called warp. So just open up the geoprossing toolbox here, go to warp, and we do um reproject. So it's a reprojection of a raster file. So the target CRS for us,

**[03:52]** we want to be in the same one as our points, um, and then we're just going to run that. It's going to basically, um, take that agricultural crop index and it's going to change it and warp it into the CRS that is being represented by UTM 17 North. Uh, this will just take a bit of a second to load, uh, and then we'll create that kind of buffer layer once that's done. So, uh, this means that both our raster layer and our vector layer are going to be in the same CRS. So any calculations that we do between them are going to be aligned

**[04:29]** properly. OK? So just let that run. I can go search for my buffer now, OK? And once this is all finished up, we're going to complete that buffer. Almost done. It's just a very large, dense, uh, data file that has a lot of, um, has a lot of pixels in it. OK, so now those two should be aligned. We can turn this off and we can see that that's reprojected. So we can rename that. OK, so if we want to go on here and go rename agricultural crop in this warp, OK.

**[05:03]** Same here. This is going to be our um provincial water quality monitoring stations and then reproject. OK, great, so we've got that now, we know which ones we want to use. Let's create a buffer around our points. Now that we've reprojected the points into um. Into that CRS that UTM um 17 North, that is we're in meters now. So now we can set the distance around our water quality monitoring site that we want to have an idea of what's the crop underneath it there. 10 m, not very far.

**[05:40]** So I would say let's, we can go up to maybe 0.5 kilometer, um, and that will give us um a buffer around each of our points and so we can do a run. OK, so now when we zoom in on each of our points, OK, you can see that we've got um a buffer around them. I'm just gonna move those points up. OK, there's a 5 kilometer buffer around each of those points now. OK, so that is a new layer, and when we go to click on that layer. OK, we can see that um it's got values associated with it as well, but that,

**[06:20]** oh sorry, um, and that buffer we can now, it's got that information attached from the underlying vector layer that we've used that for. OK. So, let's just turn off our points for a second. We now want to know underneath each of these kind of buffered layers, um, what is the underlying distribution of the crop or whatever the code is there. So let's go take a look over here, for example, just flash that on and off. We want to get an idea of what is the what is the crop that's underneath of there. As we were seeing before, if we go to

**[06:55]** our warp. All right, that's 147, so that's corn. So a big chunk of that is going to be corn, but there's some other pieces in there as well. Um, in order to calculate that, we can use something called a zonal histogram, um, and that will give us values for, um, the, the actual crop that's underneath of the buffer. So, when we want the vector layer containing the zones, that's our buffered, OK, that's our polygon, we want to use that warp data, which is good. OK. Um, each of these is going to come out, so let's just call

**[07:30]** this crop, uh, as a prefix. We're going to run that, and then I'll just take a second, but we'll see in our buffer buffered layer, we're actually going to get the breakdown of the distribution of what's underneath of there, OK? So close, let's do output zones, check out the attributes table. And now you can see how much, uh, this is essentially giving us how many pixels, um, are represented within each of these uh areas. OK, so now for all of our stations we have for the full range of crops that are available, what

**[08:10]** is the number of pixels that are there? OK, so let's go across to, well, let's take a look at this one, OK. And we can see that uh what crops are most common here, 147 and 145 make up the majority. When we go back over here, we can see 147. Is our corn as expected, 145 is uh winter wheat that's in there as well, OK? So now I could take this information, right, in our output zones, I could potentially bind that if we

**[08:45]** look at the attributes table. These are our locations, here's our latitude, longitude, now we have the crop ranges, well now I would use my spatial join. To actually attach um all of the actual values in there as well. Um, and you could do this, you could export this and do it within Excel, do the merge, and now you have all of this crop data, and you can look at how that impacts all of the different uh pollutants that are measured as part of the water quality testing. Um, I would probably pivot this table. As well, so that you have information about the crops under one column and all the values in

**[09:22]** another column, that will make it a lot easier to analyze. OK? So, cool way for us to again, create a new vector layer, pull some information through, get some um cool insights from that, that we could then take to Excel or NR to analyze a little bit further.
