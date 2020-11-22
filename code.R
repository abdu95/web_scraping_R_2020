library(rvest)
library(data.table)

rm(list=ls())

# to get a web page, pass URL to read_html 
file_html <- read_html('https://www.vox.com/search?page=1&q=Biden')

# save as html file
write_html(file_html, 'index.html')

headings <- 
  file_html %>% 
  html_nodes('.c-entry-box--compact__title') %>% 
  html_text()
headings

posted_date <- 
  file_html %>% 
  html_nodes('time') %>% 
  html_text(trim = TRUE)

# posted_date <- 
#  file_html %>% 
#  html_nodes('.c-byline__item span') %>% 
#  html_text() 

posted_date

dates <- file_html %>% 
  html_nodes('time') %>% 
  html_attrs() %>% 
  map(1) %>% 
  # Parse the string into a datetime object with lubridate
  ymd_hms() %>%                 
  unlist()


author <- 
  file_html %>% 
  html_nodes('.c-byline__author-name') %>% 
  html_text()
author


author <- 
  file_html %>% 
  html_nodes('.c-byline__item') %>% 
  html_text(trim = TRUE) 
author





author <- 
  file_html %>% 
  html_nodes('.c-byline__item') %>% 
  .[[2]] %>% 
  html_text() 


results <- file_html %>% html_nodes('.c-byline__item')

second_result <- results[2]
second_result %>% html_nodes("time")
date <- second_result %>% html_nodes("time") %>% html_text(trim = TRUE)

xml_contents(second_result)


# alternative for trim = TRUE:
# author <- gsub("[\n]", "", author)
# author <- trimws(author)
# if date contains Updated, remove Updated
