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
  labs(x = "Canopy cover (%)", y = "Buckthorn cover (%)")+
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
