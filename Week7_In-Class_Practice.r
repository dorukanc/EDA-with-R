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
cor(myData$Cost, myData$Earnings)

# We can only check the correlation between numerical variables

#Install Package GGally
install.packages('GGally')
library(GGally)

#Correlation Matrix for the continuous variables
cor(myData)
str(myData)

# Correlation matrix choosed the 2 to 6
cor(myData[2:6])
# does the same thing
cor(myData[-1])
#Linear regression model

# slm (simple linear model)

# Earning are my response variable, cost is predic

lin_model1 <- lm(Earnings ~ Cost, data=myData)


#Summary Statistics for the Regression Model

summary(lin_model1)

# If r^2 greater than 0.8 - 0.85 our model is fitted great
coeff <- lin_model1$coefficients
coeff
inter <- coeff[1]
inter
slo <- coeff[2]
confint(lin_model1, level=0.95)
#Let's plot the data and the regression line together

ggplot(myData, aes(x=Cost, y=Earnings))+
  geom_point()+
  geom_abline(intercept = inter, slope=slo, col='red', size=1.0)

# Alternative with plot

plot(x=myData$Cost, y=myData$Earnings)
abline(inter, slo, col="red")

#Let's examine the residuals for each x variable

plot(myData$Cost, resid(lin_model1))
abline(0,0,col="red")

#Linear regression model 2
# lets create another linear regression model with multiple variables this time,
# we check the adjusted R square in order to compare two different models 

lin_model2 <- lm(Earnings ~ Cost + Grad + Debt + City, data=myData)
summary(lin_model2)
summary(lin_model1)

# according to adjusted r square value linear model 2 is better fit

# create another linear model
lin_model3 <- lm(Earnings~Cost + Grad + City, data=myData)
summary(lin_model3)

# never rely on a single value for instance only r^2 square or p-value
lin_model4 <- lm(Earnings~Debt, data=myData)
summary(lin_model4)

#Let's examine the residuals for each x variable for linear model 2

plot(x=myData$Cost, resid(lin_model2))
abline(0,0,col="red")

plot(x=myData$Grad, resid(lin_model2))
abline(0,0,col="red")

plot(x=myData$Debt, resid(lin_model2))
abline(0,0,col="red")

#Predict for given independent variables

predict(lin_model1, data.frame(Cost=25000))
# Our expected earning 46k for the lin model 1 when the cost is 25k

predict(lin_model2, data.frame(Cost=25000, Grad=60, Debt=80, City=1), level=0.95,
        interval='confidence')

# It gives us the confidence interval

# Interval Estimates for the Response (Dependent) Variable #



#Calculate robust standard errors
install.packages("lmtest")
install.packages("sandwich")
library(lmtest)
library(sandwich)
coeftest(lin_model2, vcov=vcovHC(lin_model2,type="HC1"))
