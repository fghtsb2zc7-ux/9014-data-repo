---
title: "QGIS - Field calculator"
tool: qgis
duration: "06:54"
content_id: a90949ef-8dd2-4096-be6a-cb03f670b0bb
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 3: Conditional logic, conditional calculations, and deterministic modelling"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=a90949ef-8dd2-4096-be6a-cb03f670b0bb&revisionId=latest
---

# QGIS - Field calculator — transcript

Duration 06:54. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[01:42]** NPRI geolocation points (purple) loaded as layer "NPRI-INRP_GeolocationsGeoloca..." over "ESRI Gray (light)"; EPSG:4326.
- **[02:02]** Dialog "NPRI-INRP_GeolocationsGeolocalisation_1993-present — Field Calculator" (opened via the Attributes-toolbar Field Calculator button; see case-when video @00:32). Top: "Only update 0 selected feature(s)" (greyed); "Create a new field" with "Create virtual field" ticked and greyed; "Update existing field" (greyed). "Output field name" blank, "Output field type" "123 Integer (32 bit)", "Output field length" 10, "Precision" 3. Tabs "Expression" / "Function Editor". Function tree: feature, geometry, id, row_number, Aggregates, Arrays, Color, Conditionals, Conversions, CRS, Date and Time, Fields and Values, Files and Paths, Fuzzy Matching, General, Geometry, Map Layers, Maps... Operator buttons = + - / * ^ || ( ) '\n'. "Feature: Aduro Resources Ltd."; "Preview:". Info message: "This layer does not support adding new provider fields. You can only add virtual fields."
- **[02:42]** Tooltip on Output field length: "...length of field (including the ... of digits after the decimal ... for decimal fields). For example 123.45 requires a decimal field length of 5, and 123456 requires an integer field length of 6."
- **[03:02]** Output field name "Latitude_measurement"; Output field type dropdown open: Integer (32 bit), Decimal (double), Text (string), Date, Time, Date & Time, Text, unlimited length (text), Boolean, Binary Object (BLOB).
- **[03:12]** Type set to "abc Text (string)"; length 0 (greyed).
- **[03:32]** Typing `if` — autocomplete shows `if`; Preview "Expression is invalid (more info)".
- **[03:52]** `if(` typed; "Fields and Values" expanded: NULL, Year of last filed report..., NPRI ID / ID INRP, Company Name / Raison Sociale, ..., Province / Province, Postal Code / Code postal, ..., 1.2 Latitude / Latitude, 1.2 Longitude / Longitude, Datum / Datum, NAICS / Code SCIAN.
- **[04:12]** `if( "Latitude / Latitude" >50, 'North', 'South` with signature hint `if(condition, result_when_true, result_when_false)`; button now reads "Show Values".
- **[04:32]** Final: `if( "Latitude / Latitude" >50, 'North', 'South')`; Preview: 'North'; OK enabled.
- **[04:52]** (map) layer selected; attribute table opened.
- **[05:02]** Attribute table "NPRI-INRP_GeolocationsGeolocalisation_1993-present — Features Total: 24552, Filtered: 24552, Selected: 0"; last column "...tude_measurem..." with South/North values (e.g. Toronto/Montréal/Windsor rows = South; Edmonton, Côte-Nord = North).
- **[05:32]** "Layer Properties - NPRI-INRP_GeolocationsGeolocalisation_1993-present — Symbology": "Categorized", Value "abc Latitude_measurement", Color ramp "Random colors"; classes North, South, all other values; buttons Classify, +, -, Delete All, Delete Unused, Advanced; OK, Cancel, Apply, Help.
- **[05:42]** Map: red (North) points above 50°N, blue (South) below; Layers panel legend North / South / (blank).
- **[06:12]** Field Calculator re-opened; Geometry group expanded: affine_transform, angle_at_vertex, apply_dash_pattern, $area, area, azimuth, bearing, boundary, bounds, bounds_height, bounds_width, buffer, buffer_by_m, centroid ...
- **[06:32]** Geometry functions scrolled: is_valid, length, $length, length3D, line_interpolate_angle, ..., make_circle, make_ellipse.
- **[06:42]** "Processing Toolbox" panel opened from the gear icon on the Attributes toolbar; search "add" lists e.g. Vector geometry > Add geometry attributes, Vector table > Add autoincremental field, Add field to attributes table, Add X/Y fields to layer.

## Transcript

