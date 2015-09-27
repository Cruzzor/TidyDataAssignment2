library(dplyr)

############################################
########## Setup path variables ############
############################################

#datasetFolder <- "../UCI HAR Dataset/"
datasetFolder <- "./UCI HAR Dataset/"


############################################
############# Reading files ################
############################################

## Load column names for the features
colnames <- read.table(paste(datasetFolder, "features.txt", sep = ""), stringsAsFactors = FALSE)


## Load the training data and set the column names
train_X <- read.table(paste(datasetFolder, "train/X_train.txt", sep = ""), stringsAsFactors = FALSE)
colnames(train_X) <- colnames$V2
train_y <- read.table(paste(datasetFolder, "train/y_train.txt", sep = ""), stringsAsFactors = FALSE)

## Load the training subjects
subjects_train <- read.table(paste(datasetFolder, "train/subject_train.txt", sep = ""), stringsAsFactors = FALSE)


## Load the test data and set the column names
test_X <- read.table(paste(datasetFolder, "test/X_test.txt", sep = ""), stringsAsFactors = FALSE)
colnames(test_X) <- colnames$V2
test_y <- read.table(paste(datasetFolder, "test/y_test.txt", sep = ""), stringsAsFactors = FALSE)

## Load the test subjects
subjects_test <- read.table(paste(datasetFolder, "test/subject_test.txt", sep = ""), stringsAsFactors = FALSE)


############################################
######### Putting data together ############
############################################

## Merge training set and test set
data <- rbind(train_X, test_X)

## Removing the brackets from the column names
## because the brackets are causing trouble for the select function
## make.names converts invalid symbols to dots
valid_column_names <- make.names(names=names(data), unique=TRUE, allow_ = TRUE)
colnames(data) <- valid_column_names

## Select only columns that contain "mean" or "std"
temp1 <- data %>% select(contains("mean"))
temp2 <- data %>% select(contains("std"))
filteredData <- cbind(temp1, temp2)

## Add the "activity" column
activities <- rbind(train_y, test_y)
names(activities) <- "activity"
filteredData <- cbind(activities, filteredData)

## Add the "subject" column
subjects <- rbind(subjects_train, subjects_test)
names(subjects) <- "subject"
filteredData <- cbind(subjects, filteredData)


############################################
############# Tidiying data ################
############################################

## Give descriptive activity names
filteredData[filteredData$activity == 1, ]$activity = "WALKING"
filteredData[filteredData$activity == 2, ]$activity = "WALKING_UPSTAIRS"
filteredData[filteredData$activity == 3, ]$activity = "WALKING_DOWNSTAIRS"
filteredData[filteredData$activity == 4, ]$activity = "SITTING"
filteredData[filteredData$activity == 5, ]$activity = "STANDING"
filteredData[filteredData$activity == 6, ]$activity = "LAYING"

## Some type conversions of the variables
filteredData$activity <- as.factor(filteredData$activity)
filteredData$subject <- as.factor(filteredData$subject)

## Aggregate to the average of each variable for each activity and each subject
subject <- filteredData$subject
activity <- filteredData$activity
final <- aggregate(.~subject+activity, select(filteredData, -(activity), -(subject)), FUN=mean)

## Sort by subject and print
final <- final %>% arrange(subject)
View(final)


############################################
########## Write data to file ##############
######## and clean up variables ############
############################################

## Write to file
write.table(final, file = "tidyDataset.txt", row.names = FALSE)

## Clean up obsolete (temporary) variables
rm(train_X, train_y, test_X, test_y, temp1, temp2, subjects_test, subjects_train, 
   data, colnames, activities, subjects, valid_column_names, activity, subject, datasetFolder)

######### end of run_analysis.R ############