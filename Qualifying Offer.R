library("rvest")
library(ggplot2)

# The rvest library pulls data from the URL given 

url <- 'https://questionnaire-148920.appspot.com/swe/data.html'
webpage <- read_html(url)

# The html_nodes function pulls the player salaries from the HTML table  

salary_data_html <- html_nodes(webpage,'.player-salary')
player_name_html <- html_nodes(webpage, '.player-name')

# Converts the entries from HTML to Text

player_name <- html_text(player_name_html)
salary_data <- html_text(salary_data_html)

# Trims the Data to make it readable by R functions. This also serves to handle corrupted or malformed values. The first gsub function removes all dollar signs
# Salary entries, which takes care of the values that had multiple dollar signs, and the as.numeric function, discards any entries that do not have numerical
# value, removing the issues with entries that have "No Salary Data" or blank as their values.

salary_data <- gsub("[\\$]","",salary_data)
salary_data <- gsub(",", "", salary_data)
player_name <- as.factor(player_name)
salary_data <- as.numeric(salary_data)

# Gives basic 1-dimensional summary data about the player salaries throughout the MLB

summary(salary_data)

# Creates a dataframe with all the player name and salary data, this is necessary in order to make visualizations of the data

table_data <- data.frame(Name = player_name, Salary = salary_data)

# Creates and empty vector with the highest 125 salaries in the table given

v <- tail(sort(salary_data), 125)

# Uses basic arithmetic to calculate the value of the Qualifying Offer and then prints the value 

Qualifying <- sum(v)/125
cat("The Qualifying Offer comes out to be : ", Qualifying)

# The first plot just gives a visual of how salaries in the MLB copmare to one another. Each salary is plotted on a bar chart with the Y axis representing
# dollar value of the salary. This visual is meant to show how salaries in the MLB compare to one another, and roughly how much the top 125 earning players
# relative to the others

ggplot(table_data, aes(reorder(Name, -Salary), Salary)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + 
  labs(title ="Comparison of MLB Player Salaries", x = "Players", y = "Salaries (Dollars)") 
  
# This visual is a hostogram of all salaries in the MLB. Each salary is plotted on the x-axis, with the y-axis indicating the frequency of players with that salary.
# This visual is designed to show the frequencies of MLB pay grades.

ggplot(table_data, aes(Salary)) +
  geom_histogram(fill="Navy") +
  labs(title ="Histogram of MLB Player Salaries", x = "Player Salaries (Dollars)", y = "Count") 
  

# Note: https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/ 
# This was a great resource in getting me acquainted with scraping data off of a webpage using R, something that I had little prior experience with



