# ########## IE 332 - WEEK 8 ###########################
############ Exploratory Data Analysis - More Topics in Regression Analysis #############

library(readxl)

### The Interaction of Two Dummy (Categorical/Factor) Variables ###########

myData <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="MIS_Stats")
head(myData)
summary(myData)

myData$MIS <- as.factor(myData$MIS)
myData$Statistics <- as.factor(myData$Statistics)

str(myData)

# Model 1: No interaction variable

model1 <- lm(Salary ~ GPA + MIS + Statistics, data=myData)

summary(model1)

# Not that bad model but if it's greater than 0.85 good model 

#Model 2: Interaction of two dummy variables

model2 <- lm(Salary ~ GPA + MIS + Statistics + MIS*Statistics, data=myData)
summary(model2)

# if p value less than 5% we consider significant

#Prediction:

predict(model1, data.frame(GPA=3.5, MIS="0", Statistics="0"))

predict(model2, data.frame(GPA=3.5, MIS="0", Statistics="0"))

# model 2 predicts higher salary

predict(model2, data.frame(GPA=3.5, MIS="1", Statistics="0"))

predict(model2, data.frame(GPA=3.5, MIS="1", Statistics="1"))

predict(model1, data.frame(GPA=3.5, MIS="1", Statistics="1"))

predict(model2, data.frame(GPA=3.5, MIS="0", Statistics="1"))


### The Interaction of a Dummy and a Numerical Variable ###########

myData2 <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="BP_Race")
head(myData2)
summary(myData2)

# Factor on a new column
myData2$Race.f <- as.factor(myData2$Race)

str(myData2)
#Model 1: No interaction variable

model1_1 <- lm(Systolic ~ Weight + Race.f, data=myData2)
summary(model1_1)

#Model 2: Interaction of a dummy variable with a numerical variable

model2_1 <- lm(Systolic ~ Weight + Race.f + Weight * Race.f, data=myData2)
summary(model2_1)


#Prediction:

predict(model1_1, data.frame(Weight=206, Race.f="Black"))

predict(model2_1, data.frame(Weight=206, Race.f="Black"))

### The Interaction of two Numerical Variables ###########

myData3 <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="MSA")
head(myData3)
str(myData3)
#Model 1: No interaction variable

model1_2 <- lm(Applicants ~ Marketing + Employed, data=myData3)
summary(model1_2)

#Model 2: Interaction of a dummy variable with a numerical variable


model2_2 <- lm(Applicants ~ Marketing + Employed + Marketing * Employed, data=myData3)
summary(model2_2)

model2_3 <- lm(Applicants ~ Employed + Marketing * Employed, data=myData3)
summary(model2_3)

#Prediction:

predict(model1_2, data.frame(Marketing=137, Employed = 71))

predict(model2_2, data.frame(Marketing=137, Employed = 71))

predict(model2_3, data.frame(Marketing=137, Employed = 71))

### Introductory Case: Gender Gap

myData4 <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="Gender_Gap")

summary(myData4)

#Model 1: No interaction

model1_3 <- lm(Salary~Size+Experience+Female+Grad, data=myData4)

summary(model1_3)

#Model 2: Interaction of Dummy*Numerical

model2_3 <- lm(Salary~Size+Experience+Female+Grad + Experience*Female, data=myData4)

summary(model2_3)

#Model 3: Interaction of Dummy*Dummy

model3_3 <- lm(Salary~Size+Experience+Female+Grad + Grad*Female, data=myData4)

summary(model3_3)

#Model 4: Interaction of Dummy*Numerical + Dummy*Dummy

model4_3 <- lm(Salary~Size+Experience+Female+Grad + Grad*Female + Experience * Female, data=myData4)

summary(model4_3)
#Model 4: Interaction of Dummy*Numerical + Numerical*Numerical

model5_3 <- lm(Salary~Size+Experience+Female+Grad + Experience * Female + Size * Experience, data=myData4)

summary(model5_3)

#Plot a line graph for Experience vs Salary based on Different Genders
# Calculate the average salary for each experience level
library(dplyr)

library(ggplot2)

myData4$Female.f <- as.factor(myData4$Female)

ggplot(myData4, aes(x = Experience, y= Salary, color=Female))+
  geom_point()


avg_salary_data <- myData4 %>%
  group_by(Experience, Female) %>%
  summarise(avg_salary = mean(Salary, na.rm=TRUE))

ggplot(avg_salary_data, aes(x=Experience, y=avg_salary, color= factor(Female)))+
  geom_line()

#### Regression Models for Nonlinear Relationships

myData5 <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="Wages")

summary(myData5)

#The Quadratic Regression Model
#plot Wage vs Age

plot(myData5$Wage ~ myData5$Age)

#Apply different transformations and create scatterplots
plot(sqrt(myData5$Wage) ~ myData5$Age)

plot(log(myData5$Wage) ~ myData5$Age)

#Model 1: Linear Model

model_lm <- lm(Wage ~ Graduate + Age, data=myData5)

summary(model_lm)

#Model 2: Quadratic Model

model_qm <- lm(Wage ~ Graduate + Age + I(Age^2), data=myData5)
summary(model_qm)

#The Logarithmic Regression Models

myData6 <- read_excel("data/jaggia_ba_2e_ch08_data.xlsx", sheet="College_Town")
summary(myData6)

#plot Rent vs other variables

plot(myData6$Rent ~ myData6$Beds)
plot(myData6$Rent ~ myData6$Baths)
plot(myData6$Rent ~ myData6$Sqft)


#Model 1: Linear Model

model_lm2 <- lm(Rent ~ Beds + Baths + Sqft, data=myData6)
summary(model_lm2)

#Model 2,3,4: Logarithmic Models

model_log1 <- lm(Rent ~ Beds + Baths + log(Sqft), data=myData6)
summary(model_log1)

model_log2 <- lm(log(Rent) ~Beds + Baths + Sqft, data=myData6)
summary(model_log2)

model_log3 <- lm(log(Rent) ~Beds + Baths + log(Sqft), data=myData6)
summary(model_log3)

#Prediction:

predict(model_lm2, data.frame(Beds=3, Baths=2, Sqft = 1600))

# since this is a linear model you don't need any transformation

predict(model_log1, data.frame(Beds=3, Baths=2, Sqft = 1600))

plog2 <- predict(model_log2, data.frame(Beds=3, Baths=2, Sqft = 1600))
se2 <- sigma(model_log2)
exp(plog2 + se2^2/2)

plog3 <-  predict(model_log3, data.frame(Beds=3, Baths=2, Sqft = 1600))
se3 <- sigma(model_log3)
exp(plog3 + se3^2/2)

