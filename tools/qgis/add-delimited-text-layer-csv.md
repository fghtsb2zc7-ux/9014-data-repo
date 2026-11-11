---
id: qgis.add-delimited-text-layer-csv
tool: qgis
title: Add a CSV with latitude/longitude as a point layer (Add Delimited Text Layer)
keywords: [CSV, delimited text, add delimited text layer, import csv, latitude, longitude, X field, Y field, point coordinates, lat long, geometry CRS, EPSG:4326, WGS 84, NPRI geolocations, PWQMN stations, Data Source Manager, points from table, XY data]
software_context: "QGIS 3.x (Windows), Layer > Add Layer > Add Delimited Text Layer... (Data Source Manager | Delimited Text)"
prerequisites: [qgis.interface-map]
source_videos: [{video: transcripts/qgis/qgis-adding-a-delimited-text-layer.md, timestamps: "00:06-03:03"}, {video: transcripts/qgis/qgis-basic-filter-in-qgis.md, timestamps: "00:35-01:05"}, {video: transcripts/qgis/qgis-saving-working-layers-to-geopackages.md, timestamps: "02:08-02:40"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md, course-pages/technical-skills-checklist.md, course-pages/the-npri-dataset.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip > NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv", "sources/files/PWQMN_Stations.csv (also inside the Topic 7 folder in the video)"]
---
# Add a CSV with latitude/longitude as a point layer

## Purpose
Turn a non-spatial CSV that has coordinate columns into a point layer. Used constantly in the course (NPRI facility geolocations, PWQMN water-quality stations) [video qgis-adding-a-delimited-text-layer @00:06-00:42]. Checklist skill "I can load a CSV file into QGIS" [page technical-skills-checklist.md].

## Steps
1. `Layer > Add Layer > Add Delimited Text Layer...` (Ctrl+Shift+T) [video qgis-adding-a-delimited-text-layer @00:42] [frame qgis-basic-filter-in-qgis @00:42].
2. "Data Source Manager | Delimited Text" opens (Delimited Text selected in the left list) [frame qgis-adding-a-delimited-text-layer @01:02].
3. Click the **...** button at the right of **File name** and open the CSV, e.g. `NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv` (in the NPRI data folder; file filter "Text files (*.txt *.csv *.dat *.wkt ...)") [frame qgis-adding-a-delimited-text-layer @01:12].
4. Leave **Encoding** = `UTF-8` and **File Format** = `CSV (comma separated values)` [frame qgis-adding-a-delimited-text-layer @01:22].
5. Under **Geometry Definition** keep **Point coordinates** selected.
6. Set **X field** = the longitude column (east-west) and **Y field** = the latitude column (north-south) [video qgis-adding-a-delimited-text-layer @01:22-01:50]:
   - NPRI geolocations: X field `Longitude / Longitude`, Y field `Latitude / Latitude` (must be chosen manually) [frame qgis-adding-a-delimited-text-layer @01:52]
   - PWQMN stations: X field `LONGITUDE`, Y field `LATITUDE` (auto-detected) [frame qgis-saving-working-layers-to-geopackages @02:32]
7. Leave **Geometry CRS** = `EPSG:4326 - WGS 84` for lat/long in decimal degrees [video qgis-adding-a-delimited-text-layer @02:01].
8. Check the **Sample Data** preview (column types such as "123 Integer (32 bit)", "abc Text (string)", "1.2 Decimal (double)") [frame qgis-adding-a-delimited-text-layer @01:22].
9. Click **Add**, then **Close** [video qgis-saving-working-layers-to-geopackages @02:15].
10. In the Layers panel drag any World Map/base map **below** the new point layer [video qgis-adding-a-delimited-text-layer @02:20].

## Verify
- A point layer named after the file (e.g. "NPRI-INRP_Geolocations...") appears; NPRI points outline the shape of Canada [video qgis-adding-a-delimited-text-layer @02:20] [frame qgis-adding-a-delimited-text-layer @02:32].
- Right-click > Open Attribute Table: all CSV columns, including latitude/longitude, are present [video qgis-adding-a-delimited-text-layer @02:45].
- The NPRI geolocations file contains all facility locations over time, so loading takes a moment and there are many points (~23,500 rows) [video qgis-adding-a-delimited-text-layer @02:10] [_raw Class 1__NPRI data.zip.contents.md].

## Pitfalls
- **X/Y not auto-detected**: QGIS only auto-fills when columns are plainly named (e.g. lat/long, LATITUDE/LONGITUDE). The NPRI headers are bilingual with a slash ("Latitude / Latitude"), so pick them yourself; until both are set the dialog says "X and Y field names must be selected" and Add stays greyed [video qgis-adding-a-delimited-text-layer @02:01] [frame qgis-adding-a-delimited-text-layer @01:22].
- **Swapping X and Y** puts points in the wrong place: X = longitude, Y = latitude [video qgis-adding-a-delimited-text-layer @01:40].
- **Accented header characters** in the NPRI file display as "�" with UTF-8 (e.g. "Ann�e de d�claration la plus r�cente") [frame qgis-adding-a-delimited-text-layer @01:22]. The course leaves UTF-8 and works with the garbled names; choosing a Windows-1252/ISO-8859-1 encoding may display them correctly (general knowledge — not shown in course). Field names in later expressions must match what QGIS shows.

## Related
- [filter-vector-single-condition-query-builder.md](filter-vector-single-condition-query-builder.md)
- [filter-vector-multiple-conditions.md](filter-vector-multiple-conditions.md)
- [add-shapefile-drag-and-drop.md](add-shapefile-drag-and-drop.md)
- [field-calculator-change-column-type.md](field-calculator-change-column-type.md)
- [save-layers-to-geopackage.md](save-layers-to-geopackage.md)
