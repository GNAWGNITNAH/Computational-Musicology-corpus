remotes::install_github('jaburgoyne/compmus')
library(tidyverse)
library(spotifyr)
library(compmus)

Hell <-
get_tidy_audio_analysis("2zYzyRzz6pRmhPzyfMEC8s") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

Hell |>
  mutate(pitches = map(pitches, compmus_normalise, "euclidean")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  theme_minimal() +
  scale_fill_viridis_c()



gig <-
  get_tidy_audio_analysis("25tZHMv3ctlzqDaHAeuU9c") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

gig |>
  mutate(pitches = map(pitches, compmus_normalise, "euclidean")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  theme_minimal() +
  scale_fill_viridis_c()