# Combined original lesson scripts
# Topic 1 Quarto prose is presented as R comments.

# TOPIC 1: Original Quarto lesson
# ----------------------------------------------------------------------------

# ## Overview

# In this session, we will work with data from the National Pollutant Release Inventory. We will load a large environmental dataset into R, clean the column names, select variables of interest, filter the data, summarize releases by province and year, and create some simple visualizations.

# ## Install packages

# Packages add tools to R. You only need to install a package once on your computer. After that, you can load it whenever you need it.

#| eval: false

# install.packages("tidyverse")
# install.packages("janitor")


# ## Load packages

# At the start of each R session, we need to load the packages we want to use. The `tidyverse` package includes tools for working with data and making plots. The `janitor` package includes tools for cleaning messy datasets.

library(tidyverse) # tools for data manipulation and visualization
library(janitor)   # tools for cleaning messy datasets


# ## Check working directory

# The working directory is the folder where R is currently looking for files. This is useful to check before loading data.

getwd() #Check working directory


# ## Load the data

# We will load the NPRI releases dataset using `read_csv()`. We will also use `clean_names()` to make the column names easier to work with in R.

## Load without cleaning names 
npri_releases <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") 

## Load and clean names (janitor package)
npri_releases <- read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv") |> 
  clean_names()


# ## Inspect the dataset

# Before working with the data, it is important to inspect it. The `glimpse()` function gives a quick overview of the dataset, including the column names, data types, and example values.

glimpse(npri_releases)


# The `names()` function shows all column names in the dataset.

names(npri_releases)


# ## Select and filter the data

# The full NPRI dataset contains many years, substances, and variables. For this activity, we will create a smaller dataset focused on Total particulate matter releases from 2015 onward.

# The pipe symbol, `|>`, allows us to build a workflow one step at a time.

npri_tpm <- npri_releases |>
  select(npri_id_no_inrp,
         reporting_year_annee,
         substance_name_english_nom_de_substance_anglais,
         province,
         quantity_quantite) |>
  filter(reporting_year_annee >= 2015,
         substance_name_english_nom_de_substance_anglais == "Total particulate matter") |>
  rename(quantity = quantity_quantite,
    year = reporting_year_annee,
    substance = substance_name_english_nom_de_substance_anglais)


# ## Inspect the filtered data

# Now that we have created a smaller dataset, we can inspect it again.

glimpse(npri_tpm)


# head() shows the first six rows by default. 

head(npri_tpm)


# ## Summarize data

# Next, we will calculate the total quantity of Total particulate matter released in each province for each year. The `group_by()` function defines the groups, and `summarize()` calculates a summary value for each group.

province_tpm <- npri_tpm |>
  group_by(year, province) |>
  summarize(sum_tpm = sum(quantity, na.rm = TRUE)) |>
  filter(complete.cases(province)) ## removes any missing data from the province column. 


# We can also change the function we want to summarize by. 
province_tpm_max <- npri_tpm |>
  group_by(year, province) |>
  summarize(max_tpm = max(quantity, na.rm = TRUE)) |>
  filter(complete.cases(province)) ## removes any missing data from the province column. 


# Or count the number of records for each year and province. 

province_tpm_count <- npri_tpm |>
  group_by(year, province) |>
  summarize(count = n()) |>
  filter(complete.cases(province)) ## removes any missing data from the province column. 



# ## Inspect the summarized data

glimpse(province_tpm)


head(province_tpm)


# ## Visualize releases over time

# We will now create a plot showing Total particulate matter releases by province over time.

ggplot(data = province_tpm, aes(x = year, y = sum_tpm, colour = province)) +
  geom_point() +
  geom_line() +
  theme_bw() +
  facet_wrap(~ province) +
  labs(x = "Year",
    y = "Total TPM",
    title = "Total particulate matter releases in Canada from 2015 onward",
    colour = "Province")



# ## Save the figure

# The `ggsave()` function saves the most recent plot as an image file.

ggsave("province_tpm_plot.png", width = 15, height = 10, units = "cm")


# ## Save the summarized data

# We can also save the summarized dataset as a new CSV file. This file could be opened later in Excel, QGIS, or another analysis tool. This can be a nice way to transfer data between R and Excel and QGIS.

write_csv(province_tpm, "province_tpm.csv")

# TOPIC 2: Original R script
# ----------------------------------------------------------------------------
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
  
  # Set Temperature range factor levels in temperature order
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

# TOPIC 5: Original in-class R script
# ----------------------------------------------------------------------------
library(tidyverse)
library(janitor)

buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names()

glimpse(buckthorn_data)

