#### Preamble ####
# Purpose: Cleans the raw CMED data collected from borealis website
# Author: Hanqing yang
# Date: 25 November 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02_download_data.R
# Any other information needed? None

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
  dplyr::select(
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
set.seed(1202)
split <- initial_split(cleaned_data, prop = 0.7)
train_data <- training(split)
test_data <- testing(split)

# find in which year female candidate begin to participant the election
earliest_years <- cleaned_data |>
  group_by(gender) |>
  summarise(Earliest_Year = min(election_year, na.rm = TRUE))

# Filter the dataset to include only rows where election_year > 1909
train_clean <- filter(train_data, election_year > 1909)
test_clean <- filter(test_data, election_year > 1909)

# Filter the dataset to include only rows where election_year > 1909

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
write_parquet(cleaned_data, "data/02-analysis_data/analysis_data.parquet")
write_parquet(test_clean, "data/02-analysis_data/test_data.parquet")
write_parquet(train_clean, "data/02-analysis_data/train_data.parquet")

