#for reference, ignore -_ = [ ~

#Read in academic file
aca <- read.csv("academic.csv")

#Score v Decision Boxplot
boxplot(score ~ perf, data = aca, ylab = "score")

#Attendance v Decision boxplot
boxplot(attendance ~ perf, data = aca, ylab = "attendance")

#Standardise attributes score & attendance
dar2ed.scale.many <- function (dat, column_nos) 
{
  nms = names(dat)
  for (col in column_nos) {
    name = paste(nms[col], "_z", sep = "")
    dat[name] = scale(dat[, col])
  }
  cat(paste("Scaled", length(column_nos), "attribute(s)\n"))
  dat
}

aca <- dar2ed.scale.many(aca,c(1:2))

### Create partitions 60% training, 20% evaluation, 20% test / load packages
library(caret)
library(class)

#Apply seed
set.seed(2015)

samp <- createDataPartition(aca$perf,
               p = 0.6, list = FALSE)

#Training partition 1
train.1 <- aca[samp,]
#Remaining data in Rest
rest <- aca[-samp,]

#Training partition 2
samp <- createDataPartition(rest$perf,
                p = 0.5, list = FALSE)
train.2 <- rest[samp,]
#Remaining data in test
test <- rest[-samp,]

###Build KNN Model | 5 attributes, last 2 standardised, 3rd column
### equals target attribute 'perf'
train.2$pred.1 <- knn(train.1[,4:5],
      train.2[,4:5], train.1[,3], 1)

#Examine confusion matrix
tab.1 <- table(train.2$perf, train.2$pred.1,
               dnn = c("Actual", "Predicted"))
tab.1

###Model 2 confusion Matrix & KNN Model
train.2$pred.3 <- knn(train.1[,4:5],
      train.2[,4:5], train.1[,3], 3)
tab.3 <- table(train.2$perf, train.2$pred.3,
             dnn = c("Actual", "Predicted"))
tab.3

###Interpret model of best fit
test$pred.3  <- knn(train.1[,4:5],
                    test[, 4:5], train.1[,3], 3)
tab.test.3 <- table(test$perf, test$pred.3,
                    dnn = c("Actual", "Predicted"))
tab.test.3

test$pred.1 <- knn(train.1[,4:5],
                   test[, 4:5], train.1[,3], 1)

tab.test.1 <- table(test$perf, test$pred.1,
                    dnn = c("Actual", "Predicted"))
tab.test.1

###Read in New Students file
NewStudents <- read.csv("NewStudents.csv")

dar2ed.scale.many <- function (dat, column_nos) 
{
  nms = names(dat)
  for (col in column_nos) {
    name = paste(nms[col], "_z", sep = "")
    dat[name] = scale(dat[, col])
  }
  cat(paste("Scaled", length(column_nos), "attribute(s)\n"))
  dat
}

NewStudents <- dar2ed.scale.many(NewStudents,c(1:2))


###Read new predictions
NewPred <- read.csv("NewPredictions.csv")
NewPred <- dar2ed.scale.many(NewPred,c(1:2))

#Apply Seed
set.seed(2015)

samp <- createDataPartition(NewPred$Decision,
                            p = 0.6, list = FALSE)

#Training partition 1
train.a <- NewPred[samp,]
#Remaining data in Rest
rest <- NewPred[-samp,]

#Training partition 2
samp <- createDataPartition(rest$Decision,
                            p = 0.5, list = FALSE)
train.b <- rest[samp,]
#Remaining data in test
test <- rest[-samp,]

#Test KNN
train.b$pred.3 <- knn(train.a[,4:5],
                      train.b[,4:5], train.a[,3], 3)
tab.3 <- table(train.b$Decision, train.b$pred.3,
               dnn = c("Actual", "Predicted"))
tab.3



