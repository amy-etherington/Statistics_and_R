library(dplyr)

 data <- read.csv("data/msleep_ggplot2.csv")
class(data)

primates <- filter(data, order=="Primates")
nrow(primates)
class(primates)

primates_sleep <- filter(data, order=="Primates") %>%
  select(sleep_total) %>% unlist
class(primates_sleep)

mean(primates_sleep)

grouped_data <- summarise(data, av_sleep=mean(sleep_total),.by=order, .groups = "Primates")

print(grouped_data)



