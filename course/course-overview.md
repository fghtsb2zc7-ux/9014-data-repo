# ENVRSUST 9014 - course overview (Fall 2026)

Source: `sources/files/ENVRSUST 9014 COURSE OUTLINE 2026.pdf` (16 pages; extracted text) plus module structure from
`manifest.partial.json`. Dates and weights are as stated in the outline; where course pages differ, both are given.

## Essentials

| Item | Value |
|---|---|
| Course | ENVRSUST 9014 - Environmental Data Analysis and Visualization |
| Institution | Western University (Master of Environment and Sustainability, MES; enrolment restricted to MES graduate students) |
| Instructor | Dr. Paul Mensink, North Campus Building 208, paul.mensink@uwo.ca; office hours booked via Microsoft Bookings (link in Brightspace "Office hours booking") |
| Course site | OWL Brightspace, https://westernu.brightspace.com/d2l/home/198357 (org unit 198357) |
| Delivery | In person: hands-on technical work, field activities, project studios, presentations, group work. Partially flipped: pre-class videos and readings, short quiz at the start of class, in-class application |
| Attendance | Mandatory; insufficient attendance may result in failing the course |
| Generative AI | Permitted for learning, coding, troubleshooting, analysis and communication; students verify outputs. Permitted in all exams |

## Course description (summary)

Sourcing, scrutiny and critical evaluation of environmental data; transferable technical skills in data management,
visualization, statistical analysis and interpretation, using real-world datasets. Topics: biodiversity loss,
invasive species, air and water pollution, land-use change, climate change, environmental monitoring. Creativity is
encouraged through an independent StoryMap and presentation.

## Learning outcomes (verbatim list)

By the end of the course, students will be able to:
- Apply interdisciplinary data analysis approaches to investigate complex environmental problems by integrating
  field, statistical, geospatial, and open-source datasets to interpret patterns, evaluate evidence, and communicate
  findings.
- Develop problem-solving, decision-making, and critical analysis skills within the context of working with and
  presenting environmental data.
- Conduct environmental field data collection and integrate field observations with statistical, geospatial, and
  open-source datasets to support environmental assessment and decision-making.

## Structure

- **Unit 1 - Technical skills:** a broad suite of data-analysis skills across platforms, introduced incrementally with
  shared concepts across tools (e.g. joins in Excel and R alongside spatial joins in QGIS). Ends with exams at the end
  of October.
- **Unit 2 - Applied project studio:** Independent Project StoryMap and the NPRI Challenge with Environment and
  Climate Change Canada (ECCC).

## Timetable (from the outline)

| No. | Topic | Class theme | Date |
|---|---|---|---|
| 1 | Topic 1: Loading, Cleaning and Exploring Data | Beneath the Surface: Measuring Animal Abundance in the Ocean | Sept 8 |
| 2 | Topic 2: Transforming and Wrangling Data | Animal Movement Across Seascapes: Tracking Marine Megafauna | Sept 14 |
| 3 | Topic 3: Conditional logic, conditional calculations, and deterministic modelling | Food for Thought: Fisheries data and management in Canada | Sept 15 |
| 4 | Topic 4: Field Data Collection | Biodiversity and Invasive Species Monitoring - field data collection (assigned sections) | Sept 21 |
| 5 | Topic 5: Connecting Data - Joins, merges, and spatial relationships | Troubled Waters: The provincial water quality monitoring network | Sept 28 |
| 6 | Topic 6: Exploratory Data Analysis - Finding Patterns and Trends | Pollution Pathways: Tracking Canada's Environmental Releases | Sept 29 |
| 7 | Topic 7: Statistical Analysis - Testing Relationships and Interpreting Evidence | Forecasting Footprints: Canada's GHG Emissions and Climate Action | Oct 5 |
| 8 | Topic 8: Large-scale Geospatial Analysis - Scaling Patterns Across Landscapes | Landscapes in Motion: Measuring the Cost of Land Use Changes and Habitat Degradation | Oct 6 |
| 9 | Buckthorn Bust! Invasive Species Removal - evidence-based buckthorn intervention (all sections) | | Friday Oct 9 |
| 10 | Core skills technical exam (Day 1), all sections, 9-12 | | Oct 26 |
| 11 | Core skills technical exam (Day 2), all sections, 9-12 | | Oct 27 |
| 12 | Data to Decisions: Communicating Insights from your Data (visual storytelling, knowledge mobilization) | Unit 2 | Nov 9 |
| 13 | Independent Project Workshop (refine scope, data, analysis, visuals; lightning talks) | | Nov 10 |
| 14 | Individual presentations (Day 1), assigned sections | | Nov 23 |
| 15 | Individual presentations (Day 2), assigned sections | | Nov 24 |
| 16 | NPRI Final Presentations to ECCC representatives | | Dec 2 |

Also: elective ArcGIS StoryMaps and dashboards workshop on November 6.

Note: the ECCC NPRI presentation PDF is dated "October 6, 2026", while the Lesson 6 page (Sept 29 in the outline)
says ECCC representatives visit that class.

## Software (outline "Software requirements" + Getting Started page)

