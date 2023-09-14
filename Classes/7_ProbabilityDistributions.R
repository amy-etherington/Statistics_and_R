library(gapminder)
data(gapminder)
head(gapminder)
library(dplyr)

colnames(gapminder)

life_expectancies_1952 <- filter(gapminder, year==1952) %>%
  select(lifeExp) %>% unlist
hist(life_expectancies_1952)
mean(life_expectancies_1952 <=40)

prop = function(q) {
  mean(life_expectancies_1952 <= q)
}
prop(40)

qs = seq(from=min(life_expectancies_1952), to=max(life_expectancies_1952), length=20)

props = sapply(qs, prop)
plot(qs, props)

plot(ecdf(life_expectancies_1952))

