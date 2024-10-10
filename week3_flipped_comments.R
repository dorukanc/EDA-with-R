# ########## IE 332 - WEEK 3 ###########################
############# Flipped Exercise ###########################
#Exercise 3.1 - Question 5
# Go to our e-book on Connect and open page 27. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped1
myDataFlipped1 <- read_excel("data/data2.xlsx", sheet="Work_Experience")  # Reads the "Work_Experience" sheet from the Excel file and stores it in myDataFlipped1

# Answer the question a
summary(myDataFlipped1)  # Provides a summary of the dataframe, including basic statistics for each column

# Answer the question b 
min(myDataFlipped1$Salary)  # Calculates the minimum salary in the dataset
max(myDataFlipped1$Salary)  # Calculates the maximum salary in the dataset
quantile(myDataFlipped1$Salary, 0.25)  # Calculates the 25th percentile (first quartile) of salaries

# Answer the question c
min(myDataFlipped1$Experience)  # Calculates the minimum years of experience in the dataset
max(myDataFlipped1$Experience)  # Calculates the maximum years of experience in the dataset
quantile(myDataFlipped1$Experience, 0.75)  # Calculates the 75th percentile (third quartile) of experience

#Exercise 3.1 - Question 7
# Go to our e-book on Connect and open page 37. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped2
myDataFlipped2 <- read_excel("data/data2.xlsx", sheet="Fitness")  # Reads the "Fitness" sheet from the Excel file and stores it in myDataFlipped2

# Answer the question a
meanIncome <- mean(myDataFlipped2$Income)  # Calculates the mean income and stores it in meanIncome
median(myDataFlipped2$Income)  # Calculates the median income

# Answer the question b
tapply(myDataFlipped2$Income, myDataFlipped2$Married, mean)  # Calculates the mean income for each marital status group

# Answer the question c
tapply(myDataFlipped2$Income, myDataFlipped2$Exercise, mean)  # Calculates the mean income for each exercise level group

#Exercise 3.2 - Question 13
# Go to our e-book on Connect and open page 39. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped3
myDataFlipped3 <- read_excel("data/data2.xlsx", sheet="Rent")  # Reads the "Rent" sheet from the Excel file and stores it in myDataFlipped3

# Answer the question a
meanRent <- mean(myDataFlipped3$Rent)  # Calculates the mean rent and stores it in meanRent
sdRent <- sd(myDataFlipped3$Rent)  # Calculates the standard deviation of rent and stores it in sdRent

# Answer the question b
meanFootage <- mean(myDataFlipped3$Footage)  # Calculates the mean footage and stores it in meanFootage
sdFootage <- sd(myDataFlipped3$Footage)  # Calculates the standard deviation of footage and stores it in sdFootage

# Answer the question c
# Coefficient Variance
cv_rent <- sdRent / meanRent  # Calculates the coefficient of variation for rent
cv_footage <- sdFootage / meanFootage  # Calculates the coefficient of variation for footage
# Footage has more relative dispersion, The variable with the higher coefficient of variation is considered to have greater relative dispersion.

#Exercise 3.2 - Question 21
# Go to our e-book on Connect and open page 39. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped4
myDataFlipped4 <- read_excel("data/data2.xlsx", sheet="Car_Prices")  # Reads the "Car_Prices" sheet from the Excel file and stores it in myDataFlipped4

# Answer the question a
View(myDataFlipped4)  # Opens a viewer to display the contents of myDataFlipped4
mean(myDataFlipped4$Price)  # Calculates the mean price of cars
mean(myDataFlipped4$Age)  # Calculates the mean age of cars
mean(myDataFlipped4$Miles)  # Calculates the mean mileage of cars

# Answer the question b
sd(myDataFlipped4$Price)  # Calculates the standard deviation of car prices
sd(myDataFlipped4$Age)  # Calculates the standard deviation of car ages
sd(myDataFlipped4$Miles)  # Calculates the standard deviation of car mileages

# Answer the question c
cor_price_age <- cor(myDataFlipped4$Price, myDataFlipped4$Age)  # Calculates the correlation between price and age
# If the age of the car increases the price of it would decrease

# Answer the question d
cor_price_mileage <- cor(myDataFlipped4$Price, myDataFlipped4$Miles)  # Calculates the correlation between price and mileage
# Same there's a negative correlation between miles and the price of a car, even though not strong as age

#Exercise 3.3 - Question 34
# Go to our e-book on Connect and open page 41. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped5
myDataFlipped5 <- read_excel("data/data2.xlsx", sheet="Tech_Energy")  # Reads the "Tech_Energy" sheet from the Excel file and stores it in myDataFlipped5

# Answer the question a
boxplot(myDataFlipped5$Technology)  # Creates a boxplot for the Technology variable
# YES exists
tech_zscore <- scale(myDataFlipped5$Technology)  # Calculates z-scores for the Technology variable
tech_outliers <- which(abs(tech_zscore) > 3)  # Identifies outliers in Technology (z-score > 3 or < -3)

# Answer the question c
boxplot(myDataFlipped5$Energy)  # Creates a boxplot for the Energy variable

# Answer the question e
energy_zscore <- scale(myDataFlipped5$Energy)  # Calculates z-scores for the Energy variable
energy_outliers <- which(abs(energy_zscore) > 3)  # Identifies outliers in Energy (z-score > 3 or < -3)
# None
