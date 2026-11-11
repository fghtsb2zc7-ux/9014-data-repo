# Classes 1-8 (Unit 1: Core Technical Skills)

Each class pairs a pre-class "Topic" (videos per software) with an in-class case study. Dates from the course
outline timetable ([course-overview.md](course-overview.md)). Video transcripts live in `../transcripts/<tool>/`;
procedures in `../tools/<tool>/`.

## Class 1

- **Theme:** "Beneath the Surface: Measuring Animal Abundance in the Ocean" - North Atlantic right whale in the Bay of
  Fundy; entanglement and ship strikes; goals of conservation biology for migratory marine species. Sept 8.
- **Pages:** [Class 1 Overview](../course-pages/class-1-overview.md); pre-class [Topic 1](../course-pages/topic-1-loading-cleaning-and-exploring-data.md),
  [Getting Started with Course Software](../course-pages/getting-started-with-course-software.md),
  [The NPRI Dataset](../course-pages/the-npri-dataset.md). Slides: [class-1-slides.md](class-1-slides.md).
- **Outline:** Practice (20 min); course structure (35 min); Positron lesson (55 min); lecture on class dataset
  (15 min); Case study #1: North Atlantic Right Whale protections (1 h); wrap-up.
- **Case study:** `Topic 1 - Case study.qmd` (Quarto, renders to docx): Excel metadata sheet, PivotCharts of whales
  by year/month/institution, top-3 institutions; QGIS load OBIS points, basemap, symbology by month and by count,
  vessel routes, sightings within routes; R reduce the full dataset, summarise by institution-year and year-month,
  column plot, PNG and CSV export.
- **Datasets:** [NPRI](../datasets/npri.md) (Positron lesson: Total particulate matter by province since 2015),
  [OBIS right whale](../datasets/obis-north-atlantic-right-whale.md) (full + reduced),
  [Vessel traffic routes](../datasets/vessel-traffic-routes.md).
- **Skills/tools:** import CSVs into Excel (tables, Power Query), basic filtering, PivotTables/Charts; QGIS
  intro, CRS, basemaps (QuickMapServices), shapefiles, delimited text layers, basic filter; Positron intro, packages,
  `read_csv`, `clean_names`, `select`, `filter`, `group_by`, `summarize`, `ggplot`, `ggsave`, `write_csv`.

## Class 2

- **Theme:** "Animals on the Move: Tracking Animal Movement Across Seascapes" - satellite tags, acoustic arrays,
  biologgers; basking sharks as model species (migration, habitat preference, risk exposure). Sept 14.
- **Pages:** [Lesson 2 Overview](../course-pages/lesson-2-overview.md); pre-class [Topic 2](../course-pages/topic-2-transforming-and-wrangling-data.md);
  slides [topic-2-slides.md](topic-2-slides.md).
- **Outline:** review of pre-class work and homework (30 min); sourcing open data and data types (30 min); lecture
  (30 min); Positron: Data Wrangling (1 h); Case study: Marine sportfishing tagging programme (1 h).
- **Datasets:** [Class 2.zip](../datasets/class-2-basking-shark-tag-data.md) (shark tag 108916 track and
  temperature histograms, GEBCO bathymetry), [Irish sportfish tagging](../datasets/irish-marine-sportfish-tagging.md);
  pre-class: [OBIS right whale (Topic 2 copy)](../datasets/obis-north-atlantic-right-whale.md),
  [marine invasive species rasters](../datasets/marine-invasive-species-rasters.md).
- **Learning objectives:** filtering across Excel, R, QGIS; restructure, calculate and summarise; import, process and
  manipulate raster and vector data in QGIS.
- **Skills/tools:** Excel Power Query data types, splitting columns, removing columns/rows/blanks/duplicates,
  pivot/unpivot (wide vs long), date extraction and parsing; QGIS raster import and pseudocolor symbology, raster
  calculator, ESRI REST servers, multi-condition vector filters; R `ymd_hm`, `month(label = TRUE)`, `filter` with
  `==`/`!=`/`%in%`/`!`/`&`, `pivot_longer`/`pivot_wider`, `factor(levels=)`, `reorder`, `coord_flip`.
  (Lesson 2 photo `IMG_5011.JPG` could not be retrieved.)

