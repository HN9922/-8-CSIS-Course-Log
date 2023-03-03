#Table 2.7 Data Frame
Age <- c(25, 56, 65, 32, 41, 49)
Income <- c(49000, 156000, 99000, 192000, 39000, 57000)
table2.7 <- data.frame(Age, Income)
table2.7

summary(table2.7)

#Normalise table 2.7 min max
min_max <- function(x){
  res <- (x - min(x))/(max(x) - min(x))
  return(res)
}

table2.7new <- as.data.frame(sapply(table2.7[,1:2], min_max))
table2.7new
summary(table2.7new)
