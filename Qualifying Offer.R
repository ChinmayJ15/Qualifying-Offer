library("rvest")
library(ggplot2)

# The rvest library pulls data from the URL given 

url <- 'https://questionnaire-148920.appspot.com/swe/data.html'
webpage <- read_html(url)

#The html_nodes function pulls the player salaries from the HTML table  
salary_data_html <- html_nodes(webpage,'.player-salary')
player_name_html <- html_nodes(webpage, '.player-name')
player_name <- html_text(player_name_html)
salary_data <- html_text(salary_data_html)
salary_data <- gsub("[\\$]","",salary_data)
salary_data <- gsub(",", "", salary_data)
#head(salary_data)
player_name <- as.factor(player_name)
salary_data <- as.numeric(salary_data)
#head(player_name)

table_data <- data.frame(Name = player_name, Salary = salary_data)
str(table_data)

v <- tail(sort(salary_data), 125)

Qualifying <- sum(v)/125
head(Qualifying)

ggplot(table_data, aes(Salary)) + 
  geom_density()
  



