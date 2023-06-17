seasonal <-  function(london_weather){
     library(dplyr)
    library(ggplot2)
    ssn <-  london_weather %>%
         group_by(Season) %>%
         summarise( Max_temp = mean(max_temp, na.rm = T),
                    Min_temp = mean(min_temp, na.rm = T),
                    )

season_plot <- ssn %>%
    ggplot()+
    geom_bar(aes(x = Season, y = Max_temp), stat = "identity", fill = "lightblue", position = "dodge")+
    geom_bar(aes(x =Season, y = Min_temp), stat = "identity", fill = "coral", position = "dodge")+
    geom_text(aes(x = Season, y = Max_temp, label = round(Max_temp, digit = 2)), vjust = -0.5, color = "black")+
    geom_text(aes(x = Season, y = Min_temp, label = round(Min_temp, digit = 2)), vjust = -0.5, color = "black")
    labs( x = "Season",
          y = "Temperature",
          fill = NULL,
          title = "Temparature in London (1979-2020)",
          subtitle = "Average temparature",
          caption = "Data source:\nUK National Weather Service")+
    theme_bw()
season_plot
}


