# Marine invasive species distribution rasters - green shore crab and sea vase

| File | Original path (`sources/files/...`) | Size | Species |
|---|---|---|---|
| `Carcinus maenas.tif` | `Topic 2/Carcinus maenas.tif` | 293,426 B | European green shore crab |
| `Ciona intestinalis.tif` | `Topic 2/Ciona intestinalis.tif` | 414,223 B | Sea vase (vase tunicate) |

- Format: single-band GeoTIFF. CRS: not listed (no `.prj`/metadata profiled); QGIS reads it from the GeoTIFF.
- Provenance: Fisheries and Oceans Canada (DFO), "Updated Species Distribution Models for Marine Invasive Species
  Hotspot Identification" on the Open Government Portal
  (<https://open.canada.ca/data/en/dataset/1439dcb3-82a6-40fd-a9a4-8f045b20ff5b>). The dataset provides species
  distribution models (present day and 2100 under RCP 8.5) for 24 east-coast and 31 west-coast non-indigenous
  species, as a zipped set of TIFFs and as ESRI REST MapServer services (English:
  `https://egisp.dfo-mpo.gc.ca/arcgis/rest/services/open_data_donnees_ouvertes/updated_species_distribution_models_marine_invasive_hotspot_id_en/MapServer`).
  The instructor extracted these two TIFFs (Atlantic predictions) and posted them on the
  [Topic 2 page](../course-pages/topic-2-transforming-and-wrangling-data.md) because "NPRI doesn't have a good
  range of raster files".
- Pixel values: probability of occurrence from 0 (almost no chance the species is present) to 1 (very high
  probability) [video qgis-raster-import @01:59]. Very small values display in scientific notation (e.g. `e-6`)
  with the Identify tool [video qgis-raster-calculator @00:42].

## Data-quality / handling notes

1. Loads as grey-scale; set Layer Properties > Symbology > Singleband pseudocolor to see the gradient
   [video qgis-raster-import @01:59].
2. Pixels are fairly coarse; zooming in shows individual cells [video qgis-raster-import @02:35].
3. Raster Calculator thresholding: a comparison such as layer `> 0.5` alone returns a 0/1 raster; multiplying that
   result by the layer again keeps the original probabilities above the cut-off and sets the rest to 0
   [video qgis-raster-calculator @01:57-03:17]. The exact expression as typed on screen is in the transcript's
   visual notes and the QGIS procedure files.
4. Two-raster combination (where both species are likely) is shown in
   [video qgis-raster-calculator-with-two-raster-layers].
5. The same data loaded through the ESRI REST MapServer arrives as rendered tiles in EPSG:3857 (pseudo-Mercator)
   and cannot be manipulated like the TIFFs [video qgis-esri-rest-servers @01:22, @03:13].

## Course procedures that use it

QGIS: Raster import, Raster calculator, ESRI REST servers, Raster calculator with two raster layers
(transcripts in [../transcripts/qgis/](../transcripts/qgis/)); procedures under `../tools/qgis/`.
