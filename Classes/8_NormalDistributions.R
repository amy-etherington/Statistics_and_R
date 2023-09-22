library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist(read.csv(filename))

# make averages5
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

h5 <- hist(averages5)
h50 <- hist(averages50)
 # centered at 6
plot( h5, col=rgb(0,0,1,1/4))  # first histogram
plot( h50, col=rgb(1,0,0,1/4), add=T)


mean(averages50 > 23 & averages50 < 25)


pnorm(25, 23.9,0.43) - pnorm(23, 23.9,0.43)

