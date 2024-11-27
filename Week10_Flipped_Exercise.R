##### IE332 Week 10 Flipped Exercise ###########

# Use diabetes data set-------
#Initialization: Set a specific seed to obtain reproducible results.
set.seed(1234)

#1. Read the data set to a data frame

diabetesData <- read.csv("data/diabetes.csv")

#2. Check out the first few rows

head(diabetesData)


#3. Check the structure of the data set to see if we have correct categorical/numerical variables
str(diabetesData)

#4. Make the "outcome" column categorical (factor) if needed (Note that if it is numerical glm() will work)
#myDiabetData$Outcome<-as.factor(myDiabetData$Outcome)



#5. How many patients of each class (diabetes-1, no diabetes-0) are there?

xtabs(~Outcome, data=diabetesData)


#6. Divide the data set into training and test data sets (you can take 80% of the data for training)

nrow(diabetesData) * .8
trainSetDiabetes <- diabetesData[1:615,]
testSetDiabetets <- diabetesData[616:768,]


#7. Build a logistic regression model using only training data set

logitDiabetes <- glm(Outcome~., family= binomial, data=trainSetDiabetes)

summary(logitDiabetes)

#8. Use test set to predict the outcome, which is 0 (no) or 1 (yes)
# You can use 0.5 as the threshold

pHat1 <- predict(logitDiabetes, testSetDiabetets, type="response")
yHat1 <- ifelse(pHat1 >= 0.5, 1, 0)


#9. Create confusion matrix 

#Create confusion matrix manually

confMatrix <- table(testSetDiabetets$Outcome, yHat1)
confMatrix

#10. Calculate precision, recall, accuracy, sensitivity and specificity 

TP <- confMatrix[2,2]
FP <- confMatrix[1,2]
TN <- confMatrix[1,1]
FN <- confMatrix[2,1]

#Accuracy rate

mean(yHat1 == testSetDiabetets$Outcome) * 100


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
sensitivity <- TP/sum(testSetDiabetets$Outcome == 1)
100*sensitivity

# specificity = TN/(TN+FP)
specificity <- TN/sum(testSetDiabetets$Outcome == 0)
100* specificity





#11. Go to our e-book and solve Question 33 of Exercise 9.3. (page 97)

FlippedDataSet <- read_excel("data/jaggia_ba_2e_ch09_data.xlsx", sheet="Exercise_9.33")
head(FlippedDataSet)
summary(FlippedDataSet)


trainingFlippedSet <- FlippedDataSet[1:75,]
testFlippedSet <- FlippedDataSet[76:100,]

logitFlipped1 <- glm(y~x1, data=trainingFlippedSet)
logitFlipped2 <- glm(y~x1+x2, data=trainingFlippedSet)


pHatFlipped1 <- predict(logitFlipped1, testFlippedSet, type="response")
yHatFlipped1 <- ifelse(pHatFlipped1 >= 0.5, 1, 0)

pHatFlipped2 <- predict(logitFlipped2, testFlippedSet, type="response")
yHatFlipped2 <- ifelse(pHatFlipped2 >= 0.5, 1, 0)


#Accuracy rate

mean(yHatFlipped1 == testFlippedSet$y) * 100

mean(yHatFlipped2 == testFlippedSet$y) * 100

logitFlipped3 <- glm(y~x1+x2 ,data =FlippedDataSet)

predict(logitFlipped3, data.frame(x1=25, x2=50))

#12. Go to our e-book and solve Question 35 of Exercise 9.3. (page 97)

myDataFlipped35 <- read_excel("data/jaggia_ba_2e_ch09_data.xlsx", sheet = "Exercise_9.35")

summary(myDataFlipped35)

trainingFlippedSet2 <- myDataFlipped35[1:75,]
testFlippedSet2 <- myDataFlipped35[76:100,]

logitFlipped35 <- glm(y~x1+x2, data=trainingFlippedSet2)

pHatFlipped35 <- predict(logitFlipped35, testFlippedSet2, type="response")
yHatFlipped35 <- ifelse(pHatFlipped35 >= 0.5, 1, 0)

#Accuracy rate

mean(yHatFlipped35 == testFlippedSet2$y) * 100

#Create confusion matrix manually

confMatrix <- table(testFlippedSet2, yHatFlipped35)
confMatrix

#10. Calculate precision, recall, accuracy, sensitivity and specificity 

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
sensitivity <- TP/sum(testFlippedSet2$y == 1)
100*sensitivity

# specificity = TN/(TN+FP)
specificity <- TN/sum(testFlippedSet2$y == 0)
100* specificity

