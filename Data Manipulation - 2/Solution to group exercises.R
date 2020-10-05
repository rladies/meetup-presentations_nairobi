library("tidyverse")
library("lubridate")
library("readxl")

tins <- read_excel("Practise_df.xlsx", sheet = 1)

tins2 <- read_excel("Practise_df.xlsx", sheet = 2)

## 1. Append
app2 <- bind_rows(tins,tins2)

## 2.Convert from wide to long
wide_df <- pivot_longer(app2, `44109`:`44170`, names_to = "Date_var", values_to = "Death_count")


## 3. Identify all the rows where the country == Belarus
wide_df <- wide_df %>%
  mutate(letter_b = str_detect(`Country/Region`, "Belarus"))


## 4. Convert the date column from numbers into actual dates
wide_df <- wide_df %>%
  ## Convert the date into numeric first
  mutate(Date_var = as.numeric(Date_var)) %>%
  ## When converting to date, we have to define the origin,
  ## which Excel is December 30, 1899.
  mutate(Date_var = as.Date(Date_var, origin = "1899-12-30")) %>%
  ## Extract the year
  mutate(year_var = year(Date_var))






