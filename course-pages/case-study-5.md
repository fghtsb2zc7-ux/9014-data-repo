---
title: "Case study #5"
source: Brightspace content page
module_path: "Unit 1 Classes: Core Technical Skills > Class 5 - Troubled Waters: A History of Pollution in Canadian Waterways"
brightspace_url: https://westernu.brightspace.com/d2l/le/content/198357/viewContent/3978308/View
---

# Case study #5

*Module: Unit 1 Classes: Core Technical Skills > Class 5 - Troubled Waters: A History of Pollution in Canadian Waterways*

# Troubled Waters:  A History of Pollution in Canadian Waterways

---

### 

### **Sulphate wet deposition**

In this section, you will explore the distribution and characteristics of power-generating facilities and then add information from a spatial dataset describing atmospheric sulfate (xSO4) deposition.

- [SO4 wet deposition](https://ouvert.canada.ca/data/dataset/14384cc5-5f57-4878-ad9e-79a965bb49a2) - We will be adding the ESRI rest files associated with SO4 deposition to look at the occurrence of acid rain.
  - Here is the ESRI Rest link from the website above that will provide raster files for SO4 deposition - [DMS/depot\_xSO4\_5YA\_deposition (MapServer)](https://maps-cartes.ec.gc.ca/arcgis/rest/services/DMS/depot_xSO4_5YA_deposition/MapServer)
- [Power\_Plants.csv](<../sources/files/04 - Lesson 4/Pre-class work/Power_Plants.csv>)
  - This dataset provides information about

First, I want you to explore the power plants dataset and take a look at the following questions.

- How many of each power plant are there?
- How many megawatts are contributed by each power plant type?

### **Provincial Water Quality Monitoring Network**

Your goal for today is to conduct an exploratory data analysis on the PWQMN. You will exploring the following releases to water (Water Releases - Total). 

- Phosphorus (total)
  - Phosphates are primarily responsible for eutrophication
- Chloride (CHLORIDE,  UNFIL.REAC)
  - Chloride is released from road salts in the winter and has a number of adverse consequences for aquatic ecosystems.

**Datasets**

- [Provincial water quality monitoring network](https://data.ontario.ca/dataset/provincial-stream-water-quality-monitoring-network)
  - Link the Provincial Water Quality Monitoring Network. Access the data you'll need. Work to get the data you want to work with.
  - Take a collection of measurements from the PWQMN over time
    - Data 2025
    - Data 2019 - March 2021
    - Data 2000-2009
- [Conservation Authority Administrative Areas](<../sources/files/04 - Lesson 4/Pre-class work/caadmin.zip>)
  - As conservation authorities help monitor and manage water quality, it would be helpful to assess water quality at the authority level boundaries
- [Ontario Roads Network](https://geo.scholarsportal.info/#r/details/_uri@=3872254028&_add:true_nozoom:true)
  - This dataset is useful when you are exploring the  chloride concentrations as road salt is the main cause of increased chloride concentrations
  - When using this dataset, which is very large, you should do something called creating a spatial index. To do so, just go to the geoprocessing toolbox and search for Create Spatial Index
  - You can use the Sum line lengths in the processing toolbox to calculate the total number of roads within a buffer zone
- [Ontario Watershed Boundaries (OWB) | Ontario GeoHub](https://geohub.lio.gov.on.ca/maps/mnrf::ontario-watershed-boundaries-owb/about)
  - You can download different watershed boundaries here to show determine the water quality of each watershed

##### Characterizing the network

Begin by characterizing the Provincial Water Quality Monitoring Network as a whole. Your goal is to understand how the program is structured, where monitoring occurs, and how sampling effort is distributed.

Use the available PWQMN datasets to build a clear picture of the monitoring program and the potential gaps in the dataset.

- How many monitoring stations are represented in the dataset?
- How is sampling distributed among stations (e.g., are some stations sampled much more frequently than others?)
- How has monitoring effort changed through time?
- What water-quality parameters are measured most frequently?
- Where are monitoring stations located, and are there obvious geographic concentrations or gaps?

##### Phosphates and chloride

Phosphates are released into the water from agricultural run-off and wastewater. Chloride occurs naturally in freshwater, but concentrations can also be influenced by human activities, including the use of road salt. Use the PWQMN data to investigate patterns in phosphate and chloride concentrations across the monitoring network.

- How are phosphate/chloride concentrations distributed across the dataset?
- Do concentrations differ substantially among monitoring stations?
- How have phosphate/chloride concentrations changed through time?
- Are there seasonal patterns in phosphate/chloride concentrations?
- Are there particular stations or periods with unusually high concentrations?
- Are the patterns you observe consistent across the monitoring network, or are they concentrated in particular locations?
- How far is each monitoring station from the nearest major road or agricultural area?
- Are stations with relatively high phosphate/chloride concentrations located closer to roads or agricultural sites ?


