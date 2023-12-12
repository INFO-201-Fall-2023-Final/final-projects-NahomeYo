library("stringr")
library(testthat)
library(dplyr)
library(readr)

# Reading the two independent datasets concerning the Israel and Palestine conflict
poverty_pse <- read_csv("poverty_pse.csv")
Palestine_Body_Count <- read_csv("Palestine Body Count.csv")

# Converting the 'Year' columns to have consistent data types (character)
poverty_pse$Year <- as.character(poverty_pse$Year)
Palestine_Body_Count$Year <- as.character(Palestine_Body_Count$Year)

# Joining the two datasets and creating one, unified dataset based on the 'Year' column
df <- merge(poverty_pse, Palestine_Body_Count, by = "Year")

# Convert "Value" column to numeric
df <- mutate(df, Value = as.numeric(Value))

# Cleaning the unified dataset by removing rows with NA 'Year' values
df <- df[!is.na(df$Year) & !is.na(df$Year), ]

# Removing unnecessary columns and rows unrelated to this dataset's purpose
df <- select(df, -c("Country ISO3", "Indicator Code", 'Palestinians Injuries', 'Israelis Injuries'))

# Declaring indicator categories with the indicator names categorized into "levels" of poverty
low_poverty <- c(
  "Survey mean consumption or income per capita, total population (2017 PPP $ per day)",
  "Annualized average growth rate in per capita real survey mean consumption or income, total population (%)"
)

medium_poverty <- c(
  "Population living in slums (% of urban population)",
  "Income share held by second 20%",
  "Income share held by third 20%",
  "Income share held by fourth 20%",
  "Income share held by highest 20%",
  "Income share held by highest 10%",
  "Proportion of people living below 50 percent of median income (%)",
  "Gini index",
  "Multidimensional poverty headcount ratio (% of total population)",
  "Multidimensional poverty headcount ratio, household (% of total households)",
  "Multidimensional poverty intensity (average share of deprivations experienced by the poor)",
  "Multidimensional poverty index (scale 0-1)",
  "Poverty headcount ratio at national poverty lines (% of population)"
)

# Creating a new categorical variable called "Poverty_Level" based on both the categorized indicator names and frequency by year
df <- mutate(df, Poverty_Level = ifelse(`Indicator Name` %in% low_poverty, paste("low_poverty"),
                                             ifelse(`Indicator Name` %in% medium_poverty, paste("medium_poverty"),
                                                    paste("high_poverty"))))

# Creating a new continuous/numerical variable called "Total_Killed" that indicates
# the total number of casualties of Palestinians and Israelis  
df <- mutate(df, `Palestinians Killed` = as.numeric(`Palestinians Killed`), `Israelis Killed` = as.numeric(`Israelis Killed`))
df <- mutate(df, Total_Killed = `Palestinians Killed` + `Israelis Killed`)

# Creating at least one summarization data frame, summarizing the most frequent poverty level and total casualties each year.
summarize_df <- summarise(group_by(df, Year, Poverty_Level), Average_Total_Killed = mean(Total_Killed))

yearly_subsets <- list()

for (year in 2002:2020) {
  yearly_subsets[[as.character(year)]] <- filter(df, Year == as.character(year))
}

arranged_df <- arrange(summarize_df, Year, str_c(Average_Total_Killed))
grouped_df <- group_by(arranged_df, Year)
summarize_df <- summarise(
  grouped_df,
  Poverty_Level = str_c(Poverty_Level[1]),
  Average_Total_Killed = as.numeric(Average_Total_Killed[1])
)