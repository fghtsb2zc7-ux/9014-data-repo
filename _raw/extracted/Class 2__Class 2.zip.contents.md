# Class 2/Class 2.zip (zip, 8 entries)

| member | bytes |
|---|---|
| Class 2/ | 0 |
| Class 2/data/ | 0 |
| Class 2/data/108916_histos.csv | 108006 |
| Class 2/data/108916_tag.csv | 42527 |
| Class 2/data/gebco_2025_n56.0_s14.0_w-32.0_e-7.4.tif | 119091468 |
| Class 2/data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv | 6323307 |
| Class 2/Topic 2 - Case study.qmd | 207 |
| Class 2/Topic 2.R | 4897 |

## Class 2/data/108916_histos.csv
rows: 1072  columns: 38

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Ptt | int64 | 1072 | 1 | 108916 |
| DepthSensor | float64 | 1072 | 1 | 0.5 |
| Source | object | 1072 | 1 | Argos |
| Instr | object | 1072 | 1 | Mk10 |
| HistType | object | 1072 | 5 | TATLIMITS, TAT, TADLIMITS, TAD |
| Date | object | 1070 | 500 | 2012-07-26 10:00, 2012-07-26 18:00, 2012-07-27 0:00, 2012-07-27 6:00 |
| Time Offset | float64 | 1070 | 22 | 1.0, 2.0, 3.0, 4.0 |
| Count | float64 | 1070 | 7 | 1.0, 2.0, 3.0, 4.0 |
| BadTherm | float64 | 955 | 1 | 0.0 |
| LocationQuality | object | 21 | 4 | GPS, User, 2, 3 |
| Latitude | float64 | 21 | 4 | 55.33885574, 14.73900032, 14.7329998, 14.75747871 |
| Longitude | float64 | 21 | 5 | -7.41380215, -31.75900078, -31.7460022, -31.75900269 |
| NumBins | float64 | 1070 | 3 | 6.0, 8.0, 24.0 |
| Sum | float64 | 955 | 1 | 100.0 |
| Bin1 | float64 | 1072 | 110 | 0.0, 0.3, 36.1, 50.4 |
| Bin2 | float64 | 1072 | 139 | 9.0, 0.0, 100.0, 8.3 |
| Bin3 | float64 | 1072 | 303 | 12.0, 0.0, 20.1, 5.6 |
| Bin4 | float64 | 1072 | 343 | 15.0, 88.6, 74.1, 94.4 |
| Bin5 | float64 | 1072 | 314 | 18.0, 5.7, 5.8, 0.0 |
| Bin6 | object | 1072 | 295 | >18.000000, 5.7, 0, 24.3 |
| Bin7 | float64 | 589 | 153 | 100.0, 0.0, 1.8, 8.5 |
| Bin8 | object | 589 | 224 | >100.000000, 0, 72.9, 83.6 |
| Bin9 | float64 | 115 | 4 | 10.0, 100.0, 0.0, 3.0 |
| Bin10 | float64 | 115 | 4 | 3.0, 10.0, 0.0, 100.0 |
| Bin11 | float64 | 115 | 4 | 3.0, 100.0, 0.0, 10.0 |
| Bin12 | float64 | 115 | 4 | 3.0, 100.0, 0.0, 10.0 |
| Bin13 | float64 | 115 | 4 | 10.0, 100.0, 0.0, 3.0 |
| Bin14 | float64 | 115 | 3 | 10.0, 3.0, 0.0 |
| Bin15 | float64 | 115 | 3 | 10.0, 0.0, 3.0 |
| Bin16 | float64 | 115 | 3 | 10.0, 0.0, 3.0 |
| Bin17 | float64 | 115 | 4 | 3.0, 0.0, 10.0, 100.0 |
| Bin18 | float64 | 115 | 4 | 10.0, 0.0, 3.0, 100.0 |
| Bin19 | float64 | 115 | 4 | 100.0, 3.0, 0.0, 10.0 |
| Bin20 | float64 | 115 | 4 | 100.0, 10.0, 3.0, 0.0 |
| Bin21 | float64 | 115 | 4 | 3.0, 0.0, 10.0, 100.0 |
| Bin22 | float64 | 115 | 4 | 10.0, 0.0, 3.0, 100.0 |
| Bin23 | float64 | 115 | 4 | 10.0, 3.0, 0.0, 100.0 |
| Bin24 | float64 | 115 | 4 | 10.0, 0.0, 3.0, 100.0 |

