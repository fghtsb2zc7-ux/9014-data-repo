# NPRI data (National Pollutant Release Inventory) - `Class 1/NPRI data.zip`

- Original path: `sources/files/Class 1/NPRI data.zip` (39.7 MB). Linked from
  [The NPRI Dataset](../course-pages/the-npri-dataset.md) and [Class 1 Overview](../course-pages/class-1-overview.md)
  ("this contains an updated file from the original zip file").
- Publisher: Environment and Climate Change Canada (ECCC). Download page:
  <https://www.canada.ca/en/services/environment/pollution-waste-management/national-pollutant-release-inventory.html>.
- Course context: the course's "foundational dataset" for most training videos and for the NPRI group assignment.
  See [../course/npri.md](../course/npri.md) for the program itself, thresholds and the ECCC presentation.
- Windows users must unzip first (right click > Extract All) [page the-npri-dataset.md].

## Members

| File | Size | Profile | What it is | Used in |
|---|---|---|---|---|
| `NPRI-INRP_ReleasesRejets_1993-present.csv` | 363 MB | 1,048,575 rows x 18 cols — **truncated at Excel's row limit** (see [npri-file-schemas.md](npri-file-schemas.md)) | Long-format releases: one row per facility x year x substance x release category, 1993 onward | Class 1 Positron lesson (`Combined R Scripts.R` / `R Skills Review.R` Topic 1), NPRI assignment R snippet, "Million Row data set" mentioned in the Excel data-types video |
| `NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv` | 13.7 MB | 24,554 rows x 39 cols; cp1252, CR-only line endings (exact headers in [npri-file-schemas.md](npri-file-schemas.md)) | Facility locations and geographic attributes | QGIS: Adding a delimited text layer, Basic filter, Filter for multiple conditions, Case when, Counting points in polygons, Print layout; Excel shapefile discussion |
| `NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv` | 160 KB | 1,322 rows x 6 cols; cp1252 (exact headers in [npri-file-schemas.md](npri-file-schemas.md)) | Industry-level summary of releases to air, 2015-2024 | Excel: Loading data, Basic filtering, Pivot tables and charts, Pivoting columns, Using Excel formulas (UNIQUE, data validation dropdown, COUNTIF, FILTER) |
| `NPRI-INRP_CommentsCommentaires_1997-present.csv` | 164 MB | 423,112 rows x 14 cols; cp1252 | Facility comments / reasons for change (contextual text) | not used in any captured video or script |
| `NPRI-INRP_DataDonnées_2024.csv` | 38.8 MB | 59,557 rows x 77 cols; cp1252, CR-only line endings (exact headers in [npri-file-schemas.md](npri-file-schemas.md)) | Single-year (2024) wide table: one row per facility x substance with quantity columns per release/disposal/transfer category | Excel: Data and variable types (Power Query type errors), Splitting columns, Selecting/removing columns, IF statements |

## Column dictionaries

### NPRI-INRP_ReleasesRejets_1993-present.csv

Confirmed column names (from course R code). After `janitor::clean_names()` the names become the snake_case
versions shown.

| Original header (as used in course code) | clean_names() version | Type | Notes |
|---|---|---|---|
| `NPRI_ID / No_INRP` (exact punctuation not verified) | `npri_id_no_inrp` | numeric ID | facility ID |
| `Reporting_Year / Année` (not verified) | `reporting_year_annee` | integer | 1993-2024 |
| `Substance Name (English) / Nom de substance (Anglais)` | `substance_name_english_nom_de_substance_anglais` | text | e.g. `Total particulate matter` |
| `PROVINCE` | `province` | text | two-letter code, e.g. `ON`; some rows missing (scripts drop with `complete.cases(province)`) |
| `Quantity / Quantité` (not verified) | `quantity_quantite` | numeric | units vary by substance, see Units |
| `NAICS / Code_SCIAN` | `naics_code_scian` | numeric | 6-digit NAICS; NPRI assignment code takes first 4 digits: `substring(npri_data$\`NAICS / Code_SCIAN\`,1, 4)` |

