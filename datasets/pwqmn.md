# PWQMN - Provincial (Stream) Water Quality Monitoring Network, Ontario

> Full list of zero-padded ID columns across all course files: [id-columns-leading-zeros.md](id-columns-leading-zeros.md).

- Publisher: Ontario Ministry of the Environment; open data page
  <https://data.ontario.ca/dataset/provincial-stream-water-quality-monitoring-network> (linked on the
  [Topic 5 page](../course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md) and
  [Case study #5](../course-pages/case-study-5.md)). Course description: "an Ontario-wide monitoring program that
  collects long-term water-quality data from rivers and streams ... monitoring-station locations and measurements of
  parameters such as nutrients, metals, and chloride".
- Course use: Topic 5 joins (Excel merge, QGIS spatial join / join by location / buffers, R row binds and joins);
  Class 5 case study #5 (characterise the network; phosphorus and chloride patterns; distance to roads and
  agriculture); Class 8 R script (chloride heatmap) linked from [Case study #8](../course-pages/case-study-8.md).

## Files

| File | Original path (`sources/files/...`) | Size | Rows x cols | Used in |
|---|---|---|---|---|
| `PWQMN_data_2024.csv` | root and `Topic 5.zip` > `Topic 5/` | 11,266,830 B | 112,392 x 15 | Excel Merging data, QGIS Spatial joins, Changing column types, Join by location, Buffers; R `Topic5.R`, Class 8 script |
| `PWQMN_Stations.csv` | root and `Topic 5.zip` > `Topic 5/` | 228,661 B | 2,198 x 10 | same |
| `PWQMN-2000_2009.csv` | `Topic 5.zip` > `Topic 5/` | 107.5 MB | not profiled | R row binds (`bind_rows`) |
| `PWQMN-2010_2018.csv` | `Topic 5.zip` > `Topic 5/` | 103.0 MB | not profiled | R row binds |
| `PWQMN_2010_2018_update5.csv` | `Topic 5.zip` > `Topic 5/` | 103.0 MB (identical size) | not profiled | not referenced; likely duplicate |
| `PWQMN_FieldData_2021-2022_Final.csv` | `Topic 5.zip` > `Topic 5/` | 583 KB | 6,744 x 13 | not referenced in captured material |
| `ANALYTE_PARM_LOOKUP_EN_2025.csv` | `Topic 5.zip` > `Topic 5/` | 4.8 KB | 85 x 4 | analyte code lookup |

Case study #5 also tells students to download more years from the portal ("Data 2025", "Data 2019 - March 2021",
"Data 2000-2009").

## PWQMN_data_2024.csv

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `_id` | int64 | 112,392 | 112,392 | 1, 2 | row ID |
| `Year` | int64 | 112,392 | 1 | 2024 | constant |
| `Collection Site` | int64 | 112,392 | 435 | 13000300102, 8012305202 | station ID = `STATION` in stations file; 10-11 digits |
| `Analyte` | object | 112,392 | 55 | `Potassium`, `Chloride`, `Chromium` | parameter name |
| `Collected` | object | 112,392 | 168 | `08/14/2024` | sample date MM/DD/YYYY text |
| `Collection_Time` | object | 112,392 | 522 | `13:12:00` | |
| `Lab Workorder ID` | int64 | 112,392 | 537 | 16860 | |
| `Lab Sample ID` | int64 | 112,392 | 3,713 | 16860001 | one sample = many analytes |
| `Results` | object | 112,392 | 5,229 | `0.54`, `<2`, `<5` | TEXT: below-detection values carry `<` |
| `Units` | object | 108,723 | 8 | `mg/L`, `µg/L`, `mg/L as CaCO3`, `µS/cm` | 3,669 missing |
| `Result Call` | object | 112,392 | 2 | `Detected`, `BDL` | BDL = below detection limit |
| `Detection Limit` | float64 | 108,506 | 50 | 0.02, 2.0 | |
| `Method` | object | 112,392 | 17 | `E3497`, `E3218` | lab method code |
| `Value Qualifier` | object | 30,119 | 1 | `<` | present when BDL |
| `Remark Code` | object | 297 | 12 | `X5`, `RRV`, `AHS` | lab remarks |

## PWQMN_Stations.csv

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `STATION` | int64 | 2,198 | 2,188 | 3007703502 | 10 station IDs appear twice. The profiler parsed it as a number; in R `read_csv()` reads it as **chr with a leading zero** (`03007703502`) [frame r-row-binds-and-joins2 @01:12], see issue 1 |
| `NAME` | object | 2,198 | 842 | `Uxbirdge Brook`, `Black River` | stream name (typos exist) |
| `DESCRIPTION` | object | 2,198 | 2,138 | `Davis Drive,  Uxbridge Twp,` | location text with trailing commas |
| `LATITUDE` | float64 | 2,198 | 2,173 | 44.13775764 | 42.0-54.7 |
| `LONGITUDE` | float64 | 2,198 | 2,170 | -79.11259961 | -94.6 to -74.1 |
| `STATUS` | object | 2,198 | 2 | `A`, `I` | active / inactive (inferred) |
| `FIRST_YEAR` | int64 | 2,198 | 55 | 2002, 1966 | 1964-2022 |
| `LAST_YEAR` | int64 | 2,198 | 58 | 2021 | min 0 = invalid placeholder |
| `TOTAL_YEARS` | int64 | 2,198 | 58 | 20 | |
| `MISS_YEARS` | float64 | 2,196 | 43 | 0.0, 8.0 | 2 missing |

