# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?
install.packages("opendatatoronto",repos = "http://cran.us.r-project.org")
install.packages("dplyr",repos = "http://cran.us.r-project.org")
install.packages("tidyverse",repos = "http://cran.us.r-project.org")
library(opendatatoronto)
library(dplyr)
library(tidyverse)
datashelter2020 <- opendatatoronto::search_packages("Daily Shelter Occupancy") %>% opendatatoronto::list_package_resources() %>% dplyr::filter(name %in% c("daily-shelter-occupancy-2020.csv")) %>% group_split(name) %>% map_dfr(get_resource, .id = "file")
write_csv(datashelter2020, "input/datashelter2020.csv")