## Class 3

- **Theme:** "Food for Thought: Ocean Habitat, Fisheries, and Ecosystem Change" - Canadian fisheries and
  aquaculture. Sept 15.
- **Pages:** [Lesson 3 Overview](../course-pages/lesson-3-overview.md);
  [Marine Sportfish Tagging Programme](../course-pages/marine-sportfish-tagging-programme.md); pre-class
  [Topic 3](../course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md).
- **Outline:** Marine Sportfishing Programme (2 h); Food for Thought: lobster fishery data (1 h); Case study #3: Rock
  crab fishery; preparation for next week's field work.
- **Datasets:** [Irish sportfish tagging](../datasets/irish-marine-sportfish-tagging.md); lobster data not captured
  (only `Picture2 - lobster.jpg`); rock crab: probably the [rock crab survey](../datasets/rock-crab-survey.md) files
  later reused in exam practice set #2 (inferred).
- **Learning objectives:** EDA to find patterns and unusual observations; formulas and functions in Excel and R
  (e.g. catch per unit effort, population estimates); multiple conditions to classify data; build and modify simple
  deterministic models.
- **Skills/tools:** Excel formulas (SUM, AVERAGE, COUNTIF, UNIQUE, FILTER, data validation dropdowns), IF/IFS/AND/OR;
  QGIS Field Calculator IF, CASE WHEN, raster calculator with two rasters; R formulas, `ifelse`, deterministic models
  (covered in class).

## Class 4

- **Theme:** "Biodiversity and Invasive Species Assessment" / "Invasive Species Monitoring" - field survey of
  invasive buckthorn (and honeysuckle) in the riparian woodland behind the UWO soccer fields to choose removal focus
  areas. Sept 21 (outline "Topic 4: Field Data Collection").
- **Pages:** [Lesson overview](../course-pages/lesson-overview.md); [Pre-class readings](../course-pages/pre-class-readings.md)
  (buckthorn fact sheet, sampling protocol, Lyme disease / tick brochure - wear long pants).
- **Outline:** meet at North Campus Building parking lot (equipment); walk to soccer fields; riparian zone intro and
  sampling procedure; monitoring (2 h); return for data entry (1 h).
- **Datasets produced:** [Buckthorn survey](../datasets/buckthorn-survey.md) (`Buckthorn observations_0.csv`).
- **Skills:** systematic and haphazard sampling, field data collection and digitisation (ArcGIS Field Maps-type
  form), EDA to prioritise removal areas. Follow-up: "Buckthorn Bust!" removal day Friday Oct 9.

## Class 5

- **Theme:** "Troubled Waters: A History of Pollution in Canadian Waterways" - Great Lakes pollution,
  eutrophication (agriculture, wastewater, harmful algal blooms), history of acid rain and policy response. Sept 28.
