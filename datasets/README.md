# Datasets used in ENVRSUST 9014 (Fall 2026)

Catalog of every data file the course distributes on Brightspace. Original files live on the user's disk under
`sources/files/<path>` (paths below are relative to `sources/files/`). Sizes are file sizes from the course
inventory; "zip member" sizes are uncompressed. Row and column counts come from automated profiles
(`_raw/extracted/*.schema.md`, `*.contents.md`). CRS comes from the `.prj` file inside the zip when one is
listed; "not listed" means no `.prj` was available to check.

Start here, then open the per-dataset doc (Doc column) for the column dictionary and data-quality traps.

## Quick lookup by class / assessment

| Where it is used | Datasets |
|---|---|
| Class 1 / Topic 1 (right whale, NPRI intro) | [NPRI](npri.md), [OBIS right whale](obis-north-atlantic-right-whale.md), [Vessel routes](vessel-traffic-routes.md) |
| Class 2 / Topic 2 (animal movement) | [Basking shark tag data, GEBCO](class-2-basking-shark-tag-data.md), [Irish sportfish tagging](irish-marine-sportfish-tagging.md), [OBIS right whale](obis-north-atlantic-right-whale.md), [Marine invasive species rasters](marine-invasive-species-rasters.md) |
| Class 3 / Topic 3 (fisheries) | [Irish sportfish tagging](irish-marine-sportfish-tagging.md), [Rock crab survey](rock-crab-survey.md) (case study #3 rock crab, inferred) |
| Class 4 (buckthorn field survey) | [Buckthorn survey](buckthorn-survey.md) |
| Class 5 / Topic 5 (joins, water quality, acid rain) | [PWQMN](pwqmn.md), [US power plants](us-power-plants.md), [Conservation authority areas](conservation-authority-areas.md), [Annual Crop Inventory 2018](annual-crop-inventory-2018.md), [Ontario ecodistricts](ontario-ecodistricts.md), [Buckthorn survey](buckthorn-survey.md) |
| Class 6 / Topic 6 + NPRI assignment | [NPRI](npri.md), [German PRTR releases](germany-prtr-releases.md) |
| Class 7 / Topic 7 (statistics, map-making) | [Buckthorn survey](buckthorn-survey.md) (`buckthorn_updated.csv`), [Topic 7 Ontario boundary layers](topic-7-ontario-boundary-layers.md) |
| Class 8 / Case study #8 (Thames Talbot Land Trust) | [Ontario Land Cover Compilation](ontario-land-cover-compilation.md), [SOLRIS 3.0 change](solris-3-land-use-change.md), [London parcels and TTLT area](london-parcels-and-ttlt-area.md), [LIO wooded area and wetland units](lio-wooded-area-and-wetland-units.md), [PWQMN](pwqmn.md) (R heatmap script) |
| Exam practice set #1 | [OBIS right whale](obis-north-atlantic-right-whale.md), [Vessel routes](vessel-traffic-routes.md) |
| Exam practice set #2 | [Rock crab survey](rock-crab-survey.md) |
| Practice R exam | [Parks Canada human-wildlife coexistence](human-wildlife-coexistence.md) |
| Full practice exam (particulate matter) | [TPM practice exam data](tpm-practice-exam.md) |

## Full catalog

| Dataset (file) | Original path (`sources/files/...`) | Format | Size | Rows x cols / layer contents | CRS (.prj) | Used in | Tools | Doc |
|---|---|---|---|---|---|---|---|---|
| NPRI bulk data (5 CSVs) | `Class 1/NPRI data.zip` | zip of CSV | 39.7 MB zip | `NPRI-INRP_ReleasesRejets_1993-present.csv` (363 MB), `NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv` (13.7 MB, 23,568 x 24), `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv` (160 KB, ~1,300 rows per video), `NPRI-INRP_CommentsCommentaires_1997-present.csv` (164 MB), `NPRI-INRP_DataDonnées_2024.csv` (38.8 MB, 58,780 x 66) | n/a (lat/long columns, WGS 84 EPSG:4326 used in videos) | Topics 1-7 training videos, Class 1 R lesson, Class 6, NPRI assignment | Excel, QGIS, R | [npri.md](npri.md) |
| German PRTR releases 2007-2024 | `Releases_Germany_2007_2024.xlsx` | XLSX (1 sheet) | 11.7 MB | 79,844 x 34 | n/a (ETRS89 x/y columns) | NPRI group assignment | Excel, R | [germany-prtr-releases.md](germany-prtr-releases.md) |
| Class 1 case study bundle | `Class 1/Class 1 case study.zip` | zip | 2.5 MB zip | `OBIS - North Atlantic Right Whale full.csv` (26.6 MB, 8,793 x 285), `OBIS - North Atlantic Right Whale reduced.csv` (1.31 MB, 8,793 x 16, same as Topic 2 copy), `Vessel_Traffic_Routes.zip` (nested, 8.8 MB; contents not listed - larger than the 1.06 MB practice-set copy), `Topic 1 - Case study.qmd` (draft template) | n/a (EPSG:4326 coordinates) | Class 1 case study #1 (right whale protections) | Excel, QGIS, R | [obis-north-atlantic-right-whale.md](obis-north-atlantic-right-whale.md), [vessel-traffic-routes.md](vessel-traffic-routes.md) |
| OBIS North Atlantic right whale (Topic 2 copy) | `Topic 2/OBIS - North Atlantic Right Whale reduced.csv` | CSV | 1.31 MB | 8,793 x 16 (includes `month`) | n/a (decimal lat/long, EPSG:4326) | Topic 2 Excel date videos | Excel (Power Query), QGIS, R | [obis-north-atlantic-right-whale.md](obis-north-atlantic-right-whale.md) |
| OBIS North Atlantic right whale (practice copy) | `Practice sets/OBIS - North Atlantic Right Whale reduced.csv` | CSV | 1.29 MB | 8,793 x 15 (no `month`) | n/a (EPSG:4326) | Exam practice set #1, practice exam ferry question | Excel, QGIS, R | [obis-north-atlantic-right-whale.md](obis-north-atlantic-right-whale.md) |
| Vessel traffic routes | `Practice sets/Vessel_Traffic_Routes.zip` | zip of 15 shapefiles | 1.06 MB | CTSARE_A, FERYRT_L, ISTZNE_A, NAVLNE_L, RCRTCL_L, RCTLPT_A, RCTLPT_P, RECTRC_A, RECTRC_L, TSELNE_L, TSEZNE_A, TSSBND_L, TSSCRS_A, TSSLPT_A, TWRTPT_A | GCS_WGS_1984 (EPSG:4326) for all | Class 1 case study, exam practice set #1, practice exam (ferry) | QGIS | [vessel-traffic-routes.md](vessel-traffic-routes.md) |
| Green shore crab SDM raster | `Topic 2/Carcinus maenas.tif` | GeoTIFF | 293 KB | single-band raster | not listed | Topic 2 QGIS raster videos | QGIS | [marine-invasive-species-rasters.md](marine-invasive-species-rasters.md) |
| Sea vase SDM raster | `Topic 2/Ciona intestinalis.tif` | GeoTIFF | 414 KB | single-band raster | not listed | Topic 2 QGIS raster videos | QGIS | [marine-invasive-species-rasters.md](marine-invasive-species-rasters.md) |
| Class 2 bundle (basking shark tag 108916, GEBCO, sportfish, scripts) | `Class 2/Class 2.zip` | zip | 76.8 MB | `data/108916_histos.csv` (1,072 x 38), `data/108916_tag.csv` (586 x 14), `data/gebco_2025_n56.0_s14.0_w-32.0_e-7.4.tif` (119 MB), `data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` (47,086 x 15), `Topic 2.R`, `Topic 2 - Case study.qmd` | not listed | Class 2 Positron lesson and case study | R, QGIS | [class-2-basking-shark-tag-data.md](class-2-basking-shark-tag-data.md) |
| Irish Marine Sportfish Tagging Programme | `Class 2/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` | CSV | 5.8 MB | 47,086 x 13 | n/a (x/y = ICES sub-rectangle centres, degrees) | Class 2 case study, Class 3 (2 h) | Excel, R, QGIS | [irish-marine-sportfish-tagging.md](irish-marine-sportfish-tagging.md) |
| Rock crab survey - station/tow info | `Practice sets/Practice set #2/Information_stations.csv` | CSV (French/English) | 303 KB | 2,012 x 23 | n/a (decimal degrees) | Exam practice set #2 | R | [rock-crab-survey.md](rock-crab-survey.md) |
| Rock crab survey - crab counts | `Practice sets/Practice set #2/Nombre_crabe_crab_number.csv` | CSV (French/English) | 103 KB | 1,755 x 16 | n/a | Exam practice set #2 | R | [rock-crab-survey.md](rock-crab-survey.md) |
| Buckthorn observations (raw field data) | `Buckthorn observations_0.csv` (also inside `Topic 5.zip`) | CSV | 12.1 KB | 53 x 22 | n/a (x/y decimal degrees) | Class 4, Topic 5 QGIS videos | QGIS, Excel, R | [buckthorn-survey.md](buckthorn-survey.md) |
| Buckthorn observations (joined/updated) | `buckthorn_updated.csv` (also inside `Topic 5.zip`) | CSV | 22.6 KB | 53 x 36 | n/a (adds UTM 17N metre coordinates) | Topic 5 in-class R, Class 7 R (`Topic 7.R`) | R | [buckthorn-survey.md](buckthorn-survey.md) |
| PWQMN 2024 results | `PWQMN_data_2024.csv` (also inside `Topic 5.zip`) | CSV | 11.3 MB | 112,392 x 15 | n/a | Topic 5 videos, Class 5 case study, Class 8 R script | Excel, QGIS, R | [pwqmn.md](pwqmn.md) |
| PWQMN stations | `PWQMN_Stations.csv` (also inside `Topic 5.zip`) | CSV | 229 KB | 2,198 x 10 | n/a (LATITUDE/LONGITUDE, EPSG:4326 in videos) | Topic 5 videos, Class 5, Class 8 | Excel, QGIS, R | [pwqmn.md](pwqmn.md) |
| Topic 5 bundle | `Topic 5.zip` | zip | 160.6 MB | see per-layer rows below | mixed | Topic 5 videos, Class 5 | QGIS, Excel, R | [pwqmn.md](pwqmn.md), [buckthorn-survey.md](buckthorn-survey.md) |
| - SWOOP 2015 elevation tile | `Topic 5.zip` > `Topic 5/1km17477047610SWOOP2015.img` | ERDAS IMG raster | 1.05 MB | single-band elevation raster | not listed | QGIS Sample raster values video | QGIS | [buckthorn-survey.md](buckthorn-survey.md) |
| - Annual Crop Inventory 2018 (Ontario) | `Topic 5.zip` > `Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif` + `aci_crop_classifications_iac_classifications_des_cultures.csv` | GeoTIFF + CSV lookup | 1.69 GB tif; 2.8 KB csv | thematic crop raster; code lookup (csv could not be profiled) | not listed | QGIS Buffer and zonal histograms video | QGIS | [annual-crop-inventory-2018.md](annual-crop-inventory-2018.md) |
| - PWQMN analyte lookup | `Topic 5.zip` > `Topic 5/ANALYTE_PARM_LOOKUP_EN_2025.csv` | CSV | 4.8 KB | 85 x 4 | n/a | Topic 5 | Excel, R | [pwqmn.md](pwqmn.md) |
| - buckthorn_updated shapefile | `Topic 5.zip` > `Topic 5/buckthorn_updated/` | shapefile | 145 KB dbf | 53 points | NAD83 / UTM zone 17N (EPSG:26917) | Topic 5 QGIS videos | QGIS | [buckthorn-survey.md](buckthorn-survey.md) |
| - EcoDistrict | `Topic 5.zip` > `Topic 5/EcoDistrict/` | shapefile + ISO XML metadata | 2.2 MB shp | Ontario ecodistrict polygons | GCS_North_American_1983 (EPSG:4269) | QGIS Join attributes by location video | QGIS | [ontario-ecodistricts.md](ontario-ecodistricts.md) |
| - Parking lot | `Topic 5.zip` > `Topic 5/Parking lot/` | shapefile | <1 KB | 1 hand-drawn polygon | GCS_WGS_1984 (EPSG:4326) | QGIS Creating a new layer video | QGIS | [buckthorn-survey.md](buckthorn-survey.md) |
| - Sampling area | `Topic 5.zip` > `Topic 5/Sampling area/` | shapefile | <1 KB | 1 hand-drawn polygon | GCS_WGS_1984 (EPSG:4326) | QGIS Creating a new layer video | QGIS | [buckthorn-survey.md](buckthorn-survey.md) |
| - Water_Edges | `Topic 5.zip` > `Topic 5/Water_Edges/` | shapefile | 16.4 MB shp | hydrography shoreline lines | NAD83 / UTM zone 17N (EPSG:26917) | QGIS Join attributes by nearest video | QGIS | [buckthorn-survey.md](buckthorn-survey.md) |
| - PWQMN 2000-2009 | `Topic 5.zip` > `Topic 5/PWQMN-2000_2009.csv` | CSV | 107.5 MB | not profiled (has `station`, `year` after clean_names) | n/a | R row binds video | R | [pwqmn.md](pwqmn.md) |
| - PWQMN 2010-2018 | `Topic 5.zip` > `Topic 5/PWQMN-2010_2018.csv` and `PWQMN_2010_2018_update5.csv` | CSV | 103.0 MB each (same size, likely duplicates) | not profiled | n/a | R row binds video | R | [pwqmn.md](pwqmn.md) |
| - PWQMN field data 2021-2022 | `Topic 5.zip` > `Topic 5/PWQMN_FieldData_2021-2022_Final.csv` | CSV | 583 KB | 6,744 x 13 | n/a | Topic 5 (purpose not stated) | Excel, R | [pwqmn.md](pwqmn.md) |
| US power plants (EIA) | `04 - Lesson 4/Pre-class work/Power_Plants.csv` | CSV | 3.55 MB | 12,008 x 34 | n/a (X/Y and Longitude/Latitude, degrees) | Class 5 case study #5 (sulphate deposition) | Excel, QGIS | [us-power-plants.md](us-power-plants.md) |
| Conservation Authority administrative areas | `04 - Lesson 4/Pre-class work/caadmin.zip` | zip shapefile + .tbl | 9.0 MB | caadmin polygons (+ `cons_auth_admin_area.tbl`, `geog_unit.tbl`) | GCS_North_American_1983 (EPSG:4269) | Class 5 case study #5 | QGIS | [conservation-authority-areas.md](conservation-authority-areas.md) |
| Topic 7 Ontario boundary layers | `Topic 7.zip` | zip of 5 shapefiles | 179 MB | `ansi`, `indianre`, `lpr_000b16a_f`, `municlow`, `wtrshter` | ansi/indianre/municlow/wtrshter: GCS_North_American_1983 (EPSG:4269); lpr_000b16a_f: NAD83 Lambert Conformal Conic (Statistics Canada Lambert) | Topic 7 QGIS videos, Class 7 map exercise | QGIS | [topic-7-ontario-boundary-layers.md](topic-7-ontario-boundary-layers.md) |
| TPM practice exam data | `TPM practice exam.zip` | zip | 73.9 MB | `particulate_matter_ON.csv` (3,094 x 15), `ELC/ELC.shp` (44.5 MB, ecozone/ecoregion/ecodistrict polygons), `can_ppp_2020_1km_Aggregated.tif` (42.6 MB population raster) | ELC: GCS_North_American_1983 (EPSG:4269); tif not listed | Full practice exam (particulate matter) | R, QGIS | [tpm-practice-exam.md](tpm-practice-exam.md) |
| Parks Canada human-wildlife: animals involved | `Practice Questions/pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv` | CSV | 18.0 MB | 103,310 x 14 | n/a | Practice R exam | R | [human-wildlife-coexistence.md](human-wildlife-coexistence.md) |
| Parks Canada human-wildlife: incidents | `Practice Questions/pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv` | CSV | 14.0 MB | 87,789 x 10 | n/a (Public Latitude/Longitude) | Practice R exam | R | [human-wildlife-coexistence.md](human-wildlife-coexistence.md) |
| SOLRIS 3.0 land-cover change 2000-2015 | `06 - Ecosystem services/SOLRIS 3.0.zip` | zip shapefile + CSV + QGIS .qmd | 7.9 MB | 69,836 change polygons; `SOLRIS 3.0.csv` = attribute table (69,836 x 11) | NAD83(CSRS) / Ontario MNR Lambert (EPSG:3162) | Class 8 case study #8 | QGIS, R | [solris-3-land-use-change.md](solris-3-land-use-change.md) |
| Ontario Land Cover Compilation v2 | `08 - Lesson 8/Case study/OntarioLandCoverComp-v2.zip` | zip: GeoTIFF + ESRI file geodatabase | 1.06 GB zip; `OLCC_V2_TIFF.tif` 607 MB | 29-class land-cover raster, 15 m pixels | no .prj; .tif.xml says NAD_1983_Lambert_Conformal_Conic (Ontario MNR Lambert parameters) | Class 8 case study #8 | QGIS | [ontario-land-cover-compilation.md](ontario-land-cover-compilation.md) |
| OLCC data specification | `08 - Lesson 8/Case study/Ontario Land Cover Compilation - Data Specification Version.pdf` | PDF (19 p) | 760 KB | class code table | n/a | Class 8 | reference | [ontario-land-cover-compilation.md](ontario-land-cover-compilation.md) |
| City of London parcels | `08 - Lesson 8/Case study/Parcels.zip` | zip shapefile + XML | 11.3 MB | parcel polygons (20.4 MB shp) | NAD83 / UTM zone 17N (EPSG:26917) | Class 8 case study #8 | QGIS, R | [london-parcels-and-ttlt-area.md](london-parcels-and-ttlt-area.md) |
| Thames Talbot Land Trust area | `08 - Lesson 8/Case study/TTLT_Area 1 (2).zip` | zip shapefile | 421 KB | TTLT boundary polygon(s) | NAD83 / UTM zone 17N (EPSG:26917) | Class 8 case study #8 | QGIS | [london-parcels-and-ttlt-area.md](london-parcels-and-ttlt-area.md) |
| LIO Wooded Area | `woodarea.zip` | zip shapefile + .tbl | 957 MB zip; 1.31 GB shp | wooded-area polygons, Ontario | GCS_North_American_1983 (EPSG:4269) | Class 8 case study #8 | QGIS | [lio-wooded-area-and-wetland-units.md](lio-wooded-area-and-wetland-units.md) |
| LIO Wetland Unit | `wetlandu.zip` | zip shapefile + .tbl | 1.04 GB zip; 1.40 GB shp | wetland polygons + evaluation scoring tables | GCS_North_American_1983 (EPSG:4269) | Class 8 case study #8 | QGIS | [lio-wooded-area-and-wetland-units.md](lio-wooded-area-and-wetland-units.md) |

## Non-data files that sit next to the data

| File | What it is |
|---|---|
| `Practice sets/Practice set #2/crab_counts.png` | Target figure to recreate in practice set #2 |
| `Practice Questions/grand_mana.png` (page link text says `grand_manan.png`), `Practice Questions/ferry.png` | Target figures for the practice-set #1 ferry question |
| `test1.png` | Target map of London for the Class 7 ansi/municlow exercise |
| `TPM practice exam.zip` > `ELC/ELC of Ontario.pdf`, `ELC/readme.txt` | ELC documentation |
| `Topic 7.zip` > `lpr_000b16a_f/92-160-g2016002-fra.pdf`, `province_territoire.html` | Statistics Canada boundary-file reference guide (French) |
| `Map_jul20241.png`, `pic0_20260929130000851.jpg`, `20241220_122301.jpg`, `Picture2 - lobster.jpg`, `image_20260813164244727.png`, `Infographics/*` | Page illustrations and infographic examples, not data |

## Course scripts and slides (not data, but they name the data)

`Combined R Scripts.R`, `R Skills Review.R`, `Topic 1 - Case study.qmd`, `Topic 5 in-class script.R`, `Topic5.R`,
`Topic 7.R` (all under `sources/files/`), `Class 2.zip` > `Topic 2.R`; slides `Class 1/Class 1 slides.pdf`
([../course/class-1-slides.md](../course/class-1-slides.md)) and `02 - Topic 2.pdf`
([../course/topic-2-slides.md](../course/topic-2-slides.md)); `tidy.png` (tidyverse workflow image on the Topic 2 page).

## Files that could not be retrieved

- `01 - Conservation/sr_North Atlantic Right Whale_2013_e.pdf` - broken link (404 on Brightspace); presumably a
  right-whale status/recovery report (title-based guess). Unavailable.
- `IMG_5011.JPG` - photo on the [Lesson 2 Overview](../course-pages/lesson-2-overview.md) page; the browser refused
  to save it. Unavailable (illustration only).
- `Class 1/Topic 1.qmd` (Positron training script linked on the Class 1 page) is not in the inventory; the Topic 1
  lesson code survives as the "TOPIC 1" section of `Combined R Scripts.R` / `R Skills Review.R`.

## Cross-cutting data-quality rules for agents

- Bilingual NPRI headers (English / French) and French accents: read CSVs as UTF-8; if accents show as `Ã©` or
  `�`, the file is being decoded with the wrong encoding (see [npri.md](npri.md), [tpm-practice-exam.md](tpm-practice-exam.md),
  [germany-prtr-releases.md](germany-prtr-releases.md)).
- Long numeric IDs (PWQMN `STATION` / `Collection Site`, 10-11 digits) must be converted to text before joins
  (`as.character()` in R; Text type in Power Query; the R scripts do this).
- Date formats differ between files: `MM/DD/YYYY` (PWQMN `Collected`, Parks Canada incidents), `YYYY-MM-DD`
  (OBIS, Parks Canada animals, crab data), `M/D/YYYY h:mm:ss AM/PM` (buckthorn Survey123 export),
  `YYYY-MM-DD H:MM` (sportfish `Tag Date`, shark tag `Date`).
- Below-detection-limit results are stored as text such as `<2` (PWQMN `Results`); convert before numeric work.
- Units differ: NPRI quantities are in `tonnes`, `kg`, `grams` or `g TEQ` depending on substance; German PRTR is
  `kg/a`.
- Several files exist in two copies (root folder and inside `Topic 5.zip`; two OBIS "reduced" versions; two
  sportfish CSVs; `PWQMN-2010_2018.csv` vs `PWQMN_2010_2018_update5.csv`). Check which copy a task names.
- Geographic layers (EPSG:4326 / EPSG:4269) measure distance in degrees: reproject to a metre-based CRS (course
  uses NAD83 / UTM zone 17N EPSG:26917 for London/Ontario work and NAD83 / UTM zone 20N EPSG:26920 for the Bay of
  Fundy) before buffers or distances.
