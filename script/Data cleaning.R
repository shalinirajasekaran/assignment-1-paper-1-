# Purpose: Clean the survey data downloaded from Open Data Portal
# Author: Esther Shalini Rajasekaran
# Data: 29 January 2021
# Contact: esther.rajasekaran@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the Toronto Shelter data from Open Data Portal and saved it to inputs/data
# Install the following packages - opendatatoronto,dplyr & tidyverse
install.packages("opendatatoronto",repos = "http://cran.us.r-project.org")
install.packages("dplyr",repos = "http://cran.us.r-project.org")
install.packages("tidyverse",repos = "http://cran.us.r-project.org")
library(opendatatoronto)
library(dplyr)
library(tidyverse)
datashelter2020 <- opendatatoronto::search_packages("Daily Shelter Occupancy") %>% opendatatoronto::list_package_resources() %>% dplyr::filter(name %in% c("daily-shelter-occupancy-2020.csv")) %>% group_split(name) %>% map_dfr(get_resource, .id = "file")
write_csv(datashelter2020, "input/datashelter2020.csv")
