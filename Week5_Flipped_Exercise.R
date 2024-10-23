# ########## IE 332 - WEEK 5 ###########################
############# Flipped Exercise ###########################

#Exercise 4.2 - Question 28
# Go to our e-book on Connect and open page 47. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped1
library(readxl)

myDataFlipped1 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet="Shift")
myDataFlipped1

summary(myDataFlipped1)

# turn data into categoric
myDataFlipped1$Shift <- as.factor(myDataFlipped1$Shift)
myDataFlipped1$Defective <- as.factor(myDataFlipped1$Defective)

str(myDataFlipped1)

# Answer the question a, construct a contingency table ,defective during shift?

contigency_table <- table(myDataFlipped1$Defective, myDataFlipped1$Shift)
contigency_table

# Answer the question b, given that its defective whats the prob that its constructed during shift 2

# Total amount of defective is 24, the amount defective constructed at shift 2 is 6
# Thus, it's 6/24 and for the shift 3 it's 13/24 

# take a subset, all defective selected
defective_df <- myDataFlipped1[myDataFlipped1$Defective == "yes",]

contingency_df_table <- table(defective_df$Defective, defective_df$Shift)
contingency_df_table

prop.table(contingency_df_table)

# Answer to question c, construct a stacked column chart, are the defect rates
# consistent across all shifts 

barplot(contigency_table, col=c("blue","red"),
        legend = rownames(contigency_table),
        main="Stacked Column Chart of Defective and Shift")


#Exercise 4.2 - Question 31
# Go to our e-book on Connect and open page 47. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped2

myDataFlipped2 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet="Test_Scores")

summary(myDataFlipped2)
str(myDataFlipped2)

# Answer the question 

plot(myDataFlipped2$Final, myDataFlipped2$Midterm,
     main = "Scatterplot of Final against Midterm",
     xlab= "Final",
     ylab= "Midterm",
     col="blue",
     pch=16)


#Exercise 4.2 - Question 35
# Go to our e-book on Connect and open page 47. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped3

myDataFlipped3 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet="Healthy_Living")

summary(myDataFlipped3)

# Answer part a 

# Construct a scatterplot health against exercise

plot(myDataFlipped3$Health, myDataFlipped3$Exercise,
     main = "Scatterplot of Health against Exercise",
     xlab = "Health",
     ylab = "Exercise",
     col = "blue",
     pch=16)

# Alternative ggplot health against exercise

library(ggplot2)

ggplot(myDataFlipped3, aes(x = Health, y = Exercise)) +
  geom_point() + labs(title = "Health vs Exercise Scatterplot") + theme_minimal()

# Answer part b

plot(myDataFlipped3$Health, myDataFlipped3$Smoking,
     main = "Scatterplot of Health against Smoking",
     xlab = "Health",
     ylab = "Smoking",
     col = "blue",
     pch=16)

# (optional add a line to best fit)
# on abline first y axis goes then x axis

abline(lm(Smoking ~ Health, data=myDataFlipped3), col= "red")

#Exercise 4.2 - Question 39
# Go to our e-book on Connect and open page 47. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped4

myDataFlipped4 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet="HighSchool_SAT")

summary(myDataFlipped4)

# Answer part a 




# Answer part b do a scatterplot math score vs writing score

plot(myDataFlipped4$Math, myDataFlipped4$Writing,
     main = "Scatterplot Math against Writing",
     xlab = "Math",
     ylab = "Writing",
     col = ifelse(myDataFlipped4$Type == "Private", "blue", "red"),
     pch = 16)


#Exercise 4.2 - Question 42
# Go to our e-book on Connect and open page 47. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped5


myDataFlipped5 <- read_excel("data/jaggia_ba_2e_ch04_data.xlsx", sheet = "")

# Answer part a 





# Answer part b






