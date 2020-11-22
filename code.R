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
