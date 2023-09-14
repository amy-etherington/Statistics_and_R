sum = 0

for(i in 1:25){sum<-sum+i^2}

print(sum)


vec = c()
for(i in 1:25) {
  vec[i] <- i^2
}

sum(vec)