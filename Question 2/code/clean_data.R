#Appropriate Packages
library(Texevier)
library(fmxdat)
library(dplyr)
library(tidyverse)
library(readxl)

london_weather <- read_csv("C:/Users/tashe/Desktop/20772998/Question 2/data/London/london_weather.csv") %>%
    janitor::clean_names()%>%
    mutate(date = as.Date(date, format = "%Y%m%d")) %>%
    mutate(date = as.character(date))

UK <- read_csv("C:/Users/tashe/Desktop/20772998/Question 2/data/London/UKMonthly_Detailed.csv")


season <- london_weather %>%
    group_by(date = format(date, "%m")) %>%
    mutate(season = ifelse(date >= "03" & date <= "05", "Spring", ifelse(date >= "05" & date <= "08", "Summer", ifelse(date >= "09" & date <= "11", "Autumn", "Winter")))) %>%
    ungroup() %>%
    select(-date)

london_weather <- london_weather %>%
    inner_join(season)

