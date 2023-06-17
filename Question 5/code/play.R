play_bar <- function(data){
    library(ggplot2)
bar <- data %>%
    group_by(category) %>%
    summarise(av_rating = round(mean(rating, na.rm = T), digits = 2),
              av_installs = round(mean(installs, na.rm = T), digits = 2)) %>%
    arrange(av_rating) %>%
    slice(1:5)

plot <- bar %>%
    ggplot()+
    geom_bar(aes(x = category, y = av_rating, fill = category),stat = "identity", width = 0.5)+
    geom_text(aes(x = category, y = av_rating, label = av_installs), vjust = -0.5)+
    scale_fill_discrete(name = "Category")+
    guides(fill = "none")+
    labs( title = "Average Rating by APP Category",
          y = "Average Rating",
          x = "Category")+
    theme_bw()

plot
}




