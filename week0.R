library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)

packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "spDataLarge", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

gdw_df <- read_csv(here("data/gdw.csv")) |> # Read_CSV produces a data frame 
  clean_names() # Convert variable names to lower snake case

head(gdw_df, n = 10) |> 
  kable()

tail(gdw_df, n = 10) |> 
  kable()

dim(gdw_df)
nrow(gdw_df)
ncol(gdw_df)

names(gdw_df)
country_df <- gdw_df[, "country"] # Indexing by country name
country_vec <- gdw_df[["country"]] # Indexing by country name in vector format with 
# double [[]] to pull out the values from the column

gdw_df |> 
  group_by(dam_type) |>
  summarise(count = n()) |>
  ungroup()

sub_dam <- gdw_df |>
  filter(dam_type == "Dam")

gdw_df <- gdw_df |>
  arrange(year_dam)

gdw_df
