library(here)
library(tidyverse)
library(sf)
library(stars)
library(tmap)

ei_points <- st_read(here("data", "ei_points.gpkg")) |> 
  filter(type == "volcano")
ei_elev <- read_stars(here("data", "ei_elev.tif"))
ei_borders <- st_read(here("data", "ei_border.gpkg"))
ei_roads <- st_read(here("data", "ei_roads.gpkg"))