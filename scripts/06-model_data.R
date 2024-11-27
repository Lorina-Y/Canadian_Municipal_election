#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(arrow) # package for read_parquet()

#### Read data ####
data <- read_parquet("data/02-analysis_data/analysis_data.parquet") 
train_data <- read_parquet("data/02-analysis_data/train_data.parquet")
test_data <- read_parquet("data/02-analysis_data/test_data.parquet")

### Model data ####
set.seed(304)
# Fit logistic regression Model
# The model includes interaction terms: gender * election_year and gender * incumbent.

model<- glm(formula = elected ~ gender + incumbent + election_year + 
        gender:election_year + gender:incumbent, 
        data = train_data, 
        family = "binomial")

saveRDS(
  model,
  file = "models/model.rds"
)



