library(dplyr)
RNGkind("Mersenne-Twister", "Inversion", "Rejection")

data_test <- read.csv("data/femaleMiceWeights.csv")
data_population <- read.csv("data/femaleControlsPopulation.csv") %>% unlist

mean_pop <- mean(data_population)

set.seed(1)
n <-10000
sample_means <- vector("numeric", n)
sample_mean_diff <- vector("numeric", n)


for (i in 1:n) {
  sample <- sample(data_population, 5)
  sample_means[i] <- mean(sample)
  sample_mean_diff[i] <- mean(sample)-mean_pop
}

hist(sample_mean_diff)

mean(abs(sample_mean_diff) > 1)