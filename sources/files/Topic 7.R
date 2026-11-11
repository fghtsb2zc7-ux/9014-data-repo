library(tidyverse)
library(janitor)

## Load data into R 
buckthorn_data <- read_csv("buckthorn_updated.csv") |> 
  clean_names() |> ## Load in the buckthorn data and clean the column headers 
  mutate(buckthorn_present = ifelse(buckthorn_percent > 0, "Yes", "No")) |> #Create a new column that identifies if a plot has buckthorn (yes) or does not have buckthorn (no)
  mutate(reproduction_present = ifelse(reproducing_buckthorn > TRUE, 1, 0))  #Create a new column that identifies if a plot has buckthorn (yes) or does not have buckthorn (no)  mutate(total_cover = buckthorn_percent + bare_soil_percent + non_buckthorn_vegetation_percent) |> ## Create a column that sums the buckthorn, bare soil and vegetation percentage 

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

# In the summary of the linear regression, the p value is listed at the end of the table near buckthorn_percent
# Because the value is greater than the significance threshold, it is not considered a statistically significant relationship

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
summary(compare_sections)

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

## Create a summary table that shows the mean percent seedling, sapling and adult buckthorn (separate columns) for each section
buckthorn_summary_demographic <- buckthorn_data |> 
  summarize(sapling = mean(sapling_percent), adult = mean(adult_percent))


## Select only the section column, team column, and the buckthorn columns (seedling, sapling, adult). Then pivot the data longer.

life_stages <- buckthorn_data |> 
  select(section, quadrat_id, group_members, sapling_percent, adult_percent) |> 
  pivot_longer(cols = 4:5, names_to = "life_stage", values_to = "percent") |>
  mutate(quadrat_id = as.character(quadrat_id)) 

life_stages_grouped <- life_stages |>
  group_by(quadrat_id, life_stage) |> 
  summarize(mean_value = mean(percent))

## Create a plot box plot that show the different % demographic stages of buckthorn against the section (x axis)
ggplot(life_stages_grouped, aes(x = quadrat_id, y = mean_value, group = life_stage, fill = life_stage))+
  geom_col()+
 # facet_wrap(~name)+
  labs(x = "Quadrat ID", y = "Percent cover")+
  labs(fill = "Life stage")





