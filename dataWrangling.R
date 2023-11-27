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
cleaned_df <- select(df, -c("Country ISO3", "Indicator Code"))
cleaned_df <- cleaned_df[-1, ]

df <- cleaned_df

# Creating a new categorical variable

# Creating a new continuous/numerical variable

# Creating at least one summarization data frame

##
Country Name: Categorical (String)
Year: Categorical (Character)
Indicator Name: Categorical (String)
Value: Continuous/Numerical (Double)
Month: Categorical (String)
Palestinians Injuries: Continuous/Numerical (Numeric)
Israelis Injuries: Continuous/Numerical (Numeric)
Palestinians Killed: Continuous/Numerical (Numeric)
Israelis Killed: Continuous/Numerical (Numeric)


