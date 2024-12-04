#### Preamble ####
# Purpose: Fit logistic regression model for analysis
# Author: Hanqing Yang
# Date: 25 November 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` and `arrow` packages must be installed and loaded
#   - 03-clean_data.R must have been run
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(arrow) # package for read_parquet()

#### Read data ####
data <- read_parquet("data/02-analysis_data/analysis_data.parquet") 
train_data <- read_parquet("data/02-analysis_data/train_data.parquet")
test_data <- read_parquet("data/02-analysis_data/test_data.parquet")

### Model data ####
set.seed(1202)
# Fit logistic regression Model on training data
# The model includes interaction terms: gender * election_year and gender * incumbent.

model<- glm(formula = elected ~ gender + incumbent + 
        gender:election_year + gender:incumbent, 
        data = train_data, 
        family = "binomial")

saveRDS(
  model,
  file = "models/model.rds"
)



