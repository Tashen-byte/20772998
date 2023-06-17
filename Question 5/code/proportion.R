
prop <- function(data){
    library(tidyverse)

    data <-  data %>%
        mutate(installs = parse_number(installs))

typ <- data %>%
    group_by(type) %>%
    summarise(proportion = sum(installs, na.rm = T)/sum(playstore$installs, na.rm=T)*100)
typ
}
