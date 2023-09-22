library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

pnorm(3) - (1-pnorm(3))

male_chow_weights <- filter(dat, Sex=="F") %>%
  filter(Diet=="chow") %>% select("Bodyweight") %>% unlist

sd <- popsd(male_chow_weights)
mean <- mean(male_chow_weights)

pnorm(q=sd+mean,mean=mean,sd=sd) - (1-pnorm(q=sd+mean,mean=mean,sd=sd))


mean(male_chow_weights < 3*sd+mean & male_chow_weights > mean-3*sd )

y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
mean(avgs)
popsd(avgs)