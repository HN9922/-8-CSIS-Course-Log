cust <- read.csv("nb-example.csv")

###Partition data, Purchase is target variable
set.seed(2015)
sam <- createDataPartition(cust$Purchase,
                           p = 0.7, list = FALSE)
train <- cust[sam,]
test <- cust[-sam,]

###Using naive bayes
cust.nb <- naiveBayes(Purchase ~ . ,
                      data = train)
cust.nb

#Model on training set
pred.train <- predict(cust.nb, train)
table(train$Purchase, pred.train,
      dnn = c("Actual", "Predicted"))

#Model on new data
pred.test <- predict(cust.nb, test)
table(test$Purchase, pred.test,
      dnn = c("Actual", "Predicted"))

###Lab Assignment Practice
c <- read.csv("car-classification.csv")

nrow(c)

#Convert all numeric to categorical for naivebayes (except acceptability 
#target variable)
c$price <- factor(c$price)
c$maint <- factor(c$maint)
c$doors <- factor(c$doors)
c$persons <- factor(c$persons)
c$boot <- factor(c$boot)
c$safety <- factor(c$safety)

#Partition
set.seed(2015)
sam <- createDataPartition(c$acceptability,
                           p = 0.7, list = FALSE)
train <- c[sam,]
test <- c[-sam,]

c.nb <- naiveBayes(acceptability ~ . , data = train)
c.nb

pred.train <- predict(c.nb, train)
tab.train <- table(train$acceptability, pred.train,
                   dnn = c("Actual", "Predicted"))
tab.train

pred.test <- predict(c.nb, test)
tab.test <- table(test$acceptability, pred.test,
                  dnn = c("Actual", "Predicted"))
tab.test
prop.table(tab.train)
prop.table(tab.test)


### Assignment 6
flight <- read.csv("FlightDelays.csv")

#convert to categorical 
flight$DEP_TIME_BLK <- factor(flight$DEP_TIME_BLK)
flight$DAY_WEEK <- factor(flight$DAY_WEEK)

set.seed(2015)
sam <- createDataPartition(flight$Flight.Status,
                           p = 0.6, list = FALSE)
train <- flight[sam,]
test <- flight[-sam,]

###Using naive bayes
flight.nb <- naiveBayes(Flight.Status ~ . ,
                      data = train)
flight.nb

#Model on training set
pred.train <- predict(flight.nb, train)
tab.train <- table(train$Flight.Status, pred.train,
      dnn = c("Actual", "Predicted"))
tab.train

#Model on test data
pred.test <- predict(flight.nb, test)
tab.test <- table(test$Flight.Status, pred.test,
      dnn = c("Actual", "Predicted"))
tab.test