## PWQMN_FieldData_2021-2022_Final.csv

Columns: `Year` (2021, 2022), `Conservation Authority` (84 values, leading space e.g. `" Ausable Bayfield"`),
`Collection Site` (int64), `Lab Workorder ID`, `Collection Date` (`04/20/2021`), `Collection Time` (`8:00:00`,
many `0:00:00` placeholders), `Lab Sample ID`, `Specific Conductance uS cm 1`, `Water Temperature C`,
`Dissolved Oxygen mgl`, `Field PH`, `Turb FNU`, `Field Data Remark` (63 non-null, e.g. `Unreliable pH; equipment
issues`). Implausible values: turbidity down to -8.5, pH 0, temperature -3.

## ANALYTE_PARM_LOOKUP_EN_2025.csv

`CAS NUMBER` (e.g. `7440-22-4`, or a code such as `ALKT`), `ANALYTE` (`Silver`, `Alkalinity`), `PARAMETER CODE`
(`AGUT`), `PARAMETER DESCRIPTION` (`SILVER,   UNFILTERED TOTAL` - padded with spaces). Use it to map case-study
names such as `CHLORIDE,  UNFIL.REAC` and "Phosphorus (total)" to `Analyte` values.

## Data-quality issues an agent must handle

1. **Join key types:** `Collection Site` (data) and `STATION` (stations) are big integers; convert both to text
   (`mutate(station = as.character(station))`, `mutate(collection_site = as.character(collection_site))`) or set
   Text type in Power Query; in QGIS change type with the Field Calculator [video qgis-changing-column-types].
   Excel may display them in scientific notation.
   **Leading-zero mismatch in R:** `read_csv()` reads `STATION` as text with a leading zero (`03007703502`) but
   `Collection Site` as a number, so `as.character(collection_site)` gives `8012305202` (no zero). In the course
   video only 51,351 of 112,392 rows match and 61,041 do not [frame r-row-binds-and-joins2 @15:32, @17:22]. Power
   Query types both keys as whole numbers and matches 112,126 of 112,392 rows [frame excel-merging-data @02:32],
   which suggests the IDs are the same once the zero is ignored. Padding the R key, e.g.
   `stringr::str_pad(collection_site, 11, pad = "0")`, or converting both keys to numbers before joining should
   recover the matches (general knowledge — not shown in course; check with `anti_join()`).
2. **Duplicate stations** (10 IDs twice) make a left join add rows (many-to-many warning). Fix:
   `distinct(station, .keep_all = TRUE)` before joining; check `nrow()` before/after.
3. **Unmatched sites:** some `Collection Site` values have no station row - find with `anti_join()`. With numeric keys
   (Excel) only 266 of 112,392 rows are unmatched [frame excel-merging-data @02:32]; a much larger count in R
   points to the leading-zero mismatch in issue 1.
4. **Results are text:** strip/handle `<` values. Class 8 script sets `"<1.5"` to `NA` for chloride then
   `as.numeric()`; alternatives: use `Detection Limit` or half of it (general knowledge - not shown in course).
5. **Dates:** `Collected` is `MM/DD/YYYY` -> `mdy(collected)`; `month(mdy(collected), label = TRUE)`.
6. **Units vary by analyte** (mg/L vs µg/L); never mix analytes. `µ` requires UTF-8 decoding.
7. **Field names differ between periods:** the 2000-2009 / 2010-2018 files use `station` and `year` (after
   `clean_names()`), the 2024 file uses `collection_site`.
8. **Stations file covers all historical stations** (1964-2022); many are inactive (`STATUS = I`); `LAST_YEAR = 0`
   is invalid.
9. **Coordinates** are WGS 84-style decimal degrees; QGIS videos load them as EPSG:4326 and reproject to UTM 17N
   for buffers.

## Course procedures that use it

- Excel: Power Query Merge Queries (2024 data + stations) [video excel-merging-data].
- QGIS: Add Delimited Text Layer (stations), Join (attribute join of 2024 data to stations) [video qgis-spatial-joins],
  Field Calculator type change, Join attributes by location (EcoDistrict), Buffer + Warp (reproject raster) + Zonal
  histogram on the Annual Crop Inventory, Create spatial index / Sum line lengths (roads, case study #5),
  counting points, print layout.
- R: `Topic5.R` / `R Skills Review.R` (bind_rows, left_join with `join_by(collection_site == station)`, count
  duplicates, distinct, semi_join, anti_join) [video r-row-binds-and-joins2]; Class 8 section of
  `Combined R Scripts.R` (chloride heatmap with `geom_tile`, `geom_text`, line plot with highlighted January peak).
