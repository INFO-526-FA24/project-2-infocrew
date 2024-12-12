# Load necessary libraries
library
library(dplyr)

# Load the data from CSV file
data <- read.csv("C:/Users/aasth/OneDrive/data viz/project-2-infocrew/data/world-education-data.csv")


pakistan_data <- data %>% filter(country_code == "PAK")

# Inspect the data (optional)
head(pakistan_data)

# Create the plot for Pakistan with specific colors for each line
ggplot(pakistan_data, aes(x = year)) +
  geom_line(aes(y = gov_exp_pct_gdp, color = 'Govt Expenditure (% of GDP)'), size = 1) +
  geom_point(aes(y = gov_exp_pct_gdp, color = 'Govt Expenditure (% of GDP)'), size = 2) +
  geom_line(aes(y = lit_rate_adult_pct, color = 'Literacy Rate for Adults (%)'), size = 1) +
  geom_point(aes(y = lit_rate_adult_pct, color = 'Literacy Rate for Adults (%)'), size = 2) +
  geom_line(aes(y = pri_comp_rate_pct, color = 'Primary Completion Rate (%)'), size = 1) +
  geom_point(aes(y = pri_comp_rate_pct, color = 'Primary Completion Rate (%)'), size = 2) +
  labs(title = "Trends of Educational Indicators in Pakistan (1999-2004)",
       x = "Year",
       y = "Percentage",
       color = "Indicators") +
  scale_color_manual(values = c('Govt Expenditure (% of GDP)' = 'blue', 
                                'Literacy Rate for Adults (%)' = 'green', 
                                'Primary Completion Rate (%)' = 'red')) +
  theme_minimal() +
  theme(legend.position = "top")
