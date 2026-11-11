# German PRTR releases 2007-2024 - `Releases_Germany_2007_2024.xlsx`

- Original path: `sources/files/Releases_Germany_2007_2024.xlsx` (11.7 MB, one sheet `Releases_Germany_2007_2024`,
  79,844 rows x 34 columns).
- Provenance: German Pollutant Release and Transfer Register (PRTR), the counterpart of Canada's NPRI. The NPRI
  assignment links the German PRTR FAQ <https://thru.de/faq/> (thru.de is the German PRTR portal). The column
  prefixes (`Releases_202610011155.`, `Facilities_202610011143.`) show it is a join of a Releases table and a
  Facilities table exported on 2026-10-01.
- Course use: posted on [NPRI Group Assignment (updated)](../course-pages/npri-group-assignment-updated.md) as
  "German data now available". Groups compare Canadian NPRI and German releases to air and disposals/transfers by
  sector (NACE vs NAICS table on that page). See [../course/assessments.md](../course/assessments.md#npri-group-assignment).

## Column dictionary

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `Releases_202610011155.ID1` | int64 | 79,844 | 79,844 | 1, 2, 3 | row ID from the releases table |
| `Releases_202610011155.id` | int64 | 79,844 | 79,844 | 1, 2, 3 | duplicate of ID1 |
| `facility_id` | int64 | 79,844 | 29,558 | 62, 63, 64 | facility-year record ID (changes every year for the same site) |
| `Releases_202610011155.inspire_id` | object | 79,844 | 2,960 | `DE.BW/00093.FACILITY` | stable facility identifier across years (use this to track a site) |
| `Releases_202610011155.year` | int64 | 79,844 | 18 | 2007 ... 2024 | reporting year |
| `compartment` | object | 79,844 | 3 | `Water`, `Air`, `Land` | release medium (filter `Air` for the assignment) |
| `annual_load` | float64 | 79,811 | 9,413 | 53600.0, 114000.0 | annual release quantity, in `unit` (kg/a) |
| `annual_load_accident` | float64 | 52,430 | 512 | 0.0, 3160.0 | part of the load from accidents, kg/a |
| `unit` | object | 79,844 | 1 | `kg/a` | kilograms per year (NPRI uses tonnes etc.: divide by 1000 for tonnes) |
| `pollutant_name` | object | 79,811 | 74 | `Total organic carbon (TOC)`, `Carbon monoxide (CO)`, `Arsenic and compounds (as As)` | pollutant (English) |
| `pollutant_group` | object | 79,811 | 7 | `Other organic substances`, `Inorganic substances`, `Other gases`, `Heavy metals` | |
| `pollutant_casnumber` | object | 28,739 | 40 | `630-08-0`, `124-38-9`, `7664-41-7` | CAS number; missing for groups |
| `pollutant_threshold` | object | 79,811 | 43 | `50 000 kg/year (Water)`, `500 000 kg/year (Air)`, `5 kg/year (Water)` | reporting threshold as TEXT with a space as thousands separator and the compartment in brackets |
| `determination_method` | object | 79,811 | 3 | `Measured (M)`, `Calculated (C)`, `Estimated (E)` | how the load was determined |
| `determination_procedure` | object | 79,257 | 24 | `OTH (M)`, `INT (M) CEN/ISO`, `INT (C) IPCC` | method detail |
| `Facilities_202610011143.ID1` | int64 | 79,844 | 29,558 | 62, 63 | facility table row ID |
| `Facilities_202610011143.id` | int64 | 79,844 | 29,558 | 62, 63 | equals `facility_id` |
| `Facilities_202610011143.inspire_id` | object | 79,844 | 2,960 | `DE.BW/00093.FACILITY` | duplicate of releases inspire_id |
| `Facilities_202610011143.year` | int64 | 79,844 | 18 | 2007 | duplicate of year |
| `name` | object | 79,790 | 5,725 | `GKA Baden-Baden-Sinzheim`, `KA Wendlingen a. N.` | facility name (varies by year for the same site) |
| `administrative_number` | object | 79,808 | 2,918 | `06-08-2165100000006` | German administrative ID |
| `ETRS89_x` | float64 | 79,808 | 6,658 | 8.160969879 | longitude, degrees (ETRS89, effectively EPSG:4258; course has not specified) |
| `ETRS89_y` | float64 | 79,808 | 6,659 | 48.78353209 | latitude, degrees |
| `street` | object | 79,675 | 3,198 | `Im GÃ¤bele`, `VorstadtstraÃŸe` | mojibake: should read `Im Gäbele`, `Vorstadtstraße` |
| `house_number` | object | 73,643 | 535 | `ohne`, `keine`, `101` | `ohne` / `keine` = German for "none" |
| `postcode` | float64 | 79,761 | 1,731 | 76547.0 | numeric; leading zeros lost (e.g. 01067 -> 1067) |
| `city` | object | 79,761 | 1,906 | `Baden-Baden`, `Sinzheim` | |
| `federal_state` | object | 79,840 | 16 | `bw`, `by`, `nw`, `bb` | lower-case state codes |
| `river_basin_district` | object | 79,418 | 10 | `Rhein`, `Donau`, `Maas`, `Oder` | |
| `parent_company` | object | 79,268 | 4,887 | `Zweckverband GKW Wendlingen` | |
| `operating_hours` | float64 | 1,977 | 206 | 8760.0 | mostly empty |
| `prtr_info` | object | 860 | 174 | `Homepage: http://...`, `keine` | free text (German) |
| `nace_code` | float64 | 79,844 | 154 | 37.0, 16.21, 35.3, 35.11 | NACE activity code stored as a NUMBER |
| `nace_text` | object | 79,844 | 142 | `Sewerage`, `Production of electricity` | NACE description (English) |

Numeric ranges: year 2007-2024; `annual_load` 0 to 3.33e10 kg/a (median 25,500); ETRS89_x 6.09-15.0,
ETRS89_y 47.5-54.8.

## Data-quality issues an agent must handle

1. **Units:** `kg/a` vs NPRI `tonnes` (and `kg`, `grams`, `g TEQ` for some NPRI substances). Convert before
   combining; some substances may not be convertible (assignment asks you to identify these).
2. **Thresholds are text** (`50 000 kg/year (Air)`): to compare numerically, strip the bracketed compartment, remove
   the space thousands separator, and parse the number.
3. **Encoding mojibake** in `street` (and possibly other German text): UTF-8 text decoded as Latin-1. In Power
   Query, re-import with File Origin `65001: Unicode (UTF-8)`; in R, `iconv()` or read with the right encoding.
4. **`nace_code` is numeric**, so `35.10` and `35.1` collapse and `37` shows as `37.0`. Convert to text and pad
   when matching to the assignment's NACE list (06, 07, 08, 09, 05, 35.11, 29, 17, 16, 19, 20, 24, 38, 37). Most
   group codes are 2-digit divisions: match on the integer part (e.g. `floor(nace_code) == 16`), except group 3
   (`35.11`).
5. **Duplicated columns** (`ID1`/`id`, two `inspire_id`, two `year`) - drop one of each before analysis.
6. **Facility identity:** `facility_id` is a facility-year key; use `inspire_id` to follow a site through time.
7. **Postcode lost leading zeros** (stored as float).
8. **Sector matching with NPRI** uses NAICS (NPRI) vs NACE (Germany); the assignment's sector table gives the
   intended correspondence (e.g. NACE 35.11 <-> NAICS 2211).

## Course procedures that use it

None of the captured videos use this file directly. Relevant skills: Power Query filtering, splitting columns,
merging (Excel); `filter()`, `mutate()`, `bind_rows()`, `left_join()`, `group_by()`/`summarize()` (R). See
[../course/assessments.md](../course/assessments.md#npri-group-assignment) and the procedure folders under `../tools/`.
