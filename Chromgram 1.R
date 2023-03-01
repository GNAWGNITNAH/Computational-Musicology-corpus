library(tidyverse)
library(spotifyr)

girl <-
  get_tidy_audio_analysis("6rfWywxF7VQEBig0KfGOpU") |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

girl |>
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