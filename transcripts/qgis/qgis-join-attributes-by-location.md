---
title: "QGIS - Join attributes by location"
tool: qgis
duration: "03:42"
content_id: 09cc36ea-fe95-498b-bdf5-a94f1cafda2a
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=09cc36ea-fe95-498b-bdf5-a94f1cafda2a&revisionId=latest
---

# QGIS - Join attributes by location — transcript

Duration 03:42. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
(Recorded in the 2025-26 offering; the log shows "QGIS version: 3.22.3-Białowieża".)
- **[00:12-00:42]** Project from the Spatial joins video: `PWQMN_data_2024` (filtered table), `PWQMN_Stations` symbolised Graduated (0 - 0.004, 0.004 - 0.005, 0.005 - 0.0092, 0.0092 - 0.024, 0.024 - 2.97), `Google Maps`. (The stations layer now also has a numeric `phosphate` field created in the "Changing column types" video.)
- **[00:52]** `EcoDistrict` polygon layer (gold) added on top.
- **[01:02-01:22]** Identify on a polygon: `ECODISTRIC` Stratford, `ECODISTR_1` 6E-1, `ECOREGION_` Lake Simcoe - Rideau, `ECOREGIO_1` 6E, `ECOZONE_NA` Mixedwood Plains; other fields `OGF_ID`, `GEOMETRY_U`, `EFFECTIVE_`, `SYSTEM_DAT`, `OBJECTID`, `SHAPEAREA`, `SHAPELEN`.
- **[01:42]** `EcoDistrict` moved below `PWQMN_Stations`; Identify on a station shows `STATION` 16018412802 Big Creek ... `PWQMN_data_2024...` joined fields and `phosphate` 0.116.
- **[01:52]** Processing Toolbox search `join attr`: Vector analysis > Join by lines (hub lines); Vector general > Join attributes by field value, Join attributes by location, Join attributes by location (summary), Join attributes by nearest.
- **[02:02]** Tooltip on "Join attributes by location": "Join attributes from one vector layer to another by location. Algorithm ID: 'native:joinattributesbylocation'".
- **[02:22-02:32]** Dialog "Join Attributes by Location": Base Layer `PWQMN_Stations [EPSG:4326]`; Join Layer `EcoDistrict [EPSG:4269]`; Geometric predicate: `intersects` checked (overlaps, contains, within, equals, crosses, touches unchecked); Fields to add (leave empty to use all fields) [optional] `0 options selected`; Join type `Create separate feature for each matching feature (one-to-many)`; Discard records which could not be joined unchecked; Joined field prefix [optional] empty; Joined layer [optional] `[Create temporary layer]`. Run.
- **[02:42]** Log: input `PWQMN_Stations.csv` (delimitedtext), `'JOIN' : '.../Lesson 4/01 - Pre-class and lesson data/EcoDistrict/EcoDistrict.shp'`, `'JOIN_FIELDS' : []`, `'METHOD' : 0`, `'PREDICATE' : [0]`, `'PREFIX' : ''`, `'DISCARD_NONMATCHING' : False`; red warning "No spatial index exists for input layer, performance will be severely degraded"; "Execution completed in 1.71 seconds"; Results `'JOINED_COUNT' : 2134`, `'OUTPUT' : 'Joined_layer_...'`. New layer `Joined layer`.
- **[02:52]** Attribute table "Joined layer — Features Total: 2198": station columns, `PWQMN_data_2024_...` columns.
- **[03:02-03:12]** Sorted by `phosphate` (descending): EcoDistrict columns appended at the right (`OGF_ID`, `ECODISTRIC` e.g. Niagara, Kemptville, Peterborough, St. Thomas, Picton, Dryden, London ..., `ECODISTR_1`, `ECOREGION_`, `ECOREGIO_1`, `ECOZONE_NA`, `GEOMETRY_U`, `EFFECTIVE_`, `SYSTEM_DAT`, `OBJECTID`, `SHAPEAREA`, `SHAPELEN`).
- **[03:32]** Map with `Joined layer` (brown points) above `PWQMN_Stations`, `EcoDistrict`, `Google Maps`.

## Transcript

**[00:05]** All right, so the next thing that we're gonna do here is actually try and augment a little bit more information into our vector file. So we took the uh station locations, we added the results, and now we can have those results plotted in terms of phosphate. So the next thing we want to do is actually add some information about where these stations are, that's relevant and provides context to potential impacts of high phosphate levels. So we're gonna Add in something called an eco-district vector layer. An eco-district is something that's uh determined by the province of Ontario and helps with biodiversity planning and things like that. So I'm just gonna

**[00:43]** grab that, um, from the files that we downloaded for the class. It's in an eco-district. There's a shape file. Let's pop that in there. OK. So we can see now we've got these different eco-districts. Let's use our information. Button to maybe identify some. OK, so this one here is a Stratford one, the eco zone is sort of mixed wood plains. OK, so that's good. What we want to do is extract information like this, like which eco district is it? So we want to take the information that's in this attributes table for this layer, and we're going to join it to the attributes table for

**[01:18]** the um for the station data. Let me just bounce this down. Yeah. Right. OK, so we can see our points on top, which is great. So we're gonna add that um into the information that we have for each of our points. So we're gonna get, we're gonna add more information to that attributes table by doing something that's called join attributes by location, OK? As you might suspect, that is in our geoprocessing toolbox. Um, join attributes by location here, so we're just going to double click on

**[01:56]** this one. So join attributes from one vector layer to another by their location. So what that means is that because we have this point is in the boundaries of this polygon, we're going to pull data from that polygon into the into the point data, OK? All right, so the base layer, we want to have the stations, the join layer, we want to have the ecodistrict, OK? And we wanna say um basically where those two things intersect. So if, if the point is kind of going down and it, it, it's overlaying that ecodistrict behind it, it's gonna pull all of that

**[02:35]** information out. So we should just be able to say, run. Great. So now we have a new layer, uh, it's called the it's the joined layer here, it's all the information that's in there, and we have all of that, if we open up the attributes table. You can scroll over and now we've got all of that ecodistrict. I'll just bring some of the phosphate data up to the top, we say which ecodistrict all of them are found in. So now we've additionally made a larger attributes table for that, um, for that point data, gives us a little bit more information.

**[03:15]** OK, so we say, OK, which areas might have high phosphate. Levels, OK? So, quite handy for us in that respect. Now, we might want to do something that maybe we want it now that we've added that data together, maybe we want to export it. And that's something that we haven't quite done yet. So I'll make a little video right after this to show how you can export um that attributes table. That means we can take it to R or Excel and play around with it there.
