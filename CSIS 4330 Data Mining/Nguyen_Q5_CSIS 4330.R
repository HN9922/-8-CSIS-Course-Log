#Q5 Table 5.7

#Table 5.7 data
Table.df <- read.csv("Table5.7.csv")

#Read first 10 rows
head(Table.df, 10)

#Cutoffs
library(caret)
library(e1071)

confusionMatrix(as.factor(ifelse(Table.df$Probability>0.5, 'yes', 'no')), as.factor(Table.df$Class))
confusionMatrix(as.factor(ifelse(Table.df$Probability>0.25, 'yes', 'no')), as.factor(Table.df$Class))
confusionMatrix(as.factor(ifelse(Table.df$Probability>0.75, 'yes', 'no')), as.factor(Table.df$Class))

#Sensitivity and Specificity 

#.5 cutoff
confusionMatrix(factor(ifelse(Table.df$Probability>0.5, 'yes', 'no'), 
                       levels = c("yes", "no")), 
                factor(Table.df$Class, 
                       levels = c("yes", "no")),
                positive = "yes")
#.5 Error Rate
#15+3/20=0.9%

#.25 cutoff
confusionMatrix(factor(ifelse(Table.df$Probability>0.25, 'yes', 'no'), 
                       levels = c("yes", "no")), 
                factor(Table.df$Class, 
                       levels = c("yes", "no")),
                positive = "yes")
#.25 Error Rate
#9+3/20=0.6%

#.75 cutoff
confusionMatrix(factor(ifelse(Table.df$Probability>0.75, 'yes', 'no'), 
                       levels = c("yes", "no")), 
                factor(Table.df$Class, 
                       levels = c("yes", "no")),
                positive = "yes")
#.75 Error Rate
#17+2/20=0.95%








