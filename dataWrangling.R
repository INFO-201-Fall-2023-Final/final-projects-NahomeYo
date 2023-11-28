library("stringr")
library(testthat)
library(dplyr)
library(readr)

# Reading the two independent datasets concerning the Israel and Palestine conflict
poverty_pse <- read_csv("C:/Users/nahom/final-projects-NahomeYo/poverty_pse.csv")
Palestine_Body_Count <- read_csv("C:/Users/nahom/final-projects-NahomeYo/Palestine Body Count.csv")

# Since the two columns representing years have different data types (character and double),
# we convert the 'Year' column to match the other.
poverty_pse$Year <- as.character(poverty_pse$Year)
Palestine_Body_Count$Year <- as.character(Palestine_Body_Count$Year)

# Joining the two datasets and creating one, unified dataset
df <- merge(poverty_pse, Palestine_Body_Count, by = "Year")

# Cleaning the unified dataset by removing unnecessary rows and columns
df <- df[!is.na(df$Year), , drop = FALSE]
df <- select(df, -c("Country ISO3", "Indicator Code", 'Palestinians Injuries', 'Israelis Injuries'))

# Creating a new categorical variable called "Poverty_Level" that categorizes observations into different 
# poverty levels based on the "Value" column, with "Medium Poverty" for values between 10 and 20,
# "High Poverty" for values above 20, and NA for values below 10.
df$Poverty_Level <- ifelse(df$Value >= 10 & df$Value <= 20, "Medium Poverty", NA)
df$Poverty_Level <- ifelse(df$Value > 20, "High Poverty", df$Poverty_Level)
df$Poverty_Level[is.na(df$Poverty_Level)] <- "Low Poverty"


# Creating a new continuous/numerical variable called "Total_Killed" that indicates
# the total number of causalities of Palestinians and Israelis 
df <- mutate(df, `Palestinians Killed` = as.numeric(`Palestinians Killed`), `Israelis Killed` = as.numeric(`Israelis Killed`)
)
df <- mutate(df, Total_Killed = `Palestinians Killed` + `Israelis Killed`)

# Creating at least one summarization data frame
summarize_df <- summarise(group_by(df, Year), Average_Total_Killed = mean(Total_Killed))