---
id: r-positron.read-csv-and-clean-column-names
tool: r-positron
title: Load a CSV into R with read_csv() and clean the column names with clean_names()
keywords: [read_csv, import, load data, CSV, clean_names, janitor, column names, snake_case, backticks, readr, tibble, column specification, load file]
software_context: "Positron, R 4.6.1, readr 2.2.0 (tidyverse), janitor 2.2.1"
prerequisites: [r-positron.install-and-load-packages, r-positron.open-folder-and-set-working-directory]
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "06:41-07:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:43-04:22"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/npri-group-assignment-updated.md]
datasets_used: ["sources/files/Class 1/NPRI data.zip (NPRI-INRP_ReleasesRejets_1993-present.csv)", sources/files/buckthorn_updated.csv, sources/files/PWQMN_data_2024.csv, sources/files/PWQMN_Stations.csv, "sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)", "sources/files/Class 2/Class 2.zip (data/108916_tag.csv, data/108916_histos.csv)", "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Load a CSV into R with read_csv() and clean the column names with clean_names()

## Purpose
Every course analysis starts by reading a CSV with `readr::read_csv()` and usually piping it into `janitor::clean_names()`. That turns headers like `Collection Site` or `Substance Name (English) / Nom de substance (Anglais)` into snake_case names (`collection_site`, `substance_name_english_nom_de_substance_anglais`) that are easy to type.

## Steps
1. Load the packages: `library(tidyverse)` and `library(janitor)`. [script R Skills Review.R:25-26]
2. Make sure the CSV is in the opened folder, or a sub-folder of it (see [open-folder-and-set-working-directory.md](open-folder-and-set-working-directory.md)).
3. Write `object_name <- read_csv("file name.csv")`. The file name must match exactly, including spaces and capitals. [script R Skills Review.R:41]
4. Add `|> clean_names()` to standardise headers. Most course scripts do this in the same pipe. [script R Skills Review.R:44-45]
5. Optionally continue the pipe with `mutate()` to fix types, for example making IDs text with `as.character()` (see [convert-column-types.md](convert-column-types.md)). [video r-row-binds-and-joins2 @01:53]
6. Run the whole pipe. Read the console's "Rows: ... Columns: ..." and "Column specification" messages. [frame r-row-binds-and-joins2 @01:12]
7. Inspect the result with `glimpse()` or the Data Explorer (see [inspect-a-dataset.md](inspect-a-dataset.md)).

## Formulas / expressions / code
NPRI (Topic 1) [script R Skills Review.R:40-45]:
```r
## Load without cleaning names 
npri_releases <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") 

## Load and clean names (janitor package)
npri_releases <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") |> 
  clean_names()
```
Buckthorn field data (Topics 5 and 7) [script Topic 5 in-class script.R:4-5]:
```r
buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names()
```
PWQMN stations and 2024 data, with IDs converted to text (Topic 5) [script R Skills Review.R:361-368]:
```r
pwqmn_stations <- read_csv("PWQMN_Stations.csv") |>
  clean_names() |>  ## Clean up column headers
  mutate(station = as.character(station)) ## Station IDs

pwqmn_data_2024 <- read_csv("PWQMN_data_2024.csv") |>
  clean_names() |>
  mutate(collection_site = as.character(collection_site))
```
Files in a `data/` sub-folder, without `clean_names()` (Topic 2) [script R Skills Review.R:162, 177]. Only the first line of each pipe is shown: in the script `location_data` continues with `mutate(date_time = ymd_hm(Date))`/`mutate(month = ...)` and `tag_data` continues with `rename()`, which renames `Bin2`-`Bin6` to temperature-range names such as `` `Greater than 18 C` = Bin6 `` [script R Skills Review.R:162-164, 177-184]:
```r
location_data <- read_csv("data/108916_tag.csv")
tag_data <- read_csv("data/108916_histos.csv")
```
OBIS whales (practice set 1) [page practice-1-north-atlantic-right-whale.md]:
```r
whale_data<- read_csv("OBIS - North Atlantic Right Whale reduced.csv")
whale_data <- whale_data |> 
  clean_names()
```
NPRI assignment starter (no clean_names; refers to the original header with backticks) [page npri-group-assignment-updated.md]:
```r
library(tidyverse)
npri_data <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") 
npri_data$split <- substring(npri_data$`NAICS / Code_SCIAN`,1, 4)
```

What `clean_names()` produces for the course datasets (from the scripts that use the cleaned names):
| Dataset | Original header | Cleaned name |
|---|---|---|
| PWQMN_data_2024.csv | Collection Site, Analyte, Collected, Results | collection_site, analyte, collected, results |
| PWQMN_Stations.csv | STATION, LATITUDE | station, latitude |
| PWQMN-2000_2009 / 2010_2018 | STATION, YEAR, TIME_HH:MM, DATE_YYYYMMDD | station, year, time_hh_mm, date_yyyymmdd [frame r-row-binds-and-joins2 @05:22] |
| buckthorn_updated.csv | Buckthorn Percent, Canopy Cover, Reproducing Buckthorn, Quadrat ID, Group members, Sapling Percent, Adult Percent, Bare Soil Percent, Non-buckthorn Vegetation Percent, Section, distance, elevation1 | buckthorn_percent, canopy_cover, reproducing_buckthorn, quadrat_id, group_members, sapling_percent, adult_percent, bare_soil_percent, non_buckthorn_vegetation_percent, section, distance, elevation1 |
| NPRI releases | NPRI_ID / No_INRP, Reporting_Year / Année, Substance Name (English) / Nom de substance (Anglais), PROVINCE, Quantity / Quantité | npri_id_no_inrp, reporting_year_annee, substance_name_english_nom_de_substance_anglais, province, quantity_quantite (original NPRI headers inferred from the cleaned names) |
| OBIS whales | eventDate_standard, individualCount, institutionCode | event_date_standard, individual_count, institution_code |

## Verify
- The console prints, for example, `Rows: 2198 Columns: 10` and `chr (4): STATION, NAME, DESCRIPTION, STATUS`, `dbl (6): ...`. [frame r-row-binds-and-joins2 @01:12]
- The object appears in VARIABLES (`pwqmn_data_2024 [112392 rows x 15 columns]`). [frame r-row-binds-and-joins2 @02:02]
- `names(object)` returns lower-case snake_case names. [frame r-row-binds-and-joins2 @05:22]

## Pitfalls
- If you don't clean names, columns with spaces must be wrapped in backticks, for example `` `Most Likely Latitude` `` or `` `NAICS / Code_SCIAN` ``. Topic 2 deliberately keeps original names. [script R Skills Review.R:170]
- Without clean_names, the NPRI file has long bilingual headers. The instructor installs janitor "because NRI [NPRI] is a little bit complicated". [video positron-introduction-and-package-installation @06:41]
- `read_csv()` guesses types. PWQMN `Results` comes in as text (chr) because of values like `<2`, so convert before doing maths. [video r-row-binds-and-joins2 @02:31]
- ID columns such as station or collection site may be read as numbers. Convert them to character before joining. (See the join pitfalls about leading zeros in [join-tables.md](join-tables.md).)
- The course never uses `read_excel()`. The German NPRI data (`Releases_Germany_2007_2024.xlsx`) has no course R code; open it in Excel or save it as CSV first. (general knowledge — not shown in course)
- The NPRI releases CSV is about 363 MB, so loading takes time.

## Related
- [inspect-a-dataset.md](inspect-a-dataset.md)
- [convert-column-types.md](convert-column-types.md)
- [select-and-rename-columns.md](select-and-rename-columns.md)
- [view-data-in-data-explorer.md](view-data-in-data-explorer.md)
