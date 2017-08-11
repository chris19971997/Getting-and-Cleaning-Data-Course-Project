## Check and set working directory
getwd()
setwd("C:/Users/Administrator/Desktop/Getting and Cleaning Data/UCI HAR Dataset")

## Load dplyr package
library(dplyr)

## Read data, variables and labels 
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")
Sub_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")
Sub_train <- read.table("./train/subject_train.txt")
variable <- read.table("./features.txt")
label <- read.table("./activity_labels.txt")

## 1. Merges the training and the test sets to create one data set
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
Sub <- rbind(Sub_train, Sub_test)

## 2. Extracts only the measurements on the mean and standard deviation
## for each measurement
meanStd <- variable[grep("mean\\(\\)|std\\(\\)",variable[,2]),]
X <- X[,meanStd[,1]]

## 3. Uses descriptive activity names to name the activities in the data set
colnames(Y) <- "activity"
Y$activity <- factor(Y$activity, labels = as.character(label[,2]))
activity <- Y[,-1]

## 4. Appropriately labels the data set with descriptive variable names
colnames(X) <- variable[meanStd[,1],2]

## 5. From the data set in step 4, creates a second, independent tidy
## data set with the average of each variable for each activity 
## and each subject
colnames(Sub) <- "subject"
tidy <- cbind(X, activity, Sub)
tidy_mean <- tidy %>% group_by(activity, subject) %>% summarize_all(funs(mean))
write.table(tidy_mean, file = "./tidydata.txt", row.names = FALSE)