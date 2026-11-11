---
title: "QGIS - CRS"
tool: qgis
duration: "05:23"
content_id: 29e09aa2-416e-4246-afc8-37be86f38343
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=29e09aa2-416e-4246-afc8-37be86f38343&revisionId=latest
---

# QGIS - CRS — transcript

Duration 05:23. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Empty "Untitled Project — QGIS" with enlarged icons/text; Browser shows Favorites, Spatial Bookmarks, Home, C:\, D:\ (System Reserved), E:\, G:\ (Storage), S:\ (ITSsoftware$), W:\ (enswork$), GeoPackage, SpatiaLite, PostGIS, SAP HANA, MSSQL, Oracle; status bar "EPSG:4326".
- **[02:02]** `world` typed into the status-bar "Coordinate" box: "World Map" layer added, Scale 1:95734296, EPSG:4326.
- **[02:22]** Clicking "EPSG:4326" in the status bar opens "Project Properties — CRS". Left tabs: General, Metadata, View Settings, CRS, Transformations, Default Styles, Data Sources, Relations, Variables, Macros, QGIS Server, Temporal. Heading "Project Coordinate Reference System (CRS)"; checkbox "No CRS (or unknown/non-Earth projection)"; Filter box; "Recently Used Coordinate Reference Systems": WGS 84 EPSG:4326; NAD83 / Ontario MNR Lambert EPSG:3161; WGS 84 / Pseudo-Mercator EPSG:3857; NAD83 / UTM zone 17N EPSG:26917; NAD83(NSRS2007) / Alaska Albers EPSG:3467; NAD83(HARN) EPSG:4956; NAD83 / UTM zone 9N EPSG:26909; World_Robinson ESRI:54030. "Predefined Coordinate Reference Systems" list with "Hide deprecated CRSs"; details pane for WGS 84: "Geographic (uses latitude and longitude for coordinates)", "Dynamic", "Celestial body: Earth", "Based on World Geodetic System 1984 ensemble (EPSG:6326), which has a limited accuracy of at best 2 meters", "Method: Lat/long (Geodetic alias)"; extent preview map; OK / Cancel / Apply.
- **[02:42]** WGS 84 EPSG:4326 row selected.
- **[03:02]** "WGS 84 / Pseudo-Mercator" EPSG:3857 selected; properties "Units: meters", "Method: Mercator".
- **[03:22]** After OK: world redrawn in Mercator (Greenland/Antarctica enlarged); status bar "EPSG:3857"; coordinates now in metres (e.g. 7227107,-7971221).
- **[03:52]** Dialog reopened; Recently Used list now starts with WGS 84 / Pseudo-Mercator.
- **[04:02]** "NAD83 / Ontario MNR Lambert" EPSG:3161 selected; properties "Units: meters", "Static (relies on a datum which is plate-fixed)", "Method: Lambert Conformal Conic"; preview highlights Ontario.
- **[04:12]** Pop-up "Select Transformation for World Map": Source CRS "EPSG:4326 - WGS 84", Destination CRS "EPSG:3161 - NAD83 / Ontario MNR Lambert"; rows: 1 "Inverse of NAD83 to WGS 84 (1) + Ontario MNR Lambert" accuracy 4 (selected, default); 2 "... (6) ..." 1.5 Canada - Qu...; 3 "... (26) ..." 2 United States; 4 "... (14) ..." 2 United States; checkboxes "Show superseded transforms", "Allow fallback transforms if preferred operation fails" (checked), "Make default"; OK clicked with default.
- **[04:32]** Map redrawn in EPSG:3161 (South America strongly distorted); status bar "EPSG:3161".
- **[04:42]–[05:12]** Zoomed/panned to Ontario and Great Lakes, low distortion; coordinates in metres.

## Transcript

**[00:06]** All right, so we're gonna take a few minutes just to talk about the coordinate reference system, or the CRS. This is attached to every sort of shape file. We can set it at the project level within QGIS. Uh, you may notice here I actually increased the icon size and text size for the video, so hopefully that's, uh, helpful as we work our way through QGIS. It allows you to see things a little more clearly. The CRS is important for us mainly because it allows us to make sure that layers are aligned. So some layers might come in with different CRS um,

**[00:42]** values, but we're able to align them with the project CRS. Sometimes it's one of the biggest tripping points is students will bring in some data, it will not show up within, uh, the map uh view because the CRS is completely different. Um, so keeping an eye on that is important. We often use 4326, which is the global latitude longitude, but if you're working in specific areas, it's better for you to use a more specific CRS. And the coordinate reference system includes things like what's the, the shape of the, the Earth

**[01:20]** in terms of what's the anchor point for how we want to, uh. Sort of take the coordinates and reference them to the shape of the Earth. It also includes the coordinate system, latitude, longitude, or if you're an XY kind of grid coordinates, um, and also the projection. So how we take this sort of spherical Object, flatten it out into a 2D map. So you'll see there's some trade-offs in projections that mean that some areas are more accurate than others. When we're doing kind of a global view, 4326 is actually pretty good. So, let's take a look. So remember if we're going to add back our

**[01:58]** uh vector layer of our world map and just down in the coordinates, we can just type world. So we're here at um 4326. EPSG is just kind of uh a group that standardized all the coordinate reference systems. So you'll see a lot of them say EPSG and then a number. That's why we have 4326 as kind of our global attitude. So let's go ahead and click on that. And it'll bring up the coordinate reference uh system interface. Here's a number of reference systems that I've been using recently, and so we'll go through some of those. But you can see right now we are on WGS 84, so that has to do with the um the

**[02:38]** datum that's used within the coordinate reference system. Uh, is saying it's using latitude and longitude, and it's going to be measured in degrees. So distances in 4326 are measured in degrees, which is kind of hard for us to conceptualize. So let's move over to something like pseudomercator, um, and in in this. Um, particular coordinate reference system, the units are meters. So, if we're doing buffers or if we're measuring distances between features, then pseudomercator is actually very valuable in terms of being able to

**[03:12]** create distance values in meters which we can interpret. So, let's just apply that and click OK. Now you can see instantly that the the projection has changed quite considerably. So you see Antarctica here has been stretched out and pulled across and you can see it's a much different um sort of projection in up in the northern hemisphere as well. We've got Greenland's um is huge in this particular projection. So in all of these projections, there's there's kind of trade-offs for what you're trying to focus on. So let's click back into here. And one of the things that we can do is focus on an

**[03:49]** area we might be interested in like Ontario, for example. Um, so when we look at, um, Ontario, we can do something like, OK, let's get, um, this NAD 83. So that's another um datum that is used for North America. So we'll take that, that's also measured in in meters. So let's take that. And often you might get a pop-up box like this. OK. So if it's like um converting your current map into the new projection or the new CRS, um, then typically I would I would just go with the default. He click OK, click OK. Now you can see wow,

**[04:28]** we've really altered things such so, um, you know, you can look at um South America here is completely distorted, but it means that we have a pretty good um and low distortion view of Ontario, which is, which is what we're after in that um CRS system. So. All this to say that we want to potentially change CRS um settings if you want to focus on a particular smaller area to reduce the amount of distortion we get when we take that spherical shape and flatten it out. So, um, or if we wanna, we wanna shift to something that has

**[05:05]** different units like meters. So just be aware of that. We're not going to really go any further into how the CRS systems are created or anything like that. It's just useful for us to use, um, within the QGIS when we're working with, um, our spatial data.
