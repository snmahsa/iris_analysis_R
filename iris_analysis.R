# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset from the CSV file
iris_data <- read.csv("iris.csv")

# Display a summary of the data
print(summary(iris_data))

# Check unique species in the dataset
print(unique(iris_data$species))  # Assuming the species column is named "species"

# Data analysis: Calculate mean sepal and petal dimensions by species
summary_data <- iris_data %>%
  group_by(species) %>%
  summarise(mean_sepal_length = mean(sepal_length),
            mean_sepal_width = mean(sepal_width),
            mean_petal_length = mean(petal_length),
            mean_petal_width = mean(petal_width))

# Display the results of the analysis
print(summary_data)

# Visualization: Boxplot for petal length by species
ggplot(iris_data, aes(x = species, y = petal_length, fill = species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Petal Length by Species",
       x = "Species",
       y = "Petal Length") +
  theme_minimal()

# Visualization: Scatter plot of petal length vs. petal width
ggplot(iris_data, aes(x = petal_length, y = petal_width, color = species)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Petal Length vs. Petal Width",
       x = "Petal Length",
       y = "Petal Width") +
  theme_minimal()
