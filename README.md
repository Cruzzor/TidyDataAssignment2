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

