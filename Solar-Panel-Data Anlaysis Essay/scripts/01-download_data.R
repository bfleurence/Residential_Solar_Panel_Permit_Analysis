#### Preamble ####
# Purpose: Downloads and saves the data from opensourcetoronto on Solar Panel installtion data in Toronto from 2009-2024
# Author: Benjamin Fleurence
# Date: 26th September 2024 
# Contact: b.fleurence@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####

library(tidyverse)
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("1e29ce3f-9795-4664-8d42-1911c2796196")
package

# get all resources for this package
resources <- list_package_resources("1e29ce3f-9795-4664-8d42-1911c2796196")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data to raw_data file ####
write_csv(data, "data/raw_data/raw_data.csv")

