library(shiny)
library(vroom)
library(tidyverse)

dir.create("neiss")
download <- function(name) {
  url <- "https://github.com/hadley/mastering-shiny/raw/master/neiss/"
  download.file(paste0(url,name), paste0("neiss/",name), quiet = TRUE)
}
download("injuries.tsv.gz")
download("population.tsv")
download("products.tsv")

injuries <- vroom::vroom("neiss/injuries.tsv.gz")
injuries
products <- vroom::vroom("neiss/products.tsv")
products
population <- vroom::vroom("neiss/population.tsv")
population


selected <- injuries %>%filter(prod_code == 611)
nrow(selected)

selected %>% count(location, sort = TRUE)
selected %>% count(body_part, sort = TRUE)
selected %>% count(age, wt = weight, sort = TRUE)
selected %>% count(diag, sort = TRUE)

summary <- selected %>% 
  count(age,sex, wt = weight) %>%
  left_join(population, by = c("age","sex")) %>%
  mutate(rate = n / population * 1e4)
  
summary

summary %>% 
  ggplot(aes(age, rate, colour = sex)) + geom_line(na.rm = TRUE) + theme_bw() +
  labs(y = "Injuries per 10,000 people")

selected %>% 
  sample_n(10) %>%
  pull(narrative)
