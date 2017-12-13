#'  Web scraping test

install.packages("devtools")
devtools::install_github("sellorm/rsay")

library(tidyverse)
library(rvest)
library(rsay)

#' 1. grab page into R
#' 
#' 2. get second table node
#' 
#' 3. use html_table() to parse into df
#' 
#' 4. tidy and say it

set.seed(999)

read_html("https://en.wikipedia.org/wiki/List_of_Kim_Jong-il%27s_titles") %>% 
  html_nodes("table") %>%
  .[[1]] %>%
  html_table(fill = TRUE) %>% 
  dplyr::select(title = English) %>% 
  distinct() %>%
  mutate(title = paste("Mark is our", title)) %>% 
  sample_n(5) %>%
  mutate(dummy = walk(title, speak))
  

