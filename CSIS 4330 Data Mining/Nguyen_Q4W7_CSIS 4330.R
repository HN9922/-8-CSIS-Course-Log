#Q4 Part A

library(forecast)
DSS_Sales <- read.csv("DepartmentStoreSales.csv", stringsAsFactors = FALSE)
str(DSS_Sales)

#make time series object
DSS_STS <- ts(DSS_Sales$Sales, start=c(1,1), frequency = 4)
yrange = range(DSS_STS)

#plot series
plot(DSS_STS, ylim = c(0,120000), ylab = "Quarterly Sales (Thousands USD)", xlab = "Year", 
     main = "Department Store Sales Time Series", bty = "l")

#Q4 Part B 
#Decompose Data for better view of all components
Components_DSS <- decompose(DSS_STS)
Components_DSS

#plot components
plot(Components_DSS)

#Q4 Part C
#partition data using the last 4 quarters as validation period
validLen<- 4
TrainLeng <- length(DSS_STS) - validLen

SSTS_Train <- window(DSS_STS, start =c(1,1), end=c(1, TrainLeng))
SSTS_Valid <- window(DSS_STS, start=c(1,TrainLeng+1), end=c(1, TrainLeng+validLen))

#plot validation and training sets
yrange <- range(DSS_STS)
plot(c(1, 7.5), c(48000,114500), type="n", xlab="Year",  ylab="Department Store Sales (Thousands USD)", 
     bty="l", xaxt="n", yaxt="n")

lines(DSS_STS, bty="l")

axis(1, at=seq(1,7.5,1), labels=format(seq(1,7.5,1)))
axis(2, at=seq(46000, 120000, 10000), labels=format(seq(48000, 120000, 10000)), las=0)

abline(v=6)
arrows(1, 105000, 6, 105000, code=3, length=0.1)
text(3, 108000, "Training")

abline(v=7)
arrows(6, 105000, 7, 105000, code=3, length=0.1)
text(6.5, 108000, "Validation")
