#read data file
Items <- read.csv("Week3Q4HW.csv")
library(arules)

#Convert rules to binary
binary <- as(split(Items[,2], Items[,1]), "transactions")

#Apriori algorithm to CSV file
rules <- apriori(binary, parameter = list(support=0.1, confidence=0.1))
rules
inspect(rules)
