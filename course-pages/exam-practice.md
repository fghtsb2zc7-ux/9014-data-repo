---
title: "Exam Practice"
source: Brightspace content page
module_path: "Assessments > Exams"
brightspace_url: https://westernu.brightspace.com/d2l/le/content/198357/viewContent/3988369/View
---

# Exam Practice

*Module: Assessments > Exams*

# Exam practice

---

## Practice set #1: North Atlantic Right Whale

You will need the following datasets:

- [OBIS - North Atlantic Right Whale reduced.csv](<../sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv>)
- [Vessel\_Traffic\_Routes.zip](<../sources/files/Practice sets/Vessel_Traffic_Routes.zip>)

The worksheet can be found here: [Practice 1 - North Atlantic Right Whale](https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=content&rcode=C82AC29D-7A23-40FB-8DD0-9B05C3A6D177-3548136)

##### **Practice Exam Question**

- [grand\_manan.png](<../sources/files/Practice Questions/grand_mana.png>)
- [ferry.png](<../sources/files/Practice Questions/ferry.png>)

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

---

## Practice Set #2 - Crab counts

Datasets:

- [Information\_stations.csv](<../sources/files/Practice sets/Practice set %232/Information_stations.csv>)
  - Contains information on all of the stations and tows, including the distance that each tow was run for (dist)
- [Nombre\_crabe\_crab\_number.csv](<../sources/files/Practice sets/Practice set %232/Nombre_crabe_crab_number.csv>)
  - Numbers of crabs (n\_tot) for each tow is listed in every row with stations (st) and  years (an); however, the length of the tow is not accounted for in the total number of crabs counted, so tows that run for longer distances could have more crabs because they covered a greater area. This needs to be fixed!

#### Practice Exam question

Please recreate the following figure using R:

[crab\_counts.png](<../sources/files/Practice sets/Practice set %232/crab_counts.png>)

**Note**: For any left\_joins required for this question you do not need to explicitly write which columns you want the data to be joined by as we have previously done in our join examples ("by = join\_by(collection\_site == station"). You can simply tell it which datasets you want to be joined and it will attach the columns by default. Example below on how you can join two datasets without specifying the join columns (pwqmn\_data\_2024 and unique\_stations).

```
pwqmn_data_2024_joined  <- pwqmn_data_2024 |>
       left_join(unique_stations)
```

---

### Practice R Exam - Human wildlife incidents

Three practice questions in R around human-wildlife conflict data.

[ENVRSUST 9014 R Practice Exam.pdf](<../sources/files/Practice Questions/ENVRSUST 9014 R Practice Exam.pdf>)  

- [pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv](<../sources/files/Practice Questions/pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv>)
- [pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv](<../sources/files/Practice Questions/pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv>)

---

## Full Practice Exam

I've added a full practice exam exploring emissions of particulate matter!

- I've uploaded an updated copy below with a correction to question 2
- [ENVRSUST 9014 - Practice Exam - Particulate Matter 2026 updated.pdf](<../sources/files/ENVRSUST 9014 - Practice Exam - Particulate Matter 2026 updated.pdf>)

Here are the datasets:

- [TPM practice exam.zip](<../sources/files/TPM practice exam.zip>)


