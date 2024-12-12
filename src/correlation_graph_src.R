# Load necessary libraries
library(ggplot2)
library(reshape2)
library(RColorBrewer)

# Load the data from CSV file
data <- read.csv("C:/Users/aasth/OneDrive/data viz/project-2-infocrew/data/world-education-data.csv")

# Select relevant columns for correlation
data_corr <- data[, c("gov_exp_pct_gdp", "lit_rate_adult_pct", "pri_comp_rate_pct",
                      "pupil_teacher_primary", "pupil_teacher_secondary", 
                      "school_enrol_primary_pct", "school_enrol_secondary_pct", 
                      "school_enrol_tertiary_pct")]

# Calculate the correlation matrix
corr_matrix <- cor(data_corr, use = "complete.obs")

# Reshape the correlation matrix for ggplot
corr_melt <- melt(corr_matrix)

# Create the correlation heatmap
ggplot(corr_melt, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(colors = brewer.pal(11, "Spectral")) +  # Custom color scheme
  labs(title = "Correlation Heatmap of Educational Indicators", 
       x = "", 
       y = "", 
       fill = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(angle = 0, hjust = 1)) +
  coord_fixed()
