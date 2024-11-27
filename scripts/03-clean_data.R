#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(rsample)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/elec_data.csv")

# Select wanted column:
cleaned_data <-
  raw_data |> 
  janitor::clean_names() |>
  select(
    race_id, first_name, last_name, municipality, gender, elected, incumbent,
    election_year, province
  ) |>
  mutate(
    gender = if_else(gender == 'F', 1, 0) # assign female as 1, male as 0
  ) |>
  mutate(
    incumbent = as.factor(incumbent),
    elected = as.factor(elected),
    gender = as.factor(gender)# Ensure correct type of columns exist
  ) |>
  tidyr::drop_na()|> # Remove observations with N/A value
  dplyr::distinct() # Remove duplicate row

cleaned_data$elected <- factor(cleaned_data$elected, levels = c(0, 1))

# random split the dataset into training data and test data
s <- sample(1:nrow(cleaned_data), 0.7*nrow(cleaned_data), replace=F)
train <- cleaned_data[s, ]
test <- cleaned_data[-s, ]


# Note vote_share is N/A if acclaimed is 1
#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
write_parquet(cleaned_data, "data/02-analysis_data/analysis_data.parquet")
write_parquet(test, "data/02-analysis_data/test_data.parquet")
write_parquet(train, "data/02-analysis_data/train_data.parquet")

