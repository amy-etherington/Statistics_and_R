library(dplyr)
RNGkind("Mersenne-Twister", "Inversion", "Rejection")

data_test <- read.csv("data/femaleMiceWeights.csv")
data_population <- read.csv("data/femaleControlsPopulation.csv") %>% unlist

mean_pop <- mean(data_population)

set.seed(5)

sample_5 <- sample(data_population, 5)
mean_sample <- mean(sample_5)
print(mean_sample)
abs(mean_sample-mean_pop)
