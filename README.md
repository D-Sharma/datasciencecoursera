

##Introduction
The goal of this script is to prepare tidy data that can be used for later analysis. This script takes the data for the accelerometers from the Samsung Galaxy S smartphone and performs a series of actions to create a tidy data which will be used for analysis purposes. The first step will be to download the data from the link below and place it in the R working directory. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

In the next step open the "run_analysis.R" script to run it in R. The script results in one dataset in which combines all the data into one dataset with measurements on mean() and std(). The script also creates an output file "tidy_data.txt" which is a tidy data and contains averages of each measurement for each subject and each activity.


##run_analysis.R script
This script combines data, cleans it, and reshapes it to produce a tidy data which can be used for later analysis. The scripts creates one dataset which contains measurements on mean and standard deviation. Secondly, it outputs a tidy data into a file called "tidy_data.txt" which contains averages of each measurement for each subject and each activity.

This scripts combines the train and test data into one dataset. The UCI HAR Dataset contains two folders train and test which contains data for subject, X, and Y, where subject contains IDs for 30 volunteers, X contains data for the various features of this dataset, and Y contains the activity performed by the subjects. 

The script performs the following key steps: 
* Step 1: Merges the training and the test sets to create one data set.
    This steps gets data for X, Y, and subject from train and test folders. It vertically combines respective data from files in train and test folders for example it vertically combines data for X from train folder to data for X from test folder, so on and so forth. Next, with the aim of creating one dataset which combines data from all the files, the data for Subject, Y, and X are horizontally combined into one dataset. 
    The script gets features names from feature.txt file in UCI HAR Dataset folder and gives suitable variable names to features data in the dataset

* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
    In the current dataset there are 561 features, however, we are only interested in measurements on the mean and standard deviation. Hence using the dataset we extract all the variables for measurements on mean and standard deviation. A total of 66 vairables for mean and standard deviation exist in the dataset. Therefore, in the resultant dataset contains 66 features for mean and standard deviation.
    
* Step 3: Uses descriptive activity names to name the activities in the data set
    This step gets description activity descriptive names from DCI HAR dataset "activity_label.txt". Merge the activity label with activity code in the dataset.

* Step 4: Appropriately labels the data set with descriptive activity names. 
    This step renames variable names to give them a descriptive name.

* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    This step reshapes the data to form subgroups of subject and activity, it calcualtes averages for each measurement for each subject and activity.