Other columns very likely present (they appear with these headers in the instructor-derived
`particulate_matter_ON.csv`, which was cut from this file): `Company_Name`, `Facility_Name`, `NAICS Title EN`,
`CAS_Number` (e.g. `NA - M08` for Total particulate matter), `Group (English) / Groupe (Anglais)` (e.g.
`Releases to Air`), `Units` (`tonnes`), `Estimation_Method / Méthode_d'estimation` (e.g. `O - Engineering
Estimates`, `C - Mass Balance`, `E1 - Site Specific Emission Factors`, `M3 - Source Testing`). Check with
`names()` before relying on them.

### NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv

The automated profile could not find the header row (it treated a data row as the header, most likely because some
French text fields contain embedded line breaks: one header ends in `\r\n`). Column meanings below are inferred from
the values; do not rely on the profiler's column names.

| Position (approx.) | Content (inferred from example values) | Example |
|---|---|---|
| 1-2 | reporting year?, NPRI ID | `2013`, `25159` |
| 3-4 | company name, facility name | `Golden Band Resources Inc.`, `Jolu Mill Site` |
| 5-9 | address, city, province, postal code | `2911 - D Cleveland Avenue North`, `SAKATOON`, `SK`, `S7K8A9` |
| 10-11 | legal land description, NTS map sheet | `01-09-081-15-W2`, `B-003-C/074-A-1` |
| 12-13 | latitude, longitude (decimal degrees) | `56.003100`, `-104.281880` |
| 14 | a year value (meaning not confirmed) | `1983` |
| 15-17 | NAICS 6-digit code, NAICS title EN, NAICS title FR | `212220`, `Gold and silver ore mining`, `Extraction de minerais d'or et d'argent` |
| 18-20 | NPRI sector code, sector EN, sector FR | `8`, `Mining and Quarrying`, `Extraction minière et exploitation en carrière` |
| 21-24 | census division code / name, census subdivision code / name | `4718`, `Division No. 18`, `4718090`, `Division No. 18, Unorganized` |
| 25-28 | CMA/CA code, CMA name, economic region code / name | `603.0`, `Winkler`, `4760`, `Northern / Nord` |
| 29 | forward sortation area (first 3 postal characters) | `S0J` |
| 30-32 | ecozone code, ecozone EN, ecozone FR | `6`, `Boreal Shield`, `Bouclier boréal` |
| 33-35 | drainage area code, EN, FR | `6`, `Western and Northern Hudson Bay Drainage Area`, `Aire de drainage de l'ouest...` |
| 36-39 | four 0/1 flag columns (meaning not documented in course material) | `0`, `1` |

Course use: Layer > Add Layer > Add Delimited Text Layer with longitude as X, latitude as Y, CRS EPSG:4326
[video qgis-adding-a-delimited-text-layer]. Filters use province and NAICS English title columns
[video qgis-filter-vector-data-for-multiple-conditions].

### NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv

Exact headers: see [npri-file-schemas.md](npri-file-schemas.md) (the first profiler failed because of the cp1252 encoding; corrected). From the Excel videos (Pivoting columns, Pivot tables) it has about 1,300
rows in long format with: industry name in English, industry name in French, reporting year, NAICS code, facility
count, and total releases to air (quantity) [video excel-pivoting-columns @01:22]. One row contains a block of null
values that breaks Power Query's Pivot Column until it is filtered out [video excel-pivoting-columns @03:11].
To pivot years wide, the facility-count column must be removed first, otherwise rows do not collapse
[video excel-pivoting-columns @05:01].

### NPRI-INRP_DataDonnées_2024.csv

Exact headers: see [npri-file-schemas.md](npri-file-schemas.md). (The first profiler failed because this file uses CR-only line endings and cp1252 encoding; corrected.) The NPRI single-year Excel version has its
column headings on row 4 (ECCC video), and the Power Query video shows the CSV headers promoted from row 1.
Structure inferred from the 66 profiled columns:

