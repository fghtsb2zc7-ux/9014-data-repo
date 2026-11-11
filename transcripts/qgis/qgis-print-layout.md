---
title: "QGIS - Print layout"
tool: qgis
duration: "14:20"
content_id: 819a4662-20df-45d6-be4f-180977a196ca
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=819a4662-20df-45d6-be4f-180977a196ca&revisionId=latest
---

# QGIS - Print layout — transcript

Duration 14:20. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:22]** Empty "Untitled Project — QGIS", `EPSG:4326`.
- **[00:32]** "Select Items to Add | thames_river_watershed" for `...\Topic lessons\Topic 7\thames_river_watershed.gpkg` (dragged from File Explorer): pwqmn_station_thames (Point (97)), thames_river (MultiPolygon (1)), thames_river_watershed (MultiPolygon (1)), wtrshter (MultiPolygon (1)); Add Layers.
- **[00:42]** Group `thames_river_watershed` in Layers panel with pwqmn_station_thames, thames_river (purple), thames_river_watershed (gold), wtrshter (green).
- **[01:02]** `ESRI Satellite` base map added at the bottom of the layer list.
- **[01:12]** `thames_river` unchecked; gold `thames_river_watershed` visible. **[01:22]** `wtrshter` also unchecked.
- **[01:32]** "Layer Properties - thames_river_watershed — Symbology": Single Symbol > Fill > Simple Fill; Fill color (gold) being set to transparent; Fill style Solid; Stroke color black; Stroke width 0.260000 Millimeters; Join style Bevel.
- **[01:52]** Stroke color changed to red; Stroke width `1.860000` Millimeters (later reduced — narration "a little heavy... come down a little bit more").
- **[02:02]** Map: red watershed outline with orange station points over satellite imagery.
- **[02:22]** "Layer Properties - thames_river — Symbology" (Single Symbol, purple fill).
- **[02:32]** Renderer dropdown: No Symbols, Single Symbol, Categorized, Graduated, Rule-based, Merged Features, **Inverted Polygons**, 2.5 D.
- **[02:42]** Inverted Polygons: Sub renderer `Single Symbol`; Merge polygons before rendering (slow) unchecked; Simple Fill with Fill color white; Stroke 0.26 mm.
- **[02:52]** Map: everything outside the watershed is white; only the watershed shows satellite imagery.
- **[03:12]** Hover over `ESRI Satellite` (EPSG:3857, `...arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}`).
- **[03:22]** Inverted Polygons fill: Color / Opacity slider being reduced (white made semi-transparent).
- **[03:32]** Map: watershed in full colour, surroundings washed-out but visible.
- **[04:02]** "Create Print Layout" dialog: "Enter a unique print layout title (a title will be automatically generated if left empty)" → `thames_watershed`; OK.
- **[04:12]** Layout window `*thames_watershed` with menus Layout, Edit, View, Items, Add Item, Atlas, Settings; blank landscape page (rulers to ~297 mm); Items panel empty; tabs Item Properties / Layout / Atlas. Rectangle being dragged across the page (status "width: 274.731 mm height: 199.804 mm").
- **[04:22]** `Map 1` added. Item Properties > Main Properties: Scale `1166278`; Map rotation 0.00°; CRS "Use Project CRS"; Draw map canvas items checked; Layers: Follow map theme (none) unchecked, **Lock layers unchecked**, Lock styles for layers greyed; Extents X min -84.056.
- **[04:32]** "Move item content" tool active (left toolbar); map content zoomed with mouse wheel: Scale `585513`, then `585553` (04:42), X min -83.083.
- **[04:52]** Pan/select tool back; map item positioned on page.
- **[05:02]** Add Scale Bar tool: `<Scalebar>` item added bottom-right showing `0 10 20 km`.
- **[05:12]** Add North Arrow: item `North Arrow` (top-left). Item Properties "Picture": SVG image selected; SVG browser > SVG Groups `svg > arrows`; SVG Images grid of arrow styles.
- **[05:32]** Compass-style arrow (four-point star) chosen; then (05:52) the circular compass with N/E/S/W letters, moved to upper-left over Lake Huron (06:02).
- **[06:12]** `Map 1` Item Properties scrolled: Elevation Range, Temporal Range, Controlled by Atlas, Grids, Overviews, Position and Size, Rotation, Frame (unchecked), Background (checked), Item ID, Rendering, Variables.
- **[06:22]** Extents X max -80.210, Y max 43.880; **Frame checked** (black frame around map).
- **[06:32]** "Map Grid Properties": Enable grid checked; Appearance: Grid type `Solid`; CRS `Use Map CRS`; Interval `Map Units`; X 0.0, Y 0.0; Offset X/Y 0; Line style; Blend mode Normal.
- **[06:42]** Interval X `1.000000000000`, Y `1.000000000000` (1 degree) → black grid lines at whole degrees.
- **[06:52]** Grids section: list shows `Grid 1`; buttons add/remove; "Modify Grid...".
- **[07:02]** Line style colour picker: alpha slider dragged so grid lines become semi-transparent; Width `0.30000` Millimeters.
- **[07:12]** Grid Frame: Frame style `No Frame`, Frame size 2.00 mm (greyed).
- **[07:22]** "Draw Coordinates" checkbox (unchecked) with Format Decimal; Left/Right/Top/Bottom each Show All / Outside Frame / Horizontal.
- **[07:32]** Draw Coordinates checked → labels -83.000, -82.000, -81.000, 43.000, 42.000 on all four sides.
- **[07:42]** Format dropdown: Decimal, Decimal with Suffix, Degree, Minute, Degree, Minute with Suffix, Degree, Minute, Second, ..., Custom; "Degree, Minute" previewed (83°0.000′).
- **[07:52]** Font, Distance to map frame `1.00 mm`, Coordinate precision being set to `0`.
- **[08:02]** Format `Decimal with Suffix` → labels 83°W, 82°W, 81°W, 43°N, 42°N.
- **[08:12]** Right `Disabled`, Top `Disabled`; Left and Bottom `Show All`, Outside Frame, Horizontal; map item shifted right so left labels fit on the page.
- **[08:22]** Scalebar moved.
- **[08:32]** `<Scalebar>` Item Properties > Appearance: Box margin 1.00 mm; Label margin 3.00 mm; Distance label placement Above Segment Edges; Primary fill black; Secondary fill white; Line style; Font.
- **[08:42]** Scalebar Frame (unchecked) and Background (checked) sections; Variables.
- **[08:52]** Scalebar Units: Label unit multiplier 1.000000; Label for units `km`; Number format Customize; Method `Calculate along Middle of Map`; Segments left 0, right 2; Fixed width `10.000000 units`; Height 3.00 mm.
- **[09:02]** `Add Item` menu open: Add Map, Add 3D Map, Add Picture, Add Label, Add Dynamic Text, Add Legend, Add Scale Bar, Add North Arrow, Add Shape, Add Marker, Add Arrow, Add Node Item, Add HTML, Add Attribute Table, Add Fixed Table, Add Elevation Profile.
- **[09:12]** `<Legend>` added: shows group thames_river_watershed with pwqmn_station_thames, thames_river, thames_river_watershed, wtrshter and ESRI Satellite. Legend > Main Properties: Title (empty), Map `Map 1`, Arrangement Symbols on Left, Resize to fit contents checked; Word Wrapping; Legend Items: Auto update checked.
- **[09:22]** Auto update unchecked; Update All button; legend items tree editable.
- **[09:32]** `thames_river` selected in tree (removed with the red minus button below the tree).
- **[09:42]** Remaining items: pwqmn_station_thames, thames_river_watershed (wtrshter and ESRI Satellite removed).
- **[09:52]** "Legend Item Properties" > Label: `PWQMN Stations`; Patch Shape, Width/Height Default.
- **[10:02]** Second item label `Thames River Watershed`.
- **[10:22]** Legend Title typed `Thames River Watershed`; item in Items list renamed to the title.
- **[10:32]** Group heading `thames_river_watershed` hidden (legend shows title, PWQMN Stations, Thames River Watershed only).
- **[10:42]** Legend moved to lower right next to the scale bar.
- **[11:02]** Legend sections: Fonts and Text Formatting, Columns, WMS LegendGraphic, Spacing, Position and Size, Rotation, Frame (unchecked), Background (checked).
- **[11:12]** Text Format font list (current "MS Shell Dlg 2"); Arial chosen.
- **[11:22]** Fonts and Text Formatting: Legend Title / Group Headings / Subgroup Headings / Item Labels each with Font and Alignment Left.
- **[11:32]** Scalebar (Main Properties: Map `Map 1`, Style `Single Box`; Units: Scalebar units `Kilometers`) and legend tucked in the bottom-right corner; legend at page edge.
- **[11:42]** `Add Item > Add Label`.
- **[11:52]** Label item "Lorem ipsum" drawn; Label > Main Properties text box; Render as HTML unchecked; Insert/Edit Expression..., Dynamic Text; Appearance: font, Horizontal margin 0.00 mm, Vertical margin 0.00 mm.
- **[12:02]** Text typed: `Water quality monitoring in the Thames river watershed`.
- **[12:12]** Label Font list (MS Shell Dlg 2 current); scrolling fonts.
- **[12:22]** `Roboto Slab` selected.
- **[12:32]** Label Font: Font Roboto Slab, Style Regular, Size `21.0000` Points, Color black, Opacity 100%.
- **[12:42]** "Label Font > Select Text Color": H 120°, S 100%, V 79.04%, RGB 0/201.54/0, HTML notation `#00ca00` (green).
- **[12:52]** Label Font Buffer tab: Draw text buffer unchecked (options Size, Color, Opacity, Pen join style Round, Blend mode Normal).
- **[13:02]** Formatting tab (Type case No Change, spacing, Line height 100%); green title dragged to the bottom-centre over Lake Erie.
- **[13:22]** "Save Layout As" file dialog: File name `thames_watershed`; Save as type `PNG format (*.png *.PNG)`.
- **[13:32]** "Image Export Options": Export resolution `300 dpi`; Page width `3507 px`; Page height `2480 px`; Enable antialiasing checked; Generate world file unchecked; Crop to Content unchecked (margins 0); Open file after exporting unchecked; Save.
- **[13:42]** Green message bar: "Export layout: Successfully exported layout to C:\Users\...\Class materials\Topic lessons\Topic 7\thames_watershed.png".
- **[13:52]** Exported `thames_watershed.png` opened in Windows Photos: compass rose, 1° grid with 83°W-81°W / 42°N-43°N labels, scale bar 0 10 20 km, legend, green title.


