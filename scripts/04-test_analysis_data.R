#### Preamble ####
# Purpose: Tests the analysis data
# Author: Hanqing Yang
# Date: 30 November 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 03_clean_data.R



#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

#### Test data ####

# Test that there are no missing values in all 3 datasets
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that the analysis dataset has 84028 rows 
test_that("dataset has 84028 rows", {
  expect_equal(nrow(analysis_data), 84028)
})


# Test that the analysis dataset has 9 columns
test_that("dataset has 9 columns", {
  expect_equal(ncol(analysis_data), 9)
})

# Test that the 'elected' column is factor type
test_that("'elected' is a factor", {
  expect_s3_class(analysis_data$elected, "factor")
})

# Test that the 'gender' column is factor type
test_that("'gender' is a factor", {
  expect_s3_class(analysis_data$gender, "factor")
})

# Test that the 'incumbent' column is factor type
test_that("'incumbent' is a factor", {
  expect_s3_class(analysis_data$incumbent, "factor")
})

# Test that 'election_year' is between 1860 to 2022
test_that("'election_year' values are within the range 1860 to 2022", {
  expect_true(all(analysis_data$election_year >= 1860 & 
                    analysis_data$election_year <= 2022))
})

# Test that the 'municipality' column is character type
test_that("'municipality' is character", {
  expect_type(analysis_data$municipality, "character")
})

# Test that the 'first_name' column is character type
test_that("'first_name' is character", {
  expect_type(analysis_data$first_name, "character")
})

# Test that the 'last_name' column is character type
test_that("'last_name' is character", {
  expect_type(analysis_data$last_name, "character")
})

# Test that the 'province' column is character type
test_that("'province' is character", {
  expect_type(analysis_data$province, "character")
})

# Test that 'province' contains only valid Canadian province name
valid_provinces <- c("British Columbia", "Quebec", "Alberta", "Ontario", 
                     "Manitoba", "Nova Scotia", "New Brunswick", 
                     "Prince Edward Island", "Newfoundland and Labrador",
                     "Saskatchewan", "Yukon", "Northwest Territories")
test_that("'province' contains valid Canadian province names", {
  expect_true(all(analysis_data$province %in% valid_provinces))
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that there are no empty strings in 'municipality', 'province', 
# 'first_name' or 'last_name' columns
test_that("no empty strings in 'municipality', 'province', 'first_name' 
          or 'last_name' ", {
            expect_false(any(analysis_data$municipality == "" |
                               analysis_data$province == "" |
                               analysis_data$first_name == "" | 
                               analysis_data$last_name == "" ))
})

# Test that the 'municipality' column has at least 100 unique values
test_that("'manicipality' column contains at least 100 unique values", {
  expect_gte(n_distinct(analysis_data$municipality), 100)
})

