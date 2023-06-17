over_time <- function(data){
#need to get the averages for each year
    avg <- data %>%
    group_by( date = format(date, "%Y")) %>%
    summarise(mean_cloud_cover = mean(cloud_cover, na.rm = T),
              mean_sunshine = mean(sunshine, na.rm = T),
              mean_precipitation = mean(precipitation, na.rm = T),
              mean_snow_depth = mean(snow_depth, na.rm = T))

library(patchwork)#Allows graph to be imposed on each other

sun <-  ggplot(avg, aes(x = date, y = mean_sunshine)) +
    geom_line(aes(group = 1)) +
    geom_line(data = avg, aes(x = date, y = mean_sunshine, group = 1), color = "coral1")+
    theme_bw()+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+
    labs(x = "Date",
         y = "Average",
         title = "Average Sunshine")

cloud <- ggplot(avg, aes(x = date, y = mean_cloud_cover)) +
    geom_line(aes(group = 2)) +
    geom_line(data = avg, aes(x = date, y = mean_cloud_cover, group = 2 ), color = "magenta")+
    theme_bw()+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+
    labs(x = "Date",
         y = "Average",
         title = "Average Cloud Cover")


precip <- ggplot(avg, aes(x = date, y = mean_precipitation)) +
    geom_line(aes(group = 3)) +
    geom_line(data = avg, aes(x = date, y = mean_precipitation, group = 3), color = "royalblue")+
    theme_bw()+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+
    labs(x = "Date",
         y = "Average",
         title = "Average Precipitation")

snow <- ggplot(avg, aes(x = date, y = mean_snow_depth)) +
    geom_line(aes(group = 4)) +
    geom_line(data = avg, aes(x = date, y = mean_snow_depth, group = 4), color = "deepskyblue4")+
    theme_bw()+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))+
    labs(x = "Date",
         y = "Average",
         title = "Average Snow")

imposed <- sun + cloud + precip + snow + plot_layout(ncol = 1)


imposed
}






