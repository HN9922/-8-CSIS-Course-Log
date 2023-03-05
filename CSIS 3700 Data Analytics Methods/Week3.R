install.packages("arules")

install.packages(c("rpart", "rpart.plot", "class"))

library(arules)

detach("package:arules", unload=TRUE)

bh <- read.csv("BostonHousing.csv")

library(caret)

set.seed(2015)
sample <- createDataPartition(bh$MEDV,
p = 0.7, list = FALSE)
sample
train <- bh[sample, ]
test <- bh[-sample, ]

nrow(bh)
nrow(train)
nrow(test)
nrow(train) + nrow(test)

library(caret)
cperf <- read.csv("college.perf.csv")
set.seed(2015)
sample <- createDataPartition(bh$MEDV,
                              p = 0.65, list = FALSE)
sample
train <- cperf[sample, ]
test <- cperf[-sample, ]

grocery <- read.csv("grocery.csv")
library(arules)

binary <- as(split(grocery[,2], grocery[,1]), "transactions")
rules <- apriori(binary, parameter = list(support=0.1, confidence=0.1))
rules
inspect(rules)
inspect(sort(rules, by="confidence"))

rules <- apriori(binary, parameter=list(support=0.2, confidence=0.8))
inspect(rules)

regdata <-read.csv("student-courses.csv")
library(arules)
binary <- as(split(regdata[,2], regdata[,1]), "transactions")
res <- apriori(binary, parameter = list(support=0.02, confidence=0.3))
inspect(sort(res, by="lift"))

library(arules)
detach("package:arules", unload=TRUE)
