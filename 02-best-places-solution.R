library(tidyverse)
library(rvest)

## SPERLING'S BEST PLACES 
# SOLUTION CODE USING DES MOINES, IOWA AS A DEMO

# TASK 1: Look up the cost of living for your hometown on 
# Sperling's Best Places website: http://www.bestplaces.net/ 
# Then, extract it with `html_elements()` and `html_text2()`

# download the HTML page
dsm <- read_html("https://www.bestplaces.net/cost_of_living/city/iowa/des_moines")

# extract the cost of living value
col <- html_elements(dsm, css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)")
html_text2(col)

# do the same thing using a piped operation
dsm %>%
  html_elements(css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)") %>%
  html_text2()


# TASK 2: Get the first table and convert it to a data frame.
# To exact tables use the rvest function html_table()

# extract the first table
tables <- html_elements(dsm, css = "table")
html_table(tables, header = TRUE, fill = TRUE)[[1]]



# TASK 3: Extract the climate statistics table of your hometown

dsm_climate <- read_html("http://www.bestplaces.net/climate/city/iowa/des_moines")

# extract the climate table and put it into a data frame
climate <- html_elements(dsm_climate, css = "table")
html_table(climate, header = TRUE, fill = TRUE)[[1]]

