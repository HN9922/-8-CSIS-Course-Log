#install, load, begin
install.packages("arules")
install.packages(c("rpart", "rpart.plot", "class"))
detach("package:arules", unload=TRUE)

#read data file
Items <- read.csv("Week3Q3HW.csv")
library(arules)

#Convert rules to binary
binary <- as(split(Items[,2], Items[,1]), "transactions")

#Apriori algorithm to CSV file
rules <- apriori(binary, parameter = list(support=0.2, confidence=0.1))
rules
inspect(rules)