## Transcript

**[00:05]** All right, so in this video we're going to go from adding layers to the map canvas to creating a print layout. Print layout is the way that you can produce, um, you know, a finalized map out of QGIS. So we're going to start by, um, from our topic seven folder, the, um, the watershed geo package that we made before. I'm just going to dump that in there. There's all of our points and layers. OK, that's great. OK, great, so that's loaded in at 4326, that's awesome. We've got our um where

**[00:44]** all of our stations are, we've got Thames River, everything like that, so it looks really good. OK, so from here, uh we're gonna add a base map. OK, so we're gonna do Ezri, we'll go to satellite layer. Now we have context for where that watershed is, but we, I kind of wanna make our um. Our watershed that we're focused on kind of pop out a little bit. So, uh, we've got kind of multiple, uh, versions of that uh watershed here. So I'm just going to just turn on uh our, our middle one there, our gold one. We're gonna uh

**[01:22]** change that symbology. So I'll just double click on that. I'm gonna go to simple fill. And this time for fill color, I'm just going to go over and select transparent fill, apply. OK, and then we can see we've got a little uh outline there, but it's not very thick, so let's go back in there. Simple fill, we've got our um stroke color there, let's make that a little bit more exciting. And uh let's increase the the width on that there, let's apply, oh, that's a little heavy.

