---
title: "QGIS - Creating a new layer"
tool: qgis
duration: "05:05"
content_id: e9700abb-3cd3-4d8f-ad4c-3c18a7187b9b
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=e9700abb-3cd3-4d8f-ad4c-3c18a7187b9b&revisionId=latest
---

# QGIS - Creating a new layer — transcript

Duration 05:05. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Empty QGIS project ("Untitled Project — QGIS"), Browser shows Favorites, Spatial Bookmarks, Home, C:\ ... GeoPackage, SpatiaLite, PostgreSQL; EPSG:4326.
- **[00:22]** "Data Source Manager | Delimited Text": File name "...\EnvrSust 9014\2026-2027\Class materials\Topic lessons\Topic 5\Buckthorn observations_0.csv"; CSV (comma separated values); Point coordinates, X field "x", Y field "y", Geometry CRS "EPSG:4326 - WGS 84"; sample columns OBJECTID (123 Integer (32 bit)), GlobalID, CreationDate, Creator, EditDate, Editor (Text (string)). Pointer on "Add" then "Close".
- **[00:32]** Layers: "Buckthorn observations_0" (points) over "Google Road"; Western campus (Huron Dr, Practice Field North) beside the Thames River.
- **[00:42]** "New Shapefile Layer" dialog: File name (blank, "..." button), File encoding "UTF-8", Geometry type (blank), Additional dimensions "None" / "Z (+ M values)" / "M values", CRS "EPSG:4326 - WGS 84"; "New Field" Name, Type "abc Text (string)", Length 80, Precision, "Add to Fields List"; "Fields List": id | Integer | 10; "Remove Field"; OK (greyed), Cancel, Help.
- **[00:52]** "Save Layer As" file dialog at "... > EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > Topic 5" (folders aci_2018_on_v3, EcoDistrict, OntarioDEM_ImageryDerived_TileIndex, Water_Edges); a new folder being named "Sampling area"; File name "Sampling area"; Save as type "ESRI Shapefile (*.shp *.SHP)".
- **[01:02]** File name "...\Topic lessons\Topic 5\Sampling area\Sampling area.shp"; Geometry type still blank.
- **[01:12]** Geometry type "Polygon"; CRS "EPSG:4326 - WGS 84"; OK clicked.
- **[01:22]** Layer "Sampling area" (polygon) added at top; Toggle Editing (pencil) on; Digitizing toolbar active; pointer on "Add Polygon Feature" button.
- **[01:32]** Cross-hair cursor; clicking vertices around the outermost buckthorn points.
- **[01:42]** Red rubber-band polygon growing as vertices added.
- **[01:52]** Near-complete polygon enclosing all points, last vertex at the river edge (right-click closes; ID dialog not captured in frames).
- **[02:02]** Filled polygon (yellow) drawn, covering the points; still in edit mode.
- **[02:12]** "Sampling area" moved below "Buckthorn observations_0" in Layers panel so points draw on top; pointer on the Toggle Editing pencil — status bar "Toggles the editing state of the current layer".
- **[02:22]** Layer removed ("1 legend entries removed").
- **[02:32]** Shapefile re-added from folder: "Sampling area" (pink polygon) at top of Layers.
- **[03:22]** Basemap switched to "ESRI Satellite" (aerial imagery of campus).
- **[03:42]** `Layer` menu > `Create Layer` submenu: New GeoPackage Layer... (Ctrl+Shift+N), **New Shapefile Layer...** (highlighted), New SpatiaLite Layer..., New Temporary Scratch Layer..., New Mesh Layer..., New GPX Layer..., New Virtual Layer.... (Layer menu also shows Toggle Editing, Save Layer Edits, Current Edits, Save As..., Filter... Ctrl+F, Open Attribute Table F6.)
- **[03:52]** "Save Layer As": new folder "Parking lot" created in Topic 5 (beside "Sampling area").
- **[04:02]** New Shapefile Layer: File name "...\Topic lessons\Topic 5\Parking lot\Parking lot.shp", Geometry type "Polygon", EPSG:4326 - WGS 84, Fields List id Integer 10.
- **[04:12]** "Parking lot" layer in edit mode, red rubber-band polygon being traced around the parking lot on satellite imagery.
- **[04:22]** Orange filled "Parking lot" polygon plus pink "Sampling area" on campus imagery.
- **[04:32]** Edits still on (pencil active) — final view of both polygons.

