##
##    GETTING AND CLEANING DATA - Programming Assignment
##
##    Guillermo Monge del Olmo, May 2014
##
# GOAL:
#	The overall goal of this assignment is to prepare tidy data that can
# be used for later analysis.


## Previous considerations:
#  Downloaded data must be unzipped and in the current working directory 
setwd("C:/Users/guillermo.monge.del1/Documents/Coursera/Data Science - John Hopkins/3. Getting and Cleaning Data/UCI HAR Dataset")



## READ VARIABLE NAMES
# Read variable names
var.names <- read.table(file="UCI HAR Dataset/features.txt",
                        col.names= c("position","variable"))

# Read activity factor labels
fact.labels <- read.table(file="UCI HAR Dataset/activity_labels.txt",
                          col.names= c("code","act.label"))



## READ TRAINING DATA-SET
# Read train data
train.data <- read.table(file="UCI HAR Dataset/train/X_train.txt",
                         col.names=var.names$variable)

# Read train activity and subject factors
train.act.factors <- read.table(file="UCI HAR Dataset/train/Y_train.txt",
                                col.names= "act.factor")
train.subj.factors <- read.table(file="UCI HAR Dataset/train/subject_train.txt",
                                 col.names= "subj.factor")

# Merge subject and activity factors to training data set
train <- cbind(train.data,train.subj.factors,train.act.factors)

# Add activity factor labels to data set
train <- merge(train, fact.labels, by.x= 'act.factor', by.y= 'code')



## READ TRAINING DATA-SET
# Read test data
test.data <- read.table(file="UCI HAR Dataset/test/X_test.txt",
                        col.names=var.names$variable)

# Read test activity and subject factors
test.act.factors <- read.table(file="UCI HAR Dataset/test/Y_test.txt",
                               col.names= "act.factor")
test.subj.factors <- read.table(file="UCI HAR Dataset/test/subject_test.txt",
                                col.names= "subj.factor")

# Merge subject and activity factors to training data set
test <- cbind(test.data,test.subj.factors,test.act.factors)

# Add activity factor labels to data set
test <- merge(test, fact.labels, by.x= 'act.factor', by.y= 'code')



## 1. Merge the training and the test sets to create one data set.

data <- rbind(test,train)
nrow(data) == nrow(train) + nrow(test)
    # TRUE


## 2. Extract only the measurements on the mean and standard deviation for
# each measurement.

mean.data <- sapply(data, mean)  # extract mean
sd.data <- sapply(data, sd)  # extract sd
summ.data <- rbind(mean.data, sd.data)  # merge summary data into a single set


## 3. & 4. Use descriptive activity names to name and appropiately label the
# data set with descriptive activity names.

# Done previously to the merge of train and test, by merging the data with
# the factors ant their corresponding activity labels. See lines 41-45 & 60-64


## 5. Create a second, independent tidy data set with the average of each
# variable for each activity and each subject. 

# Create list in which each entry is a matrix with the mean by subject (row),
# and column (activity) of each of the data variables. Since there were
# 561 non-factor variables, the list contains 561 entries.
data.act.subj <- NULL
for (i in 2:562) {
    data.act.subj[[names(data)[i]]] <- tapply(data[,i],
                                              list("Subject#"=data$subj.factor,
                                                   "Activity"=data$act.label),
                                              mean) 
}


## Export complete tidy data set to .txt file
write.table(data, "Assignment/tidy_data.txt", sep="\t")

## Export summary data set to .txt file
write.table(summ.data, "Assignment/summary_data2.txt", sep="\t")

## Export complete tidy data set to .txt file
write.table(data.act.subj, "Assignment/subj_act_data.txt", sep="\t")
