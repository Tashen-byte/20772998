imdb_rating <- function(data){

   top_show <-  data %>%
    filter(type == "SHOW") %>%
        arrange(desc(imdb_score)) %>%
       select(title, type, release_year, genres, seasons, tmdb_score, imdb_score) %>%
       slice(1:10)
top_movie <- data %>%
    filter(type == "MOVIE") %>%
    arrange(desc(imdb_score)) %>%
    select(title, type, release_year, genres, tmdb_score, imdb_score) %>%
    slice(1:10)
top_notch <-
    list(Top_Movies = top_movie,
         Top_Shows = top_show)

top_notch

}

