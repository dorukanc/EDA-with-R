# ########## IE 332 - WEEK 5 ###########################
############ Visualization #############################

##### 4.2. Methods to Visualize Multiple Variables ######

###### Two Categorical (Factor) Variables ##########

# Use Promotion data set from our book (Connect)
library(readxl)

myData <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet="Promotion")

View(myData)
head(myData)
summary(myData)

myData$Purchase <- as.factor(myData$Purchase)
myData$Location <- as.factor(myData$Location)

str(myData)


### A Contingency Table ####

myTable <- table(myData$Purchase, myData$Location)
myTable

#likelihood
prop.table(myTable)


### A Stacked Column Chart ####

barplot(myTable, col=c("blue","orange"),
        legend = rownames(myTable),
        main="Stacked Column Chart for Purchase and Location",
        xlab="Location",
        ylim= c(0,200))

abline(h=0) # we added a line on x axis



###### Two Numerical Variables ##########

# Use Transactions data set from our book (Connect)
myData2 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "Transactions")
head(myData2)
summary(myData2)
myData2$Repeat <- as.factor(myData2$Repeat)
myData2$Sex <- as.factor(myData2$Sex)
str(myData2)

### A Scatterplot ####

plot(myData2$Purchase~myData2$Income, main="Scatter Plot of Purchase Against Income", xlab = "Annual Income (in $1000)"
     , ylab="Purchase (in $)", col="blue", pch=16)



##### 4.3. Other Data Visualization Methods ######

# Use Birth_Life data set from our book (Connect)
myData3 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "Birth_Life")
head(myData3)

summary(myData3)

myData3$Development <- as.factor(myData3$Development)

###### A Scatterplot with a Categorical Variable ##########

#Use Development variable:


plot(myData3$Birth_Rate~myData3$Life_Exp, xlab="Life Expectancy (in years)",
     ylab="Birth Rate (in%)",
     col= ifelse(myData3$Development == "Developing", "blue", "red"),
     pch=16)

legend("topright", legend=c("Developing","Developed"),
       col=c("blue","red"),
       pch=16)



# Use myData2 and use Sex as the categorical var.
plot(myData2$Purchase~myData2$Income, main="Scatter Plot of Purchase Against Income", xlab = "Annual Income (in $1000)"
     , ylab="Purchase (in $)", col= ifelse(myData2$Sex == "Male", "blue", "red"), pch= 16)

legend("topright", legend=c("Male","Female"),
       col=c("blue","red"), 
       pch = 16)


###### A Bubble Plot ##########

#Create an empty plot (type="n" means no plotting)



# Use symbols function to plot the bubbles




###### A Line Chart ##########

# Use Apple_Merck data set from our book (Connect)
myData4 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "Apple_Merck")
head(myData4)

summary(myData4)
#First plot Apple's price

plot(myData4$Apple~myData4$Date,
     main="Monthly Stock prices of Apple and Merck",
     xlab="Date",
     ylab="Stock Price (in $)",
     col="blue",
     type="l",
     ylim=c(0,300))


#Incorporate Merck's price with red

lines(myData4$Merck~myData4$Date, col="red", type="l")


#Add legend

legend("topleft", legend=c("Apple","Merch"),
       col=c("blue","red"), 
       lty=1)


###### A Heat Map ##########

# Use Bookstores data set from our book (Connect)
myData5 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "Bookstores")
head(myData5)

#create a contingency table for eact type of book



#Convert data into a matrix



#Use heatmap()



##### Additional Examples (not in the Book)##########

####### 1. Scatterplot with ggplot######
library(ggplot2)
# Use Transactions data set from our book (Connect) -> myData2
myData2 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "Transactions")

summary(myData2)

#limitation on x axis

ggplot(data=myData2, aes(x=Income, y=Purchase)) + 
  geom_point(col="darkred")+
  xlim(25,200)

# alternative

ggplot(data=myData2, aes(x=Income, y=Purchase)) + 
  geom_point(col="darkred")+
  xlim(25,200)+
  facet_wrap(~Sex)






######## 2. Faceting (1 quantitative 1 categorical variable)#########

######faceting with box plot: 

ggplot(data=myData2, aes(x=Income))+
  geom_boxplot()+
  ggtitle("Income Boxplot")+
  ylab("Income in $1,000s")+
  theme(plot.title = element_text(size = 10))

#faceting by Repeat

ggplot(data=myData2, aes(y=Income))+
  geom_boxplot()+
  ggtitle("Income Boxplot")+
  ylab("Income in $1,000s")+
  theme(plot.title = element_text(size = 10))+
  facet_wrap(~Repeat)


#faceting by Satisfaction

ggplot(data=myData2, aes(y=Purchase))+
  geom_boxplot()+
  ggtitle("Income Boxplot")+
  ylab("Income in $1,000s")+
  theme(plot.title = element_text(size = 10))+
  facet_wrap(~Satisfaction)


#######faceting with Histograms ###########

#Draw Histogram for Income ####

ggplot(data=myData2, aes(x=Income))+
  geom_histogram(binwidth = 8, fill="blue", color="orange")

#Let's split the graph by gender


ggplot(data=myData2, aes(x=Income))+
  geom_histogram(binwidth = 8, fill="blue", color="orange")+
  facet_wrap(~Sex)



###### 3. Add summary layers to your graphs############





#### Get summary information and then draw a Line Chart####
install.packages('dplyr')
library(dplyr)





#draw two line graphs at the same time (1st way)