ggplot(data = buckthorn_data, aes(x = canopy_cover, y = buckthorn_percent))+
  geom_point(colour = "pink")+
  geom_smooth()+
  labs(x = "Canopy cover (%)", y = "Buckthorn cover (%)")+
  theme_bw()

ggplot(data = buckthorn_data, aes(x = elevation1, y = buckthorn_percent))+
  geom_point(colour = "pink")+
  geom_smooth()+
  labs(x = "Elevation", y = "Buckthorn cover (%)")+
  theme_bw()


buckthorn_reduced <- buckthorn_data |> 
  select(buckthorn_percent, bare_soil_percent, non_buckthorn_vegetation_percent) |>
  pivot_longer(cols = c(buckthorn_percent, bare_soil_percent, non_buckthorn_vegetation_percent),
    names_to = "Cover type", 
    values_to = "Percent")

summarized_data <- buckthorn_reduced |> 
  group_by(`Cover type`) |> 
  summarize(average = mean(Percent, na.rm = TRUE)) 

ggplot(data = summarized_data, aes(x = reorder(`Cover type`, -average), y = average))+
  geom_col()+
  labs(x = "Cover type", y = "Average cover (%)")

# TOPIC 5: PWQMN row binds and joins — supplied additional script
# ----------------------------------------------------------------------------
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
    by = join_by(collection_site == station)
  )

## The warning you receive from the code above indicates that there may be duplicate entries of the stations
# Below, we can identify stations in the dataset that are appearing more than once
duplicate_stations <- pwqmn_stations |>
  count(station) |> # this line counts how many times a station is listed in the dataset
  filter(n > 1)  # this filters for cases when a station is listed more than once

# It looks like there are 10 stations that occur more than once
# To get rid of those extra stations, we can use the distinct function
unique_stations <- pwqmn_stations |>
  distinct(station, .keep_all = TRUE) # distinct keeps only the unique stations and the keep all means we keep the rest of the row

