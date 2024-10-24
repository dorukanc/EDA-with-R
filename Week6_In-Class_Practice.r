# ########## IE 332 - WEEK 6 ###########################
############ Exploratory Data Analysis #############################

install.packages('dplyr')
library(dplyr)

myData <- read.csv("day.csv", sep=",")

summary(myData)
head(myData)

str(myData)

myData$season <- as.factor(myData$season)
myData$holiday <- as.factor(myData$holiday)
myData$workingday <- as.factor(myData$workingday)
myData$weathersit <- as.factor(myData$weathersit)
myData$yr <- as.factor(myData$yr)

which(is.na(myData))

mean(myData$cnt)
sd(myData$cnt)

#outliers
boxplot(myData$cnt)
boxplot(myData$casual)
boxplot(myData$registered)

# outliers

outliers_cas <- boxplot(myData$casual)$out
outliers_cas

mean_cas <- mean(myData$casual, na.rm = TRUE)
mean_cas


myData$casual_mean <- ifelse(myData$casual %in% outliers_cas, mean_cas, myData$casual)

boxplot(myData$casual_mean)
median_cas <- median(myData$casual)
median_cas

myData$casual_median <- ifelse(myData$casual %in% outliers_cas, median_cas, myData$casual)
boxplot(myData$casual_median)

#1. select() function
# Select the first 3 columns of the data set and check the head and tail:

subMyData1 <- select(myData , 1:3)
head(subMyData1)
tail(subMyData1)

# Using the pipe operator (%) to do the same

head(select(myData, 1:3))

select(myData,1:3)%>%
  head()

# select the columns that contains word 'day' in the caption

subData2<- select(myData, contains('day'))

head(subData2)

# select the columns that contains word 'day' in the caption and 'cnt' column

subData3 <- select(myData, contains('day'), cnt)


#let's get the head of it

head(subData3)

# or using the pipe operator

myData %>%
  select(contains('day'), cnt)%>%
  head()

# 2. arrange() function
#let's arrange the above head() in descending order of cnt

myData %>%
  select(contains('day'), cnt)%>%
  head()%>%
  arrange(desc(cnt))


#Descending order on the whole set and then get the head()

myData %>%
  select(contains('day'), cnt)%>%
  arrange(desc(cnt))%>%
  head()


# 3. group_by() and summarise() functions

# maybe you would like to group your dataset using categorical variable

str(myData)

myData%>%
  group_by(season)%>%
  head()


myData%>%
  group_by(season)%>%
  summarize(mean(cnt, na.rm= TRUE))
