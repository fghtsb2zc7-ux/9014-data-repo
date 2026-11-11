# Annual Crop Inventory 2018, Ontario - `aci_2018_on_v3`

- Original path: `sources/files/Topic 5.zip` > `Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif` (1.69 GB uncompressed)
  and `aci_crop_classifications_iac_classifications_des_cultures.csv` (2.8 KB, code lookup; the profiler could not
  parse it - likely an encoding or layout issue with the bilingual file).
- Provenance: Agriculture and Agri-Food Canada (AAFC), "Annual Crop Inventory 2018"
  (<https://open.canada.ca/data/en/dataset/1f2ad87e-6103-4ead-bdd5-147c33fa11e6>): national crop-type maps from
  Landsat-8, Sentinel-2 and RADARSAT-2 at 30 m resolution; resources include GeoTIFFs, a crop classification CSV and
  ESRI REST services.
- Naming mismatch: the [Topic 5 page](../course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md)
  labels this link "Agricultural Resource Inventory (ARI)" and describes a historical southern-Ontario land-use
  dataset, but the URL is the AAFC Annual Crop Inventory 2018, and the video calls it the "agricultural crop
  index" / "ACI" [video qgis-buffer-creation-and-zonal-histograms]. The file in the zip is the ACI.
- Values: thematic crop class codes; video examples `147` = corn, `158` = soybeans (from the lookup CSV).
- CRS: not listed in the zip profile. The video reprojects it with Warp (Reproject) to NAD83 / UTM zone 17N to match
  the buffered stations before the zonal histogram [video qgis-buffer-creation-and-zonal-histograms @03:52].

## Handling notes

1. Very large raster (1.69 GB): load once, avoid on-the-fly reprojection; clip or warp to the study area.
2. Rasters reproject with Raster > Projections > Warp (Reproject), not the vector Reproject Layer tool.
3. Zonal histogram output adds one pixel-count column per class code (QGIS default prefix `HISTO_`, e.g.
   `HISTO_147` - general knowledge, not shown in course); join codes to names with the lookup CSV.
4. Use paletted/unique-values symbology for class codes.

## Course procedures that use it

QGIS: Buffer creation and zonal histograms (PWQMN stations buffered, ACI warped, Zonal Histogram); results can be
exported and merged in Excel with water-quality data.
