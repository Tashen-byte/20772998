seasonal <-  function(data){
     library(dplyr)
    library(ggplot2)
    #Add seasons to the mix
    season <- data %>%
        group_by(date = format(date, "%m")) %>%
        mutate(season = ifelse(date >= "03" & date <= "05", "Spring", ifelse(date >= "05" & date <= "08", "Summer", ifelse(date >= "09" & date <= "11", "Autumn", "Winter")))) %>%
        ungroup() %>%
        select(-date)

    seasons <- season %>%
           inner_join(data)

    ssn <-  season %>%
         group_by(season) %>%
         summarise( Max_temp = mean(max_temp, na.rm = T),
                    Min_temp = mean(min_temp, na.rm = T),
                    )

season_plot <- ssn %>%
    ggplot()+
    geom_bar(aes(x = season, y = Max_temp), stat = "identity", fill = "coral", position = "dodge")+
    geom_bar(aes(x =season, y = Min_temp), stat = "identity", fill = "lightblue", position = "dodge")+
    geom_text(aes(x = season, y = Max_temp, label = round(Max_temp, digit = 2)), vjust = -0.5, color = "black")+
    geom_text(aes(x = season, y = Min_temp, label = round(Min_temp, digit = 2)), vjust = -0.5, color = "black")+
    labs( x = "Season",
          y = "Average Temperature",
          fill = NULL,
          title = "Temparature in London (1979-2020)",
          subtitle = "Average temparature",
          caption = "Data source:\nUK National Weather Service")+
        theme_bw()
season_plot
}


