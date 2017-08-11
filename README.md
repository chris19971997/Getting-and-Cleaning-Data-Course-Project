# Getting-and-Cleaning-Data-Course-Project

This repository contains the R code for completing the course project. The data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

First download the data from the url above and save it into your R working directory. Then source "run_analysis.R" in R, the code will automatically generate the tidy data following the requirement of the course project, which is:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The generated data should be the same to "tidydata.txt" in this repository, which contains 180 observations of 68 variables(more information in "CodeBook.md").

When using the R code, please first check if there is any update of the "dplyr" package, which is mainly used here.
