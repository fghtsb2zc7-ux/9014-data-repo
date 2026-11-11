---
title: "Topic 5: Connecting Data - Joins, merges, and spatial relationships"
source: Brightspace content page
module_path: "Unit 1: Developing Skills in Data Analysis > Course topics and training"
brightspace_url: https://westernu.brightspace.com/d2l/le/content/198357/viewContent/3852264/View
---

# Topic 5: Connecting Data - Joins, merges, and spatial relationships

*Module: Unit 1: Developing Skills in Data Analysis > Course topics and training*

# Topic 5: Connecting Data - Joins, merges, and spatial relationships

---

In this topic, we focus on connecting datasets using shared attributes and spatial relationships. You will learn how to merge tables in Excel using Power Query, combine and bind datasets in R, and use QGIS to connect spatial information across vector and raster layers.  The majority of work for this topic will be in QGIS. You need to download the following data folder:

- [Topic 5.zip](<../sources/files/Topic 5.zip>)

**Open datasets**

- [Provincial Water Quality Monitoring Network (PWQMN)](https://data.ontario.ca/dataset/provincial-stream-water-quality-monitoring-network)  
  The PWQMN is an Ontario-wide monitoring program that collects long-term water-quality data from rivers and streams. The dataset includes monitoring-station locations and measurements of parameters such as nutrients, metals, and chloride, making it useful for exploring how environmental measurements can be linked to spatial sampling locations.
- [Agricultural Resource Inventory (ARI)](https://open.canada.ca/data/en/dataset/1f2ad87e-6103-4ead-bdd5-147c33fa11e6)  
  The Agricultural Resource Inventory is a historical spatial dataset describing agricultural land use systems in southern Ontario. It classifies agricultural areas based on crop patterns and land use, providing a useful spatial layer for examining the agricultural character of the landscape.

### 

### Excel

- [Excel - Merging data](../transcripts/excel/excel-merging-data.md) (4:33)
  - Here, we review how you can use the Power Query tool to merge data from two separate tables

### 

### QGIS

For these videos, we'll be exploring the buckthorn data we collected on Monday.

- [QGIS - Creating a new layer](../transcripts/qgis/qgis-creating-a-new-layer.md) (5:04)
  - How to create a new vector layer (polygon) manually within QGIS
- [QGIS - Reprojecting a vector layer](../transcripts/qgis/qgis-reprojecting-a-vector-layer.md) (4:05)
  - Reprojecting layers to new CRS (e.g., switching to units measured in metres)
- [QGIS - Join attributes by nearest](../transcripts/qgis/qgis-join-attributes-by-nearest.md) (11:04)
  - Measuring distances between two vector layers using join attributes by nearest
- [QGIS - Sample raster values](../transcripts/qgis/qgis-sample-raster-values.md) (5:23)
  - Attach raster values to vector data by pulling pixel data where vectors points overlap
- [QGIS - Exporting attribute table to CSV](../transcripts/qgis/qgis-exporting-attribute-table-to-csv.md) (3:00)
  - Exporting attributes tables to a CSV

For these videos, we are going to look at the Provincial Water Quality Monitoring Network.

- [QGIS - Spatial joins](../transcripts/qgis/qgis-spatial-joins.md)  (8:36)  
  - This video introduces the idea of joining a spatial dataset (e.g., with longitude and latitude) with a dataset that has no spatial information
- [QGIS - Changing column types](../transcripts/qgis/qgis-changing-column-types.md) (1:58)
  - In cases where data types are incorrect (e.g., text when it should be a number) you can change the data type within the field calculator
- [QGIS - Join attributes by location](../transcripts/qgis/qgis-join-attributes-by-location.md) (3:41)  
  - This tool allows the user to take two vector layers (e.g., a point and polygon layer) and pull information from one to another based on the location
- [QGIS - Buffer creation and zonal histograms](../transcripts/qgis/qgis-buffer-creation-and-zonal-histograms.md) (9:39)  
  - In this video, we explore how to make buffers around vector features and then subsequently, how we can use zonal histograms to characterise an underlying raster layer

### Positron (R)

You can download the R script for this section here (download and copy it into the data you downloaded above and then open that folder within Positron):

- [Topic5.R](../sources/files/Topic5.R)
- [R - Row binds and joins2](../transcripts/r-positron/r-row-binds-and-joins2.md)

Sorry everyone, I hadn't realized I was recording music over top of the Row binds video. I have now removed the background music.

We will review this script in class as well.


