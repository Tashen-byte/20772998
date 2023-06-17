studio_comparison <- function(data){
compare <- data %>%
    group_by(lead_studio) %>%
    summarise(Audience_Score_percent = round(mean(audience_score_percent, na.rm = T), digit = 2),
              Profitability = round(mean(profitability, na.rm = T), digit = 2),
              World_Gross = round(mean(worldwide_gross, na.rm = T), digit = 2),
              Rotten = round(mean(rotten_tomatoes_percent, na.rm = T), digit = 2)
              ) %>%
    arrange(Audience_Score_percent)
compare
}

