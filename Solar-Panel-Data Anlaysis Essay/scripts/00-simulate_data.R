#### Preamble ####
# Purpose: Simulates a subset to analyze 
# Author: Benjamin Fleurence 
# Date: 26th September 2024
# Contact: b.fleurence@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(08)

# Define the start and end date
start_date <- as.Date("2009-05-07")
end_date <- as.Date("2023-08-29")

#Set the number of random dates you want to generate
number_of_dates <- 140

# Sample 140 random rows from cleaned_data
sampled_data <- cleaned_data %>%
  select(application_date, completed_date, postal, status) %>%  # Select only the desired columns
  sample_n(size = number_of_dates)  

# Create a tibble for the new dataset
data <- tibble(
  application_date = sampled_data$application_date,  # Use sampled application dates
  completed_date = sampled_data$completed_date,      # Use sampled completed dates
  postal = sampled_data$postal,                      # Use sampled postal codes
  status = sampled_data$status                       # Use sampled status values
)

### Write_csv ###
write_csv(data, "data/raw_data/simulated.csv")