**[01:57]** Uh, come down a little bit more. OK, so there that kind of really nicely highlights where um the watershed area is, so that's great. So, OK, so now, um, what I'd like to do is, we're going to use one of these other layers that's already in there and that's already filled, and we're going to use kind of a, a neat symbology trick. So, since we've been mostly working in single symbol, we're going to change this to inverted polygon, so this is going to um, Work with symbology outside of the borders of the polygon layer, OK? We're going to make sure we're going to

**[02:35]** change that fill color so that we're going to a solid white, and it's going to make everything outside of the um the polygon borders white. So let's see what that looks like. OK. So now you can see. We have sort of used this layer over top to kind of kind of cut out the base map underneath. And so we've just got the base map showing through our polygon layer there. So we don't have anything else now. It's a little bit hard to understand what the heck is going on here and where we are. So we can actually use um The the

**[03:15]** another base map to sort of sort this out. So let's let's show the base map again. So let's go back into here, we'll double click on here. We've got a symbology. So instead of just super just very white, we're going to make it slightly transparent here. OK, so now our kind of watershed really pops out against the back of the base map, but we can still see things and and um and where we are in context. So I'm kind of, I'm, I'm kind of happy with this. This shows where our watershed is, this shows where the provincial water quality monitoring

**[03:49]** stations are. So let's go ahead and, and, and try and make a little bit of a map of this. So we're gonna go to project, we're gonna go to new print layout. OK, let's call this uh Thames watershed. Now we get this blank canvas, OK, so we want to go to add item and add map, this is probably the most important thing that we want to do. OK. Great, OK, so that gives us um our our map canvas view. Now this is pretty zoomed out here, so I can use this um button over here to toggle and we can

