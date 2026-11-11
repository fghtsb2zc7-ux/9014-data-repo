# Assessments - what is asked and what an agent needs

Weights and dates: [course-overview.md](course-overview.md#assessments-and-weights-outline-methods-of-evaluation).

| Assessment | Weight | Due | Tools |
|---|---|---|---|
| Exams (2 days, open book, AI permitted, cumulative) | 40% | Oct 26 and Oct 27, 2026, 9-12 | Excel, QGIS, R (Positron) |
| Independent project presentation | 5% | Nov 23 / 24 | slide deck |
| Independent Project ArcGIS StoryMap | 30% | Dec 11, 11:59 PM | R (10 figures), QGIS (10 maps), ArcGIS StoryMaps + dashboard, infographic tool |
| NPRI group report + standardized air-release dataset | 20% | draft to ECCC Dec 2; final Dec 16 (outline) | Excel / R / QGIS, Power BI or Tableau optional |
| NPRI presentation to ECCC | 5% | Dec 2 (in class, virtual) | slides |

## Exams

Outline: two days of exams applying Unit 1 technical skills (data manipulation, analysis, visualization) across
Excel, R and QGIS; cumulative; open-book; generative AI tools permitted. The
[Technical skills checklist](../course-pages/technical-skills-checklist.md) (updated 12 Oct 2026) lists the 32 Excel,
42 QGIS and 70 R skills examinable.

Practice material is on [Exam Practice](../course-pages/exam-practice.md):

### Practice set 1: North Atlantic Right Whale

Datasets: `Practice sets/OBIS - North Atlantic Right Whale reduced.csv`, `Practice sets/Vessel_Traffic_Routes.zip`
([dataset doc](../datasets/obis-north-atlantic-right-whale.md), [routes](../datasets/vessel-traffic-routes.md)).
Full worksheet with "Get help" foldouts and R answer code:
[Practice 1 - North Atlantic Right Whale](../course-pages/practice-1-north-atlantic-right-whale.md). Codes: E =
Excel, Q = QGIS, R = R. Question prompts (as on the page):

- **E.1.1** Import the CSV using Power Query (use Transform) and inspect the complete dataset. Locate coordinates,
  dates, years, whale counts. (1) Parse out as many dates as you can from `eventDate`. (2) Create a month column
  from `eventDate_standard`. (3) Null `individualCount` = whale seen but number not recorded; assume a single whale
  and correct. (4) Save as `OBIS - North Atlantic Right Whale updated.csv`.
- **E.1.2** Create `corrected_depth` setting negative bathymetry to 0, (1) via the column filter, (2) with an IF
  function (`=IF([@bathymetry] <0, 0,[@bathymetry])`).
- **E.1.3** PivotTable of the number of sighting records by `institutioncode`; how many have no institution; sort;
  remove blanks and institutions with fewer than 10 sightings; PivotChart.
- **E.1.4** PivotTable of sum of `individualCount` per year; change the chart to the number of sightings per year;
  compare.
- **E.1.5** PivotTable of total sightings by calendar month pooled across years; discuss observation effort.
- **E.1.6** PivotChart of sightings in three categories: 1 whale, 2-10 whales, more than 10
  (`=IFS([@individualCount]>10, "More than 10", [@individualCount]> 1, "Between 2 and 10", [@individualCount] =1, "Only 1")`).
- **E.1.7** Dropdown to select institutions and a cell showing the number of sightings (`UNIQUE` list on a separate
  sheet, Data Validation list, `COUNTIF`).
- **Q.1.1** Load the updated CSV as points (WGS 84 EPSG:4326), add ocean basemap; find bathymetry < 0 records, clear
  filter; symbolise on land vs on water (Field Calculator text field `IF( "bathymetry" <0, 'On land', 'On Water')`).
- **Q.1.2** Load `TSSLPT_A.shp` (traffic separation lanes) and `TSEZNE_A.shp` (separation zone); merge into one
  layer (ignore field-length errors); select Bay of Fundy routes and save as a separate layer.
- **Q.1.3** Symbolise sightings by month (Categorized); show sightings count per polygon (Count Points in Polygon);
  make May and August count layers and compare.
- **Q.1.4** Distance from each point to the nearest route in NAD83 / UTM zone 20N (EPSG:26920) (reproject both, Join
  attributes by nearest). What does distance 0 mean?
- **Q.1.5** Field Calculator distance in km (`/1000`); filter <= 5 km and count; graduated symbology by distance;
  explain why proximity does not prove vessel presence.
- **Q.1.6** Print layout of Bay of Fundy sightings and routes with distance symbology, title, legend, scale bar;
  export and save project and layers.
- **R.1.1** Load tidyverse and janitor, import, `clean_names()`, inspect, add labelled month.
- **R.1.2** Select id, year, month, individual_count, institution_code; records from 2000 onward.
- **R.1.3** Sum of whale counts per month excluding missing; blue column plot with axis labels.
- **R.1.4** Yearly totals of sightings (rows); purple line + points, labels, title, `theme_bw`.
- **R.1.5** Top five institutions by whales seen; yearly sums per institution as columns, coloured and faceted.
- **R.1.6** Monthly sightings split Individual vs Group (count >= 2); stacked columns; export PNG and CSV.

**Practice exam question (ferry):** recreate `Practice Questions/grand_mana.png` / `ferry.png` - sightings within
1 km and 2 km of the (Grand Manan) ferry route by month. Expected workflow: QGIS buffers (1 km, 2 km) around the ferry
route (`FERYRT_L`), select/extract sightings within each, export `1km_buffer.csv` and `2km_buffer.csv`, then R:

```
library(tidyverse)
library(janitor)

data1 <- read_csv("1km_buffer.csv") |> 
  clean_names()|>
  mutate(buffer = "1 km")

data2 <- read_csv("2km_buffer.csv") |> 
  clean_names() |>
  mutate(buffer = "2 km")

combined_data <- bind_rows(data1, data2) |> 
  mutate(month = month(event_date_standard, label = TRUE))

count_data <- combined_data |> 
  group_by(month, buffer) |> 
  summarize(sightings = n()) |> 
  filter(month %in% c("Jul", "Aug", "Sep", "Oct", "Nov"))

ggplot(count_data, aes(x = month, y= sightings, fill = buffer)) +
  geom_col(colour = "black")+
  labs(x = "Month", y = "Sightings", fill = "Distance from ferry route", title = "Sightings within 1 km and 2 km of the ferry", subtitle = "OBIS data from 1900-2024")+
  theme_bw()+
  theme(legend.position = "bottom")
```

### Practice set 2: Crab counts

Datasets: `Information_stations.csv` (stations/tows incl. tow distance `dist`), `Nombre_crabe_crab_number.csv`
(crab numbers `n_tot` per tow with `st` and year) - [dataset doc](../datasets/rock-crab-survey.md).
Question: "Please recreate the following figure using R: crab_counts.png". Counts must be corrected for tow length.
Note from the page: left joins may omit `by =`; R joins on all shared columns, e.g.

```
pwqmn_data_2024_joined  <- pwqmn_data_2024 |>
       left_join(unique_stations)
```

### Practice R exam: Human wildlife incidents

Source: `Practice Questions/ENVRSUST 9014 R Practice Exam.pdf` (figures not extractable). Datasets:
[Parks Canada human-wildlife files](../datasets/human-wildlife-coexistence.md). Text as extracted:

> **Human and wildlife conflict.** Description: National parks provide both protection for biodiversity and
> recreational ecosystem services for society. However, this can sometimes lead to conflict between humans and
> wildlife. As a park manager, you want to identify major issues with wildlife and human conflict using reporting
> data. The datasets we will be using contain the incident type, incident date, the species involved, and whether or
> not a deterrent was used.
>
> Datasets: pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv - "Each row in the dataset
> is a recorded incident with a different species"; pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv
> - "This dataset has staff hours across years according to incident type".
>
> 1. In order to better plan and prepare for interventions, we need to examine how incidents are occurring over time.
>    This might allow us to put more resources in place to respond, or limit, negative interactions. Use the
>    pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv to recreate the following figure.
>    Species can be found in the Species Common Name column. Remove species listings that are classified as
>    "Unknown". Note, there are some species that have "unknown" in front of their common name (e.g., "unknown duck",
>    "unknown mollusk", etc), please keep those in the dataset. Include code in your script to save your figure as a
>    PNG.
> 2. Occasionally, a deterrent may have to be used when there is a human wildlife interaction to protect humans.
>    Filter the pca-human-wildlife-conflict-animals-involved-detailed-records-data dataset for only 'Human Wildlife
>    Interaction' (found in the Incident Type column). Once you have determined the top five species, go back and
>    filter the deterrent_records dataset to only include those top 5 species and then recreate the figure below.
> 3. We want to learn more about how the number of animals involved in different incident types has changed over
>    time. From the pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv, create a new
>    dataset that only has the following columns: Year; Incident Type; Sum of number of animals. Recreate the
>    following figure which explores how the mean number of animals per incident type has changed from 2013 to 2023
>    (hint: use back-ticks around the year headers when doing your calculations, `2013`).

Agent needs: R filtering with exact string matching, `year()` from ISO dates, grouping/summarising, top-n with
`arrange()`/`head()`, `%in%`, `pivot_wider()` (years as columns, hence backticks), `ggsave()`. The target figures are
images in the PDF and were not captured as text.

### Full practice exam: Particulate matter

Source: `ENVRSUST 9014 - Practice Exam - Particulate Matter 2026 updated.pdf` ("updated copy ... with a correction to
question 2"); data `TPM practice exam.zip` ([dataset doc](../datasets/tpm-practice-exam.md)). Text as extracted
(figures not extractable):

> **Practice exam: Particulate matter in Canada.** Datasets to work with (in data folder):
> - particulate_matter_ON.csv - Particulate matter releases from Ontario facilities (2020-2024)
> - ELC shapefile - The Ecological Land Classification (ELC) layers divide the landscape into ecological regions
>   (ecoregions) based on features such as climate, geology, soils and vegetation.
> - can_ppp_2020_1km_Aggregated - This raster shows the estimated population of Canada in 2020, aggregated to a grid
>   at approximately 1 km resolution. Each cell contains the estimated number of people living within that cell,
>   rather than population density.
>
> 1. Please recreate the figure below. As part of the question, please add the slope and indicate whether or not the
>    slope is significantly different from zero in the subtitle.
> 2. Please recreate the figure below. Red rings represent 5 km distance from facilities that are located in areas
>    with over 500 people. Grid cells with over 5000 1000 people are also shown on the map. [Extracted text reads
>    "5000 1000" - the "updated" correction; 1000 appears to replace 5000, matching the "1000" figure annotation.]
>    [Annotation on the figure: "These range values on the raster symbology may not be aligned with the full range of
>    the dataset, but by default when you change symbology it should show up like this" - "1000"]
> 3. Recreate the figure below. Pay careful attention to the details in the figure title and subtitle.

Agent needs: Q1 R `lm()` + `summary()` and `geom_smooth(method = "lm")`, slope and p-value pasted into `labs(subtitle=)`;
Q2 QGIS: load CSV points, Sample raster values (population), filter > 500, reproject to metres, Buffer 5 km,
raster symbology/Raster Calculator for cells > 1000, Print Layout; Q3 depends on the figure (likely ELC join and R
summary - not determinable from text).

## NPRI group assignment

Page: [NPRI Group Assignment (updated)](../course-pages/npri-group-assignment-updated.md); outline section "NPRI
Assignment (20%)"; ECCC presentation [npri.md](npri.md).

- Groups of 5-6 (pre-assigned), each a sector: 1 Natural Resource Extraction (except coal) - NACE 06, 07, 08, 09 /
  NAICS 21 (other than 2121); 2 Coal and lignite mining - NACE 05 / NAICS 2121; 3 Electricity Generation - NACE 35.11 /
  NAICS 2211; 4 Automotive & Transportation Manufacturing - NACE 29 / NAICS 336; 5 Paper manufacturing - 17 / 322;
  6 Wood product manufacturing - 16 / 321; 7 Petroleum processing - 19 / 324; 8 Chemical manufacturing - 20 / 325;
  9 Metal Production & Processing - 24 / 331; 10 Waste Management - 38 / 5622; 11 Waste Water Treatment - 37 / 2213.
- **Objective:** "How comparable are the Canadian and German reporting datasets, and what can they tell us about
  differences in reported industrial releases to air?"
- **Section 1 - Assess comparability** (releases to air and disposals/waste transfers): thresholds and requirements by
  substance/activity/category and what gets excluded (German thresholds are in the data; Canadian thresholds at the
  NPRI threshold page); number of substances covered and overlap; determination methods (measured / calculated /
  estimated); units and conversions (and non-convertible substances); matching periods and equivalent activities
  (NACE vs NAICS). Explain which comparisons are defensible, need standardization, or cannot be made.
- **Section 2 - Build and analyse a comparable air-release dataset** for the sector in both countries; document years,
  sectors, substances retained; name/sector matching; unit conversions; handling of thresholds, missing values,
  unmatched records; remaining differences. Analyse differences between countries and sectors with summaries and
  visualizations.
- **Format:** report with table of contents; 250-word executive summary per section; sector introduction (max 300
  words) in section 1; a table plus discussion for section 1; visualizations and maps for both sections; references;
  30-40 pages max (groups of three may be shorter). Submit the standardized air-release dataset with the report.
  Complete and upload the MES Team Charter (`MES Team Charter Template .docx`: team culture, communication/
  organization, meetings, deadlines, decision-making and conflicts, feedback, initials).
- **Dates:** polished draft to ECCC Dec 2, 2026; virtual presentations to ECCC mentors Dec 2 (in class); then revise
  per mentor feedback and submit the final with track changes (outline: Dec 16).
- **ECCC presentation project leads** (slides 37/39): how releases changed over years across countries in each
  industry; facility comparisons across release media, disposals and transfers; statistically significant
  Canada-Germany differences between facilities and over time; explanations; locations with consistently high
  pollution and possible interventions. Suggested report outline: Summary, Introduction (environmental and health
  impacts, processes), Methods (data collection, analysis, limitations), Results (dashboard - Power BI / Tableau,
  maps), Discussion, Conclusion.
- **Presentation (5%)** (outline): detailed findings, key patterns/trends/concerns, best visuals, recommendations
  (e.g. monitoring threshold changes, further investigation, priority areas).
- **Data:** [NPRI](../datasets/npri.md) and [German PRTR](../datasets/germany-prtr-releases.md). Starter R from the
  page:

```
library(tidyverse)
npri_data <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") 
npri_data$split <- substring(npri_data$`NAICS / Code_SCIAN`,1, 4)
```

- **Agent procedures needed:** filter NPRI by NAICS prefix and "Releases to Air"; filter German data
  `compartment == "Air"` and NACE; harmonise substance names; convert kg/a to tonnes; apply common thresholds;
  `bind_rows` into one long dataset; summaries and plots in R; maps of facilities in QGIS (two CRSs: NPRI lat/long,
  German ETRS89 x/y); optionally Power Query merges.
- Past examples (ECCC): "Bisphenol A and Bis(2-ethylhexyl) Adipate releases from different facilities across Canada";
  "Analysis of Biphenyl and Bis(2-ethylhexyl) phthalate releases and exposure in diverse water bodies in Canada"
  (links in [external-resources.md](external-resources.md)).

## Independent project (ArcGIS StoryMap)

Pages: [Selecting a project topic and collecting data](../course-pages/selecting-a-project-topic-and-collecting-data.md),
[Final Submission - ArcGIS Story Map](../course-pages/final-submission-arcgis-story-map.md); outline section; rubric on
Brightspace (Assignments > Independent Project (30%), not captured).

- **Scope:** open-ended exploratory analysis of a broad ecosystem-health / environmental topic using temporal and
  spatial open-source data. Choose a high-level topic first, then check data availability before fixing research
  questions. Past topics: neonicotinoids in SW Ontario; air quality near emitting facilities in Ontario; fossil-fuel
  electricity and ecosystem health. Class 1 slides show 2025 StoryMaps (agricultural runoff; Ontario's low-carbon
  shift; NPRI releases near First Nations).
- **Data sources suggested:** Canadian Open Data Portal, Ontario Open Data, London Open Data, World Bank, OBIS,
  iNaturalist, Dryad, UN Data, eBird, Scholars GeoPortal ([external-resources.md](external-resources.md)).
- **StoryMap must include:** a "social media ready" infographic (PowerPoint/Canva, inserted as an image; readable
  figures); **10 figures created in R**; **10 maps created in QGIS, at least two interactive** (QGIS-processed data
  shown interactively in StoryMaps; a dashboard may count as one); **at least one dashboard** in the StoryMap; written
  summary of key findings, citing all figures/maps, with academic context, **max 2,000 words**; list of data sources
  with weblinks; references in **APA 7th**. All visuals must be your own from open data. R scripts are submitted too.
  Photos allowed (StoryMap component worth 7 of 60 rubric points).
- **Due:** December 11, 11:59 PM. Elective StoryMaps and dashboards workshop Nov 6.
- **Presentation (5%), Nov 23/24:** ~10 minutes plus questions, slide deck (not the StoryMap): title slide; 1-2
  introduction slides (issue, why, current understanding, data sources); content slides with the most compelling
  figures and maps and their interpretation.
- **Agent procedures needed:** all R plotting skills (ggplot geoms, labs, themes, facets, ggsave), QGIS map-making
  (symbology, print layout, export), data sourcing and cleaning in Excel/R; ArcGIS StoryMaps steps are not covered by
  captured course videos.
