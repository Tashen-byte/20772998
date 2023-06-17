coldplay_pop_album <- function(data){
    library(ggplot2)

    pop <- data %>%
        group_by(album_name) %>%
        summarise(avg_pop = round(mean(popularity), digits = 2))


    ggplot(pop, aes(x = album_name, y = avg_pop, fill = avg_pop))+
        geom_bar(stat = "identity")+
        scale_fill_gradient(low = "darksalmon", high = "cornflowerblue", guide = "colorbar")+
        labs(x = "Album",
             y = "Average Popularity",
             title = "Coldplay Popularity by Album")+
        guides(fill = guide_colorbar(title = "Popularity \ngradient"))+
        theme_minimal()+
        theme(axis.text.x = element_text(angle = 90))
}