Numeric summary:
```
              count        mean     std         min         25%         50%         75%         max
Ptt          1072.0  108916.000   0.000  108916.000  108916.000  108916.000  108916.000  108916.000
DepthSensor  1072.0       0.500   0.000       0.500       0.500       0.500       0.500       0.500
Time Offset  1070.0      11.455   5.963       1.000       6.000      12.000      17.000      22.000
Count        1070.0       2.303   1.295       1.000       1.000       2.000       3.000       7.000
BadTherm      955.0       0.000   0.000       0.000       0.000       0.000       0.000       0.000
Latitude       21.0      30.207  20.202      14.733      14.739      14.739      55.339      55.339
Longitude      21.0     -22.488  12.118     -31.812     -31.759     -31.759      -7.414      -7.414
NumBins      1070.0       8.819   5.355       6.000       6.000       8.000       8.000      24.000
Sum           955.0     100.000   0.000     100.000     100.000     100.000     100.000     100.000
Bin1         1072.0       1.972   7.601       0.000       0.000       0.000       0.200      79.400
Bin2         1072.0       3.195  11.361       0.000       0.000       0.000       0.700     100.000
Bin3         1072.0      19.097  31.827       0.000       0.000       0.400      22.500     100.000
Bin4         1072.0      13.449  22.065       0.000       0.000       1.300      16.900     100.000
Bin5         1072.0      11.078  19.523       0.000       0.000       1.900      12.325     100.000
Bin7          589.0       5.910  13.848       0.000       0.000       0.700       5.600     100.000
Bin9          115.0       3.000  16.035       0.000       0.000       0.000       0.000     100.000
Bin10         115.0       2.183  13.184       0.000       0.000       0.000       0.000     100.000
Bin11         115.0       2.861  16.028       0.000       0.000       0.000       0.000     100.000
Bin12         115.0       1.983  13.146       0.000       0.000       0.000       0.000     100.000
Bin13         115.0       1.235   9.441       0.000       0.000       0.000       0.000     100.000
Bin14         115.0       0.530   1.944       0.000       0.000       0.000       0.000      10.000
Bin15         115.0       0.591   2.123       0.000       0.000       0.000       0.000      10.000
Bin16         115.0       0.530   1.944       0.000       0.000       0.000       0.000      10.000
Bin17         115.0       1.235   9.441       0.000       0.000       0.000       0.000     100.000
Bin18         115.0       1.200   9.407       0.000       0.000       0.000       0.000     100.000
Bin19         115.0       1.557   9.477       0.000       0.000       0.000       0.000     100.000
Bin20         115.0       2.626   9.507       0.000       0.000       0.000       3.000     100.000
Bin21         115.0       3.148   9.623       0.000       0.000       3.000       3.000     100.000
Bin22         115.0       4.096  13.107       0.000       0.000       3.000       3.000     100.000
Bin23         115.0       2.357   9.503       0.000       0.000       0.000       3.000     100.000
Bin24         115.0       1.774   9.408       0.000       0.000       0.000       3.000     100.000
```

First 5 rows:
```
      Ptt  DepthSensor Source Instr   HistType              Date  Time Offset  Count  BadTherm LocationQuality   Latitude  Longitude  NumBins    Sum  Bin1  Bin2  Bin3   Bin4  Bin5        Bin6  Bin7 Bin8  Bin9  Bin10  Bin11  Bin12  Bin13  Bin14  Bin15  Bin16  Bin17  Bin18  Bin19  Bin20  Bin21  Bin22  Bin23  Bin24
0  108916          0.5  Argos  Mk10  TATLIMITS               NaN          NaN    NaN       NaN             NaN        NaN        NaN      NaN    NaN   0.0   9.0  12.0   15.0  18.0  >18.000000   NaN  NaN   NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN
1  108916          0.5  Argos  Mk10        TAT  2012-07-26 10:00          1.0    1.0       0.0             GPS  55.338856  -7.413802      6.0  100.0   0.0   0.0   0.0   88.6   5.7         5.7   NaN  NaN   NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN
2  108916          0.5  Argos  Mk10        TAT  2012-07-26 18:00          1.0    2.0       0.0             GPS  55.338856  -7.413802      6.0  100.0   0.0   0.0  20.1   74.1   5.8           0   NaN  NaN   NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN
3  108916          0.5  Argos  Mk10        TAT   2012-07-27 0:00          1.0    2.0       0.0             GPS  55.338856  -7.413802      6.0  100.0   0.0   0.0   5.6   94.4   0.0           0   NaN  NaN   NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN
4  108916          0.5  Argos  Mk10        TAT   2012-07-27 6:00          1.0    3.0       0.0             GPS  55.338856  -7.413802      6.0  100.0   0.0   0.0   0.0  100.0   0.0           0   NaN  NaN   NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN    NaN
```

