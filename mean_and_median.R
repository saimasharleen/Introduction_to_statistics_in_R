library(dplyr)
food_consumption <- read_csv('data/food_consumption.csv',show_col_types = FALSE)
head(food_consumption, 5)
# Filter for Belgium
belgium_consumption <- food_consumption %>%
  filter(country == "Belgium")

# Filter for USA
usa_consumption <- food_consumption %>%
  filter(country == "USA")

# Calculate mean and median consumption in Belgium
mean(belgium_consumption$consumption)
median(belgium_consumption$consumption)

# Calculate mean and median consumption in USA
mean(usa_consumption$consumption)
median(usa_consumption$consumption)
# Filter food_consumption for rows with data about Belgium and the USA. Group the filtered data by country. 
# Calculate the mean and median of the kilograms of food consumed per person per year in each country. Call these columns mean_consumption and median_consumption
food_consumption %>%
  # Filter for Belgium and USA
  filter(country %in% c("Belgium", "USA")) %>%
  # Group by country
  group_by(country, consumption) %>%
  # Get mean_consumption and median_consumption
  summarize(mean_consumption = mean(consumption),
      median_consumption = median(consumption))
