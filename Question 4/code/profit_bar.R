

profit <- function(data, title, ylab, xlab){
    library(ggplot2)

    mov <- data %>%
        group_by(genre) %>%
        mutate(avg_profitability = round(mean(profitability, na.rm = T), digits = 2)) %>%
        ungroup()
library(RColorBrewer)
colour <- brewer.pal(n_distinct(mov$genre), "Dark2")
    plot <- mov %>%
        ggplot()+
        geom_bar(aes(x = genre, y = avg_profitability, fill = genre),stat = "identity" )+
        scale_fill_manual(values = colour )+
        theme_bw()+
        labs(title = title,
             y = ylab,
             x= xlab)+
             guides(fill = "none")

    plot

}

