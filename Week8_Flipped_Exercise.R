#Initialization
#Install/Load required packages
library(ggplot2)

# 1. Read day.csv to a data frame named myDaily
myDaily <- read.csv("data/day.csv")

# 2. Summarize all variables in the data frame (myDaily) and then check their structure
str(myDaily)

# 3. Create a scatter plot for variables atemp and casual renters.
# You can use either plot or ggplot functions

ggplot(myDaily, aes(x=atemp, y=casual))+
  geom_point()

# 4. The relationship does not look like a linear one. 
# Apply different transformations and create scatterplots

ggplot(myDaily, aes(x=atemp, y=log(casual)))+
  geom_point()


# 5. Which transformation looks better in terms of a linear relationship?  


# 6.Create linear models that takes atemp as a variable to explain the change in the casual riders.
# Note: Create three models: one with no transformation and two with log/sqrt transformations


# 7. Which model is the best one? Explain it using R^2 values and plotting the residuals



# 8. By using the models that you created above, predict the casual renter
#  numbers given a temp values of 0.1, 0.2, 0.4 and 0.6. Also provide the confidence intervals


# 9. Which variables are actually factor variables but defined as other types in the data frame? 



# 10. Convert weathersituation and workingday variables to categorical variables and keep them 
# in new variables named ws.f and wd.f, respectively



# 11. Plot the casual renters w.r.t. temp for different weathersituation (ws.f).
#Note that you can use color option to show the ws.f on the plot



# 12. Create a linear model that takes temp as a variable to explain the 
# number of casual renters (casual) dependent variable. Do not forget to name your model (model1).


# 13. Create a linear model that takes temp and ws.f as variables to explain the 
# number of casual rentals (casual) dependent variable. Do not forget to name your model (model2).


# 14. Add an interaction term (temp*ws.f) to the model that you created above. 
# Do not forget to name your model (model3).


# 15. Analyze all three models that you created above and comment about their performance. 
# Which one performs the worst, the best?


# 16. Create a linear model that takes temp, ws.f, windspeed, and wd.f as variables to explain the 
# number of casual rentals (casual) dependent variable. Do not forget to name your model (model1_1).


# 17. Create three models where you add interaction terms (temp*ws.f), (temp*windspeed), (ws.f*wd.f) to the model that you created above. 
# Do not forget to name your models (model1_2, model1_3, model_1,4).


# 18. Analyze all four models that you created above and comment about their performance. 
# Which one performs the worst, the best?

