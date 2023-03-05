#Lab 7 Adjusting/standardizing attributes in R p 133 thru 136
sp <- read.csv("knn-smart-ph.csv")
sp

#Find min and max
max(sp$Family_income)

#Find highest age
max(sp[,1])

#Adjust age and store in new attributes
sp$Age_s <-(sp$Age - min(sp$Age))/
  (max(sp$Age) - min(sp$Age))
sp

#Adjust family income and store in new attributes
sp$Family_income_s <-(sp$Family_income - min(sp$Family_income))/
  (max(sp$Family_income) - min(sp$Family_income))
sp

#Standardize income values
sp$Family_income_z <- scale(sp$Family_income)
sp

#Standardize Age values
sp$Age_z <- scale(sp$Age)
sp

#Standardize Age and Family Income in one command
sp <- read.csv("knn-smart-ph.csv")

#Standardize multiple attributes
sp <- dar2ed.scale.many(sp, c(1,2))

#Create new attributes with Z
sp

#LAB 8 KNN for Classification p 137 thru 146
vac <- read.csv("vacation-trip-classification.csv")
vac

#Standardize attribute values
vac <- dar2ed.scale.many(vac, c(1:2))
vac

#KNN Model
library(caret)
set.seed(2015)
samp <- createDataPartition(vac$Result,
                            p = 0.6, list = FALSE)
train.a <- vac[samp, ]
rest <- vac[-samp, ]

samp <- createDataPartition(rest$Result, p = 0.5, list = FALSE)
train.b <- rest[samp, ]
test <- rest[-samp, ]

library(class)
train.b$pred.1 <- knn(train.a[,4:5],
                      train.b[,4:5], train.a[ ,3], 1)
tab.1  <- table(train.b$Result, train.b$pred.1,
                dnn = c("Actual", "Predicted"))
tab.1


train.b$pred.3 <- knn(train.a[,4:5],
                      train.b[,4:5], train.a[ ,3], 3)

tab.3 <- table(train.b$Result, train.b$pred.3,
               dnn = c("Actual", "Predicted"))
tab.3
