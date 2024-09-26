# ########## IE 332 - WEEK 2 ###########################
############ Data Wrangling ###########################

#First let's read our data set into a data frame
getwd()
########### DATA READ ####################
#What is the working directory?

list.files()
#List the files in the working directory



#Set your working directory to a different path (for example to your desktop)
# for MAc: setwd("/users/agralis/Desktop")


#What is the working directory now?


#You may set your working directory to your original directory if you want.



#read a comma separated file into the the data table named day_df


#get basic summary information on the data table




#We will see the examples from our book (Specifically Chapter 2.2 and 2.3)

################ DATA INSPECTION #####################

# Example 2.1 
# Import the Gig data file into a data frame (table) and label it myData
myData <- read.csv("Gig.csv", sep=",")


#check the data set
view(myData)
head(myData)
head(myData, 10)
dim(myData)
summary(myData)

#check the NAs
is.na(myData)
is.na(myData$Industry)
which(is.na(myData$Industry))
which(is.na(myData$Job))

#check a specific row

myData[24,]
myData[,2]
myData[24,2]

#count the data based on some conditions
#How many data points are there where the Industry is Automotive?

length(which(myData$Industry == "Automotive"))

#How many data points are there where the Hourly wage is above $30?

length(which(myData$HourlyWage > 30))

#How many data points are there where the Industry is Automotive and the Hourly wage is above $30?

length(which(myData$Industry == "Automotive" & myData$HourlyWage > 30))

#SORTING
#sort the data set based on Hourly wage

sortedData1 <- myData[order(myData$HourlyWage),]
View(sortedData1)

sortedData1.1 <- myData[order(myData$HourlyWage, decreasing = TRUE),]

#sort the data set based on Industry, Job and Hourly wage

sortedData2 <- myData[order(myData$Industry, myData$Job, myData$HourlyWage),]
View(sortedData2)

#sort the data set based on Industry and Job in ascending order and then Hourly wage (descending order for hourly wage)

sortedData3 <-  myData[order(myData$Industry, myData$Job, -myData$HourlyWage),]

#sort the data set based on Industry in the descending order, then Job and Hourly wage

sortedData4 <- myData[order(-xtfrm(myData$Industry), myData$Job, myData$HourlyWage),]

#sort the data set based on Industry, Job and Hourly wage in all descending order

sortedData5 <- myData[order(myData$Industry, myData$Job, myData$HourlyWage, decreasing = TRUE),]

#import one of the sorted data as a csv file

write.csv(sortedData5, "Sorted Data All Decreasing.csv")

# The output file will be created in the project folder


########### DATA PREPERATION ########################

#1. Handing NAs

# Example 2.2
# Import the Restaurant_Reviews data file into a data frame (table) and label it myData

rmyData <- read.csv("RestaurantReviews.csv", sep=",")

# Check for NAs
which(is.na(rmyData))
is.na(rmyData$RecordNum)
is.na(rmyData$Ambience)
is.na(rmyData$Cleanliness)
is.na(rmyData$Service)
is.na(rmyData$Food)

#Alternatively, use complete.cases function to identify the rows that are complete

rmyData[complete.cases(rmyData),]

#Since most of the rows are complete, you can check the not complete rows

rmyData[!complete.cases(rmyData),]

# You can remove all NAs within the data frame

rmyData1.1 <- rmyData[complete.cases(rmyData),]
View(rmyData1.1)

# alternative

omittedData <- na.omit(rmyData)
View(omittedData)

summary(rmyData)
# imputation with mean
#first find the mean value without NAs

ambianceMean <- mean(omittedData$Ambience)
serviceMean <- mean(omittedData$Service)

# alternative

ambianceMeanAlt <- mean(rmyData$Ambience, na.rm=TRUE)
serviceMeanAlt <- mean(rmyData$Service, na.rm=TRUE)

cleanlinessMedian <- median(rmyData$Cleanliness, na.rm=TRUE)
foodMedian <- median(rmyData$Food, na.rm=TRUE)

#replace NAs with the mean that you have just found

rmyData$Ambience[is.na(rmyData$Ambience)] <- ambianceMeanAlt
rmyData$Service[is.na(rmyData$Service)] <- serviceMeanAlt

rmyData$Cleanliness[is.na(rmyData$Cleanliness)] <- cleanlinessMedian
rmyData$Food[is.na(rmyData$Food)] <- foodMedian

# 2. Subsetting
# Example 2.3
# Import the Customers data file into a data frame (table) and label it myData.

myData3 <- read.csv("Customers.csv", sep=",")

#Aim: Find the millennials with a college degree
#First, find the customers with a college degree
summary(myData3)
collegeData <- myData3[myData3$College == "Yes",]

#Then,select millennials (birthdata:1982-2000) from the above subset.
# Note that R usually imports date values as text characters, so we need to convert the data type of the column called BirthDate
#Common formats: 
# 1. "%m/%d/%Y" -> 01/13/1990; 
# 2. "%Y-%m-%d" -> 1990-01-13; 
# 3. "%b %d, %Y" -> Jan 13, 1990;
# 4. "%B %d, %Y" -> January 13, 1990

#First specify the Birth DAte column format

collegeData$BirthDate <- as.Date(collegeData$BirthDate, format="%d.%m.%Y")

#Then, write the cutoff dates and find millenials

cutoffdate1 <- as.Date("01.01.1982", format="%d.%m.%Y")
cutoffdate2 <- as.Date("31.12.1999", format="%d.%m.%Y")

millenials <- collegeData[collegeData$BirthDate >= cutoffdate1 & collegeData$BirthDate <= cutoffdate2,]

# Keep only columns "Sex, HouseholdSize, Income, Spending2021, NumoOrders, and Channel"
#First with column index

subset1 <- millenials[,c(2,6,8,10,11,14)]

#The same with column names

subset2 <- millenials[,c("Sex","HouseholdSize","Income","Spending2021","NumOfOrders","Channel")]

#Correct the data structure of the categorical variables

names(millenials)

millenials$Sex <- as.factor(millenials$Sex)
millenials$Race <- as.factor(millenials$Race)
summary(millenials)

str(millenials)

# indices are given alphabetically 
#split the data set


#subset certain ranges of the rows

