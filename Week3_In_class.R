# ########## IE 332 - WEEK 3 ###########################
############ Summary Measures ###########################

########### 3.1. Measures of Location ####################

###### Measures of Central Location ##########

# Use Online data set from our book (Connect)
library(readxl)
myData <- read_excel("data/data2.xlsx" ,sheet="Online")

#Mean and median of the variable called Clothing

meanClothing <- mean(myData$Clothing)
medianClothing <- median(myData$Clothing)

#Minimum, maximum, mean, median and first and third quartiles for each variable

summary(myData)

#Means of subgroups (inputs: (1) outcome variable, (2) the categorical var., (3) the function (mean, sd, etc.))

tapply(myData$Clothing, myData$Sex, mean)
tapply(myData$Health, myData$Sex, median)

###### Other Measures of Location ##########
#Precentile/Quantile

summary(myData)
quantile(myData$Health, 0.3)

########### 3.2. Measures of Dispersion, Shape and Association ####################

###### Measures of Dispersion ######

#Range of Clothing 

max(myData$Clothing) - min(myData$Clothing)

#Interquantile range (IQR) of Clothing

quantile(myData$Clothing, 0.75) - quantile(myData$Clothing, 0.25)

#Mean Absolute Deviation (MAD) of Clothing

# Its going to calculate the mean of the clothing and substract it from every value then take mean
mean(abs(myData$Clothing - mean(myData$Clothing)))

#Variance and Standard Deviation of Clothing

var(myData$Clothing)
sd(myData$Clothing)

#Coefficient of Variation

sd(myData$Clothing) / mean(myData$Clothing)

###### Measures of Association ######

# Correlation

cor(myData[, -2])

# also removed the customer, c(-1,2) is a vector
cor(myData[, c(-1,-2)])

########### 3.2. Detecting Outliers ####################

#Import Growth_Value Dataset

myData2 <- read_excel("data/data2.xlsx" ,sheet="Growth_Value")

summary(myData2)
str(myData2)


### Boxplot

boxplot(myData2$Growth,myData2$Value, horizontal = TRUE, xlab="Annual Returns", main="Boxplot of Growth and Value", names= c("Growth", "Value"))

#Treat outliers using out function

outliers_Growth <- boxplot(myData2$Growth)$out
outliers_Growth

outliers_value <- boxplot(myData2$Value)$out
outliers_value
#Replace outliers with NA

myData2$NewValue <- ifelse(myData2$Value %in% outliers_value, NA, myData2$Value)


#### Z-Score 
# Get the summary info about Growth  from above data set




# What is the z-score for the min and max observations


