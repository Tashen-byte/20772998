library(tidyverse)
library(readxl)

playstore <- read_csv("C:/Users/tashe/Desktop/20772998/Question 5/data/googleplay/googleplaystore.csv") %>%
    janitor::clean_names()
playstore <- playstore %>%
    mutate(installs = gsub("[+]", "", installs)) %>%
    mutate(installs = gsub(",", "", installs)) %>%
    mutate(installs = as.numeric(installs))

reviews <- read_csv("C:/Users/tashe/Desktop/20772998/Question 5/data/googleplay/googleplaystore_user_reviews.csv") %>%
    janitor::clean_names()
