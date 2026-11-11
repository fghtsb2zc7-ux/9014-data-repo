---
id: qgis.export-layer-to-csv-or-shapefile
tool: qgis
title: Export a layer's attribute table to CSV or save it as a permanent shapefile
keywords: [export, save features as, attribute table to csv, csv export, shapefile export, make permanent, temporary layer, scratch layer, save vector layer as, geopackage, xlsx, share with Excel or R]
software_context: "QGIS 3.x (Windows), Layers panel right-click > Export > Save Features As... (Save Vector Layer as... dialog)"
prerequisites: []
source_videos: [{video: transcripts/qgis/qgis-exporting-attribute-table-to-csv.md, timestamps: "00:06-03:00"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md, course-pages/technical-skills-checklist.md]
datasets_used: ["Topic 5 buckthorn workflow output layer 'Sampled'", "Topic 5.zip > Topic 5/buckthorn_updated.csv", "Topic 5.zip > Topic 5/buckthorn_updated/buckthorn_updated.shp"]
---
# Export a layer's attribute table to CSV or save it as a permanent shapefile

## Purpose
Processing outputs (joins, Sample Raster Values) are temporary layers that disappear when QGIS closes. Export them to CSV for Excel/R, or to a shapefile to keep the geometry [video qgis-exporting-attribute-table-to-csv @00:06-00:44]. Checklist items 14 and 22 [page technical-skills-checklist.md].

## Steps
1. Identify temporary layers: they show a small indicator icon at the right of the layer row in the Layers panel (course: `Sampled`, `Joined layer`) [video @00:06] [frame @00:12].
2. Optional check: right-click > `Open Attribute Table` ("Sampled — Features Total: 53") [frame @00:22].
3. Right-click the layer > `Export` > `Save Features As...` [video @00:44] [frame @00:52]. (`Make Permanent...` is also in this menu [frame @00:52]; its use is not shown.)
4. In "Save Vector Layer as...", set `Format` = `Comma Separated Value [CSV]` [video @00:44] [frame @01:02].
5. Click `...` next to `File name`, browse to the folder (course: `Topic 5`), type the name (`buckthorn_updated`), Save as type `Comma Separated Value [CSV] (*.csv *.CSV)`, `Save` [video @00:44-01:22] [frame @01:12].
6. Leave fields all ticked under "Select fields to export and their export options"; `Add saved file to map` ticked; click `OK` [frame @01:02].
7. Message bar: "Layer Exported: Successfully saved vector layer to ...\Topic 5\buckthorn_updated.csv"; a non-spatial table layer is added [frame @01:32].
8. For a spatial copy instead: right-click > `Export` > `Save Features As...`, `Format` = `ESRI Shapefile` [video @01:22] [frame @01:42, @02:12].
9. Click `...`, create a new folder (Windows right-click > New > Folder; course: `buckthorn_updated`), open it, File name `buckthorn_updated`, Save as type `ESRI Shapefile (*.shp *.SHP)`, `Save` [video @01:22-02:05] [frame @01:52-02:12].
10. CRS stays as the layer's (course: `EPSG:26917 - NAD83 / UTM zone 17N`); `OK` [frame @02:12].
11. The new layer has no temporary icon; you can remove the temporary layer and drag `buckthorn_updated.shp` back in from the folder [video @02:05-02:42] [frame @02:42-02:52].

## Formulas / expressions / code
None.

## Verify
- Green "Layer Exported: Successfully saved vector layer to <path>" message [frame @01:32].
- Folder contains `buckthorn_updated.csv`, or `buckthorn_updated.shp/.shx/.dbf/.prj/.cpg/.qmd` [frame @02:42].
- Re-added shapefile tooltip shows "(Point - EPSG:26917)" [frame @02:52].

## Pitfalls
- A CSV export carries no geometry; re-importing requires `Add Delimited Text Layer` with coordinate fields [video @01:22].
- Temporary (scratch/processing) layers are lost when QGIS closes unless exported [video @00:06-00:44].
- Put each shapefile in its own folder — it is several files [video @01:22].
- Format list also includes GeoPackage, GeoJSON, KML, MS Office Open XML spreadsheet [XLSX], etc. [frame @01:02]. GeoPackage saving is covered in [QGIS - Saving working layers to GeoPackages](../../transcripts/qgis/qgis-saving-working-layers-to-geopackages.md).

## Related
- [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md) (export a filtered layer to make the subset permanent)
- [create-shapefile-layer-and-digitize-polygon.md](create-shapefile-layer-and-digitize-polygon.md)
- Transcript: [QGIS - Exporting attribute table to CSV](../../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md)
