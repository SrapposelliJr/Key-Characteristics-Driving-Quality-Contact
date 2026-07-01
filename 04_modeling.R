library(tidyverse)

model_data <- read_csv(
  "quality_of_contact_model/data/processed/model_data.csv"
)

# Model 1
model1 <- lm(
  xwoba ~ launch_speed,
  data = model_data
)

summary(model1)

# Model 2
model2 <- lm(
  xwoba ~ launch_speed +
    launch_angle +
    attack_angle +
    attack_direction +
    swing_path_tilt +
    rate_ideal_attack_angle,
  data = model_data
)

summary(model2)

# Model 3
model3 <- lm(
  xwoba ~ launch_speed +
    swing_path_tilt +
    rate_ideal_attack_angle,
  data = model_data
)

summary(model3)

ggplot(model_data,
       aes(x = swing_path_tilt,
           y = xwoba)) +
  geom_point(alpha = .6) +
  geom_smooth(method = "lm") +
  labs(
    title = "Swing Path Tilt vs xwOBA",
    x = "Swing Path Tilt",
    y = "xwOBA"
  )
  ggplot(model_data,
       aes(x = swing_path_tilt,
           y = xwoba)) +
  geom_point(alpha = .6) +
  geom_smooth(method = "lm") +
  labs(
    title = "Swing Path Tilt vs xwOBA",
    x = "Swing Path Tilt",
    y = "xwOBA"
  )
  model_results <- data.frame(
  Model = c("Launch Speed Only",
            "Full Model",
            "Reduced Model"),
  R2 = c(.266, .342, .318)
)

ggplot(model_results,
       aes(x = Model,
           y = R2)) +
  geom_col() +
  labs(
    title = "Model Performance Comparison",
    y = "R²",
    x = ""
  )
  ggplot(model_results,
       aes(x = Model,
           y = R2)) +
  geom_col(width = .6) +
  labs(
    title = "Model Performance Comparison",
    y = "R²",
    x = ""
  ) +
ggplot(model_results,
       aes(x = Model,
           y = R2)) +
  geom_col(width = .6) +
  labs(
    title = "Model Performance Comparison",
    y = "R²",
    x = ""
  ) +
  theme_minimal()
  model_results <- data.frame(
  Model = factor(
    c("Launch Speed Only", "Reduced Model", "Full Model"),
    levels = c("Launch Speed Only", "Reduced Model", "Full Model")
  ),
  R2 = c(.266, .318, .342)
)
model_results <- data.frame(
  Model = factor(
    c("Launch Speed Only", "Reduced Model", "Full Model"),
    levels = c("Launch Speed Only", "Reduced Model", "Full Model")
  ),
  R2 = c(.266, .318, .342)
)

ggplot(model_results, aes(x = Model, y = R2, fill = Model)) +
  geom_col(width = 0.6) +
  geom_text(
    aes(label = round(R2, 3)),
    vjust = -0.5,
    size = 5
  ) +
  scale_fill_manual(
    values = c(
      "Launch Speed Only" = "#6C757D",
      "Reduced Model" = "#2A9D8F",
      "Full Model" = "#E76F51"
    )
  ) +
  labs(
    title = "Impact of Bat-Tracking Metrics on Model Performance",
    subtitle = "Adding swing characteristics improved explanatory power beyond launch speed alone",
    x = "",
    y = "R²"
  ) +
  ylim(0, 0.40) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 11),
    axis.text.x = element_text(size = 11),
    axis.text.y = element_text(size = 11),
    axis.title.y = element_text(size = 12)
  )