pwqmn_data_2024_joined <- pwqmn_data_2024 |>
  left_join(
    unique_stations,
    by = join_by(collection_site == station)
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


# TOPIC 7: Original R script
# ----------------------------------------------------------------------------
library(tidyverse)
library(janitor)

## Load data into R 
buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names() |> ## Load in the buckthorn data and clean the column headers 
  mutate(buckthorn_present = ifelse(buckthorn_percent > 0, "Yes", "No")) |> #Create a new column that identifies if a plot has buckthorn (yes) or does not have buckthorn (no)
  mutate(reproduction_present = ifelse(reproducing_buckthorn == TRUE, 1, 0))  #Create a new column that identifies if a plot has buckthorn (yes) or does not have buckthorn (no)  mutate(total_cover = buckthorn_percent + bare_soil_percent + non_buckthorn_vegetation_percent) |> ## Create a column that sums the buckthorn, bare soil and vegetation percentage 

#############################################################################################################

# Filter practice #

## Create one dataset that has section one and another that has section two


## Create a separate dataset (that is different from the main data), where you filter for just Buckstreet boys and Love islanders team data. 


############################################################################################################


## Create a histogram of the buckthorn percentage with each section having its own colour (fill) and individual plot (hint: you can do this with one ggplot call)
ggplot(buckthorn_data, aes(x = buckthorn_percent, fill = section))+
  geom_histogram()+
  facet_wrap(~section)

## Add proper labels to the plot above

## Create a point plot that shows canopy cover against buckthorn percentage. Make sure you update the axis labels. 
ggplot(buckthorn_data, aes(x = canopy_cover, y = buckthorn_percent))+
  geom_point()+
  geom_smooth(method = "lm") #### You can add a line to your point plot by using geom_smooth(method = "lm")

### Linear regression #################################################################

## Run a linear regression between canopy cover (x) and buckthorn % (y)
linear_regression <- lm(buckthorn_percent~canopy_cover, data = buckthorn_data)
summary(linear_regression)

## What are the results of the regression (is there a significant relationship)? 

# In the regression summary, the slope p-value is in the canopy_cover row.
# Compare that p-value with the significance threshold to interpret the result.

## Create a boxplot to show the differences between each section
ggplot(buckthorn_data, aes(x = section, y = buckthorn_percent, fill = section))+
  geom_boxplot()

## Create a summary table showing the mean % of buckthorn found in each section
buckthorn_summary <- buckthorn_data |> 
  group_by(section) |> 
  summarize(mean_buckthorn = mean(buckthorn_percent))

compare_sections <- lm(buckthorn_percent~section, data = buckthorn_data)
summary(compare_sections)
hist(residuals(linear_regression))

compare_sections <- lm(buckthorn_percent~section+distance, data = buckthorn_data)
summary(compare_sections)

compare_sections_int <- lm(buckthorn_percent~section*distance, data = buckthorn_data)
summary(compare_sections_int)

ggplot(buckthorn_data, aes(x = distance, y = buckthorn_percent, colour = section)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  facet_wrap(~section)+
  labs(
    x = "Distance",
    y = "Buckthorn cover (%)",
    colour = "Section"
  ) +
  theme_bw()

################################################################################





########################################################################################

## Create a summary table showing mean sapling and adult percentages for each section.
buckthorn_summary_demographic <- buckthorn_data |> 
  group_by(section) |>
  summarize(sapling = mean(sapling_percent), adult = mean(adult_percent))


## Select identifiers and the sapling/adult columns, then pivot longer.

life_stages <- buckthorn_data |> 
  select(section, quadrat_id, group_members, sapling_percent, adult_percent) |> 
  pivot_longer(cols = 4:5, names_to = "life_stage", values_to = "percent") |>
  mutate(quadrat_id = as.character(quadrat_id)) 

life_stages_grouped <- life_stages |>
  group_by(quadrat_id, life_stage) |> 
  summarize(mean_value = mean(percent))

## Create a stacked column plot of sapling and adult cover by quadrat.
ggplot(life_stages_grouped, aes(x = quadrat_id, y = mean_value, group = life_stage, fill = life_stage))+
  geom_col()+
 # facet_wrap(~name)+
  labs(x = "Quadrat ID", y = "Percent cover")+
  labs(fill = "Life stage")






# FINAL LESSON: PWQMN heatmaps, labels and plot customization
# ----------------------------------------------------------------------------

library(tidyverse)
library(janitor)

pwqmn_data <- read_csv("PWQMN_data_2024.csv") |>
  clean_names()

unique(pwqmn_data$collection_site)

# Filter by chloride data
chloride_data <- pwqmn_data |>
  filter(analyte == "Chloride") |>
  mutate(results = ifelse(results == "<1.5", NA, results),
         month = month(mdy(collected), label = TRUE),
         collection_site = as.character(collection_site)) |>
  mutate(results = as.numeric(results)) |>
  filter(!is.na(results), !is.na(month))

# Count the distinct months with numeric chloride results for each station.
monthly_data <- chloride_data |>
  group_by(collection_site) |>
  summarize(months_recorded = n_distinct(month)) |>
  filter(months_recorded == 12)

high_output <- chloride_data |>
  filter(collection_site %in% monthly_data$collection_site) |>
  group_by(collection_site) |>
  summarize(mean_chloride = mean(results)) |>
  arrange(-mean_chloride) %>%
  head(8)

# Choose eight stations with a numeric mean in all 12 months.
selected_stations <- chloride_data |>
  filter(collection_site %in% high_output$collection_site) %>%
  group_by(collection_site, month) %>%
  summarize(mean_chloride = mean(results))

heatmap_plot <- ggplot(selected_stations,
                       aes(x = month, y = collection_site,
                           fill = mean_chloride)) +
  geom_tile(colour = "white") +
  geom_text(aes(label = round(mean_chloride, 1)), size = 3) +
  #scale_fill_gradient(low = "white", high = "lightblue") +
  labs(
    title = "Monthly chloride concentrations",
    subtitle = "Selected PWQMN stations, 2024",
    x = "Month",
    y = "Station",
    fill = "Chloride (mg/L)"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 12, colour = "grey40"),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 11, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 10, colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10),
    legend.position = "right"
  )

heatmap_plot

# Hide the legend; put units in the subtitle instead.
heatmap_plot +
  labs(subtitle = "Monthly mean chloride (mg/L), 2024") +
  theme(legend.position = "none")

station_data_302 <- selected_stations |>
  filter(collection_site == "6008200302")

january_data <- station_data_302 |>
  filter(month == "Jan")

line_plot <- ggplot(station_data_302,
                    aes(x = month, y = mean_chloride,
                        group = 1, colour = "Chloride")) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_point(data = january_data,
             aes(x = month, y = mean_chloride), colour = "red", size = 4) +
  geom_text(data = january_data,
            aes(label = "January peak"),
            colour = "black", hjust = -0.25, vjust = 0, size = 4) +
  scale_colour_manual(values = c("Chloride" = "purple")) +
  labs(
    title = "Chloride concentrations through 2024",
    subtitle = "PWQMN station 6008200302",
    x = "Month",
    y = "Mean chloride (mg/L)",
    colour = "Parameter"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 12, colour = "grey40"),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 11, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 11, colour = "black"),
    axis.line = element_line(colour = "grey40"),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10),
    legend.position = "bottom"
  )

line_plot

line_plot +
  theme(legend.position = "none")
