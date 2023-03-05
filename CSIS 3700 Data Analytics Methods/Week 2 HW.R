st <- read.csv("bank-teller.csv")

hist (st$svc_time)

hist(st$svc_time, main="Bank teller service times",
xlab="service time",
ylab="Number of occurences")

boxplot(st$svc_time)

hw <- read.csv("height-weight.csv")
plot(hw$age, hw$weight,
main="Age vs. Weight", xlab="age",
ylab="weight (lbs)")

cov(hw$age, hw$weight)