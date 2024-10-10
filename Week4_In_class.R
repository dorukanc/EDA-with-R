# ########## IE 332 - WEEK 4 ###########################
############ Visualization #############################

##### 4.1. Methods to Visualize a Single Variable ######

###### Categorical (Factor) Variable ##########

### A Frequency Distribution ####

# Use Transactions data set from our book (Connect)
library(readxl)
mydata <- read_excel("data/dataweek4.xlsx", sheet="Transactions")

View(mydata)

#Construct frequency and relative frequency distributions for "Repeat" and "Sex" variables

Repeat_Freq <- table(mydata$Repeat)
Repeat_Freq

View(Repeat_Freq)

Sex_Freq <- table(mydata$Sex)

#Create a relative frequency distribution for the same variables

Repeat_RelFreq <- prop.table(Repeat_Freq)
View(Repeat_RelFreq)

# alternative you could just write in 

Repeat_Rel_Freq2 <- prop.table(table(mydata$Repeat))

Sex_Rel_Freq <- prop.table(Sex_Freq)

### A Bar Chart ####

#Construct a bar chart for "Repeat" variable from a table

barplot(Repeat_Freq)

# optional arguments title etc.

barplot(Repeat_Freq, main="Bar Chart for Repeat Freq.", ylab="Number of Customers", xlab="Is a returning customer?", col=c("blue", "red"))
# draws a horizontal line to current graph, where y equivlant to 0
abline(h=0)

#Analyze Repeat variable from the data set using ggplot
install.packages('ggplot2')
library(ggplot2)

?ggplot

# next week 

#basics: 
##   data
##   mapping (aesthetics)
##   geometric representation
##   statistics
##   facet
##   coordinate space
##   labels
##   theme




###### Numerical Variable ##########

### A Frequency Distribution ####
# First make certain decisions:
# Define Intervals using seq function

# summary of my income variable

summary(mydata$Income)

intervals <- seq(0, 250, 50)

#Use cut function with left and right options to
#ensure that the intervals are open on the left
#and closed on the right: 0<x<=50, etc.

interval_cut <- cut(mydata$Income, intervals, left= FALSE, right = TRUE)

str(interval_cut)
#Use table function to create a frequency distribution

Income_Freq <- table(interval_cut)
View(Income_Freq)
#Use prop.table function to create a relative frequency distribution

Income_Rel_Freq <- prop.table(Income_Freq)
View(Income_Rel_Freq)


### A Histogram ####
# Use hist function or ggplot

hist(mydata$Income)

#Make it presentable

hist(mydata$Income, breaks= intervals, right= TRUE, main="Histogram of Income", xlab="Annual Income (in $1000)", col="red")

# alternative intervals

hist(mydata$Income, breaks= seq(30,240,10), right= TRUE, main="Histogram of Income", xlab="Annual Income (in $1000)", col="blue")

#Use ggplot


#make it presentable

# Boxplot of Income Variable

boxplot(mydata$Income, main="Boxplot of Income", xlab="Annual Income (in $1000)")

