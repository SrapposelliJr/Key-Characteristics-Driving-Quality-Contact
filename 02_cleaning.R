library(tidyverse)

contact_data <- read_csv(
  "quality_of_contact_model/data/raw/statcast_2026_contact.csv"
)

model_data <- contact_data %>%
  select(
    player_name,
    xwoba,
    xba,
    launch_speed,
    launch_angle,
    attack_angle,
    attack_direction,
    swing_path_tilt,
    rate_ideal_attack_angle
  ) %>%
  drop_na()

write_csv(
  model_data,
  "quality_of_contact_model/data/processed/model_data.csv"
)

glimpse(model_data)
