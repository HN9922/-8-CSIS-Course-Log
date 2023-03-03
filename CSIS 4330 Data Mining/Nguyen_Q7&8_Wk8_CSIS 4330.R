#Q7

#load package and read data 
library(arules)
cosm.df <- read.csv("Cosmetics.csv")

#remove first column and convert to matrix
count.cosmetics.df <- cosm.df
incid.cosmetics.df <- ifelse(count.cosmetics.df > 0, 1, 0)
incid.cosmetics.mat <- as.matrix(incid.cosmetics.df[, ???1])

#convert to transactions 
cosm.trans <- as(incid.cosmetics.mat, "transactions")
inspect(cosm.trans)

#plot data
itemFrequencyPlot(cosm.trans)

#run apriori function
rules = apriori(as.matrix(cosm.df[,2:15]), 
                parameter=list(support=0.1, confidence=0.80,minlen=2))

#inspect rules
inspect(sort(rules, by = "lift"))

#number of products
colSums(cosm.df[,-1])

#Q8
#load packages and read data 
library(forecast)
library(ggplot2)
toys.df <- read.csv("ToysRUsRevenues.csv",stringsAsFactors = FALSE)
str(toys.df)

#create time series and plots
toys.df <- ts(toys.df$Revenue, start=c(1992, 1),frequency=4)

#make plot
yrange = range(toys.df)
plot(c(1992,1995), yrange, type="n",xlab="Year", 
     ylab="Revenue(millions)", bty="l", xaxt="n",yaxt="n")

#add air time series
lines(toys.df, bty="l")

#x-axis
axis(1, at=seq(1992,1995,1), labels=format(seq(1992,1995,1)))

#y-axis
axis(2, at=seq(1000,4500,500), labels=format(seq(1,4.5,.5)), las=2)

#Q8 prt A

#train data 
toys.dfTrain<-window(toys.df,1992,c(1995,2))
toys.dfTrain

#model for seasonality and trend
toys.dfLinearSeason <- tslm(toys.dfTrain~trend+season)
summary(toys.dfLinearSeason)

#predict last two quarters
q3Forecast <- toys.dfLinearSeason$coefficients["(Intercept)"] + toys.dfLinearSeason$coefficients["trend"]*3
q4Forecast <- toys.dfLinearSeason$coefficients["(Intercept)"] + toys.dfLinearSeason$coefficients["trend"]*4