**[04:27]** actually, I'm just rolling with my mouse here, you can zoom in, you can move the content around, so it's just a little bit more centered. OK, that that looks pretty good, so now we're a little bit more centered within that area, we can see that uh watershed a lot better, OK? Um, OK, we can then take unclick this, so you can go back to our hand here and that will allow us to move the map around on the actual canvas. OK? Uh, so this one allows us to move the map around on the actual canvas. So we're nicely centered here. What we can do now is we can add a scale bar.

**[05:04]** OK, so that tells us what our distances look like along the watershed, um, I would probably add a little north arrow in here as well, let's pop that over here. OK, and you've got options for what you want those um those potential arrows to look like, so you can have that, you know, straight directional arrow or whatever you want. There's a couple of different options that are are in there. We can do some um directional arrows in there. Let's put this in there. OK, you can make that a little bit bigger so you get an idea. Um, and

**[05:40]** there's also a couple other options in there as well. We can use this one which has the directions on it already. OK, there we go. Uh, let's just move that over here a little bit. So it's a little bit easier to see. OK, you can see north, uh, east, south and west there. Um, and then I could, uh, we can also go in and for that on the, the map layer there, we can scroll down, there's a lot of options down below. OK. So we can choose whether we want a frame around it, so that puts a little

**[06:15]** frame around the entire map there. OK. Uh, and then we can scroll down. Uh, we can think about whether or not we want a grid. So we want to know where this is in terms of latitude and longitude, or we can add a grid, OK? We can modify that grid. Now our map CRS is using degrees, latitude and longitude. So if we put this to one. And this to one, this shows us where we are actually in terms of the latitude and the longitude. OK? Now those black lines are a little extreme, so let's click on this, let's go to modify grid, um, we'll kind of

**[06:55]** change the line style here, we'll just make that a little bit more transparent. So you can see them, but they're not like right in your face. Um, OK, and then also with that grid option again. We can go down and we can actually specify where we kind of want the grid to be. So and where we want the labels to potentially be on there too. So we can click on draw coordinates. Now you can see our coordinates are being shown here. Um, it's probably overkill to have them on every single side, and we

**[07:32]** can change the format that they show up in as well. So we can do, uh, we can just change it to degree minutes. OK, so that will change it to degrees. Um, we could do decimal with a suffix, so it will, and we can also then tell it how many, um. What the precision of the coordinates we want, we don't really need those to be any more precise, uh, anything after the decimal place, so that's good. Um, I'm going to say that we'll do that on the left and and the bottom. So let's say top, we're going to take those off, uh sorry, right. We're going to take those off as well. OK, and I'm just

