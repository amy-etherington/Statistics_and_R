head(InsectSprays)
class(InsectSprays)
class(InsectSprays$count)
boxplot(split(x=InsectSprays$count,f=InsectSprays$spray))


library(dplyr)
data(nym.2002, package="UsingR")
class(nym.2002$time)

males <- filter(nym.2002, gender=="Female")
females <- filter(nym.2002, gender=="Male")

hist(females[, "time"])

hist(males[, "time"])

boxplot(split(x=nym.2002$time,f=nym.2002$gender))


