library("stringr")
library(testthat)
library(dplyr)
library(readr)

# Reading the two independent datasets concerning the Israel and Palestine conflict
poverty_pse <- read_csv("FINAL PROJECT INFO 201/poverty_pse.csv")
Palestine_Body_Count <- read_csv("FINAL PROJECT INFO 201/Palestine Body Count.csv")

# Since the two columns representing years have different data types (character and double),
# we convert the 'Year' column to match the other.
poverty_pse$Year <- as.character(poverty_pse$Year)
Palestine_Body_Count$Year <- as.character(Palestine_Body_Count$Year)

# Joining the two datasets and creating one, unified dataset
df <- left_join(poverty_pse, Palestine_Body_Count, by = "Year")

# Cleaning the unified dataset by removing unnecessary rows and columns
df <- select(df, -c("Country ISO3", "Indicator Code", 'Palestinians Injuries', 'Israelis Injuries'))
df <- df[-1, ]

# Creating a new categorical variable called "PopularityLevel" that indicates the
# popularity status of each combination of "Indicator Name", "Year", and "Month"
df <- group_by(df, `Indicator Name`, Year)
df <- mutate(df, Frequency = n())
df <- ungroup(df)

df <- mutate(df, PopularityLevel = ifelse(Frequency > 12, "Popular", 
                                          ifelse(Frequency < 12, "Kinda Popular", "Not Popular")))
df <- select(df, -Frequency)

# Creating a new continuous/numerical variable called "Total_Killed" that indicates
# the total number of casualities of Palestinains and israelis 
df <- mutate(df, 
             `Palestinians Killed` = as.numeric(`Palestinians Killed`), 
             `Israelis Killed` = as.numeric(`Israelis Killed`)
)
df <- mutate(df, Total_Killed = `Palestinians Killed` + `Israelis Killed`)


# Creating at least one summarization data frame
summary_df <- summarise(group_by(df, Year), Average_Total_Killed = mean(Total_Killed))
print(summary_df)