## Class 2/data/108916_tag.csv
rows: 586  columns: 14

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Ptt | int64 | 586 | 1 | 108916 |
| Date | object | 586 | 578 | 2012-07-26 10:00, 2012-07-26 10:16, 2012-07-26 10:25, 2012-07-26 12:00 |
| Month | int64 | 586 | 6 | 7, 8, 9, 10 |
| Most Likely Latitude | float64 | 586 | 372 | 55.375, 55.4, 55.625, 55.65 |
| Most Likely Longitude | float64 | 586 | 311 | -7.4, -7.625, -7.9, -8.025 |
| Observation Type | object | 305 | 7 | User, Argos-3, Argos-1, Light - Dawn |
| Observed SST | float64 | 110 | 65 | 14.9, 14.8, 13.8, 14.5 |
| Satellite SST | float64 | 110 | 110 | 13.41623073, 13.40999857, 13.1420891, 12.99000486 |
| Observed Depth | float64 | 298 | 26 | 16.0, 80.0, 1.0, 48.0 |
| Bathymetry Depth | float64 | 298 | 133 | 99.0, 161.0, 179.0, 178.0 |
| Observation LL (MSS) | float64 | 0 | 0 |  |
| Observation Score | float64 | 305 | 128 | 69.55855243, 71.11836594, 71.10906648, 0.100000001 |
| Sunrise | object | 140 | 140 | 2012-07-27 4:29, 2012-07-28 4:32, 2012-07-29 4:31, 2012-07-30 4:28 |
| Sunset | object | 140 | 140 | 2012-07-27 20:46, 2012-07-28 20:50, 2012-07-29 20:51, 2012-07-30 20:53 |

Numeric summary:
```
                       count        mean       std         min         25%         50%         75%         max
Ptt                    586.0  108916.000     0.000  108916.000  108916.000  108916.000  108916.000  108916.000
Month                  586.0       9.621     1.390       7.000       8.000      10.000      11.000      12.000
Most Likely Latitude   586.0      37.716    14.316      14.700      21.756      46.162      48.650      58.125
Most Likely Longitude  586.0     -19.805     7.773     -31.725     -28.694     -15.950     -13.806      -7.400
Observed SST           110.0      22.369     3.877      13.800      20.150      23.550      25.800      27.100
Satellite SST          110.0      20.482     4.458      12.798      17.043      18.984      25.623      26.315
Observed Depth         298.0     174.668   202.271       1.000       1.000     112.000     328.000     784.000
Bathymetry Depth       298.0    4242.990  1734.636      99.000    4740.000    4858.000    5249.500    5865.000
Observation LL (MSS)     0.0         NaN       NaN         NaN         NaN         NaN         NaN         NaN
Observation Score      305.0      17.199    29.185       0.100       0.100       0.100      23.110      94.705
```

First 5 rows:
```
      Ptt              Date  Month  Most Likely Latitude  Most Likely Longitude Observation Type  Observed SST  Satellite SST  Observed Depth  Bathymetry Depth  Observation LL (MSS)  Observation Score          Sunrise            Sunset
0  108916  2012-07-26 10:00      7                55.375                 -7.400             User           NaN            NaN             NaN               NaN                   NaN          69.558552              NaN               NaN
1  108916  2012-07-26 10:16      7                55.375                 -7.400          Argos-3           NaN            NaN             NaN               NaN                   NaN          71.118366              NaN               NaN
2  108916  2012-07-26 10:25      7                55.375                 -7.400          Argos-1           NaN            NaN             NaN               NaN                   NaN          71.109066              NaN               NaN
3  108916  2012-07-26 12:00      7                55.400                 -7.625              NaN           NaN            NaN             NaN               NaN                   NaN                NaN              NaN               NaN
4  108916   2012-07-27 0:00      7                55.625                 -7.900              NaN           NaN            NaN             NaN               NaN                   NaN                NaN  2012-07-27 4:29  2012-07-27 20:46
```

