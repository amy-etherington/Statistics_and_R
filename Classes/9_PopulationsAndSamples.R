library(downloader)
library(rafalib)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)
dat <- na.omit( dat )


male_chow_weights <- filter(dat, Sex=="F") %>%
  filter(Diet=="chow") %>% select("Bodyweight") %>% unlist

male_hf_weights <- filter(dat, Sex=="F") %>%
  filter(Diet=="hf") %>% select("Bodyweight") %>% unlist


mean(male_chow_weights)
mean(male_hf_weights)
popsd(male_chow_weights)
popsd(male_hf_weights)

set.seed(2)
rand_sample <- sample(male_chow_weights, 25)
mean(rand_sample)
set.seed(2)
rand_sample_hf <- sample(male_hf_weights, 25)
mean(rand_sample_hf)

mean_diff <- mean(male_hf_weights)-mean(male_chow_weights)
mean_diff_rand <- mean(rand_sample_hf)-mean(rand_sample)

mean_diff_rand-mean_diff
