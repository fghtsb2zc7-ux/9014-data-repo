# Full practice exam data (particulate matter) - `TPM practice exam.zip`

- Original path: `sources/files/TPM practice exam.zip` (73.9 MB, 9 entries). Linked from
  [Exam Practice](../course-pages/exam-practice.md) "Full Practice Exam" with
  `ENVRSUST 9014 - Practice Exam - Particulate Matter 2026 updated.pdf` (questions in
  [../course/assessments.md](../course/assessments.md#full-practice-exam-particulate-matter)).

| Member | Size | Content | CRS |
|---|---|---|---|
| `particulate_matter_ON.csv` | 667,690 B | 3,094 x 15: NPRI Total particulate matter releases to air, Ontario facilities, 2020-2024 | n/a (latitude/longitude) |
| `ELC/ELC.shp` (+ `.dbf` 8.3 MB, `.shx`, `.prj`, `.qix`) | 44.5 MB | Ecological Land Classification of Ontario polygons | GCS_North_American_1983 (EPSG:4269) |
| `ELC/ELC of Ontario.pdf`, `ELC/readme.txt` | 1.6 MB | documentation | |
| `can_ppp_2020_1km_Aggregated.tif` | 42.6 MB | estimated population of Canada 2020 on a ~1 km grid; "each cell contains the estimated number of people living within that cell, rather than population density" (exam sheet) | not listed |

The `ppp_..._1km_Aggregated` naming matches WorldPop population grids (general knowledge - provenance not stated).

## particulate_matter_ON.csv

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `Year` | int64 | 3,094 | 5 | 2020-2024 | |
| `NPRI_ID` | int64 | 3,094 | 321 | 161, 327 | facility ID |
| `Company_Name` | object | 3,094 | 221 | `Bunge Canada`, `Bunge Canada ` | trailing spaces create false duplicates - trim |
| `Facility_Name` | object | 3,094 | 342 | `BUNGE CANADA - HAMILTON` | |
| `NAICS` | int64 | 3,094 | 88 | 311224, 322121 | 6-digit NAICS |
| `NAICS Title EN` | object | 3,094 | 90 | `Oilseed processing`, `Paper (except newsprint) mills` | 90 titles vs 88 codes |
| `PROVINCE` | object | 3,094 | 1 | `ON` | |
| `CAS_Number` | object | 3,094 | 1 | `NA - M08` | |
| `Substance Name (English) / Nom de substance (Anglais)` | object | 3,094 | 1 | `Total particulate matter` | |
| `Group (English) / Groupe (Anglais)` | object | 3,094 | 1 | `Releases to Air` | |
| `Quantity` | float64 | 3,094 | 2,800 | 3.794, 26.13 | 0-8,176.5 |
| `Units` | object | 3,094 | 1 | `tonnes` | |
| `Estimation_Method / M�thode_d�estimation` | object | 3,070 | 8 | `O - Engineering Estimates`, `C - Mass Balance`, `E1 - Site Specific Emission Factors`, `M3 - Source Testing` | header contains mis-decoded accents (file is not UTF-8; read with `locale(encoding = "latin1")` or rename by position) |
| `latitude` | float64 | 3,094 | 319 | 43.27022 | 42.1-52.8 |
| `longitude` | float64 | 3,094 | 320 | -79.84949 | -94.4 to -74.6 |

### ELC attributes (from readme.txt)

`Ecozone` (first tier, ecozone name), `Ecoregion` (second tier, code), `Ecorg_name` (ecoregion name), `Ecodist`
(third tier, code), `Edist_name` (ecodistrict name).

## Data-quality issues

1. **Multiple rows per facility-year** (e.g. Bunge Hamilton 2024 has 3.794 and 26.130 t): rows are separate release
   reports (sub-categories) - sum per facility and year before plotting trends.
2. **Encoding** of the French header (see table).
3. **Trailing spaces** in `Company_Name`.
4. **Raster value meaning:** people per cell (not density). The exam's red rings = 5 km around facilities in cells with
   > 500 people; the grid shows cells with > 1000 people (the extracted text reads "over 5000 1000 people" - the updated sheet appears to correct 5000 to 1000).
5. **CRS:** CSV points are degrees; reproject (e.g. to a metre CRS) before 5 km buffers.

## Course procedures that use it

R: `group_by`/`summarize`, `geom_point` + `geom_smooth(method = "lm")`, `lm()` + `summary()` (slope and
significance in the subtitle), `labs`. QGIS: delimited text layer, Sample raster values, Buffer, Raster
Calculator / symbology thresholds on the population raster, Join attributes by location with ELC, Print layout.
