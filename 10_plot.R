# Load libraries
library(tidyverse)
library(bruneimap)
theme_set(theme_bw())
library(sf)

# Create map from shapefile
fr_sf <- st_read("/Users/hafeezulrzq/Documents/github_local/forestreserve_bn/QJIS files/polygon_forestreserves.shp")

data(kpg_sf)

# Check fr_sf
ggplot() +
  geom_sf(data = shapefile) +
  theme_void()

ggplot(kpg_sf) +
  geom_sf(aes(fill = mukim), col = "gray50") +
  geom_sf(data = mkm_sf, col = "black", lwd = 0.5, fill = NA) +
  geom_sf(data = filter(kpg_sf, is.na(mukim)), fill = "gray70", col = "gray70") +
  geom_sf(data = fr_sf, fill = "red", col = "black", alpha = 0.5) +
  theme(legend.position = "none") +
  scale_fill_viridis_d(option = "turbo")

ggplot() +
  geom_sf(data = kpg_sf, aes(fill = mukim), col = "gray50") +
  geom_sf(data = fr_sf_normalized, aes(fill = Fr_Reserve), col = "black", alpha = 0.5) +
  theme_void() +
  scale_fill_viridis_d(option = "turbo") +
  theme(axis.text = element_blank(), axis.title = element_blank(), legend.position = "none")