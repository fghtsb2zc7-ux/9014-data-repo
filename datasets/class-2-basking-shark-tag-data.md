# Class 2 bundle - basking shark satellite tag 108916, GEBCO bathymetry - `Class 2/Class 2.zip`

- Original path: `sources/files/Class 2/Class 2.zip` (76.8 MB). Linked from
  [Lesson 2 Overview](../course-pages/lesson-2-overview.md) (Class 2 "Animals on the Move", basking sharks as model
  species; Positron: Data Wrangling; case study: Marine sportfishing tagging programme).
- Unzip and open the `Class 2/` folder in Positron: the script expects to sit in the lesson root and reads
  `data/...` ("Ensure you are sitting in the root folder for the lesson").

## Members

| Member | Size | Rows x cols | What it is |
|---|---|---|---|
| `Class 2/data/108916_tag.csv` | 42.5 KB | 586 x 14 | Track (most likely positions) of tag PTT 108916, 26 Jul - Dec 2012 |
| `Class 2/data/108916_histos.csv` | 108 KB | 1,072 x 38 | Summary histograms from the same tag (time-at-temperature, time-at-depth) |
| `Class 2/data/gebco_2025_n56.0_s14.0_w-32.0_e-7.4.tif` | 119 MB | raster | GEBCO 2025 bathymetry grid clipped to 56N-14N, 32W-7.4W (bounds from file name); CRS not listed |
| `Class 2/data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` | 6.3 MB | 47,086 x 15 | Sportfish tagging records - see [irish-marine-sportfish-tagging.md](irish-marine-sportfish-tagging.md) (this copy has 4 coordinate columns, not 2) |
| `Class 2/Topic 2.R` | 4.9 KB | | Positron lesson script (filtering, pivoting, dates, factors) |
| `Class 2/Topic 2 - Case study.qmd` | 207 B | | Empty Quarto template "Case study 2 - Marine Sportfishing Tagging Program", renders to docx with `quarto render "Topic 2 - Case study.qmd"` |

Provenance: the tag is a Wildlife Computers `Mk10` instrument transmitting via `Argos` (values in the file). The
Topic 2 slides show the instructor's basking-shark tracking research (Johnston et al., "Cool runnings: behavioural
plasticity and the realised thermal niche of basking sharks", Environ Biol Fish) - see
[../course/topic-2-slides.md](../course/topic-2-slides.md). The course does not state which shark in the paper
PTT 108916 is.

## 108916_tag.csv

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `Ptt` | int64 | 586 | 1 | 108916 | tag ID |
| `Date` | object | 586 | 578 | `2012-07-26 10:00` | date-time text `YYYY-MM-DD H:MM`; parse with `ymd_hm()` |
| `Month` | int64 | 586 | 6 | 7 ... 12 | month number |
| `Most Likely Latitude` | float64 | 586 | 372 | 55.375 | modelled latitude (14.7-58.1) |
| `Most Likely Longitude` | float64 | 586 | 311 | -7.4 | modelled longitude (-31.7 to -7.4) |
| `Observation Type` | object | 305 | 7 | `User`, `Argos-3`, `Argos-1`, `Light - Dawn` | source of the observation |
| `Observed SST` | float64 | 110 | 65 | 14.9 | sea-surface temperature from tag, deg C |
| `Satellite SST` | float64 | 110 | 110 | 13.416 | satellite SST, deg C |
| `Observed Depth` | float64 | 298 | 26 | 16.0, 80.0 | depth, m |
| `Bathymetry Depth` | float64 | 298 | 133 | 99.0, 4858 | seabed depth, m |
| `Observation LL (MSS)` | float64 | 0 | 0 | | empty |
| `Observation Score` | float64 | 305 | 128 | 69.56 | |
| `Sunrise` | object | 140 | 140 | `2012-07-27 4:29` | date-time text |
| `Sunset` | object | 140 | 140 | `2012-07-27 20:46` | date-time text |

## 108916_histos.csv

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `Ptt` | int64 | 1,072 | 1 | 108916 | tag ID |
| `DepthSensor` | float64 | 1,072 | 1 | 0.5 | |
| `Source` | object | 1,072 | 1 | `Argos` | |
| `Instr` | object | 1,072 | 1 | `Mk10` | |
| `HistType` | object | 1,072 | 5 | `TATLIMITS`, `TAT`, `TADLIMITS`, `TAD` (+1 more) | `TAT` = time-at-temperature, `TAD` = time-at-depth, `...LIMITS` rows hold bin edges (general knowledge; script filters on these values) |
| `Date` | object | 1,070 | 500 | `2012-07-26 10:00` | blank on LIMITS rows |
| `Time Offset` | float64 | 1,070 | 22 | 1.0 | |
| `Count` | float64 | 1,070 | 7 | 1.0 | |
| `BadTherm` | float64 | 955 | 1 | 0.0 | |
| `LocationQuality` | object | 21 | 4 | `GPS`, `User`, `2`, `3` | |
| `Latitude`, `Longitude` | float64 | 21 | 4-5 | 55.3389, -7.4138 | rarely filled |
| `NumBins` | float64 | 1,070 | 3 | 6, 8, 24 | |
| `Sum` | float64 | 955 | 1 | 100.0 | percentages sum to 100 |
| `Bin1`-`Bin5`, `Bin7`, `Bin9`-`Bin24` | float64 | 115-1,072 | | 0.0, 88.6 | percent of time in each bin |
| `Bin6`, `Bin8` | object | 1,072 / 589 | | `>18.000000`, `5.7`, `>100.000000` | TEXT because LIMITS rows contain `>18.000000` / `>100.000000` |

Bin meaning for TAT rows, from `TATLIMITS` (0, 9, 12, 15, 18, >18) and the script's renames:
`Bin2` = `Less than 9 C`, `Bin3` = `Between 9-12 C`, `Bin4` = `Between 12-15 C`, `Bin5` = `Between 15-18 C`,
`Bin6` = `Greater than 18 C`.

## Data-quality issues an agent must handle

1. **Mixed rows:** limits rows and data rows share columns; filter `HistType == "TAT"` before analysis.
2. **Text in numeric bins:** `Bin6`/`Bin8` are character because of `>18.000000`; convert with `as.numeric()` after
   filtering (script: `mutate(\`Greater than 18 C\` = as.numeric(\`Greater than 18 C\`))`).
3. **Dates as text** (`YYYY-MM-DD H:MM` with non-padded hours): `ymd_hm(Date)`; `month(date_time, label = TRUE)`.
4. **Wide bins** need `pivot_longer()` to plot; script drops columns 21:38 first (`select(-(21:38))`).
5. **Factor order:** temperature ranges plot alphabetically unless set with `factor(..., levels = ...)`.
6. **GEBCO raster is large (119 MB)**; bounds are only in the file name.

## Course procedures that use it

R (Topic 2 script, also in `Combined R Scripts.R` / `R Skills Review.R`): `read_csv`, `ymd_hm`, `month`,
`glimpse`, `unique`, `filter` with `==`, `!=`, `%in%`, `!`, `&`, `rename`, `pivot_longer`, `pivot_wider`,
`group_by`/`summarize(mean(..., na.rm = TRUE))`, `geom_line`, `geom_col`, `coord_flip`, `factor(levels=)`,
`reorder()`. QGIS use of the GEBCO raster is not shown in captured material (purpose inferred: bathymetry
basemap for tracks).
