#read data file
Food <- read.csv("SAMCLUB.csv")
library(arules)

#Convert Rules to Binary Form
binary <- as(split(Food[,2], Food[,1]), "transactions")

#Apply Apriori algorithm to Rules
rules <- apriori(binary, parameter = list(support=0.001, confidence=0.1))
rules
inspect(rules)

#A. Summarise rules 
summary(rules)

#B. Visualisation
library(arulesViz)
library(plotly)
plot(rules)
plot(rules, method="two-key plot")
plot(rules, method="matrix")
plot(rules, method="graph")
plot(rules, method="graph", control=list(type="itemsets"))
plot(rules, method="matrix3D", measure="lift")

plot(rules, method="grouped")

#C. Transactions before Orange Juice
Prules <- apriori(binary, parameter = list(supp=0.001, conf=0.1), 
                  appearance = list(default="lhs",rhs="ORANGE JUICE"))
Prules
inspect(Prules)

#D. Visualise Orange Juice RUles
plot(Prules)
plot(Prules, method="two-key plot")
plot(Prules, method="graph")
plot(Prules, method="grouped")

#E. Rules with Confidence greater than 0.5 and visualisation
rules<-rules[quality(rules)$confidence>0.5]
inspect(rules)

plot(rules)
plot(rules, method = "grouped")
plot(rules, method="graph")
plot(rules, method="two-key plot")
















































