#install.packages('ggplot2')


#Recall logistic regression

#vertebral_column Dataset: 
#For each of 309 patients, the dataset contains 6 vertebral measurements 
#(potential predictors) along with the patient's vertebral class 
#(1 = irregular, 0 = regular). It's important to keep in mind that 
#each row in the dataset represents a real patient

#1. Read the data set (csv file) to a data frame named vert

vert <- read.csv("data/vertebral_column.csv")

#2. Check out the first few rows

head(vert)
summary(vert)
str(vert)



#3. How many patients of each class are there?
xtabs(~class, data=vert)

#4. Build a logistic regression model for class
#Note that if the dependent variable is character, the glm() will not work.
#You need to correct the structure of the dependent variable

vert$class <- as.factor(vert$class)

# . selects all
logitVert <- glm(class~., family = binomial, data=vert)

logitVert2 <- glm(class~pelvic_incidence+pelvic_tilt+lumbar_lordosis_angle+sacral_slope+pelvic_radius+degree_spondylolisthesis, family = binomial, data=vert)


#6. check the summary of your model

summary(logitVert)

summary(logitVert2)

#9.3. Cross-Validation of Binary Choice Models

# SPAM Dataset
library(readxl)
myDataSpam <- read_excel("data/jaggia_ba_2e_ch09_data.xlsx", sheet="Spam")

head(myDataSpam)
str(myDataSpam)
xtabs(~Spam, data=myDataSpam)


#The Holdout Cross-Validation Method :training and test (validation) sets!
#First divide the set by taking the first 75% rows for training

nrow(myDataSpam) * .75

trainSetSpam <- myDataSpam[1:375,]
testSetSpam <- myDataSpam[376:500,]


#Logistic regression using Training Data set

logitSpam1 <- glm(Spam~Recipients+Hyperlinks+Characters, family = binomial ,data=trainSetSpam)

summary(logitSpam1)


#Make predictions for Test DAta Set

pHat1 <- predict(logitSpam1, testSetSpam, type="response")
yHat1 <- ifelse(pHat1 >= 0.5, 1, 0)

#Accuracy rate

mean(yHat1 == testSetSpam$Spam) * 100


#Randomly separate the data set into training and test
# Set a specific seed to obtain reproducible results.
set.seed(123564)

# Let's randomly divide the dataset to training and test sets 


# create s array

s <- sample(nrow(myDataSpam), nrow(myDataSpam)*.75)
trainSetSpamR <- myDataSpam[s,]
testSetSpamR <- myDataSpam[-s,]


#Logistic Regression using Training Data set

logitSpam2 <- glm(Spam~Recipients+Hyperlinks+Characters, family = binomial ,data=trainSetSpamR)


#Make predictions for Test DAta Set


pHat2 <- predict(logitSpam2, testSetSpamR, type="response")
yHat2 <- ifelse(pHat2 >= 0.5, 1, 0)

#Accuracy rate


mean(yHat2 == testSetSpamR$Spam) * 100

#Create confusion matrix manually

confMatrix <- table(testSetSpamR$Spam, yHat2)
confMatrix

#Calculate accuracy, precision, recall by using TP, TN, FP and FN (T: True, F: False, P: Positive, N: Negative)

TP <- confMatrix[2,2]
FP <- confMatrix[1,2]
TN <- confMatrix[1,1]
FN <- confMatrix[2,1]


#accuracy = (TP+TN)/(TP+FN+TN+FP)

accuracy <- (TP+TN)/(TP+FN+TN+FP)
accuracy * 100

#precision = TP/(TP+FP)

precision <- TP/(TP+FP)
100 * precision
#recall = TP/(TP+FN) 

recall <- TP/(TP+FN)
100 * recall
# sensitivity = TP/(TP+FN)
sensitivity <- TP/sum(testSetSpamR$Spam == 1)
100*sensitivity

# specificity = TN/(TN+FP)
specificity <- TN/sum(testSetSpamR$Spam == 0)
100* specificity