- **Pages:** [Lesson 5 overview](../course-pages/lesson-5-overview.md); [Case study #5](../course-pages/case-study-5.md);
  pre-class [Topic 5](../course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md).
- **Outline:** pre-class work review (1 h); Case study #5: sulphate concentrations and the PWQMN (2 h);
  introduction to the NPRI assignment (30 min). Script: `Topic 5 in-class script.R` (buckthorn plots).
- **Case study:** (a) sulphate wet deposition: explore [US power plants](../datasets/us-power-plants.md) (count by
  type, MW by type) and add the ECCC xSO4 5-year-average deposition ESRI REST layer; (b) PWQMN EDA: characterise the
  network (stations, sampling effort, change over time, most-measured parameters, geographic gaps); phosphorus and
  chloride distributions, station differences, trends, seasonality, hotspots; distance to roads/agriculture.
- **Datasets:** [PWQMN](../datasets/pwqmn.md), [conservation authority areas](../datasets/conservation-authority-areas.md),
  Ontario Road Network (Scholars GeoPortal, external), Ontario Watershed Boundaries (GeoHub, external),
  [Annual Crop Inventory 2018](../datasets/annual-crop-inventory-2018.md), [EcoDistricts](../datasets/ontario-ecodistricts.md),
  [buckthorn survey](../datasets/buckthorn-survey.md) (Topic 5 videos).
- **Learning objectives:** attribute joins, spatial joins, joins by location; integrate and merge data in Excel, R
  and QGIS; sample raster and vector values onto vector data.
- **Skills/tools:** Excel Power Query Merge; QGIS new layer, reproject, join attributes by nearest, sample raster
  values, export to CSV, attribute join, change column type, join by location, buffers and zonal histograms, create
  spatial index, Sum line lengths; R `bind_rows`, `left_join`, `semi_join`, `anti_join`, `distinct`, `join_by`.

## Class 6

- **Theme:** "Pollution Pathways: Tracking Canada's Environmental Releases" - the NPRI with ECCC representatives;
  launch of the NPRI group project. Sept 29.
- **Pages:** [Lesson 6 Overview](../course-pages/lesson-6-overview.md); pre-class
  [Topic 6](../course-pages/topic-6-exploratory-data-analysis-and-visualization.md) (NPRI "Using and interpreting data"
  tabs, NPRI Power BI dashboard tasks, 2023/2024 data highlights);
  [NPRI Group Assignment](../course-pages/npri-group-assignment-updated.md).
- **Outline:** group assignments and Team Charter (30 min); introduction to the NPRI and the German national
  pollutant monitoring (1 h); NPRI group work (2 h).
- **Datasets:** [NPRI](../datasets/npri.md), [German PRTR releases](../datasets/germany-prtr-releases.md); MES Team
  Charter template (`MES Team Charter Template .docx`). Background: [npri.md](npri.md).

## Class 7

- **Theme:** "Forecasting Footprints: Canada's GHG Emissions and Climate Action" (outline Topic 7: Statistical
  Analysis - testing relationships and interpreting evidence). Oct 5.
- **Pages:** [Lesson 7 Overview](../course-pages/lesson-7-overview.md); pre-class [Topic 7](../course-pages/topic-7.md).
- **Outline:** Topic 7 practice question (15 min); NPRI project (15 min); Buckthorn R script `Topic 7.R` with
  `buckthorn_updated.csv` (45 min); GHG lecture (2 h). Exercise: recreate the London map (`test1.png`) from the
  Topic 7 `ansi` and `municlow` layers.
- **Datasets:** [buckthorn_updated.csv](../datasets/buckthorn-survey.md),
  [Topic 7 boundary layers](../datasets/topic-7-ontario-boundary-layers.md).
- **Skills/tools:** R histograms with `facet_wrap`, scatter + `geom_smooth(method = "lm")`, `lm()` + `summary()`
  (slope p-value), group comparison (`y ~ section`), additive and interaction models, boxplots, pivot_longer of
  life stages; QGIS spatial index, clip, count points in polygons and grids, merge layers/features, GeoPackages,
  print layout, project files.

## Class 8

- **Theme:** "Landscapes in Motion: Measuring the Cost of Land Use Changes and Habitat Degradation" (outline Topic 8:
  Large-scale Geospatial Analysis). Oct 6.
- **Pages:** [Case study #8](../course-pages/case-study-8.md) - Thames Talbot Land Trust.
- **Case study:** identify London parcels with wooded and wetland areas and wetland loss; build a parcel scoring
  system in R; map the top-scoring parcels and show R figures of the score distribution.
- **Datasets:** [Ontario Land Cover Compilation](../datasets/ontario-land-cover-compilation.md),
  [London parcels and TTLT area](../datasets/london-parcels-and-ttlt-area.md),
  [SOLRIS 3.0 change](../datasets/solris-3-land-use-change.md),
  [LIO wooded area and wetland units](../datasets/lio-wooded-area-and-wetland-units.md); R script
  `Combined R Scripts.R` with [PWQMN](../datasets/pwqmn.md) 2024 data and stations (Topic 8 section: chloride
  heatmap and annotated line plot).
- **Skills/tools:** large-layer handling (spatial index, clip, GeoPackage), overlay/zonal summaries, scoring with
  `mutate`/`ifelse`, `geom_tile`, `geom_text`, `scale_colour_manual`, `theme()` customisation.

## After Class 8

Buckthorn removal (Oct 9); exams Oct 26-27 ([assessments.md](assessments.md)); Unit 2 project studios from Nov 9.
