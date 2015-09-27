# Readme for the script analysing the data set for TidyData assignment 2

## Codebook
In the following you will find a short explanation of the variables of the data set the script *runAnalysis.R* outputs.

* subject: the id of the person performing a certain activity
* activity: the activity a certain person performed
* list of meassured data variables: the other variables can be looked up in the code book of the original data set that can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Note 1:** Not all of the meassured data variables from the original data set have been added to the final data set produced by *runAnalysis.R*. Only the variables expressing values of means and standard deviations have been taken from the original data set. 

**Note 2:** The variable names have been left as is since they are already very descriptive. The only modification was to replace all characters that are not allowed corresponding to the R syntax definition of variables, namely "-", "(" and ")".

## Script description
In this section you will find a a brief explanation about what the script does. 

### Requirements
To be able to run the script the following R library needs to be installed on your system:
* dplyr

Also, you need the original data set located in a folder in your R workspace. The files need to be extracted in a folder named "UCI HAR Dataset", which is the default folder from the original data set. You can this by editing the *datasetFolder* variable on the top of the script (see below).

### Running the script
The script itself is separated in several parts:
* Setup
* Reading the files of the original data set
* Putting the data together to a whole data set
* Tidying the data
* Data set output

In the following, all sections will be briefly explained:
#### Setup
Here you can change the path to the folder containing the original data set.

#### Reading the files of the original data set
This section reads all the necessary files from the original data set. In detail these are
* the subjects
* the activities which are represented by the _y_ variable
* the meassured data represented by the _X_ variables
* the feature names
* complete data sets for a training and a testing group

#### Putting the data together to a whole data set
This part combines all the data above to a single data set according to the task description, namely extracting only the features containing values for means or standard deviations.

#### Tidying the data
First thing here is to give descriptive names to the activities performed by either subject. These names are taken from the original data set and replace the numeric values. By using the _aggregate_ function, all data is collapsed so that for every activity and for every subject there's only the mean of all corresponding values contained in the tidy data set.

#### Data set output
This section is about writing the final data set to a file named _tidyDataset.txt_. It will be located in the set R workspace afterwards. Also, all obsolete variables are removed from memory since there're not needed anymore.

