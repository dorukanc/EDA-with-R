# ########## IE 332 - WEEK 2 ###########################
############# Flipped Exercise ###########################

#Exercise 2.2 - Question 10
# Go to our e-book on Connect and open page 27. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped
myDataFlipped <- read.csv("exercise2_10.csv", sep = ",")


# Answer the question a

sum(myDataFlipped$x4 < 3)


# Answer the question b

sortedData1 <- myDataFlipped[order(myDataFlipped$x1, myDataFlipped$x2, myDataFlipped$x3, myDataFlipped$x4),]


# Answer the question c


sortedData2 <-sortedData1 <- myDataFlipped[order(myDataFlipped$x1, myDataFlipped$x2, myDataFlipped$x3, myDataFlipped$x4, decreasing = TRUE),]

# Answer the question d

na_x1 <- sum(is.na(myDataFlipped$x1))
na_x2 <- sum(is.na(myDataFlipped$x2))
na_x3 <- sum(is.na(myDataFlipped$x3))
na_x4 <- sum(is.na(myDataFlipped$x4))


# Answer the question e

myDataFlipped$x4 <- as.factor(myDataFlipped$x4)

summary(myDataFlipped)
str(myDataFlipped)

#Exercise 2.2 - Question 13
# Go to our e-book on Connect and open page 27. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped2



# Answer the question a



# Answer the question b




# Answer the question c



# Answer the question d



# Answer the question e



#Exercise 2.2 - Question 23
# Go to our e-book on Connect and open page 29. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped3



# Answer the question a



# Answer the question b



# Answer the question c



# Answer the question d



# Answer the question e



# Answer the question f



#Exercise 2.2 - Question 27
# Go to our e-book on Connect and open page 29. 
#Download the data file and save the worksheet to your working directory as a csv file.
#Import the dataset to a dataframe called myDataFlipped3



# Answer the question a



# Answer the question b

