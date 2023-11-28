library("stringr")
library(testthat)
library(dplyr)
library(readr)

# Reading the two independent datasets concerning the Israel and Palestine conflict
poverty_pse <- read_csv("FINAL PROJECT INFO 201/poverty_pse.csv")
Palestine_Body_Count <- read_csv("FINAL PROJECT INFO 201/Palestine Body Count.csv")

# Since the two columns representing years have different data types (character and double),
# we convert the 'Year' column to match the other.
Palestine_Body_Count <- mutate(Palestine_Body_Count, Year = as.character(Year))

# Joining the two datasets and creating one, unified dataset
df <- full_join(poverty_pse, Palestine_Body_Count, by = "Year")

# Cleaning the unified dataset by removing unnecessary rows and columns
df <- df[complete.cases(df[c("Indicator Name", "Country Name")]), ]
df <- select(df, -c("Country ISO3", "Indicator Code"))
df <- df[-1, ]

# Creating a new categorical variable
df <- mutate(df, Category = paste(`Indicator Name`, Year))

# Creating a new continuous/numerical variable
df <- mutate(df, 
             `Palestinians Killed` = as.numeric(`Palestinians Killed`), 
             `Israelis Killed` = as.numeric(`Israelis Killed`)
)
df <- mutate(df, Total_Killed = `Palestinians Killed` + `Israelis Killed`)

# Creating at least one summarization data frame


