#install.packages('ggplot2')
library(ggplot2)
library(readxl)
#9.1. Linear Probability Model (Linear Regression)
myData <- read_excel("data/jaggia_ba_2e_ch09_data.xlsx", sheet="Mortgage")

head(myData)
summary(myData)


#Linear model

linModel <- lm(y~x1+x2, data=myData)

summary(linModel)


#Find prediction for 20% down payment (x1) and 30% income (x2)

predict(linModel, data.frame(x1=20, x2=30))

#Find prediction for 30% down payment (x1) and 30% income (x2)

predict(linModel, data.frame(x1=30, x2=30))

#Logistic Regression Model

logitModel <- glm(y~x1+x2, data=myData, family="binomial")
summary(logitModel)

#Find prediction for 20% down payment (x1) and 30% income (x2)

predict(logitModel, data.frame(x1=20, x2=30), type="response")

#Find prediction for 30% down payment (x1) and 30% income (x2)

predict(logitModel, data.frame(x1=30, x2=30), type="response")


#SPAM Data set
myDataSpam <- read_excel("data/jaggia_ba_2e_ch09_data.xlsx", sheet="Spam")

head(myDataSpam)
summary(myDataSpam)

#Linear Model

linModelSpam <- lm(Spam~Recipients+Hyperlinks+Characters, data=myDataSpam)
summary(linModelSpam)

# Logistic Regression

logitModelSpam <- glm(Spam~Recipients+Hyperlinks+Characters, data=myDataSpam,
                      family="binomial")
summary(logitModelSpam)


#Simulate: Hyp=6.226, Chr=58.602 and Rec=10-50

p1 <- predict(logitModelSpam, data.frame(Hyperlinks=6.226,
                                   Characters=58.602,
                                   Recipients=10),
        type="response")

dataSpam <- with(myDataSpam, data.frame(Hyperlinks=mean(Hyperlinks),
                                        Characters=mean(Characters),
                                        Recipients=seq(10,50,10)))

#Draw the line graphs

dataSpam$linPred <- predict(linModelSpam, dataSpam)
dataSpam$LogitPred <- predict(logitModelSpam, dataSpam, type="response")
View(dataSpam)

plot(dataSpam$linPred~dataSpam$Recipients, type="l")
lines(dataSpam$LogitPred~dataSpam$Recipients, type="l", col="red")


ggplot()+
  geom_line(data=dataSpam, aes(x=Recipients, y=linPred))+
  geom_line(data=dataSpam, aes(x=Recipients, y=LogitPred), col="blue")

#The Odds of an Event
#odds = p/(1-p)
#p=odds/(1+odds)

#Calculate the p and odds for Recipients =20 and 21

p_20 <- predict(logitModelSpam, data.frame(Hyperlinks=mean(dataSpam$Hyperlinks),
                                           Characters=mean(dataSpam$Characters),
                                           Recipients= 20), type="response")

p_20

p_21 <- predict(logitModelSpam, data.frame(Hyperlinks=mean(dataSpam$Hyperlinks),
                                           Characters=mean(dataSpam$Characters),
                                           Recipients= 21), type="response")

p_21
#percentage change in odds as Rec. increases by one unit:

odds_20 <- p_20/(1-p_20)
odds_20

odds_21 <- p_21/(1-p_21)
odds_21

(odds_21 - odds_20) / odds_20 * 100

# %11.351 Increase

#Accuracy rate =(correct pred/total pred)*100

p_logit <- predict(logitModelSpam, type="response")
p_logit

myDataSpam$Spam_logit <- ifelse(p_logit>=0.5,1,0)

View(myDataSpam)
#Use 0.5 as the threshold

mean(myDataSpam$Spam_logit == myDataSpam$Spam) * 100

sum(myDataSpam$Spam == myDataSpam$Spam_logit) / nrow(myDataSpam)*100

#Find the proportion of correct predictions


