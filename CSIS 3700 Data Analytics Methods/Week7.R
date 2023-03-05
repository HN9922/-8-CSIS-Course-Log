setwd("C:/Users/haile/Downloads/Week 7")

library(forecast)

AmtrakRidership <- read.table("AmtrakPassengersMonthly.csv", header=TRUE, sep =",")
tsAmtrak <- ts(AmtrakRidership, start=c(1991, 1), frequency = 12)

par(mfrow=c(2,2))

ylim <- c(min(tsAmtrak), max(tsAmtrak))
plot(tsAmtrak)
plot(tsAmtrak, main="Raw time series")

plot(ma(tsAmtrak, 3), main="Simple Moving Averages (k=3)", ylim=ylim)

plot(ma(tsAmtrak, 7), main="Simple Moving Averages (k=7)", ylim=ylim)

plot(ma(tsAmtrak, 15), main="Simple Moving Averages (k=15)", ylim=ylim)

# Subset View
window (tsAmtrak)

#Season Decomposition
fit_add = decompose (tsAmtrak, type='additive')
plot(fit_add)


ltsAmtrak <-log(tsAmtrak)
plot(ltsAmtrak, ylab="log(Amtrak)")
fit <- stl(ltsAmtrak, s.window="period")
plot(fit)

dim(tsAmtrak)
dim(tsAmtrak)<-NULL


stl(x = tsAmtrak, s.window = "periodic")
plot(tsAmtrak)


