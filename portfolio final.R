install.packages('spotifyr')
install.packages('tidyverse')
install.packages('knitr',dependencies = TRUE)
install.packages('ggjoy')
install.packages("ggplot2",dependencies = TRUE)

library(tidyverse)
library(spotifyr)

revolver <- get_album_tracks("3PRoXYsngSwjEQWR5PsHWR")
the_dark_side_of_the_moon <- get_album_tracks("2WT1pbYjLJciAR26yMebkH")
are_you_experienced <- get_album_tracks("7rSZXXHHvIhF4yUFdaOCy9")
a_night_at_the_opera<- get_album_tracks("1GbtB4zTqAsyfZEsm1RZfx")
rumours <- get_album_tracks("1bt6q2SruMsBtcerNVtpZB")

English_rock <-
  bind_rows(
    revolver |> mutate(category = "E_rock1"),
    the_dark_side_of_the_moon |> mutate(category = "E_rock2"),
    are_you_experienced |> mutate(category = "E_rock3"),
    a_night_at_the_opera |> mutate(category = "E_rock4"),
    rumours |> mutate(category = "E_rock5")
  )

Rocknroll_on_the_new_long_march <- get_album_tracks("28vZ0gCHZ3Me1c8chHt4LF")
black_dream <- get_album_tracks("3zpWCeI1YrALZLyD4KhSYX")
omnipotent_youth_society <- get_album_tracks("6gApmv7Klo2uuyTxWkPzXb")
black_panther <- get_album_tracks( "33dKa7Yept397zPl3myqoz")
tang_dynasty <- get_album_tracks( "20ygpcBZI24gCEE2aGuyvn")

Chinese_rock <-
  bind_rows(
    Rocknroll_on_the_new_long_march |> mutate(category = "C_rock1"),
    black_dream |> mutate(category = "C_rock2"),
    omnipotent_youth_society |> mutate(category = "C_rock3"),
    black_panther |> mutate(category = "C_rock4"),
    tang_dynasty |> mutate(category = "C_rock5")
  )

Chinese_and_English_Rock <- get_playlist_audio_features("", "2NEXYKUJSm74TMdKyOdWbY")
Chinese_Rock <- get_playlist_audio_features("", "2NeZgBftsdK7fFZcu67aUW")
English_Rock <- get_playlist_audio_features("", "3PImZaqq5HuQxKHHhiXYaN")

instrumentalness <-
  bind_rows(
    Chinese_Rock |> mutate(category = "C_rock"),
    English_Rock |> mutate(category = "E_rock")
  )

instrumentalness |>                   
  mutate(mode = ifelse(mode == 0, "C_rock", "E_rock")) |>
  ggplot(aes(x = instrumentalness, y = speechiness, size = loudness, colour = mode))+
  geom_point() +             
  geom_rug(linewidth = 0.1) + 
  geom_text(aes(x = instrumentalness,y = speechiness),category = c("C_rock", "E_rock"), instrumentalness = c(0.090, 0.123), 
            speechiness = c(0.101, 0.967)),
colour = "black", size = 3, hjust = "left", vjust = "bottom", nudge_x = -0.05, nudge_y = 0.02) +
  facet_wrap(~ category) +
  scale_x_continuous( limits = c(0, 1), breaks = c(0, 0.50, 1), minor_breaks = NULL) +
  scale_y_continuous( limits = c(0, 1),breaks = c(0, 0.50, 1),minor_breaks = NULL) +
  scale_colour_brewer( type = "qual", palette = "Paired") +
  scale_size_continuous(trans = "exp",guide = "none") +
  theme_light() +             
  labs( x = "instrumentalness", y = "speechiness",colour = "Mode")    

instrumentalness |>
  ggplot(
    aes(x = instrumentalness, y = speechiness)) +
  geom_smooth() +
  facet_wrap(~category)












install.packages("flexdashboard")
