## Topic 5 ##

library(tidyverse)
library(janitor)

###~~~~~~~~~~~~~~~~###
#### Load data ####
###~~~~~~~~~~~~~~~~###

## Load station location/information data
pwqmn_stations <- read_csv("PWQMN_Stations.csv") |>
  clean_names() |>  ## Clean up column headers
  mutate(station = as.character(station)) ## Station IDs 
 

## Load 2024 water-quality data
pwqmn_data_2024 <- read_csv("PWQMN_data_2024.csv") |>
  clean_names() |>
  mutate(collection_site = as.character(collection_site))


###~~~~~~~~~~~~~~~~~~~~~~~~###
#### Column and row binds ####
###~~~~~~~~~~~~~~~~~~~~~~~~###

## Row binds ##
## Row binds are useful when datasets contain the same variables

pwqmn_data_2010_2018 <- read_csv("PWQMN-2010_2018.csv") |>
  clean_names() |>
  mutate(station = as.character(station)) 

pwqmn_data_2000_2009 <- read_csv("PWQMN-2000_2009.csv") |>
  clean_names() |>
  mutate(station = as.character(station))

names(pwqmn_data_2010_2018)
names(pwqmn_data_2000_2009)

## Stack the two datasets on top of one another
combined_data <- bind_rows(
  pwqmn_data_2000_2009,
  pwqmn_data_2010_2018
) |> 
  arrange(-year)

###~~~~~~~~~~~~###
#### Joins ####
###~~~~~~~~~~~~###

## LEFT JOIN

## The join below adds station information to each water-quality measurement.
## Many water-quality measurements can come from the same station, but each measurement should match only one station ("many-to-one")

pwqmn_data_2024_joined <- pwqmn_data_2024 |>
  left_join(
    pwqmn_stations,
    by = join_by(collection_site == station), ## here you can specify what the matching columns are
     )

## The warning you receive from the code above indicates that there may be duplicate entries of the stations
# Below, we can identify stations in the dataset that are appearing more than once

duplicate_stations <- pwqmn_stations |>
      count(station) |> # this line counts how many times a station is listed in the dataset
      filter(n > 1)  # this filters for cases when a station is listed more than once

# It looks like there are 10 stations that occur more than once
# To get rid of those extra stations, we can use the distinct function

unique_stations <-pwqmn_stations |>
  distinct(station, .keep_all = TRUE) # distinct keeps only the unqiue stations and the keep all means we keep the rest of the row

pwqmn_data_2024_joined <- pwqmn_data_2024 |>
  left_join(
    unique_stations,
    by = join_by(collection_site == station), ## here you can specify what the matching columns are
     )

## Compare the number of rows before and after the join.
## A many-to-one join should not increase the number of water-quality records.

nrow(pwqmn_data_2024)
nrow(pwqmn_data_2024_joined)
ncol(pwqmn_data_2024)
ncol(pwqmn_data_2024_joined)

## SEMI JOIN
## Keep only water-quality measurements that HAVE a matching station.
## semi_join() is useful for filtering one dataset based on whether
## a matching record exists in another dataset.

pwqmn_data_2024_matched <- pwqmn_data_2024 |>
  semi_join(
    unique_stations,
    by = join_by(collection_site == station)
  )

nrow(pwqmn_data_2024)
nrow(pwqmn_data_2024_matched)


## ANTI JOIN

pwqmn_data_2024_missing <- pwqmn_data_2024 |>
  anti_join(
    unique_stations,
    by = join_by(collection_site == station)
  )


## Examine records without a matching station
pwqmn_data_2024_missing |> 
  distinct(collection_site)



