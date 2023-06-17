overall_mean <- function(avg){

    overall <- avg %>%
    summarise(Cloud_Cover = round(mean(avg$mean_cloud_cover), digits = 3),
                     Sunshine = round(mean(avg$mean_sunshine), digits = 3),
                     Precipitation = round(mean(avg$mean_precipitation), digits = 3),
                     Snow = round(mean(avg$mean_snow_depth, na.rm= T), digits = 3))
    overall_tbl <- as.data.frame(t(overall))
    colnames(overall_tbl) <- "Average"

   overall_tbl$Percentage <- paste(round(overall_tbl$Mean/sum(overall_tbl$Mean)*100, digits = 3), "%" )

   overall_tbl
}


