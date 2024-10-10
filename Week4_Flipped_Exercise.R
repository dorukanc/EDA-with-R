# ########## IE 332 - WEEK 4 ###########################
############# Flipped Exercise ###########################

#Exercise 4.1 - Question 10
# Go to our e-book on Connect and open page 45. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped1
library(readxl)
myFlipped1 <- read_excel("data/dataweek4flipped.xlsx" ,sheet="Transit_Survey")

View(myFlipped1)
# Answer the question a

ModeFreq <- table(myFlipped1$Mode)

ModeRelFreq <- prop.table(ModeFreq)

# Answer the question b 

barplot(ModeFreq)


#Exercise 4.1 - Question 20
# Go to our e-book on Connect and open page 45. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped2

myFlipped2 <- read_excel("data/dataweek4flipped.xlsx", sheet="DJIA_2019")
  
  
# Answer the question a

djiaFreq <- table(myFlipped2$DJIA)

hist(myFlipped2$DJIA, breaks= seq(22000,27000, 1000), right=TRUE)

# Answer the question b

# The distrubition is not symmetric, it's negatively skewed


# Construct a box plot for DJIA. Are there any outliers?

boxplot(myFlipped2$DJIA)

