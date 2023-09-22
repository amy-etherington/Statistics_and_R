library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)


ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
library(dplyr)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
  	x <- sample(1:sides,n,replace=TRUE)
  	(mean(x==1) - p) / sqrt(p*(1-p)/n)
  })
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist

mean(X)
sd <- sd(X)/sqrt(12)
(1-pnorm(2, mean=0,sd=sd))*2
z <- 2/sd
(1-pnorm(z, 0,1))*2

se <- sqrt(sd(X)^2/12+sd(Y)^2/12)
print(se)

tstat <- (mean(Y)-mean(X))/se
ttest <- t.test(Y,X)

(1-pnorm(tstat))*2

print(ttest)


