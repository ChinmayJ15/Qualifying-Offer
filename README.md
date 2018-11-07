## Calculating the Qualifying Offer:

Following the instructions given, I chose to use R to calculate the Qualifying Offer. I chose to use R because I am familiar with its power as a tool for statistical analysis. I was also able to use R to generate relevant statistics and visuals

## Prerequisites

For this question, I chose to use R through the means of RStudio. To run this code, RStudio will be required, which can be found and installed online. I used 2 R libraries, rvest and ggplot2, to assist me with this task. rvest was used to scrape the data off of the given URL and ggplot2 was used to generate the added visuals. If these packages are not installed, you can install them using these commands on your R terminal:

```
install.packages("rvest")
install.packages("ggplot2")
```

## Deployment

No other outside resources aside from the R libraries will be needed for the execution of this code. The URL given stays the same, so the rvest package draws data from the static link within the code (internet connection provided). The rvest package also provides us the use of functions that allow us to cleanly pull the data from the HTML on the webpage. 

```
salary_data_html <- html_nodes(webpage,'.player-salary')
player_name_html <- html_nodes(webpage, '.player-name')
```

This function allows us to draw the requisite data from the CSS table within the webpage

```
player_name <- html_text(player_name_html)
salary_data <- html_text(salary_data_html)
```

This function lets us convert the drawn values from HTML to text, something we can further analyze

Subsequent functions used are native to R and allow us to trim the data to make it readable, and filter out erroneous data. These functions eliminate values that are either blank or have "no salary data", while also correcting values that have been mis-entered (multiple dollar signs). 

The ggplot2 functions are designed to create visuals that aid in understanding the salary data given and need the ggplot2 library to execute properly

## Built With

* [RStudio](https://www.rstudio.com/products/rstudio/download/) - written in RStudio

## Author

* **Chinmay Joshi**

## Resources Used

* [Analytics Vidhya](https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/) - was a great tool assisting with data scraping using R


##
