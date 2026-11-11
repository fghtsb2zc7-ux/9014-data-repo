---
title: "QGIS - Adding a shapefile"
tool: qgis
duration: "01:27"
content_id: d76eb579-57fa-4898-bcac-b945e12fcbaf
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=d76eb579-57fa-4898-bcac-b945e12fcbaf&revisionId=latest
---

# QGIS - Adding a shapefile — transcript

Duration 01:27. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** A different (newer) QGIS install, no SCP menu: menu bar `Project Edit View Layer Settings Plugins Vector Raster Database Web Mesh Processing Help`; Browser lists Favorites, Spatial Bookmarks, Home, C:\, GeoPackage, SpatiaLite, PostgreSQL, SAP HANA, STAC, MS SQL Server, Oracle, WMS/WMTS (Crops, So4), Cloud, Scenes, SensorThings, Vector Tiles, XYZ Tiles; Layers panel has "World Map"; status "1 legend entries removed."
- **[00:32]** Windows File Explorer (Desktop) open over QGIS: files Geolocations.dbf, Geolocations (no extension shown), Geolocations.shp, Geolocations.shx, Geolocations.cpg, Geolocations.prj; Quick access includes folder "NPRI data".
- **[00:52]** "Geolocations.shp" selected ("1 item selected 671 KB").
- **[01:12]** After dragging Geolocations.shp onto the QGIS canvas: magenta points across Canada drawn over World Map; tooltip "SHP File ... Date modified: 2026-08-14 8:02 PM".
- **[01:22]** Cursor over Geolocations.prj (tooltip "PRJ File, 145 bytes") while instructor explains the companion files must stay together.

## Transcript

**[00:07]** All right, very quick video here on how to load a shape file. So, we already saw from the Statistics Canada demo that you can load it up through the browser, but there's also really easy drag and drop approach to it as well. Um, so, I'm just gonna show you that, and so, I'm gonna open up, um, a shape file that I saved. I created a shape file here, uh, from the NRI data set of the CSV of the geolocation. One key thing to note about shape files is that they're actually a collection of files. So, I exported this into a shape file called geolocations. It

**[00:42]** actually came out as a ton of different files. So, the key thing here is this.shp is the kind of one that binds them all together. So, if you just drag and drop that, that just pops that shape file right in for you. Importantly, if you, if you create a shape file or if you download one, you have to keep these files together in the same location. If you just cut and paste the shape file into another or the dot SHP file into another folder, it's gonna break that connection. So you need to make sure you keep all of

**[01:16]** these files together, because all together, they provide the information that QJS needs to actually uh put your shape file into the program.
