#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data
# Author: Hanqing Yang
# Date: 01 December 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` and `testthat` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `Canadian_Municipal_Elections` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
test_that("dataset was successfully loaded", {
  expect_true(exists("simulated_data"))
})


#### Test data ####

# Check if the dataset has 1000 rows
test_that("dataset has 1000 rows", {
  expect_equal(nrow(simulated_data), 1000)
})

# Check if the dataset has 9 columns
test_that("dataset has 9 columns", {
  expect_equal(ncol(simulated_data), 9)
})

# Test that 'province' contains only valid Canadian province name
valid_provinces <- c("British Columbia", "Quebec", "Alberta", "Ontario", 
                     "Manitoba", "Nova Scotia", "New Brunswick", 
                     "Prince Edward Island", "Newfoundland and Labrador",
                     "Saskatchewan", "Yukon", "Northwest Territories")
test_that("'province' contains valid Canadian province names", {
  expect_true(all(simulated_data$province %in% valid_provinces))
})

# Check if there are any missing values in the dataset
test_that("dataset contains no missing values", {
  expect_true(all(!is.na(simulated_data)))
})

# Test that there are no empty strings in 'municipality', 'province', 
# 'first_name' or 'last_name' columns
test_that("no empty strings in 'municipality', 'province', 'first_name' 
          or 'last_name' ", {
            expect_false(any(simulated_data$municipality == "" |
                               simulated_data$province == "" |
                               simulated_data$first_name == "" | 
                               simulated_data$last_name == "" ))
          })

# Check if the 'municipality' column has at least 6 unique values
test_that("'manicipality' column contains at least six unique values", {
  expect_gte(n_distinct(simulated_data$municipality), 6)
})

# Test that 'election_year' is between 1860 to 2022
test_that("'election_year' values are within the range 1860 to 2022", {
  expect_true(all(simulated_data$election_year >= 1860 & 
                    simulated_data$election_year <= 2022))
})

