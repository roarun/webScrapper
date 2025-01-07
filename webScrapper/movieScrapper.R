library(rvest)
library(dplyr)

# Read website
link <- "https://www.sfu.ca/~haoluns/forecast.html"
page <- read_html(link)

# parsing and saving into variables
period <- page %>% html_nodes(".period-name") %>% html_text()
weather_desc <- page %>% html_nodes(".short-desc") %>% html_text()
temp <- page %>% html_nodes(".temp") %>% html_text()

# creating a dataframe
df <- data.frame(period,weather_desc,temp, stringsAsFactors = FALSE)

#view the data frame
View(df)

# creating a csv file
write.table(df, "301557420.csv", sep =",", row.names = F, col.names = F)
