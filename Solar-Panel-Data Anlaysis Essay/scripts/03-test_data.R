#### Preamble ####
# Purpose: Test to make sure there are no NA values for Completed Applications
# Author: Benjamin Fleurence 
# Date: 26th September, 2024
# Contact: b.fleurence@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Test data ####

# Check for NA values in the completed_date variable
na_completed_dates <- sum(is.na(cleaned_data$completed_date))

# Print the result
if (na_completed_dates == 0) {
  cat("There are no NA values in the completed_date variable.\n")
} else {
  cat("There are", na_completed_dates, "NA values in the completed_date variable.\n")
}

# Check if completed_date is in Date format
is_date_format <- inherits(cleaned_data$completed_date, "Date")

# Print the result
if (is_date_format) {
  cat("The completed_date variable is in Date format.\n")
} else {
  cat("The completed_date variable is NOT in Date format.\n")
}
