#### Preamble ####
# Purpose: Downloads and saves the data from borealis
# Author: Hanqing Yang
# Date: 21 November 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? Make sure you are in the `Canadian_Municipal_Elections` rproj


#### Workspace setup ####
library(tidyverse)


#### Download data ####
the_raw_data <- read_tsv( "data/01-raw_data/elec.tab")


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "data/01-raw_data/elec_data.csv") 


         
