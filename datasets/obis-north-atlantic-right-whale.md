# OBIS North Atlantic right whale sightings (reduced)

Two course copies of the same 8,793 sighting records of *Eubalaena glacialis*:

| Copy | Original path (`sources/files/...`) | Size | Columns | Used in |
|---|---|---|---|---|
| Topic 2 copy | `Topic 2/OBIS - North Atlantic Right Whale reduced.csv` | 1,313,368 B | 16 (has `month`) | Topic 2 Excel videos "Extracting date information" and "Cleaning up date data" ([Topic 2 page](../course-pages/topic-2-transforming-and-wrangling-data.md)) |
| Practice copy | `Practice sets/OBIS - North Atlantic Right Whale reduced.csv` | 1,294,859 B | 15 (no `month`) | [Exam practice set #1](../course-pages/practice-1-north-atlantic-right-whale.md), practice-exam ferry question ([Exam Practice](../course-pages/exam-practice.md)) |

- Provenance: Ocean Biodiversity Information System (OBIS, <https://obis.org/>), an open occurrence-record
  repository, filtered to the North Atlantic right whale and "reduced" to selected columns by the instructor. The
  original OBIS export has only `eventDate`; the instructor added `eventDate_standard`, `year` and (Topic 2 copy)
  `month` [video excel-extracting-date-information @01:20].
- A third copy of the Topic 2 version (1,313,368 B, 16 columns) and the **full** OBIS export are in
  `Class 1/Class 1 case study.zip` (see "Full export" below), used by the Class 1 case study
  (`Topic 1 - Case study.qmd`: build a metadata sheet, PivotCharts of whales by year/month/institution, QGIS
  symbology by month and count, vessel routes; R: reduce the full file to the reduced columns, summarise, plot,
  export).
- Course context: Class 1 "Beneath the Surface" case study on right-whale protections (ship strikes, vessel lanes);
  practice set #1 combines it with [vessel traffic routes](vessel-traffic-routes.md).

## Column dictionary

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `id` | object | 8,793 | 8,793 | `071fb69d-84ea-41d9-a71d-6a607d027086` | OBIS record UUID (unique key; R exercises count records with `n()`) |
| `areas` | object | 8,793 | 39 | `[266, 272, 40006, 31912]` | list of OBIS area IDs stored as a text string with brackets |
| `bathymetry` | float64 | 8,793 | 433 | 34.0, 2.0, -3.0 | estimated depth (m) at the sighting; negative values (min -114) = point falls on land |
| `behavior` | object | 35 | 11 | `PORPOISING`, `BLOWING`, `FEEDING` | almost always empty |
| `decimalLatitude` | float64 | 8,793 | 7,028 | 30.047163 | latitude, WGS 84 degrees (Y) |
| `decimalLongitude` | float64 | 8,793 | 6,960 | -80.697271 | longitude, WGS 84 degrees (X) |
| `eventDate` | object | 8,784 | 2,720 | `2010-03-20` | original OBIS date text; mixed formats (dashes, slashes, date-times, month-year only such as "April '64"); stored as text |
| `eventDate_standard` | object | 8,784 | 2,585 | `2010-03-20` | instructor-standardised ISO date `YYYY-MM-DD`; use this for month/year |
| `month` (Topic 2 copy only) | float64 | 8,792 | 12 | 3.0, 11.0 | month number 1-12 |
| `year` | float64 | 8,792 | 73 | 2010.0 | 1900-2024; one missing |
| `identifiedBy` | object | 45 | 15 | `David Walker`, `NJM` | mostly empty |
| `identifiedByID` | float64 | 0 | 0 | | entirely empty - drop |
| `individualCount` | float64 | 4,445 | 55 | 2.0, 1.0, 6.0 | number of whales in the sighting (1-100); null in 4,348 rows |
| `institutionCode` | object | 4,475 | 27 | `DON`, `NEFSC`, `SEFSC`, `Virginia Aquarium Stranding Response Program` | reporting institution; null in 4,318 rows |
| `institutionID` | object | 8 | 2 | `http://www.seadatanet.org/urnurl/SDN:EDM...` | mostly empty |
| `species` | object | 8,793 | 1 | `Eubalaena glacialis` | constant |

Numeric ranges: latitude -33.9 to 71.4 (median 44.3); longitude -97.4 to 153.6 (median -66.6); bathymetry -114 to
5,185 m; individualCount mean 3.7.

## Full export - `OBIS - North Atlantic Right Whale full.csv`

`Class 1/Class 1 case study.zip` > `OBIS - North Atlantic Right Whale full.csv`: 26.6 MB, 8,793 rows x 285
columns (Darwin Core / OBIS fields). 152 columns are completely empty. Same records (`id`) as the reduced file.
Non-empty columns useful for analysis:

| Column(s) | Non-null | Example values | Notes |
|---|---|---|---|
| `dataset_id`, `datasetID`, `datasetName` | 8,793 / 4,498 / 4,499 | `NEFSC Aerial Survey - Summer 1995` | source dataset (79 dataset IDs) |
| `id`, `occurrenceID`, `catalogNumber`, `recordNumber` | 8,793 / 8,785 / 4,506 / 4,452 | `592_607` | identifiers |
| `basisOfRecord` | 8,793 | `HumanObservation`, `MachineObservation`, `PreservedSpecimen`, `NomenclaturalChecklist` | not all are sightings |
| `eventDate`, `eventDate_standard`, `verbatimEventDate`, `eventTime` | 8,784 / 8,784 / 8,462 / 4,106 | `2010-03-20`, `2010-03-20 10:20`, `14:20:00Z` | |
| `month`, `year` | 8,793 | `3`, `2010` | TEXT columns (13 / 74 unique - include a non-numeric value) |
| `month.1`, `year.1`, `day` | 3,278 | 5.0, 1979.0 | duplicated names renamed by the reader |
| `date_start`, `date_mid`, `date_end`, `date_year` | 4,774 | 1269040000000.0 | epoch milliseconds |
| `decimalLatitude`, `decimalLongitude`, `footprintWKT`, `geodeticDatum` | 8,793 / 8,793 / 4,484 / 4,759 | `POINT(-80.697271 30.047163)`, `EPSG:4326 WGS84` | |
| `coordinateUncertaintyInMeters`, `coordinatePrecision` | ~4,500 | 1000.0, 111319.49 | some very coarse |
| `locationRemarks` | 1,028 | `Coordinates likely to be erroneous` | flag for QC |
| `bathymetry`, `shoredistance`, `sst`, `sss` | 8,793 / 8,793 / 8,788 / 8,788 | 34.0, -68, 24.37, 36.23 | OBIS-added environment values; negative shoredistance = on land |
| `flags` | 8,793 | `[NO_DEPTH]`, `[NO_DEPTH, ON_LAND]`, `[ON_LAND]`, `[]` | OBIS QC flags |
| `individualCount`, `organismQuantity` | 4,445 / 7 | 2.0 | |
| `institutionCode`, `ownerInstitutionCode`, `rightsHolder`, `recordedBy` | 4,475 / 4,441 / 3,275 / 3,888 | `NEFSC`, `NOAA;NMFS;NEFSC` | |
| `identificationRemarks` | 7,068 | `DEFINITE`, `PROBABLE`, `UNSURE/POSSIBLE` | certainty |
| `occurrenceStatus` | 8,785 | `present`, `P`, `Present` | inconsistent coding |
| `samplingProtocol`, `occurrenceRemarks`, `eventRemarks` | 319 / 4,473 / 3,804 | `Standardized surveys`, `Visual; plane` | |
| `scientificNameAuthorship` | 8,506 | `(Müller, 1776)`, `(MÃ¼ller, 1776)` | mojibake variants |
| `vernacularName`, `redlist_category`, `license`, `waterBody`, `locality` | various | `North Atlantic Right Whale`, `CR` | |
| taxonomy (`kingdom` ... `species` + `*id`) | 8,793 | `Eubalaena glacialis` | constant |

R exercise (Class 1 case study): "Create a new dataset the retains only the columns found in the reduced dataset
csv" - i.e. `select()` the 16 reduced columns.

## Data-quality issues an agent must handle

1. **Null `individualCount`** = whale seen but number not recorded. Practice set #1 (E.1.1) instructs: assume 1
   whale and replace nulls with 1 (Power Query Replace Values, or fill blanks with 1).
2. **Records vs individuals.** "Number of sighting records" = count of rows (Count of `id`); "number of whales" =
   Sum of `individualCount`. Exercises deliberately ask for both (E.1.4, R.1.4 vs R.1.3).
3. **Negative bathymetry** = points on land. E.1.2: create `corrected_depth` with
   `=IF([@bathymetry] <0, 0,[@bathymetry])`; Q.1.1: label with `IF( "bathymetry" <0, 'On land', 'On Water')`.
4. **Mixed date formats in `eventDate`.** Power Query `Add Column > Date > Parse` standardises slashes, dashes and
   month-year values (month-year becomes the 1st of the month) [video excel-cleaning-up-date-data @01:19-03:13].
   Prefer `eventDate_standard` (already ISO); in R: `month(event_date_standard, label = TRUE)`.
5. **Missing institutions** (about half the rows) and inconsistent institution spellings (Topic 1 case study asks
   students to spot data-entry errors in `institutionCode`). E.1.3 removes blanks and institutions with < 10 records.
6. **Outlier coordinates:** a few points far outside the North Atlantic (latitude -33.9, longitude 153.6) - likely
   errors; check on the map.
7. **Observation effort bias:** monthly/annual counts reflect survey effort, not just whale presence (E.1.5, Q.1.5
   ask students to discuss).
8. **CRS:** load as a delimited text layer with X = `decimalLongitude`, Y = `decimalLatitude`, CRS WGS 84
   (EPSG:4326). Reproject to NAD83 / UTM zone 20N (EPSG:26920) before distance work in the Bay of Fundy (Q.1.4).
9. **Two copies differ** only by the `month` column; scripts expecting `month` need the Topic 2 copy or must derive it.
10. `clean_names()` converts headers to `event_date_standard`, `individual_count`, `institution_code`,
    `decimal_latitude` etc. (practice R code uses these).

## Course procedures that use it

- Excel: Power Query import (Data > From Text/CSV > Transform Data), Add Column > Date (Year, Month, Week, Parse),
  Replace Values, IF / IFS, PivotTables and PivotCharts, UNIQUE + Data Validation dropdown + COUNTIF (E.1.1-E.1.7).
- QGIS: Add Delimited Text Layer, QuickMapServices basemap, filters, Field Calculator IF, categorized/graduated
  symbology, Count Points in Polygon, Reproject Layer, Join attributes by nearest, Print Layout (Q.1.1-Q.1.6).
- R: `read_csv`, `clean_names`, `mutate(month(..., label = TRUE))`, `select`, `filter`, `group_by`/`summarize`,
  `geom_col`, `geom_line`, `facet_wrap`, `ifelse`, `ggsave`, `write_csv` (R.1.1-R.1.6); practice-exam
  `bind_rows()` of `1km_buffer.csv` and `2km_buffer.csv` exported from QGIS.
- Full question text: [../course/assessments.md](../course/assessments.md#practice-set-1-north-atlantic-right-whale).
