#Q4

#Load data
ct.df <- read.csv("Coursetopics.csv")

#Create binary incidence matrix
count.course.df <- ct.df
incid.course.df <- ifelse(count.course.df > 0, 1, 0)
incid.course.mat <- as.matrix(incid.course.df[, -1])

#Convert binary incidence matrix to transactions database
library(arules)
ct.trans <- as(incid.course.mat, "transactions")
inspect(ct.trans)

#plot data
itemFrequencyPlot(ct.trans)

#Run apriori function
rules <- apriori(ct.trans, 
                 parameter = list(supp= 0.01, conf = 0.5, target = "rules"))

#inspect rules
inspect(sort(rules, by = "lift"))