| Software | Role (Class 1 slides) | Notes |
|---|---|---|
| Microsoft Excel (desktop, Microsoft 365 via Western account) | Data entry & organization | Install from https://m365.cloud.microsoft/apps (outline says https://portal.office.com/) > "Install apps"; Power Query and PivotTables used heavily; Data Analysis ToolPak added in the intro video |
| R | statistics engine | https://cran.r-project.org/ ; base R (Getting Started page: current version 4.6.1); tidyverse + janitor packages |
| Positron (Posit) | Data manipulation & visualization (code editor for R) | https://positron.posit.co/download.html ; detects R automatically |
| QGIS | Geospatial data analysis & mapping | https://qgis.org/ ; install the Long Term Release (LTR); Mac users update OS and approve the app in security settings; QuickMapServices plugin for basemaps |
| ArcGIS StoryMaps, ArcGIS Field Maps | Communication; field data collection | StoryMaps for the independent project; Field Maps/Survey forms for the buckthorn survey (Class 1 slide 6) |
| Python | possible later use for large-scale geospatial analysis | "no further action" for now |

## Assessments and weights (outline "Methods of Evaluation")

| Assessment | Type | Deadline / date | Weight |
|---|---|---|---|
| Exams (Core Concepts and Technical Skills), open-book, cumulative across Excel, QGIS, R | Individual | October 26 / 27 | 40% |
| Final (independent project) presentation, ~10 min slide deck | Individual | November 23 / 24 | 5% |
| NPRI presentation (virtual, to ECCC mentors, start of class) | Group | December 2 | 5% |
| Independent Project StoryMap | Individual | December 11 (11:59 PM per the StoryMap page) | 30% |
| NPRI assignment report | Group (5-6 students, pre-assigned) | December 16 (outline); polished draft to ECCC December 2 (assignment page) | 20% |

Details: [assessments.md](assessments.md). The outline's table of contents lists "Presentation (5%)" twice (one for
each project).

## Module structure on Brightspace (manifest `modulePath`)

- **Course information and overview**: ENVRSUST 9014 COURSE OUTLINE 2026 (PDF); Zoom (LTI link); Office hours booking.
- **Unit 1: Developing Skills in Data Analysis**: [Videos organized by software](../course-pages/videos-organized-by-software.md);
  [Technical skills checklist](../course-pages/technical-skills-checklist.md)
  - **> Course topics and training**: [Getting Started with Course Software](../course-pages/getting-started-with-course-software.md);
    [The NPRI Dataset](../course-pages/the-npri-dataset.md);
    [Topic 1](../course-pages/topic-1-loading-cleaning-and-exploring-data.md);
    [Topic 2](../course-pages/topic-2-transforming-and-wrangling-data.md);
    [Topic 3](../course-pages/topic-3-conditional-logic-conditional-calculations-and-deterministic-m.md);
    [Topic 5](../course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md);
    [Topic 6](../course-pages/topic-6-exploratory-data-analysis-and-visualization.md);
    [Topic 7](../course-pages/topic-7.md). (No Topic 4 or Topic 8 page exists.)
- **Unit 1 Classes: Core Technical Skills**:
  - Class 1 - Beneath the Surface: [Class 1 Overview](../course-pages/class-1-overview.md)
  - Class 2 - Animals on the Move: [Lesson 2 Overview](../course-pages/lesson-2-overview.md); 02 - Topic 2 (slides PDF)
  - Class 3 - Food for Thought: [Lesson 3 Overview](../course-pages/lesson-3-overview.md); [Marine Sportfish Tagging Programme](../course-pages/marine-sportfish-tagging-programme.md)
  - Class 4 - Biodiversity and Invasive Species Assessment: [Lesson overview](../course-pages/lesson-overview.md); [Pre-class readings](../course-pages/pre-class-readings.md)
  - Class 5 - Troubled Waters: [Lesson 5 overview](../course-pages/lesson-5-overview.md); [Case study #5](../course-pages/case-study-5.md)
  - Class 6 - Pollution Pathways: [Lesson 6 Overview](../course-pages/lesson-6-overview.md)
  - 7 - Forecasting Footprints: [Lesson 7 Overview](../course-pages/lesson-7-overview.md)
  - 8 - Landscapes in Motion: [Case study #8](../course-pages/case-study-8.md)
- **Assessments**:
  - Exams: [Exam Practice](../course-pages/exam-practice.md); [Practice 1 - North Atlantic Right Whale](../course-pages/practice-1-north-atlantic-right-whale.md)
  - Independent Project: [Selecting a project topic and collecting data](../course-pages/selecting-a-project-topic-and-collecting-data.md); [Final Submission - ArcGIS Story Map](../course-pages/final-submission-arcgis-story-map.md)
  - NPRI - Academic Challenge: [NPRI Group Assignment (updated)](../course-pages/npri-group-assignment-updated.md); Western Presentation - EN NPRI 101-201_2024 AP_2 (PDF, see [npri.md](npri.md))

## Related

[classes.md](classes.md) - [assessments.md](assessments.md) - [npri.md](npri.md) - [glossary.md](glossary.md) -
[external-resources.md](external-resources.md) - [../datasets/README.md](../datasets/README.md)
