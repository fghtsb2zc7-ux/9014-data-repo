---
title: ID columns with leading zeros (read these as text)
keywords: [leading zeros, station id, join key, text vs number, dtype, Transect ID, STATION, Collection Site]
---
# ID columns with leading zeros — read these as text

A scan of every course CSV (including CSVs inside zips under 300 MB, read with all columns as text) found these columns
whose values start with `0`. Excel/Power Query, QGIS and `readr::read_csv()` may guess them as numbers, silently dropping the zeros.
That breaks joins (for example PWQMN `STATION` ↔ `Collection Site`) and merges distinct labels (`001` vs `01`).

| file | column | values with leading zero | non-null values (sample) | examples |
|---|---|---|---|---|
| PWQMN_Stations.csv (also in Topic 5.zip) | STATION | 1,102 | 2,198 | 03007703502, 03007703602 |
| Topic 5.zip > PWQMN-2000_2009.csv | STATION | 150,687 | 300,000 (first rows) | 06006800102 |
| Topic 5.zip > PWQMN-2000_2009.csv | FIELD_NO | 164,729 | 300,000 (first rows) | 00054608 |
| Topic 5.zip > PWQMN_FieldData_2021-2022_Final.csv | Collection Site | 3,652 | 6,744 | 08002201602 |
| Buckthorn observations_0.csv / buckthorn_updated.csv (also in Topic 5.zip) | Transect ID | 7 | 53 | 001, 01, 002 (inconsistent padding) |
| 06 - Ecosystem services/SOLRIS 3.0.zip > SOLRIS 3.0.csv | CHANGE_PERIOD | 69,835 (all) | 69,835 | 01, 02, 03 |

No leading-zero ID columns were found in the NPRI, rock crab, human-wildlife coexistence, Irish sportfish, OBIS, power plant or Germany PRTR files.
`PWQMN_data_2024.csv` stores `Collection Site` without the leading zero (10 digits), so it matches `STATION` only after both are
converted to numbers or the 2024 IDs are zero-padded to 11 characters — see [pwqmn.md](pwqmn.md).

## How to keep the zeros (general knowledge — not shown in course)
- **R:** `read_csv(file, col_types = cols(STATION = col_character()))`; pad with `stringr::str_pad(x, 11, pad = "0")`.
- **Power Query:** set the column type to Text before (or instead of) the automatic Changed Type step.
- **QGIS Delimited Text:** untick "Detect field types", or set the field to Text in a `.csvt` file / with the Field Calculator `lpad("Collection Site", 11, '0')`.
