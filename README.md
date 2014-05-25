
# README

## tidy_data.txt

Contains the tidy_data set obtained from the data of the Programming Assignment for Getting and Cleaning Data from a Coursera course by John Hopkins University.

This data is the result of running: run_analysis.R



## summary_data.txt

Contains the mean (first row) and standard deviation (second row) of all the variables of the complete tidy data set.



## subj_act_data.txt

Contains a list with the mean of each variable breaken down by subject and activty factor. 



## run_analysis.R

This code reads the data extracted for the assignment from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code first reads the data sets in the zipped file:

- Activity Labels (activty_labels.txt)
- Features: variable names for the data sets (features.txt)
- Training Data:
  * X_train.txt the training dat set
  * Y_train.txt the activity factors for the training data set
  * subject_train.txt the subject factors for the training data set 
- Test Data:
  * X_test the test dat set
  * Y_test the activity factors for the test data set
  * subject_test.txt the subject factors for the test data set


The code runs the analysis for the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The code then merges the data into one complete data set. First, all the training data and factors, then the test data. Both complete sets are then added into one.

The complete tidy set is exported to tidy_data.txt.

The data set summary_data.txt contains the mean and standard deviation of all the variables of the data set.

The data set subj_act_data.txt contains mean of all variables by activity and subject.


