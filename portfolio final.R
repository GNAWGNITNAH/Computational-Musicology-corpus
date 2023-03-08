library(tidyverse)
library(spotifyr)
library(plotly)

revolver <- get_album_tracks("3PRoXYsngSwjEQWR5PsHWR")
the_dark_side_of_the_moon <- get_album_tracks("2WT1pbYjLJciAR26yMebkH")
are_you_experienced <- get_album_tracks("7rSZXXHHvIhF4yUFdaOCy9")
a_night_at_the_opera<- get_album_tracks("1GbtB4zTqAsyfZEsm1RZfx")
rumours <- get_album_tracks("1bt6q2SruMsBtcerNVtpZB")


Rocknroll_on_the_new_long_march <- get_album_tracks("28vZ0gCHZ3Me1c8chHt4LF")
black_dream <- get_album_tracks("3zpWCeI1YrALZLyD4KhSYX")
omnipotent_youth_society <- get_album_tracks("6gApmv7Klo2uuyTxWkPzXb")
black_panther <- get_album_tracks( "33dKa7Yept397zPl3myqoz")
tang_dynasty <- get_album_tracks( "20ygpcBZI24gCEE2aGuyvn")



English_rock <-
  bind_rows(
    revolver |> mutate(category = "E_rock1"),
    the_dark_side_of_the_moon |> mutate(category = "E_rock2"),
    are_you_experienced |> mutate(category = "E_rock3"),
    a_night_at_the_opera |> mutate(category = "E_rock4"),
    rumours |> mutate(category = "E_rock5")
  )

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

C_and_E_rock <-
  bind_rows(
    Chinese_rock |> mutate(category = "Chinese_Rock"),
    English_rock |> mutate(category = "English_Rock")
  )

 C_and_E_rock |>                   
   ggplot(C_and_E_rock, aes(x = acousticness, y = instrumentalness, size = loudness, colour = category)) +
   geom_jitter() +
   
   ggploty()
  

