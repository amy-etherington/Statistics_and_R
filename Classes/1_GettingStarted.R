library(dplyr)
library(downloader
)

data <- read.csv("data/femaleMiceWeights.csv")
msleep_data <- read.csv("data/msleep_ggplot2.csv")

weights <- data$Bodyweight
weights[11]
length(weights)

mean(weights[13:24])

set.seed(1)

sample(weights[13:24], size=1)

controls <- filter(data, Diet=="chow")
print(controls)
controls <- select(controls, Bodyweight)
unlist(controls)


## %>% is a pipe it allows us to write the above code in one
## line by passing the output of filter to the input of select and so on
controls <- filter(data, Diet=="chow") %>%
          select(Bodyweight) %>% unlist


