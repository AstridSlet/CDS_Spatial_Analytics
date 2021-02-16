##-----------------------------------------------##
##    Author: Adela Sobotkova                    ##
##    Institute of Culture and Society           ##
##    Aarhus University, Aarhus, Denmark         ##
##    adela@cas.au.dk                             ##
##-----------------------------------------------##

#### Goals ####

# - Understand the provided datasets
# - Learn how to reproject spatial data
# - Limit your data into an area of interest
# - Create a new map

# We highlighted all parts of the R script in which you are supposed to add your
# own code with: 

# /Start Code/ #

print("Hello World") # This would be your code contribution

# /End Code/ #

#### Required R libraries ####

# We will use the sf, raster, and tmap packages.
# Additionally, we will use the spData and spDataLarge packages that provide new datasets. 
# These packages have been preloaded to the worker2 workspace.

library(sf)
library(raster)
library(tmap)
library(spData)
library(spDataLarge)
library(rgdal)
#### Data sets #### 

# We will use two data sets: `srtm` and `zion`.
# The first one is an elevation raster object for the Zion National Park area, and the second one 
# is an sf object with polygons representing borders of the Zion National Park.

srtm <- raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion <- read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Additionally, the last exercise (IV) will used the masked version of the `lc_data` dataset.

study_area <- read_sf("data/study_area.gpkg")
lc_data <- raster("data/example_landscape.tif")
lc_data_masked <- mask(crop(lc_data, study_area), study_area)

#### Exercise I ####

# 1. Display the `zion` object and view its structure.
# What can you say about the content of this file?
# What type of data does it store? 
# What is the coordinate system used?
# How many attributes does it contain?
# What is its geometry?
# 2. Display the `srtm` object and view its structure.
# What can you say about the content of this file? 
# What type of data does it store?
# What is the coordinate system used? 
# How many attributes does it contain?
# How many dimensions does it have? 
# What is the data resolution?

# Your solution (type answer to the questions as code comments and the code used)
# /Start Code/ #

### zion data set ###
#display zion and count the number of columns and check column type 
ncol(zion)      # attributes: you have 12 collumns in zion, 11 attributes and 1 collumn with the geometric data 
str(zion) 
head(zion$geom) # view geometric information about zion dataset
                # object type: polygons, map projection: projected CRS, UTM Zone 12, Northern hemisphere
                # dimensions: XY coordinates

### srtm data set ###
extent(srtm) # Get the extent (the coordinates of the 'corners' of the raster)
             # xmin: -113.2396
             # xmax: -112.8521 
             # ymin: 37.13208 
             # ymax: 37.51292 
ratify(srtm) # attributes: 1 attribute (elevation), the values run from 1024 to 2892
             # dimensions:nrow: 457, ncol:465 ncell:212505
             # data resolition 0.0008333333, 0.0008333333 (x, y)
             # projected CRS, WGS84

# /End Code/ #

#### Exercise II ####

# 1. Reproject the `srtm` dataset into the coordinate reference system used in the `zion` object. 
# Create a new object `srtm2`
# Vizualize the results using the `plot()` function.
# 2. Reproject the `zion` dataset into the coordinate reference system used in the `srtm` object.
# Create a new object `zion2`
# Vizualize the results using the `plot()` function.


# Your solution

# /Start Code/ #
### reproject srtm into ref system of zion ###
zion_crs <- crs(zion, asText = TRUE)  #get crs from zion
srtm_transformed <-  projectRaster(srtm, crs = zion_crs, method = "ngb")
ratify(srtm_transformed) # check that crs is transformed

### reproject zion into ref system of srtm ###
srtm_crs_WGS84 <-crs(srtm, asText = TRUE) # get crs from srtm
zion_transformed <- st_transform(zion, crs = srtm_crs_WGS84) 
head(zion_transformed$geom) # check that the crs is changed 
crs(srtm, asText = TRUE)

# /End Code/ #
