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

gdw_df <- read_csv(here("data/gdw.csv")) |>
  clean_names() # Convert variable names to lower snake case