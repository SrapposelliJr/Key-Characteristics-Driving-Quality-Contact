library(tidyverse)

# Load cleaned data
model_data <- read_csv(
  "quality_of_contact_model/data/processed/model_data.csv"
)

# Create correlation dataset
cor_data <- model_data %>%
  select(
    xwoba,
    launch_speed,
    launch_angle,
    attack_angle,
    attack_direction,
    swing_path_tilt,
    rate_ideal_attack_angle
  )

# Print correlation matrix
cor(cor_data)
