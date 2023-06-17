overall_mean <- function(data){

    overall <- data %>%
    summarise(Cloud_Cover = round(mean(cloud_cover, na.rm = T), digits = 3),
                     Sunshine = round(mean(sunshine, na.rm = T), digits = 3),
                     Precipitation = round(mean(precipitation, na.rm = T), digits = 3),
                     Snow = round(mean(snow_depth, na.rm = T), digits = 3))
    overall_tbl <- as.data.frame(t(overall))
    colnames(overall_tbl) <- "Average"

   overall_tbl$Percentage <- paste(round(overall_tbl$Average/sum(overall_tbl$Average)*100, digits = 3), "%" )

   overall_tbl
}

