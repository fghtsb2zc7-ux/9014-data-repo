# US power plants (EIA) - `Power_Plants.csv`

- Original path: `sources/files/04 - Lesson 4/Pre-class work/Power_Plants.csv` (3.55 MB, 12,008 x 34). The folder
  name ("04 - Lesson 4") is left over from an earlier course structure; the file is linked from
  [Case study #5](../course-pages/case-study-5.md) (Class 5).
- Provenance: `Source` column = `EIA-860, EIA-860M and EIA-923` (US Energy Information Administration), `Period` =
  `202305` (May 2023). All plants are in US states (52 values incl. DC / Puerto Rico; `State` e.g. `Alaska`,
  `Alabama`). The course page sentence describing it is cut off ("This dataset provides information about").
- Course use (case study #5, "Sulphate wet deposition"): explore power-generating facilities then add the ECCC xSO4
  wet-deposition ESRI REST layer (acid rain). Questions: "How many of each power plant are there?" and "How many
  megawatts are contributed by each power plant type?"

## Column dictionary

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `X`, `Y` | float64 | 12,008 | ~11,700 | -160.497, 55.340 | longitude/latitude (duplicate of Longitude/Latitude, more decimals) |
| `OBJECTID` | int64 | 12,008 | 12,008 | 11570 | |
| `Plant_Code` | int64 | 12,008 | 12,008 | 1, 2 | EIA plant ID |
| `Plant_Name` | object | 12,008 | 11,985 | `Sand Point`, `Barry` | |
| `Utility_ID`, `Utility_Name` | int64 / object | 12,008 / 12,004 | ~5,100 | 195, `Alabama Power Co` | |
| `sector_name` | object | 12,008 | 7 | `Electric Utility`, `IPP Non-CHP`, `IPP CHP`, `Commercial Non-CHP` | |
| `Street_Address`, `City`, `County`, `State` | object | 11,920-12,008 | | `Mobile`, `Alabama` | |
| `Zip` | float64 | 11,990 | 6,636 | 99661.0 | leading zeros lost |
| `PrimSource` | object | 12,008 | 12 | `petroleum`, `hydroelectric`, `natural gas`, `nuclear` | primary energy source - use for "type" |
| `source_desc` | object | 12,008 | 3,952 | `Coal = 1118.5 MW, Natural Gas = 1296.2 MW` | text summary |
| `tech_desc` | object | 12,008 | 154 | `Conventional Hydroelectric` | technologies, `;`-separated |
| `Install_MW` | float64 | 12,008 | 2,163 | 2569.5 | installed (nameplate) capacity, MW |
| `Total_MW` | float64 | 12,008 | 2,044 | 2414.7 | total capacity, MW (sum of source columns) |
| `Bat_MW`, `Bio_MW`, `Coal_MW`, `Geo_MW`, `Hydro_MW`, `HydroPS_MW`, `NG_MW`, `Nuclear_MW`, `Crude_MW`, `Solar_MW`, `Wind_MW`, `Other_MW` | float64 | 40-5,195 | | 1118.5 (Coal), 1296.2 (NG) | capacity by source; blank = 0 |
| `Source` | object | 12,008 | 1 | `EIA-860, EIA-860M and EIA-923` | |
| `Period` | int64 | 12,008 | 1 | 202305 | |
| `Longitude`, `Latitude` | float64 | 12,008 | ~11,700 | -160.497222, 55.339722 | WGS 84 degrees |

## Data-quality issues

1. **Wide capacity columns with blanks** (e.g. `Coal_MW` only 237 non-null): treat blank as 0 when summing; to get
   MW by type either group `Total_MW` by `PrimSource` or unpivot the `*_MW` columns (long format).
2. **US only** - the Canadian sulphate deposition story relies on transboundary US sources; no Canadian plants here.
3. Duplicate coordinate columns (`X`/`Y` vs `Longitude`/`Latitude`) - pick one pair for QGIS.
4. `Zip` stored as number (leading zeros lost).

## Course procedures that use it

Excel PivotTables (count of plants by `PrimSource`, sum of MW); QGIS Add Delimited Text Layer (X = `Longitude`,
Y = `Latitude`, EPSG:4326), categorized symbology, ESRI REST connection to
`https://maps-cartes.ec.gc.ca/arcgis/rest/services/DMS/depot_xSO4_5YA_deposition/MapServer`.