## Class 2/data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv
rows: 47086  columns: 15

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| OBJECTID_1 | int64 | 47086 | 47086 | 1, 1075, 13561, 13990 |
| Tag Event ID | object | 47086 | 47086 | MSFTag_000001, MSFTag_001077, MSFTag_013586, MSFTag_014015 |
| TagType Num | object | 47086 | 47086 | D000001, J000013, J015757, J016262 |
| Tag Type | object | 47086 | 5 | D, J, P, R |
| Common Name | object | 47086 | 22 | Blue shark, Tope, Thornback ray, Porbeagle shark |
| Species Code | object | 47082 | 21 | PGB, GGT, THR, LNP |
| Latin name | object | 47086 | 22 | Prionace glauca, Galeorhinus galeus, Raja clavata, Lamna nasus |
| Tag Date | object | 46586 | 5455 | 1971-09-15 0:00, 1971-09-06 0:00, 1995-08-30 0:00, 1994-08-31 0:00 |
| Tag Year | int64 | 47086 | 50 | 1971, 1995, 1994, 1980 |
| Tagger ID | object | 47086 | 389 | MSFTagger_Unknown, MSFTagger_0155, MSFTagger_0382, MSFTagger_0225 |
| ICES Statistical SubRectangles | object | 47086 | 228 | 37D98, 32E24, 32E16, 39E31 |
| Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view | float64 | 47086 | 14 | -10.5, -7.5, -8.5, -6.5 |
| Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view | float64 | 47086 | 20 | 54.25, 51.75, 55.25, 52.25 |
| Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view | float64 | 47086 | 30 | -10.16666667, -7.5, -8.5, -6.833333333 |
| Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view | float64 | 47086 | 47 | 54.25, 51.91666667, 51.58333333, 55.41666667 |

Numeric summary:
```
                                                                                count       mean        std      min        25%        50%        75%        max
OBJECTID_1                                                                    47086.0  23552.553  13601.423     1.00  11775.250  23546.500  35340.750  47112.000
Tag Year                                                                      47086.0   1996.110     11.502  1970.00   1988.000   1996.000   2005.000   2019.000
Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.stat_x  47086.0     -8.665      1.420   -13.50     -9.500     -8.500     -8.500      1.500
Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.stat_y  47086.0     52.449      1.850    36.75     51.750     52.250     53.250     58.250
Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.sub_x   47086.0     -8.702      1.434   -13.50     -9.833     -8.833     -8.167      1.833
Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.sub_y   47086.0     52.435      1.846    36.75     51.583     52.250     53.250     58.417
```

First 5 rows:
```
   OBJECTID_1   Tag Event ID TagType Num Tag Type    Common Name Species Code          Latin name         Tag Date  Tag Year          Tagger ID ICES Statistical SubRectangles  Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.stat_x  Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.stat_y  Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.sub_x  Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.sub_y
0           1  MSFTag_000001     D000001        D     Blue shark          PGB     Prionace glauca  1971-09-15 0:00      1971  MSFTagger_Unknown                          37D98                                                                         -10.5                                                                         54.25                                                                   -10.166667                                                                        54.25
1        1075  MSFTag_001077     J000013        J           Tope          GGT  Galeorhinus galeus  1971-09-06 0:00      1971     MSFTagger_0155                          37D98                                                                         -10.5                                                                         54.25                                                                   -10.166667                                                                        54.25
2       13561  MSFTag_013586     J015757        J     Blue shark          PGB     Prionace glauca  1995-08-30 0:00      1995     MSFTagger_0382                          37D98                                                                         -10.5                                                                         54.25                                                                   -10.166667                                                                        54.25
3       13990  MSFTag_014015     J016262        J     Blue shark          PGB     Prionace glauca  1994-08-31 0:00      1994     MSFTagger_0382                          37D98                                                                         -10.5                                                                         54.25                                                                   -10.166667                                                                        54.25
4       33478  MSFTag_033538    P000047a        P  Thornback ray          THR        Raja clavata  1980-09-02 0:00      1980     MSFTagger_0155                          37D98                                                                         -10.5                                                                         54.25                                                                   -10.166667                                                                        54.25
```

## Class 2/Topic 2 - Case study.qmd
```
---
title: "Case study 2 - Marine Sportfishing Tagging Program"
format: docx
---







To finalize your submission, copy the following into the powershell terminal:quarto render "Topic 2 - Case study.qmd"


```

