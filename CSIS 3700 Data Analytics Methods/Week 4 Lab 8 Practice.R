#reference ignore -_ = [

vac <- read.csv("vacation-trip-classification.csv")
  
#scale/standardise data
vac$Income_z <- scale(vac$Income)
vac$Family_size_z <-(vac$Family_size)
vac



#create partitions
library(caret)
set.seed(2015)

samp <- createDataPartition(vac$Result,
                             p = 0.6, list = FALSE)
train.a <- vac[samp,]
rest <- vac[-samp,]

samp <- createDataPartition(rest$Result,
                            p = 0.5, list = FALSE)
train.b <- rest[samp,]
test <- rest[-samp,]

library(class)
train.b$pred.1 <- knn(train.a[,4:5],
      train.b[,4:5], train.a[ ,3], 1)

tab.1 <- table(train.b$Result, train.b$pred.1,
               dnn = c("Acutal", "Predicted"))
tab.1