| Block | Content | Example values |
|---|---|---|
| Facility identifiers | reporting year, NPRI ID, company, facility, city, province, postal code | `2024`, `455`, `Ingot Metal Co. Ltd.`, `Toronto`, `ON`, `M9L 1M3` |
| Geography | ecozone EN/FR, drainage area EN/FR, latitude, longitude | `Mixedwood Plain`, `St. Lawrence Drainage Area`, `43.75888`, `-79.54943` |
| Industry | NAICS 4-digit code and titles EN/FR, NAICS 6-digit code and titles EN/FR | `3314`, `331410`, `Non-ferrous metal (except aluminum) smelting and refining` |
| Substance | CAS number (or `NA - xx` code), substance name EN, substance name FR, units | `NA - M09`, `PM10 - Particulate Matter <= 10 Micrometers`, `tonnes` |
| Quantities | ~45 numeric columns: releases to air by type, total air, releases to water (with receiving water body name columns, e.g. `Fraser River`, `St. Lawrence River`), releases to land, on-site / off-site disposals, transfers for treatment and recycling, and a grand total (last column) | mostly empty (NaN) except where reported; some negative values exist in a few transfer/total columns (min about -305,918) |

Units column values: `tonnes`, `kg`, `grams`, `g TEQ` (dioxins and furans).

## Data-quality issues an agent must handle

1. **Bilingual headers and values.** Every descriptive field has an English and a French column; header names
   contain `/`, spaces, parentheses and accents. In R use `clean_names()` (the course always does) or backticks;
   in Power Query rename or select columns.
2. **Encoding.** File names and values contain accents (`DataDonnées`, `boréal`). Only the Releases file is UTF-8 (with BOM); Geolocations, Industry Air, Comments and Data 2024 are Windows-1252 (cp1252),
   which is why QGIS/Power Query show `�` in headers when told UTF-8. Choose "1252: Western European (Windows)" / `encoding="cp1252"` to get clean accents.
3. **Embedded line breaks inside quoted fields** (e.g. French sector names ending in `\r\n`) make naive parsers
   misalign rows. `readr::read_csv()` and Power Query handle quoted line breaks; line-by-line tools do not.
4. **Shifted / mistyped values.** In the 2024 data, Power Query found rows where text (`Fort MacKay`, facility
   `Wood Buffalo Cold Lake`) landed in the Year column, and 49 type errors in the NPRI ID column
   [video excel-data-and-variable-types @04:29-06:55]. Fix: set column profiling to "entire data set", Keep Errors to
   inspect, Replace Errors (the instructor used `2024` for Year).
5. **Units differ by substance.** Never sum quantities across substances with different units (tonnes vs kg vs
   g TEQ). ECCC's Excel video also warns units differ when sorting Total Air Emissions.
6. **Double / triple counting.** Some substances are reported both individually and as part of a group (e.g. PM2.5
   within PM10 within Total PM; individual VOCs and total VOCs; TRS example) - see
   [../course/npri.md](../course/npri.md).
7. **Changes in reporting requirements over time** (substances added/removed, thresholds changed) mean year-to-year
   trends can be artefacts. Consult the history of requirements before trend analysis.
8. **Missing province** values in the releases file (drop with `filter(complete.cases(province))`).
9. **Size.** The releases file (363 MB, roughly a million-plus rows) is slow in Excel; the course uses R for it.
10. **Coordinate errors.** ECCC notes facilities sometimes forget the minus sign on longitude; check for points in
    the wrong hemisphere after loading into QGIS.
11. **Preliminary vs reviewed data.** ECCC's preliminary July release should not be used for analysis.

## Course procedures that use it

- Excel: loading data, basic filtering, pivot tables and charts, data and variable types, splitting columns,
  selecting/removing columns and rows, pivoting columns, using formulas, IF statements (transcripts in
  [../transcripts/excel/](../transcripts/excel/)).
- QGIS: adding a delimited text layer, basic filter, filter for multiple conditions, field calculator, case when,
  counting points in polygons and creating grids, print layout ([../transcripts/qgis/](../transcripts/qgis/)).
- R: Topic 1 lesson in `sources/files/Combined R Scripts.R` (select, filter Total particulate matter >= 2015,
  group_by year and province, summarize, ggplot facets, ggsave, write_csv).
- Procedure files: see `../tools/excel/`, `../tools/qgis/`, `../tools/r-positron/` (procedures tagged with
  `datasets_used: NPRI`).
