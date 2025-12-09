#Cleaning of the environment
rm(list = ls())
#Libraries
library(dplyr)
library(stringr)
library(readr)
library(here)
library(tidyverse)
#Data import
members <- read_delim(here("data_in","dial_members.csv"), delim = ";")
#Set seed 
set.seed(19091994)

#Add some random funny variables
members_clean <- members %>%
  mutate(
    coffee_cups_week = sample(10:40, n(), replace = TRUE),
    git_commits = sample(1:200, n(), replace = TRUE),
    overleaf_projects = sample(1:15, n(), replace = TRUE),
    meetings_month = sample(1:100, n(), replace = TRUE),
    has_cat = sample(0:1, n(), replace = TRUE),
    life_satisfaction = round(runif(n(), 5, 10), 1),
  )

#Export clean data
write_csv(members_clean, here("data_out","dial_members_fun.csv"))