## Transcript

**[00:05]** Alright, so in this video, we're gonna quickly go over how you can create your own vector layer manually and how you can alter existing vector layers. So let's uh add a layer from our delimited text layer. OK, we're gonna add our Buckthorne observations. Go click add, click close. Now we're going to add a bit of a base map underneath of there, so our road, let's say, Google road. OK, there are observations and we can see all of that now, so that's great. OK, so if we want to create a new layer, we're gonna go to layer, create layer,

**[00:40]** and we're gonna create a new shape file, click on these three dots at the top right. Um, and now we want to create kind of a new folder here just to kind of keep all of our, um, shape files together. So we'll call this sampling area, click on there, OK, we'll click save. Uh, everything's all good there, OK, and we just need to select geometry type. So we're going to create a polygon, but you could create a line, you could create points. Here we create polygons, OK? It'll be in 4326, which is the CRS for the project as well.

**[01:14]** OK, so now we can go up to the pencil, click toggle editing, and all of these other options appear for us, OK? So this one over here is add polygon feature, so we can click on that. So, the way this works is we're gonna try and compass the entire area of our uh sampling site, so I'm just gonna click here. Click here. And you can just click to to draw that polygon outside of all of our points. OK, in order to close the uh polygon off, you right click. OK? It'll ask for

**[01:57]** an ID for this, so let's just say that this ID is going to be one for our sampling area, and now we've got that uh polygon, and we'll just uh shift it down a second here, so it's underneath, OK? Um, now when we click on this, we want to make sure that we unclick edit and it'll ask us to save, OK? So let's just remove this now. Remove that layer, but when I go into uh my file folder, I can see that I've got sampling area and there's our shape file, so I'll drag that in. And now we've got our shape file. So now we've created a shape file very quickly that

**[02:36]** we can now save and we can add and move in and out of as well. OK? So why is this handy? Well, in this case we're creating a new polygon that kind of wraps around our sampling area, but you could also use this to create from things like satellite imagery new polygon files that maybe don't exist. So let's say you go. You're working on something and there is no shape file for that, well, you can actually kind of hand trace a shape file for that. So let's get rid of the Google Road, uh, for a second and let's add something

**[03:12]** else. So let's do, uh, let's see if we can get, uh, satellite imagery up. OK, great. So let's say you were doing, I don't know, something on the parking lot over here, you were doing an assessment or let's say you wanted to understand what the total impervious area was on campus, well we can now create our own polygon layer in order to be able to capture that. So, uh, again, what do we do? layer, create layer, new shape file. We're gonna call this one parking lot.

**[03:51]** Kind of click on that. OK, and we're just gonna make an oh, sorry, we're gonna make another polygon layer. OK, great. So now all I have to do is edit, remember just add, and I can go around that parking lot area, make sure I get all in. OK, it's gonna be ID number 2. OK, and now we have the um uh basically the shape file that has where that parking lot is located, OK? We're gonna start

**[04:28]** doing things like measuring shape and area, uh, but right now we're in 4326. So the next video, we're gonna convert, Um, these polygons and their CRS, the layer CRS into something that measures in meters. Right now, 4326 is measuring in degrees, latitude, and longitude, that doesn't give us a lot of really helpful information, so the next video, we're gonna reproject vector layers, which allows us to put vector layers into coordinate reference systems that use meters, and we can get all sorts of things like perimeter and area and distance. So we'll do that uh in the next video.
