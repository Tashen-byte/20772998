
count_performance_table <- function(data){
    summary <- function(data, type){

        each <- data %>%
            filter(performance_type == type) %>%
            summarise(num = n(), popularity = round(mean(popularity), digits = 2), duration = round(mean(duration), digits = 2))
        each
    }

    album <- summary(data, "Album")
    live <- summary(data, "Live")

    sum_tbl <- data.frame(Performance_Type = c("Album", "Live"),
                          Count = c(album$num, live$num),
                          Popularity = c(album$popularity, live$popularity),
                          Duration = c(album$duration, live$duration))
    sum_tbl
}
count_performance_table(coldplay)
count_performance_table(metallica)