**[08:10]** going to shift my map over a little bit so those show nicely on the map canvas. So now we've got our degrees, latitude and longitude, those are prominently shown on there and that's that's really good. So we've got kind of a really good version of our our map here. Um, I'm just going to show you just using the scale bar that there are options for things like, Um, sort of the appearance of it, like what kind of, uh, margins you want and that sort of thing in there, uh, whether or not you want a frame on that, OK, whether you want a background on that, you can change all of that, um, here within the item

**[08:45]** properties. So one of the things we probably want to have an idea of is, well, actually we, we have something on here that we would want people to know what those orange lines are. So we're going to add a legend in. OK, so you can add the legend here, or you can do add item and add legend. OK. So we can pop that legend somewhere here. Now, we've got a number of different things within our legend that you know we probably don't need to have. OK. So we can scroll down. We've got these right now, it's auto updating from the map canvas. So if I click auto update, I can Now remove things that you don't

**[09:26]** necessarily want to show. So, um, and we've got these in kind of weird labels at the moment. So I'm just going to remove that, going to remove our watersheds, don't really need to know that we've got our satellite layer underneath there, um, and we can now show what we've actually got. So this, we're going to double click on that. We're going to say this is the provincial Water Quality Monitoring Network stations. OK, and then we're also gonna change this to just look a little nicer. OK, so that's highlights that we've got that outlined there. Now this also we

**[10:08]** can change the text on, but one of the things we can do, um, is we can put a title on that legend so we can say Thames River or watershed. And it's kind of got the boundary layers there, we can right click on this and go hidden, and so that disappears. Let's tighten that up a little bit there. OK, great. So now we've got um our legend on our map so we can understand. Let's let's pop that over here with our scale. OK. Um, and we can change the

**[10:46]** the font on this as well. So if I scroll down within here, uh, there's fonts, uh, options, so for the legend title I can change that font. So let's say I wanna change it to something different. Maybe I'll just go with Ariel. OK, it will change the fonts on there, and then I can also change, OK, I want that to be a little bit smaller. OK, so that I can change that, I can go back, I can change any of the group headings or anything on there that I want to do for this, maybe I'll just tuck this over here in the corner, OK, and that can just kind of be at the bottom. I can

**[11:23]** know what um what each of these things represents, um, and let's put, we can also add some text on there, OK, so let's grab, um, and we can just add a label, OK, grab a label and we'll fill this in here. OK, so the um water quality monitoring. In the tense. For for watershed. OK. So we can go do that. Now we can check on which font we want to have for

**[12:00]** this. OK, we can do something kind of. Fun See It's OK, that looks kind of fun. And uh so I can uh have that now, and I wanna maybe let's let's increase the size a little bit. OK, and maybe I wanna change the color a little bit as well, it's green, that's a little sharp. OK. So that's good. Um, and so, OK, so let's go back here. We can talk about

**[12:36]** whether or not we want, uh, any background or anything on it. So maybe we want, um, like a buffer around it or some sort of any, any type of formatting, we can change that as well. Let's put this down here. OK. Now, this map is a little, a little goofy, but it kind of gives you the idea of, uh, how you might, uh, be able to approach this a little bit. So, and, and options for you to, um, to alter your map layouts. So let's go to, uh,

**[13:16]** layout, let's go to export image. It's like, OK. Uh, and we're going to go to our topic here. Topic lesson 7, and then we'll just save that as the Thames River Watershed. This is asking what resolution you want that to be in, but you can just save. OK, and I can now see here that I've got my map. OK. And so that's kind of an example of, of something that you could put into

**[13:56]** your story map, um, or put into your NPRI report. OK? So there we're going to be going over more of the finer details on, on how to maybe make your maps look the best that they can, but here, here is the kind of start to finish way that you can load those into print layout, get those out, and, um, and then export them, OK?
