library(tidyverse)
library(janitor)
library(palmerpenguins)
library(here)
library(renv)

here::here()

source(here("functions", "cleaning.R"))



dir.create(here("data"))

penguins_raw <- read.csv(here("data", "penguins_raw.csv"))

View(penguins_raw)

#penguins_clean <- select(penguins_raw, -Comments)
#penguins_clean <- select(penguins_raw, -starts_with("Delta"))

cleaning_columns <- function(raw_data){
  raw_data %>% 
    select(-Comments) %>% 
    select(-starts_with("Delta")) %>%  #improved with %>% from above 
    clean_names() %>% 
    shorten_species() %>% 
    remove_empty(c("rows","cols")) %>% 
    print(complete)
}



View(penguins_clean)

write.csv(penguins_clean, here("data", "penguins_clean.csv"))



#test
#comment



renv::init()
renv::diagnostics()

install.packages(table1)

renv::spanshot()

renv::restore()
