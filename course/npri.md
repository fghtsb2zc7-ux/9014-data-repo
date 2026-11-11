# The National Pollutant Release Inventory (NPRI) in ENVRSUST 9014

Sources: [The NPRI Dataset](../course-pages/the-npri-dataset.md), [Topic 6](../course-pages/topic-6-exploratory-data-analysis-and-visualization.md),
[Lesson 6 Overview](../course-pages/lesson-6-overview.md), [NPRI Group Assignment](../course-pages/npri-group-assignment-updated.md),
the ECCC slide deck `Western Presentation - EN NPRI 101-201_2024 AP_2 - Copy.pdf` (39 pages, dated October 6, 2026),
and the ECCC webinar/Excel video transcripts (publisher paraphrases in
[../transcripts/external/](../transcripts/external/)). Data files: [../datasets/npri.md](../datasets/npri.md).

## What it is

Canada's Pollutant Release and Transfer Register (PRTR): a publicly accessible inventory of pollutant releases (to
air, surface water, land), disposals and transfers (for treatment, recycling, energy recovery) reported annually by
industrial, commercial and institutional facilities. Mandated under the Canadian Environmental Protection Act, 1999
(CEPA), run by Environment and Climate Change Canada (ECCC). Over 491 pollutants from over 7,000 facilities (ECCC
2026 deck; the older webinar says >300 substances, ~7,500 facilities). First reporting year 1993 with 178 substances.
Public "right-to-know" is a core principle.

## How the course uses it

1. **Foundational training dataset** for most Unit 1 videos, so students learn skills without learning a new dataset
   each topic (Excel pivots and Power Query on the industry air-release summary and 2024 single-year table; QGIS on
   facility geolocations; R on the 1993-present releases file).