**[00:06]** All right, so we're just gonna do a short video in QGAS about how to use something called the field calculator. It is sort of analogous to the things that we've been doing within Excel for this topic. We're just looking at how we can sort of do calculations on a particular column to maybe classify um data in a different way. Ah, we will, of course, I'm just gonna quickly add our delimited text layer here. Um, as we've done before, geolocations.

**[00:40]** Make sure I tell the the longitude and the latitude, got the right CRS we're gonna add that. I'm gonna use quick management, uh, quick map services to add our uh light background and. OK, uh, OK, so there's our, uh, map. What I wanna do now is use an if statement within QGIS. Now, if you were using a delimited text layer like I just added here, you would probably just do this, do the if statement in Excel, but, and then bring the data in. But there's a lot of cases where you're

**[01:15]** gonna be adding a shape file, and in that case, you'd have to export it to a CSV export the attributes table to a CSV. Then make the change in the statements and then bring it back in and in some cases, um, that's that's easy for point data, but if you're using polygon data that has sort of, you know, large area components to it, it's not going to transfer well back from going to. QGIS to Excel and back. Point data is fine, um, but not really for other types of like line and polygon data. So it is helpful to know

**[01:53]** how you can potentially classify that type of data within QJS natively. So we can use something called the field calculator. OK, this field calculator opens up, um. It's got sort of a number of different things on the side here that um give you names of columns or or fields and variables, but also gives you a number of different uh functions that you can use. It's similar to that kind of function library within Excel, but it's actually a little bit um a little bit more convoluted I would say. So here we're gonna create a new field

**[02:31]** name, so this will pop over another field within. Uh, QGIS, so let's just call this here, we're gonna, we're gonna use, uh, continuous variable of latitude, even though that's kind of a weird thing to do. We don't have another continuous variable yet in the geolocations data for the MPRI data set. Um, so let's just, uh, we're just gonna call this, um, latitude, um, let's just say measurement, OK? Um, we're going to change this to a text here, so a text variable, and then here's where we're going to build our expression. So

**[03:08]** similar to what we're doing inside cells in Excel, similar to what we're doing in um within our kind of pipe stacks within. Uh, and here's how the same thing we're going to develop here in QGIS. So, um, one handy thing is, is that we've got these fields and values which are the fields that are actually in the attributes table. So if I go if, and I put a bracket, it's we're now going to see that very familiar uh setup where we have a condition, that condition is met, then we do this, if it's not, then we do that. So, first

**[03:43]** we're going to go and add our uh latitude. So here are the fields and values, it gives us, uh, you know, everything that's in the data set. We're going to do latitude here. We're gonna say if it's greater than, I don't know, 50, OK, if the latitude is greater than 50. Then we're going to do something, and in this case, we're gonna say that this is north, this is obviously very arbitrary. Um, if not, we're gonna say it's south. OK, now. Uh, this is very important because, um, you know, QJS has a slightly different

**[04:20]** syntax, so the column sort of title or the field goes in double quotation marks what you actually want it to uh. Put into the new field goes in single quotation marks. So just something to watch out for there. You can see that down here gives us a preview of what that's going to look like in the actual attributes table itself. So we're going to click apply, click OK. Uh, and then we're going to right click on here, open up the attributes table. So, I will bring in here, Should be able to go all the way over, and yes, we've got

**[05:00]** our latitude measurement column, which is I said north or south, based on our our latitude. Now again, latitude's kind of a random thing to actually assign a continuous uh break in here, but it's just for purposes of understanding how we can use those if statements here. So, again, what's something that you could easily do after that? Well, you could double click. Um, on your layer, go to symbology. Now you can categorize that data based on your new column, your latitude measurement. OK, and click apply. Now we can find all of the uh facility locations that are um north or

**[05:41]** south of that line that we set at 50 degrees north latitude. OK, so again. Quick and quick and easy way to be able to go in and and do that within the field calculator. The field calculator itself actually allows you to do a number of different things in terms of creating columns, in terms of um building out different variables, in terms of grabbing things like geometry and things like that. So that This is a very um full number of functions that you can use here. We're not going to be dabbling too much in here, but just to

**[06:21]** know that you can explore all of these. Some of these are replicated by other functions in the geoprocessing toolbox. So there's Some things that would be here but would also be in a more intuitive sort of set up within something called the geoprocessing toolbox which is up here which we will delve into um a little bit later but OK simple straightforward how you can use the field calculator to actually create some new um categorical variables within QGIS.
