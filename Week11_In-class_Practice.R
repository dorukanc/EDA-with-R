# ########## IE 332 - WEEK 11 ###########################
############ KNN and Naive Bayes #############

library(readxl)
#KNN
#Use Gym_Data data set
myData <- read_excel("data/jaggia_ba_2e_ch12_data.xlsx", sheet="Gym_Data")

#Supress warnings to find the same answers with the book
suppressWarnings(RNGversion("3.5.3"))

#Install and load the required packages
install.packages(c("caret","gains","pROC"))
library(caret)
library(gains)
library(pROC)

library(ggplot2)

#Create a new data set after standardizing the Age, Income and Hours variables.

head(myData)


newMyData <- scale(myData[2:4])

head(newMyData)

newMyData <- data.frame(newMyData, myData$Enroll)

head(newMyData)
colnames(newMyData)[4] <- 'Enroll'
head(newMyData)
str(newMyData)

newMyData$Enroll <- as.factor(newMyData$Enroll)

#Partition the data set into training and test/validation sets

set.seed(1)

myIndex <- createDataPartition(newMyData$Enroll, p=0.6, list=FALSE) 
trainSet <- newMyData[myIndex,]
testSet <- newMyData[-myIndex,]
  
#Implement 10-fold cross-validation

myCtrl <- trainControl(method = "cv", number=10)


#Specify possible k-values from 1 to 10

myGrid <- expand.grid(.k=c(1:10))

myGrid


#Implement KNN

set.seed(1)
KNN_fit <- train(Enroll~., data=trainSet, method='knn', trControl=myCtrl, tuneGrid=myGrid)

KNN_fit
#Check the performance of KNN

KNN_class <- predict(KNN_fit, newdata = testSet)

confusionMatrix(KNN_class,testSet$Enroll, positive='1')

#Use a different cutoff value

KNN_Class_Prob <- predict(KNN_fit, newdata = testSet, type='prob')


#Create a confusion matrix using a cutoff value of 0.403

confusionMatrix(as.factor(ifelse(KNN_Class_Prob[,2]>0.403,'1','0')), testSet$Enroll, positive='1')

#--Naive Bayes

# A new data set 
myData2 <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

head(myData2)

## vimyData2## view the first few rows of the data


## two-way contingency table of categorical outcome and predictors we want
## to make sure there are not 0 cells

xtabs(~rank+admit, data=myData2)


#convert rank admit to factor to indicate that rank should be 
#treated as a categorical variable

myData2$admit <- as.factor(myData2$admit)
myData2$rank <- as.factor(myData2$rank)

str(myData2)


#Last week we used logistic regression. This week we will learn Naive Bayes on the same data set:
install.packages("e1071")
library(e1071)

# Let's partition the dataset into training and test sets randomly. 
# Training set will include 80% of the rows of our data set

set.seed(1)
s <- sample(nrow(myData2), nrow(myData2)*0.8)
trainSetNB <- myData2[s,]
testSetNB <- myData2[-s,]

# Let's build the model

nb_Model <- naiveBayes(admit~., data=trainSetNB)


# Use test set to predict the outcome, which is admit or not

predNB <- predict(nb_Model, testSetNB)

cbind(predNB, testSetNB)


# Check the performance of the model by using confusion matrix and
# calculating precision and recall and accuracy

confMatNB <- table(predNB, testSetNB$admit)
confMatNB

TP <- confMatNB[2,2]
TN <- confMatNB[1,1]
FP <- confMatNB[2,1]
FN <- confMatNB[1,2]


#accuracy = (TP+TN)/(TP+FN+TN+FP)

(TP+TN)/(TP+FN+TN+FP)

#precision = TP/(TP+FP) (or detection rate)
TP/(TP+FP)

#recall = TP/(TP+FN) (or sensitivity)

TP/(TP+FN)
#Use caret to obtain the confusion matrix automatically


confusionMatrix(predNB, testSetNB$admit, positive='1')


