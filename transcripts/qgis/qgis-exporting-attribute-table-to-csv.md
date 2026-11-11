---
title: "QGIS - Exporting attribute table to CSV"
tool: qgis
duration: "03:00"
content_id: d1c2843b-d8a8-4ee9-83c4-ee0ffe3a4a06
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=d1c2843b-d8a8-4ee9-83c4-ee0ffe3a4a06&revisionId=latest
---

# QGIS - Exporting attribute table to CSV — transcript

Duration 03:00. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:12]** Project CRS EPSG:26917. Layers: "Joined layer" (unchecked, italic, temporary-layer indicator icon at right), "Sampled" (graduated points 234.31–238.63, temporary-layer indicator icon), raster "1km17477047610SWOOP2015" (Band 1: Layer_1, 233.126563–273.100006). Buckthorn points beside the river.
- **[00:22]** Attribute table "Sampled — Features Total: 53, Filtered: 53, Selected: 0" (blank while loading).
- **[00:32]** "Sampled" selected; the small indicator icon at the right of the layer row (temporary/scratch layer) is visible.
- **[00:52]** Right-click on "Sampled": Zoom to Layer(s), ..., Open Attribute Table, Toggle Editing, Filter..., Change Data Source..., Set Layer Scale Visibility..., Layer CRS, **Make Permanent...**, **Export** > submenu "Save Features As..." (highlighted), "Save Selected Features As..." (greyed), "Save as Layer Definition File...", "Save as QGIS Layer Style File..."; Styles, Add Layer Notes..., Properties...
- **[01:02]** "Save Vector Layer as..." dialog with Format dropdown open: GeoPackage, ESRI Shapefile, (Geo)Arrow, (Geo)Parquet, AutoCAD DXF, Comma Separated Value [CSV], ESRI File Geodatabase, FlatGeobuf, Geography Markup Language [GML], GeoJSON, GeoJSON - Newline Delimited, GeoRSS, GPS eXchange Format [GPX], Keyhole Markup Language [KML], Mapinfo MIF, Mapinfo TAB, Microstation DGN, MS Office Open XML spreadsheet [XLSX], Open Document Spreadsheet [ODS], PostgreSQL SQL dump, S-57 Base file, SpatiaLite, SQLite. Dialog also shows File name, Layer name, CRS, Encoding, "Save only selected features", "Select fields to export and their export options" (OBJECTID, GlobalID, CreationDate, Creator, EditDate ... all ticked), Select All / Deselect All, "Use aliases for exported name", "Replace all selected raw field values by displayed values", "Persist layer metadata" (ticked), "Geometry" section, "Add saved file to map" (ticked), OK, Cancel, Help.
- **[01:12]** "Save Layer As" file browser at "... > EnvrSust 9014 > 2026-2027 > Class materials > Topic lessons > Topic 5"; Save as type "Comma Separated Value [CSV] (*.csv *.CSV)"; File name being typed.
- **[01:22]** Progress bar 100% in status bar.
- **[01:32]** Message bar: "Layer Exported: Successfully saved vector layer to C:\Users\pmensin\OneDrive - The University of Western Ontario\Teaching\EnvrSust 9014\2026-2027\Class materials\Topic lessons\Topic 5\buckthorn_updated.csv". New non-spatial table layer "buckthorn_updated" (table icon) in Layers panel.
- **[01:42]** Right-click "Sampled" again > Export > Save Features As...
- **[01:52]** "Save Layer As" with Save as type "ESRI Shapefile (*.shp *.SHP)"; Windows right-click > New > Folder in Topic 5.
- **[02:02]** New folder named "buckthorn_updated".
- **[02:12]** Inside folder ".../Topic 5/buckthorn_updated" ("No items match your search"); File name "buckthorn_updated"; behind it the Save Vector Layer as... dialog shows Format "ESRI Shapefile", CRS "EPSG:26917 - NAD83 / UTM zone 17N".
- **[02:22]** "Layer Exported" message; new point layer "buckthorn_updated" (no temporary indicator) above "Sampled".
- **[02:32]** Original "Sampled" turned off ("1 legend entries removed" after removing the exported layer).
- **[02:42]** Windows Explorer ".../Topic lessons > Topic 5 > buckthorn_updated": buckthorn_updated.cpg, buckthorn_updated (dbf), buckthorn_updated.prj, buckthorn_updated (qmd), buckthorn_updated.shp, buckthorn_updated.shx — .shp dragged into QGIS.
- **[02:52]** Re-added layer tooltip: "buckthorn_updated (Point - EPSG:26917) .../Topic lessons/Topic 5/buckthorn_updated/buckthorn_updated.shp".

## Transcript

**[00:06]** All right, so now that we have joined um that data together, so we've we've sampled the raster values, we've measured distances to the um to the water edges. I want to, we can go back and take a look at um that attributes table again just to verify what we've got. What we need, we've got distance, we've got elevation there as well. So now we want to actually export this data to a CSV. Now one thing that you may have noticed already is that there's this little icon here that indicates that these layers that we are making when we're joining layers are not permanent. That means if you close

**[00:44]** down GIS try and reopen it, those will be gone. So we want to do a couple of things. So we want to um let me export this, we're gonna save features as if you wanted to bring this data easily back into um into QGIS you could either save it as a shape file or as a comma separated file as well. We're going to save it as a CSV. So when we go in here. Uh, we're gonna talk 5. I'm just gonna save this here as our Buckthorn. Updated file that's gonna save that as a CSV.

**[01:22]** OK, now that will be in there. Now that doesn't have any, now that I saved it as CSV, it, it doesn't have any, uh, spatial data attached to it. It doesn't know that it is, uh, has spatial data. So when you upload it again, you'd have to add a delimited text layer. If you wanted to, um, export that as a shape file instead, then you would just go to shape file, uh, you would save again, you'd make a new folder here to save that. OK, so in this case we can say, uh, what's our our our Buckthorne updated.

**[02:05]** Mhm. Oh, sorry. Just give it in here as well. And click OK. Now we've got that that has made a new permanent layer. It doesn't have that temporary sign anymore and you'll be able to save that and reupload it when we drop it back in. So I can remove that layer now, click OK. Let's turn off this one. Go back to my topic five here and I've got my Buckthorne updated. And just drag and drop that shape file in and we're good

**[02:42]** to go. OK, so just remember if you want to export that as a shape file, you need to do that through the export, but you can also save it as a CSV and now we can use that CSV and go analyze it within Excel or within R. So now we're kind of shifting back and forth between the programs by being able to do that.
