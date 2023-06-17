coldplay <- read_csv("C:/Users/tashe/Desktop/20772998/Question 3/data/Coldplay_vs_Metallica/Coldplay.csv ")
coldplay$name[55] <- gsub("A Head Full of Dreams", "A Head Full of Dreams - Live", coldplay$name[55])
coldplay <- coldplay %>%
    mutate(performance_type = ifelse(grepl("Live", coldplay$name, ignore.case = TRUE), "Live", "Album"))

metallica <- read_csv("C:/Users/tashe/Desktop/20772998/Question 3/data/Coldplay_vs_Metallica/metallica.csv")

  metallica <- metallica %>%
      mutate(performance_type = ifelse(grepl("Live", metallica$name, ignore.case = TRUE), "Live", ifelse(grepl("NOT", metallica$name, ignore.case =T),"Album", "Album"))) %>%
    mutate(duration_ms = duration_ms/1000) %>%
    rename("duration" = duration_ms) %>%
    rename("album_name" = album)