2. **NPRI group assignment / Academic Challenge** with ECCC: compare Canadian NPRI and German PRTR releases to air by
   sector ([assessments.md](assessments.md#npri-group-assignment)).
3. **Pre-class work:** ECCC overview video, "How to use NPRI Excel single year tabular data" video, NPRI map; Topic 6
   readings: "Using and interpreting data" (About us, Using our data - common mistakes and double/triple counting,
   Interpreting our data - understanding changes, Our method), the NPRI Power BI dashboard tasks (London 2024 vs
   2014; Conventional Oil and Gas Extraction locations; sector leading air releases; filter Part 1A; sector with most
   particulate matter and ammonia; metals industry; Ontario Pulp and Paper Mills trend; 3M Canada London facility
   main 2018 air releases) and the NPRI data highlights (2024 Data at a Glance; Regional Overview).
4. **Class 6** visit by ECCC (NPRI and the German national pollutant monitoring introduced; team charter; group work).

## Reporting rules (ECCC deck)

- **Who reports:** mandatory under CEPA for owners/operators meeting requirements published in the Canada Gazette,
  Part I. Generally if: total hours worked > 20,000 (about 10 full-time employees); or engaged in certain activities
  (e.g. wood preservation, incineration, burning fuels in stationary combustion equipment); and manufacturing,
  processing or otherwise using (MPO) or releasing NPRI substances above thresholds.
- **Substance parts:**

| Part | Reporting criteria |
|---|---|
| 1A | Core substances reported if MPO above thresholds (>= 10 tonnes at 1% concentration) |
| 1B | Substances with alternate (lower) thresholds |
| 1C | Per- and polyfluoroalkyl substances (PFAS) |
| 2 | Polycyclic aromatic hydrocarbons (PAHs): higher threshold for grouped PAHs, smaller for individual PAHs |
| 3 | Dioxins, furans and hexachlorobenzene from specific activities (by-products of industrial and combustion processes) |
| 4 | Criteria Air Contaminants (CACs) - combustion/industrial; acid rain and smog |
| 5 | Speciated volatile organic compounds (VOCs) reported when air releases >= 1 tonne |

- **Particulate matter thresholds:** PM2.5 0.3 tonnes; PM10 0.5 tonnes; Total PM (TPM) 20 tonnes. A facility can meet
  the threshold for a smaller fraction without meeting it for larger fractions (so PM2.5 may be reported while TPM is
  not).
- **VOCs:** over 100 listed; reported as a total (Part 4) and/or individually (Parts 1, 2) and speciated (Part 5) -
  risk of double counting.
- **Full threshold list:** <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/substances-list/threshold.html>.
- **What is reported:** quantities released (air, surface water, land, and < 1 tonne totals), disposed (on/off-site:
  landfill, land application, underground injection, tailings and waste rock), transferred off-site (treatment,
  recycling, energy recovery, with destination); facility info (location, industry, contacts); pollution prevention
  activities; reasons for changes vs previous years.
- **Not covered:** non-point sources (transportation, agriculture - see the Air Pollutant Emissions Inventory, APEI);
  facilities under thresholds; substances not listed (some covered by the Greenhouse Gas Reporting Program, APEI,
  Black Carbon Emissions Inventory).
- **Facility types:** oil and gas extraction, chemical pulp mills, refineries, mining, metal and chemical
  manufacturing; waste treatment and sewage; electric power, airports, cargo handling, R&D, hospitals; National
  Defence, Correctional Services.
- **Estimation methods (2023 breakdown on slide 12):** E2 published emission factors 46%, O engineering estimates
  22%, M3 source testing 14%, C mass balance 10%, E1 site-specific emission factors 3%, M1 continuous emission
  monitoring 3%, M2 predictive emission monitoring 1%, SP speciation profile 1%, RQ remote quantification 0%. These
  codes appear in the `Estimation_Method` column (e.g. `O - Engineering Estimates`).

## Annual cycle and data quality

- Requirements published every two years in the Canada Gazette; online reporting (ECCC Single Window) opens in March;
  deadline June 1 for the previous calendar year; preliminary data in early July (draft - do not analyse); reviewed
  data and summary products published in December (webinar).
- Report types: Inventory report; Does Not Meet Criteria (DNMC) report (facility reported last year but no longer
  meets criteria); Sale, Closure or Purchase report.
- QC by NPRI staff, ECCC sector experts and industry associations. Common errors: wrong units and decimal errors;
  omitted substances or sources; wrong reference data/assumptions; forgetting the minus sign in coordinates
  (facilities mapped in the wrong place).
- **Interpretation:** substances have been added, modified and deleted over time - always check the history of
  reporting requirements before analysing trends; avoid double counting (TRS example; PM fractions; VOCs).
- Analysis dimensions: geolocation, industry, substance, facility, company, environmental compartment, pollution
  prevention, timeline; contextual data: reasons for change, comments, facility activities.

## Data products (deck slides 30-33)

NPRI Online Query Site (facility lookup); NPRI map layers for Google Earth; MS Excel/CSV tabular data (most common
fields, simplified); MS Excel/CSV bulk data (grouped sets of releases, disposals, transfers since 1993); NPRI Database
(all data for all years, technical users); Power BI Dashboard (2013-2023 data; search by pollutant, facility,
location, sector); Data Highlights; Overview Series (interactive maps by sector/substance); Data Integration Series.
Uses: pollution-prevention priorities, chemicals risk assessment (Chemicals Management Plan) and air-quality
modelling, complementing monitoring programs, encouraging reductions, public understanding and research, annual
international reporting.

## International context

Canada participates in PRTR partnerships: UNECE (Kyiv Protocol), OECD, UNITAR, CEC. Germany's PRTR (thru.de) is the
comparison dataset for the assignment.

## NPRI Academic Challenge (deck slides 36-39)

Students conduct research with NPRI data on topics of common interest to ECCC and students. Past projects: Dalhousie
(2021) mercury exposure in Nova Scotia; Université de Sherbrooke (2020) pulp and paper industry trends; UQAT (2021)
critical and strategic metals releases in Quebec. Western's 11 sector groups and project leads are in
[assessments.md](assessments.md#npri-group-assignment). Contact: NPRI and Substance Information Division, Science
Reporting and Assessment Directorate, Science and Technology Branch, ECCC - https://canada.ca/NPRI.

## Links

| Resource | URL |
|---|---|
| NPRI home | <https://www.canada.ca/en/services/environment/pollution-waste-management/national-pollutant-release-inventory.html> |
| NPRI overview video (ECCC webinar) | <https://www.youtube.com/watch?v=xP4Td5olNvs> - paraphrase: [../transcripts/external/eccc-npri-overview-webinar.md](../transcripts/external/eccc-npri-overview-webinar.md) |
| Instructional videos (Excel single-year tables) | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/instructional-videos.html#excel> - paraphrase: [../transcripts/external/eccc-npri-excel-single-year-tabular-data.md](../transcripts/external/eccc-npri-excel-single-year-tabular-data.md) |
| NPRI map | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/tools-resources-data/npri-map.html> |
| Using and interpreting data | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/using-interpreting-data.html#evolution> |
| Power BI dashboard | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/tools-resources-data/all-year-dashboard.html> |
| Data highlights | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/tools-resources-data/fact-sheet.html> |
| Substance list and thresholds | <https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/substances-list/threshold.html> |
| German PRTR FAQ | <https://thru.de/faq/> |
