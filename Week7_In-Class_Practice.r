# ########## IE 332 - WEEK 7 ###########################
############ Exploratory Data Analysis - Linear Regression #############

library(readxl)
myData <- read_excel("data/jaggia_ba_2e_ch07_data.xlsx", sheet="College")
head(myData)
summary(myData)

#First let's remember the correlation
# Use ggplot
library(ggplot2)

#Create a scatterplot of Cost vs Earnings

plot(x=myData$Cost, y=myData$Earnings)

# Alternative using ggplot

ggplot(myData, aes(x=Cost, y=Earnings))+
  geom_point()

#Calculate the correlation between temperature (temp) vs total renters per day (cnt)



#Install Package GGally
install.packages('GGally')
library(GGally)

#Correlation Matrix for the continuous variables



#Linear regression model



#Summary Statistics for the Regression Model



#Let's plot the data and the regression line together



#Let's examine the residuals for each x variable




#Linear regression model 2




#Let's examine the residuals for each x variable



#Predict for given independent variables



# Interval Estimates for the Response (Dependent) Variable #



#Calculate robust standard errors
install.packages("lmtest")
install.packages("sandwich")
library(lmtest)
library(sandwich)
coeftest(Lin_Model3, vcov=vcovHC(Lin_Model3,type="HC1"))
