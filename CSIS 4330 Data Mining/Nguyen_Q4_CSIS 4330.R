# load data
car.df <- read.csv("ToyotaCorolla.csv", header = TRUE) 

# Find the dimension of the data frame
dim(car.df)

# Show the first six rows of the data frame
head(car.df)

# Show the first 10 rows of the third column (Price column)
car.df[1:10, 3]

# Find the length of the third column (Price column)
length(car.df$Price)

# Find the mean of the third column (Price column)
mean(car.df$Price)

# Find summary statistics for the third column (Price column)
summary(car.df[3])
