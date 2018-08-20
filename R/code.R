library(raster)
library(sf)
library(mapview)
# read the raster ---------------------------------------------------------
r = raster("DEM_5m.tif")

# read training dataset ---------------------------------------------------
v_csv = read.csv("Training_stations.csv", stringsAsFactors = FALSE)

# convert to spatial and reproject ----------------------------------------
v = st_as_sf(v_csv, coords = c("GPS_LON", "GPS_LAT"), crs = 4326) %>% 
  st_transform(projection(r))

# visualization -----------------------------------------------------------
mapview(r) + v
