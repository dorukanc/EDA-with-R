#IE332 - Week 1 - Introduction to Data Types in R

# Most Used Data Types 
#character
my_char <- "dorukan"

#numeric
my_int <- 10
my_double <- 10.5

#logical
my_logic <- TRUE

#categorical (factor)
my_factors <- factor("dorukan")


# 1) DATA STRUCTURES

#######################################################################################
# 1.1) VECTOR: Dimensions: 1; mixed data types (modes): No
#vector/column/variable

#get help first
?vector
x1 <- c(1,2,3,4)
x2 <- c("dorukan","cago")
x3 <- c("1","2","3","4")

# access the elements of a vector
# index starts from 1 

x1[2]
x1[5]

#get the structure of a vector and the summary

str(x1)
str(x3)
summary(x1)
summary(x3)


##################################################################################
# 1.2) DATAFRAME (data.frame): Dimensions: 2; mixed data tpes (modes): Yes

?data.frame
df_1 <- data.frame(x1,x3)
df_1

dim(df_1) #dimensions of df_1
names(df_1) #names of the columns (features)
nrow(df_1) # number of rows in df_1
ncol(df_1) # number of columns in df_1
length(df_1)

#Notes: 
# - most used data structure in R
# - can contain different types of data 
# - one column must contain the same data types
# we can access the columns of a data frame by $ sign:

df_1$x3
df_1$x1

str(df_1$x3)
#################################################################################
# 1.3) LIST: Dimensions: n; mixed data tpes (modes): Yes
#most powerful structure for looping, output storage
#it is like dataframe of dataframe
#a dataframe of different length of any data type

list_1 <- list("dorukan", 3, TRUE, 5.2)

list_2 <- list(x1, x2, x3)

# accessing elements

list_2[[1]][1]

###################################################################################

# 1.4) FACTOR: Dimensions: 1; mixed data types (modes): No 

?factor

mar_status <- c("married", "single")

# It should be categorical (factor)

mar_status_f <- factor(mar_status)

#create another factor



