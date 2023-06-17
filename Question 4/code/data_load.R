library(readxl)
library(tidyverse)
library(ggplot2)

credits <- read_csv("C:/Users/tashe/Desktop/20772998/Question 4/data/credits.csv")
movies <- read_csv("C:/Users/tashe/Desktop/20772998/Question 4/data/Movies.csv") %>%
    janitor::clean_names()
titles <- read_csv("C:/Users/tashe/Desktop/20772998/Question 4/data/titles.csv")%>%
    mutate(genres = str_replace_all(genres, "[\\[\\]']", ""))


