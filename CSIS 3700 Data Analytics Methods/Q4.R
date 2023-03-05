###Q4 

auto <- read.csv("auto-mpg.csv")

set.seed(2015)
sam <- createDataPartition(auto$mpg,
                           p=0.7, list = FALSE)
train <- auto[sam,]
test <- auto[-sam,]

###Build model
auto.lm <- lm(mpg ~ weight, data = train)
auto.lm
summary(auto.lm)

###Make plot
plot(train$weight, train$mpg,
     xlab = "weight", ylab = "mpg")

###Get regression line
abline(auto.lm)

###Compare model to test partition
pred.test <- predict(auto.lm, test)
data.frame(test$mpg, pred.test)

rmse <- sqrt(mean((test$mpg-pred.test)^2))
rmse
sessionInfo()
