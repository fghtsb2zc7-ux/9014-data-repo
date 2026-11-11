---
title: "NPRI Group Assignment (updated)"
source: Brightspace content page
module_path: "Assessments > NPRI - Academic Challenge"
brightspace_url: https://westernu.brightspace.com/d2l/le/content/198357/viewContent/3841340/View
---

# NPRI Group Assignment (updated)

*Module: Assessments > NPRI - Academic Challenge*

![Database – all data for all years](https://catalogue.ec.gc.ca/geonetwork/srv/api/records/4f2f1fdd-13f9-4946-8c00-04df9e65b112/attachments/NPRI_Infographic_E.png)

# National Pollutant Release Inventory  Report

---

## Background

Our class will be collaborating with Environment and Climate Change Canada on data analysis for the National Pollutant Release Inventory (NPRI).  ECCC has provided us with some key target areas they would like more information on and you and your team will be conducting an exploratory data analysis using the NPRI dataset.

#### Topics

German data now available - [Releases\_Germany\_2007\_2024.xlsx](../sources/files/Releases_Germany_2007_2024.xlsx)

|  |  |  |  |
| --- | --- | --- | --- |
| **Group** | **Sector** | **NACE Codes** | **NAICS Codes** |
| 1 | Natural Resource Extraction (except coal) | 06 - Extraction of crude petroleum and natural gas  07 - Mining of metal ores  08 - Other mining and quarrying  09 - Mining support service activities | 21 (other than 2121) |
| 2 | Coal and lignite mining | 05 - Mining of coal and lignite | 2121 |
| 3 | Electricity Generation | 35.11 - Electricity generation | 2211 |
| 4 | Automotive & Transportation Manufacturing | 29 – auto manufacturing | 336 |
| 5 | Paper manufacturing | 17 – Paper manufacturing | 322 |
| 6 | Wood product manufacturing | 16 – Wood product manufacturing | 321 |
| 7 | Petroleum processing | 19 – Petroleum processing | 324 |
| 8 | Chemical manufacturing | 20 – Chemical manufacturing | 325 |
| 9 | Metal Production & Processing | 24 – Metal manufacturing | 331 |
| 10 | Waste Management | 38 – Waste Management | 5622 |
| 11 | Waste Water Treatment | 37 -Wastewater disposal | 2213 |

## Project objectives

How comparable are the Canadian and German reporting datasets, and what can they tell us about differences in reported industrial releases to air?

Your project has two sections. First, assess the comparability of the reporting systems across releases to air and disposals or waste transfers (this is what Carlos was stressing in his presentation). Then use that assessment to prepare a comparable air-release dataset and investigate differences between countries and industrial sectors.

## Section 1: Assess dataset comparability

Compare the Canadian National Pollutant Release Inventory (NPRI) and German pollutant release and transfer data. Your assessment should consider both releases to air and disposals or waste transfers, using the categories available in each reporting system.

Develop a comparison addressing the following:

- How do reporting thresholds and requirements vary by substance, activity, or reporting category? Which facilities or quantities might be excluded?
- The German data includes threshold data in the CSV. You can find Canadian threshold data here -

  [Canadian NPRI substance list and thresholds](https://www.canada.ca/en/environment-climate-change/services/national-pollutant-release-inventory/substances-list/threshold.html)
- How many substances or substance groups are covered by each program? Where is their overlap between the two programs?
- How are the reporting methodologies reported (e.g.,  measured, calculated, or estimated in the German data) and how does this differ between the programs?
- What units are used and what conversions would be necessary? Are there some substances that cannot be converted?
- Do the datasets cover matching periods and equivalent industrial activities? Briefly consider whether the NACE and NAICS categories in the sector table describe comparable activities.

Explain which comparisons are defensible, which require standardization, and which cannot be made reliably. Support your assessment with reporting documentation and examples from the datasets.

## Section 2: Build and analyse a comparable air-release dataset

Use your assessment to construct a combined dataset for comparing releases to air from your selected industrial sectors in Canada and Germany.

Document your decisions about:

- The years, sectors, and substances retained.
- How substance names and sector classifications were matched.
- Unit conversions and other transformations.
- How reporting thresholds, missing values, and unmatched records were handled.
- Any remaining differences that standardization cannot resolve.

Use the combined dataset to investigate how reported air releases vary between countries and sectors. Present clear summaries and well-chosen visualizations, and explain the main patterns.

## Assignment format

As a group, prepare a report that explains your comparability assessment, dataset preparation, analysis, and conclusions. Use tables, figures, and maps where they help support your findings.

Your report should include:

- A table of contents.
- A short executive summary for each section (250 words each).
- A short introduction to the sector in section 1 (300 words max)
- A table and supporting discussion for Section 1.
- Relevant visualizations and maps for both sections in the report.
- References

Submit your standardized air-release dataset alongside the report.

Please keep your report between 30-40 pages maximum. Groups with three students may have shorter reports.

### Past collaborations from other institutions

Below, you can find examples of past projects. Please note that these examples are provided simply to illustrate the types of reports previously submitted to the program and are not necessarily intended as models of exemplary project work.

- [Bisphenol A and Bis(2-ethylhexyl) Adipate releases from different facilities across Canada](https://www.canada.ca/content/dam/eccc/documents/pdf/npri-/NPRI%20Project%20Final%20Report%20-%20Diego%2c%20Reema%2c%20Jean.pdf)
- [Analysis of Biphenyl and Bis(2-ethylhexyl) phthalate releases and exposure in diverse water bodies in Canada](https://www.canada.ca/content/dam/eccc/documents/pdf/npri-/Analysis%20of%20Biphenyl%20and%20Bis(2-ethylhexyl)%20phthalate%20releases%20and%20exposure%20in%20diverse%20water%20bodies%20in%20Canada.pdf)

## Dates and deadlines

- Polished draft to ECCC for review  -  December 2nd, 2026, [Submission portal for assignment](https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=dropbox&rcode=C82AC29D-7A23-40FB-8DD0-9B05C3A6D177-2917517)
- Virtual presentations to ECCC mentors - December 2nd, 2026 (in class)
- When feedback has been received from your ECCC mentor, you will have a set period of time to complete updates to the document before final submission. This will form part of your grade for the assignment.

As part of this project, I would like you to complete the MES Team Charter Template linked below and upload it to Brightspace.

- [MES Team Charter Template .docx](<../sources/files/MES Team Charter Template .docx>)

```
library(tidyverse)
npri_data <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") 
npri_data$split <- substring(npri_data$`NAICS / Code_SCIAN`,1, 4)
```


