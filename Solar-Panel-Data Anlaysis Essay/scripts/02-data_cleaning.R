#### Preamble ####
# Purpose: Cleans the raw data to eliminate unnecessary parameters and date forms 
# Author: Benjamin Fleurence 
# Date: 26th September 2024
# Contact: b.fleurence@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
library(readr)      # For read_csv
library(dplyr)      # For data manipulation
library(janitor)    # For clean_names
library(lubridate)  # For date manipulation

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv") 

# Clean and filter the data
cleaned_data <- raw_data %>%
  janitor::clean_names() %>%  # Clean column names
  select(application_date, completed_date, postal, status) %>%  # Select only specified columns
  mutate(
    application_date = lubridate::ymd(application_date),   # Convert application_date to Date format
    completed_date = lubridate::ymd(completed_date)        # Convert completed_date to Date format
  ) %>%
  tidyr::drop_na(completed_date) %>%  # Eliminate rows with NA in completed_date
  mutate(completed_month_year = format(completed_date, "%b %Y"))  # Shorten completed_date to Month Year (abbreviated)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")  # Save cleaned data

