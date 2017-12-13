 Web scraping test


```r
install.packages("devtools")
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/zw/cz1_xqvs7tjdm7k7g661q2f00000gn/T//RtmpQdr2TK/downloaded_packages
```

```r
devtools::install_github("sellorm/rsay")
```

```
## Warning in strptime(x, fmt, tz = "GMT"): unknown timezone 'zone/tz/2017c.
## 1.0/zoneinfo/Europe/London'
```

```
## Skipping install of 'rsay' from a github remote, the SHA1 (1f38e6a2) has not changed since last install.
##   Use `force = TRUE` to force installation
```

```r
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
## ✔ tibble  1.3.4     ✔ dplyr   0.7.4
## ✔ tidyr   0.7.2     ✔ stringr 1.2.0
## ✔ readr   1.1.1     ✔ forcats 0.2.0
```

```
## ── Conflicts ─────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(rvest)
```

```
## Loading required package: xml2
```

```
## 
## Attaching package: 'rvest'
```

```
## The following object is masked from 'package:purrr':
## 
##     pluck
```

```
## The following object is masked from 'package:readr':
## 
##     guess_encoding
```

```r
library(rsay)
```

1. grab page into R

2. get second table node

3. use html_table() to parse into df

4. tidy and say it


```r
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
```

```
##                                                     title
## 1                                     Mark is our General
## 2                     Mark is our Great Sun of The Nation
## 3                                 Mark is our Wise Leader
## 4                               Mark is our Great Marshal
## 5 Mark is our Glorious General, Who Descended From Heaven
##                                                     dummy
## 1                                     Mark is our General
## 2                     Mark is our Great Sun of The Nation
## 3                                 Mark is our Wise Leader
## 4                               Mark is our Great Marshal
## 5 Mark is our Glorious General, Who Descended From Heaven
```

