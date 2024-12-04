#### Preamble ####
# Purpose: Simulated the analysis dataset
# Author: Hanqing Yang
# Date: 30 November 2024
# Contact: hanq.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
set.seed(1202)


#### Simulate data ####
# Number of rows in the dataset
n <- 1000

# Generate race_id
race_id <- sample(c("Abbotsford2022Mayor99", "AlertBay2022Councillor99", 
                    "Belcarra2022Mayor99", "CacheCreek2022Mayor99", 
                    "Courtenay2022Mayor99", "Comox2022Mayor99"),
                  n, replace = TRUE)
# Generate first_name, second_name values
first_name <- sample(c("Ross", "Siemens", "D. Paul", "Dave", "Patricia", 
                        "Mark", "Kelly", "Dave", "Sandy", "Bharathi"), 
                      n, replace = TRUE)
last_name <- sample(c("Manjit", "Sohi", "Pellikaan", "Sidhu", "Ross", 
                       "Warkentin", "Chahal", "Loewen", "Blue", "Sandhu"),
                     n, replace = TRUE)


# municipality names
municipality <- sample(c(
  "Abbotsford",
  "Hudson",
  "Anmore",
  "Armstrong",
  "Ashcroft",
  "Belcarra",
  "Cache Creek",
  "Campbell River"
), n, replace = TRUE)

# Generate a binary factor variable for gender
gender <- factor(
  sample(c(1, 0), n, replace = TRUE, prob = c(0.3, 0.7)) # Adjust probabilities if needed
)

# Generate a binary factor variable for elected
elected <- factor(sample(c(1, 0), n, replace = TRUE, prob = c(0.5, 0.5)) # Adjust probabilities if needed
)

# Generate a binary factor variable for incumbent
incumbent <- factor(sample(c(1, 0), n, replace = TRUE, prob = c(0.5, 0.5)) # Adjust probabilities if needed
)

# Generate election year values
election_year <- round(runif(n, min = 1867, max = 2022))

#Province
province <- sample(c("British Columbia", "Quebec", "Alberta", "Ontario", 
                     "Manitoba", "Nova Scotia", "New Brunswick", 
                     "Prince Edward Island", "Newfoundland and Labrador",
                     "Saskatchewan", "Yukon", "Northwest Territories"), n, replace = TRUE)

# Create dataframe
simulated_data <- data.frame(race_id, first_name, last_name, municipality, gender, elected, 
                   incumbent, election_year, province)

# View the first few rows of the dataset
head(simulated_data)


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
