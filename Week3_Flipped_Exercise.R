# ########## IE 332 - WEEK 3 ###########################
############# Flipped Exercise ###########################

#Exercise 3.1 - Question 5
# Go to our e-book on Connect and open page 27. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped1

myDataFlipped1 <- read_excel("data/data2.xlsx", sheet="Work_Experience")

# Answer the question a

summary(myDataFlipped1)

# Answer the question b 

min(myDataFlipped1$Salary)
max(myDataFlipped1$Salary)

quantile(myDataFlipped1$Salary, 0.25)

# Answer the question c
min(myDataFlipped1$Experience)
max(myDataFlipped1$Experience)

quantile(myDataFlipped1$Experience, 0.75)
#Exercise 3.1 - Question 7
# Go to our e-book on Connect and open page 37. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped2

myDataFlipped2 <- read_excel("data/data2.xlsx", sheet="Fitness")


# Answer the question a

meanIncome <- mean(myDataFlipped2$Income)
median(myDataFlipped2$Income)

# Answer the question b

tapply(myDataFlipped2$Income, myDataFlipped2$Married, mean)

# Answer the question c

tapply(myDataFlipped2$Income, myDataFlipped2$Exercise, mean)


#Exercise 3.2 - Question 13
# Go to our e-book on Connect and open page 39. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped3

myDataFlipped3 <- read_excel("data/data2.xlsx", sheet="Rent")


# Answer the question a

meanRent <- mean(myDataFlipped3$Rent)
sdRent <- sd(myDataFlipped3$Rent)

# Answer the question b

meanFootage <- mean(myDataFlipped3$Footage)
sdFootage <- sd(myDataFlipped3$Footage)


# Answer the question c

# Coefficient Variance

cv_rent <- sdRent / meanRent
cv_footage <- sdFootage / meanFootage

# Footage has more relative dispersion, The variable with the higher coefficient of variation is considered to have greater relative dispersion.


#Exercise 3.2 - Question 21
# Go to our e-book on Connect and open page 39. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped4

myDataFlipped4 <- read_excel("data/data2.xlsx", sheet="Car_Prices")

# Answer the question a

View(myDataFlipped4)

mean(myDataFlipped4$Price)
mean(myDataFlipped4$Age)
mean(myDataFlipped4$Miles)

# Answer the question b


sd(myDataFlipped4$Price)
sd(myDataFlipped4$Age)
sd(myDataFlipped4$Miles)


# Answer the question c

cor_price_age <- cor(myDataFlipped4$Price, myDataFlipped4$Age)
# If the age of the car increases the price of it would decrease

# Answer the question d

cor_price_mileage <- cor(myDataFlipped4$Price, myDataFlipped4$Miles)
# Same there's a negative correlation between miles and the price of a car, even though not strong as age

#Exercise 3.3 - Question 34
# Go to our e-book on Connect and open page 41. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped5

myDataFlipped5 <- read_excel("data/data2.xlsx", sheet="Tech_Energy")

# Answer the question a

boxplot(myDataFlipped5$Technology)
# YES exists

tech_zscore <- scale(myDataFlipped5$Technology)
tech_outliers <- which(abs(tech_zscore) > 3)

# Answer the question c
boxplot(myDataFlipped5$Energy)

# Answer the question e

energy_zscore <- scale(myDataFlipped5$Energy)
energy_outliers <- which(abs(energy_zscore) > 3)

# None