## Class 2/Topic 2.R
```
library(tidyverse)
library(janitor)

# Ensure you are sitting in the root folder for the lesson

## Load in the location dataset
location_data <- read_csv("data/108916_tag.csv") |> 
    mutate(date_time = ymd_hm(Date)) |>   # Convert the Date column into a date-time format that R can understand
    mutate(month = month(date_time, label = TRUE)) # Extract the month from the date-time column, label = TRUE returns month names/abbreviations instead of numbers

## Make a quick assessment of the data
glimpse(location_data)

# R can natively identify and plot datetime objects within ggplot
ggplot(data = location_data, aes(x = date_time, y = `Most Likely Latitude`))+
  geom_line()


# The histograms dataset has summarized data in the file
# Load in the temperature histogram dataset and rename the temperature bin columns

tag_data <- read_csv("data/108916_histos.csv") |>   
    rename(
    `Greater than 18 C` = Bin6, 
    `Between 15-18 C` = Bin5,
    `Between 12-15 C` = Bin4,
    `Between 9-12 C` = Bin3,
    `Less than 9 C` = Bin2
  )

glimpse(tag_data)

#~~~~~~~~~~~~~~~~~~~~~~~~~#
##### Basic filtering #####
#~~~~~~~~~~~~~~~~~~~~~~~~~#

## The unique function shows the different values found in a column
unique(tag_data$HistType)

## Create a new dataset that keeps only rows where HistType is TAT
filtered_tag_data <- tag_data |> 
  filter(HistType == "TAT") # The double equals sign == means "is equal to"


## Exclude TAT data from the dataset
filtered_tag_data <- tag_data |> 
  filter(HistType != "TAT") # The exclamation mark means "does not equal"


## Include multiple histogram types
filtered_tag_data <- tag_data |> 
  filter(HistType %in% c("TAT", "TATLIMITS")) # %in% means "is one of these values"

## Remove multiple histogram types
filtered_tag_data <- tag_data |> 
  filter(!HistType %in% c("TAT", "TATLIMITS")) 
# The ! reverses the condition, so this keeps rows that are NOT in the list

## Combined filters
filtered_tag_data <- tag_data |>
   mutate(`Greater than 18 C` = as.numeric(`Greater than 18 C`)) |>    # Make sure this column is numeric before comparing it to a number
   filter(HistType == "TAT" & `Greater than 18 C` > 5)  # Keep rows where HistType is TAT AND percent time above 18 C is greater than 5


#~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#### Pivot data within R ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~#

## Check the column names before selecting or pivoting
names(filtered_tag_data)

filtered_tag_data_long <- filtered_tag_data |> 
  select(-(21:38)) |>  # This can be useful when there are extra columns we do not need for this activity
  pivot_longer(
    cols = c(
      "Less than 9 C", 
      "Between 9-12 C",  
      "Between 12-15 C", 
      "Between 15-18 C", 
      "Greater than 18 C"
    ), 
    names_to = "Temperature range", 
    values_to = "Percent time"
  )  

filtered_tag_data_wide <- filtered_tag_data_long |> 
  pivot_wider(
    names_from = "Temperature range", 
    values_from = "Percent time"
  ) # Convert the data back from long format to wide format, This recreates one column for each temperature range


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
#### Mutate, Group_by and Summarize ####
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##

# Date and time formatting, grouping, and summarizing

grouped_tag_data <- filtered_tag_data_long |> 
  
  # Convert the Date column into a date-time format
  mutate(date_time = ymd_hm(Date)) |> 
  
  # Extract month as a labelled month variable
  mutate(month = month(date_time, label = TRUE)) |> 
  
  # Group the data by temperature range
  group_by(`Temperature range`) |> 
  
  # Calculate the average percent time spent in each temperature range
  summarize(
    average_time = mean(`Percent time`, na.rm = TRUE)
  )


## Create a basic plot
ggplot(data = grouped_tag_data, aes(x = `Temperature range`, y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip()


## Manipulating factors

grouped_tag_data <- grouped_tag_data |> 
  
  # Convert Temperature range into an ordered factor
  # This controls the order of categories in tables and plots
  mutate(
    `Temperature range` = factor(
      `Temperature range`,
      levels = c(
        "Less than 9 C",
        "Between 9-12 C",
        "Between 12-15 C",
        "Between 15-18 C",
        "Greater than 18 C"
      )
    )
  )


## Plot again after setting the factor order
ggplot(data = grouped_tag_data, aes(x = `Temperature range`, y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip() +
  labs(y = "Percent of time")+
  theme_bw()

## Plot by percent of time 
ggplot(data = grouped_tag_data, aes(x = reorder(`Temperature range`, average_time), y = average_time)) +
  geom_col() +
  theme_bw() +
  coord_flip() +
  labs(y = "Percent of time")+
  theme_bw()

```