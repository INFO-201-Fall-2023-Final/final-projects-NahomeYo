library("stringr")
library(testthat)
library(dplyr)
library(readr)

# Reading the two independent datasets concerning the Israel and Palestine conflict
poverty_pse <- read_csv("C:/Users/nahom/final-projects-NahomeYo/poverty_pse.csv")
Palestine_Body_Count <- read_csv("C:/Users/nahom/final-projects-NahomeYo/Palestine Body Count.csv")

# Convert the 'Year' columns to have consistent data types (character)
poverty_pse$Year <- as.character(poverty_pse$Year)
Palestine_Body_Count$Year <- as.character(Palestine_Body_Count$Year)

# Joining the two datasets and creating one, unified dataset based on the 'Year' column
df <- merge(poverty_pse, Palestine_Body_Count, by = "Year")

# Convert "Value" column to numeric
df <- mutate(df, Value = as.numeric(Value))

# Cleaning the unified dataset by removing rows with missing 'Year' values
df <- df[!is.na(df$Year) & !is.na(df$Year), ]

# Removing unnecessary columns and rows
df <- select(df, -c("Country ISO3", "Indicator Code", 'Palestinians Injuries', 'Israelis Injuries'))

# Creating a new categorical variable called "Poverty_Level" based on the "Value" column
# Categories: "low poverty" for values below 20, "medium poverty" for values between 20 and 40,
# "high poverty" for values above 40
df$Poverty_Level <- ifelse(df$Value > 40, "high", ifelse(df$Value > 20, "medium", "low"))
df <- df[!is.na(df$Poverty_Level), ]

# Creating a new continuous/numerical variable called "Total_Killed" that indicates
# the total number of casualties of Palestinians and Israelis 
df <- mutate(df, `Palestinians Killed` = as.numeric(`Palestinians Killed`), `Israelis Killed` = as.numeric(`Israelis Killed`))
df <- mutate(df, Total_Killed = `Palestinians Killed` + `Israelis Killed`)

# Creating at least one summarization data frame
summarize_df <- summarise(group_by(df, Year, Poverty_Level), Average_Total_Killed = mean(Total_Killed))
arranged_df <- arrange(summarize_df, Year, str_c(Average_Total_Killed))
grouped_df <- group_by(arranged_df, Year)
summarized_df <- summarise(
  grouped_df,
  Poverty_Level = str_c(Poverty_Level[1]),
  Average_Total_Killed = as.numeric(Average_Total_Killed[1])
)