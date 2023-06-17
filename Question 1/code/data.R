des <- read_csv("C:/Users/tashe/Desktop/20772998/Question 1/data/Covid/covid_data_description.csv")
death <- read_csv("C:/Users/tashe/Desktop/20772998/Question 1/data/Covid/Deaths_by_cause.csv")
owid <- read_csv("C:/Users/tashe/Desktop/20772998/Question 1/data/Covid/owid-covid-data.csv")

#Death does not seem tidy.
death <- death %>%
    janitor::clean_names()


detah <- death %>%
    group_by(entity) %>%
    distinct(code) %>%
    mutate(code = ifelse(is.na(code), "AFR", code),
           code = as.character(code)) %>%
    mutate(entity = ifelse(entity == "African Region (WHO)", "Africa", entity)) %>%
    rename('location' = entity)

African_nations_code_owid <- owid %>%
    filter(continent == "Africa") %>%
    rename("code" = iso_code) %>%
    mutate(code= as.character(code)) %>%
    arrange(code)

africa_code <- African_nations_code_owid %>%
    distinct(location)

death %>%
    full_join(African_nations_code_owid)




