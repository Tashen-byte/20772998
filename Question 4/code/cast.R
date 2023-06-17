
name_occ <- function(data, names){
    cun <- sapply(names, function(name) sum(data == name, na.rm =T))
    res <- data.frame(Name = names, Count = counts)
    res
}



credits_specific <- credits %>%
    select(id, name, role)

x <- titles %>%
    filter(type == "SHOW") %>%
    arrange(desc(imdb_score)) %>%
    select(id, title, type, release_year, genres, seasons, imdb_score, tmdb_score) %>%
    slice(1:10)
y <- x %>%
    left_join(credits_specific, by = "id")

y %>% distinct(name)

x1 <- titles %>%
    filter(type == "MOVIE") %>%
    arrange(desc(imdb_score)) %>%
    select(id, title, type, release_year, genres, seasons, imdb_score, tmdb_score) %>%
    slice(1:10)
y1 <- x1 %>%
    left_join(credits_specific, by = "id")
y1 %>%
    distinct(name)
