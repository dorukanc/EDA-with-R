# 1. Initialization - 
getwd()
list.files()
library(ggplot2)
# 2. Read the day.csv data set first, and then, create a dataset named myFlipped 
myFlipped <- read.csv("data/day.csv", sep = ',')

# 3. Check if there are NAs.If yes, remove them.
which(is.na(myFlipped))


# 4. Draw a scatter plot of an independent variable and cnt 
plot(myFlipped$cnt~myFlipped$temp)



# 5. Calculate the correlation coefficient between the variable you selected and cnt by using
#functions cor(). Then, what can you say about the correlation?
cor(myFlipped$cnt,myFlipped$temp)



# 6. Create a linear regression model between the variable you selected and cnt 
# (Hint: Which variable is the dependent variable?)
slmF1 <- lm(cnt~temp, data = myFlipped)
summary(slmF1)
coef_slmF1 <- slmF1$coefficients
intc <- coef_slmF1[1]
slp <- coef_slmF1[2]
confint(slmF1, level = .95)
# 7. Provide the summary statistics for the regression model as well as the confidence interval
confint(slmF1, level = 0.95)



# 8. What can you tell by checking the statistics for your linear regression model?
#Not that of a good fit due to R^2 <= 0. 8 


# 9. Plot the data and the regression line together
ggplot(myFlipped, aes(x=temp, y=cnt))+
  geom_point()+
  geom_abline(intercept = intc, slope = slp, col="red", size=1.0)


#10. Examine the residuals for the model you created. What can you tell about the model?
plot(myFlipped$temp, resid(slmF1))
abline(0,0,col="red")

#11. Pick two more variables and create a multiple linear regression model
slmF2 <- lm(cnt~temp + hum + windspeed, data = myFlipped)
#12. Analyze the model by checking the summary and residual plots.  
summary(slmF2)

plot(myFlipped$temp, resid(slmF2))
abline(0,0,col="red")

plot(myFlipped$hum, resid(slmF2))
abline(0,0,col="red")

plot(myFlipped$windspeed, resid(slmF2))
abline(0,0,col="red")
