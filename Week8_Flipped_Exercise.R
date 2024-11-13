#Initialization
#Install/Load required packages
library(ggplot2)

# 1. Read day.csv to a data frame named myDaily
myDaily <- read.csv("data/day.csv")

# 2. Summarize all variables in the data frame (myDaily) and then check their structure
str(myDaily)
summary(myDaily)

# 3. Create a scatter plot for variables atemp and casual renters.
# You can use either plot or ggplot functions

ggplot(myDaily, aes(x=atemp, y=casual))+
  geom_point()

# 4. The relationship does not look like a linear one. 
# Apply different transformations and create scatterplots

ggplot(myDaily, aes(x=atemp, y=log(casual)))+
  geom_point()

ggplot(myDaily, aes(x=log(atemp), y=casual))+
  geom_point()

ggplot(myDaily, aes(x=log(atemp), y=log(casual)))+
  geom_point()

ggplot(myDaily, aes(x=sqrt(atemp), y=casual))+
  geom_point()

# 5. Which transformation looks better in terms of a linear relationship?  

# The third model where I transformed both casual and atemp and take log, has more linear look than the others.

# 6.Create linear models that takes atemp as a variable to explain the change in the casual riders.
# Note: Create three models: one with no transformation and two with log/sqrt transformations
# So our predictor variable is atemp, and dependent one is casual riders.


# First model with no transformation
lm1 <- lm(casual~atemp, data= myDaily)

summary(lm1)

# Second model with log transformation
# Because I transformed the dependent variable I had to retransform the predicted value back.

lm2 <- lm(log(casual)~log(atemp), data=myDaily)
summary(lm2)

# Third model with sqrt transformation

lm3 <- lm(casual ~ sqrt(atemp), data=myDaily)
summary(lm3)

# 7. Which model is the best one? Explain it using R^2 values and plotting the residuals

# Second model has the highest R^2 value with 0.49 it's still not good however still better than others.

# 8. By using the models that you created above, predict the casual renter
#  numbers given a temp values of 0.1, 0.2, 0.4 and 0.6. Also provide the confidence intervals

predict(lm1, data.frame(atemp=0.1))
predict(lm1, data.frame(atemp=0.2))
predict(lm1, data.frame(atemp=0.4))
predict(lm1, data.frame(atemp=0.6))

# Confidence interval for lm1 
confint(lm1, level = .95)

# For model2 I need to transform it back exp
plm2 <- predict(lm2, data.frame(atemp=0.1))
plm2 <- predict(lm2, data.frame(atemp=0.2))
plm2 <- predict(lm2, data.frame(atemp=0.4))
plm2 <- predict(lm2, data.frame(atemp=0.6))
se2 <- sigma(lm2)
exp(plm2+ se2^2/2)

confint(lm2, level= .95)

# Model 3

predict(lm3, data.frame(atemp=0.1))
predict(lm3, data.frame(atemp=0.2))
predict(lm3, data.frame(atemp=0.4))
predict(lm3, data.frame(atemp=0.6))

# Confidence interval for lm3 
confint(lm3, level = .95)


# 9. Which variables are actually factor variables but defined as other types in the data frame? 

# Factorize categoric variables

myDaily$season.f <- as.factor(myDaily$season)
myDaily$mnth.f <- as.factor(myDaily$mnth)
myDaily$holiday.f <- as.factor(myDaily$holiday)
myDaily$weekday.f <- as.factor(myDaily$weekday)
myDaily$workingday.f <- as.factor(myDaily$workingday)
myDaily$weathersit.f <- as.factor(myDaily$weathersit)

str(myDaily)

# 10. Convert weathersituation and workingday variables to categorical variables and keep them 
# in new variables named ws.f and wd.f, respectively

# Instead ws.f and wd.f, weathersit.f and workingday.f

# 11. Plot the casual renters w.r.t. temp for different weathersituation (ws.f).
#Note that you can use color option to show the ws.f on the plot

ggplot(myDaily, aes(x=temp, y=casual, color=weathersit.f))+
  geom_point()

# 12. Create a linear model that takes temp as a variable to explain the 
# number of casual renters (casual) dependent variable. Do not forget to name your model (model1).
# prediction var is temp and dependent is casual, you first write the value you want to predict, in this case casual

model1 <- lm(casual~temp, data=myDaily)
summary(model1)

# 13. Create a linear model that takes temp and ws.f as variables to explain the 
# number of casual rentals (casual) dependent variable. Do not forget to name your model (model2).

model2 <- lm(casual~temp+weathersit.f, data=myDaily)
summary(model2)

# 14. Add an interaction term (temp*ws.f) to the model that you created above. 
# Do not forget to name your model (model3).

model3 <- lm(casual~temp+weathersit.f+temp*weathersit.f, data=myDaily)
summary(model3)

# 15. Analyze all three models that you created above and comment about their performance. 
# Which one performs the worst, the best?

# Highest R^2 value is on the second model however it's still not that good model with the value of .3284


# 16. Create a linear model that takes temp, ws.f, windspeed, and wd.f as variables to explain the 
# number of casual rentals (casual) dependent variable. Do not forget to name your model (model1_1).

model1_1 <- lm(casual~temp+weathersit.f+windspeed+workingday.f, data=myDaily)
summary(model1_1)

# Since we added more independent variables adjusted r square value is higher on this model

# 17. Create three models where you add interaction terms (temp*ws.f), (temp*windspeed), (ws.f*wd.f) to the model that you created above. 
# Do not forget to name your models (model1_2, model1_3, model_1,4).


model1_2 <- lm(casual~temp+weathersit.f+windspeed+workingday.f+temp*weathersit.f, data=myDaily)
summary(model1_2)

model1_3 <- lm(casual~temp+weathersit.f+windspeed+workingday.f+temp*windspeed, data=myDaily)
summary(model1_3)

# Two Dummy Variables
model1_4 <- lm(casual~temp+weathersit.f+windspeed+workingday.f+weathersit.f*workingday.f, data=myDaily)
summary(model1_4)

# model 4 has the highest adjusted r square value with 0.6247

# 18. Analyze all four models that you created above and comment about their performance. 
# Which one performs the worst, the best?

