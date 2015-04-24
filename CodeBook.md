---
title: "CodeBook: Getting and Cleaning Data"
author: "Edgar Scott"
date: "4/22/2015"
output: html_document
---
### Summary
This codebook describes what **run_analysis.R** accomplishes as well as the contents of the tidy data file, **tidy_data.txt**, that the script creates.  

### Description of **run_analysis.R**
**run_analysis.R** is a script written in R to perform the following tasks...

 - Merge the training and the test data sets from this zip file <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> to create one data set.  A Description of the study can be found here <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
 - Extract only the measurements on the mean and standard deviation for each measurement.  If the measurement had either the word "mean" or "std" in it, then it was extracted, yielding 86 measurements.  
 - Use descriptive activity names to name the activities in the data set stored in **acitivity_labels.txt**
 - Appropriately label the data set with descriptive variable names which are stored in **features.txt**.
      All special characters (i.e. parentheses, commas, and hyphens) were removed from the variable names
 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Description of **tidy_data.txt**
**tidy_data.txt** contains a 4 x 15480 data frame of tidy data generated by **run_analysis.R**. The raw data was merged and melted based on the principles expressed by Hadley Wickham in his paper “Tidy Data” <http://www.jstatsoft.org/v59/i10/paper>. Given that there are 6 activities, 30 subjects, and 86 measurements, this produces 15480 observations following melting (6 * 30 * 86 = 15480).  Below is a description of the variables in **tidy_data.txt**

 - **subject** – the numeric identifier of each of the participants in the study
 - **activity** – the specific physical activity performed
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
 - **measurementVariables** – names of the variables that are the means of the measurement or the standard deviation of the measurement collected in the study.  A full description of these variables can be found in the file named **features_info.txt** which, in turn, can be found in the zipped file here <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
    - mean variable names extracted from raw data set
        - tBodyAccmeanX: originally labeled tBodyAcc-mean()-X 
        - tBodyAccmeanY: originally labeled tBodyAcc-mean()-Y 
        - tBodyAccmeanZ: originally labeled tBodyAcc-mean()-Z 
        - tGravityAccmeanX: originally labeled tGravityAcc-mean()-X 
        - tGravityAccmeanY: originally labeled tGravityAcc-mean()-Y 
        - tGravityAccmeanZ: originally labeled tGravityAcc-mean()-Z 
        - tBodyAccJerkmeanX: originally labeled tBodyAccJerk-mean()-X 
        - tBodyAccJerkmeanY: originally labeled tBodyAccJerk-mean()-Y
        - tBodyAccJerkmeanZ: originally labeled tBodyAccJerk-mean()-Z  
        - tBodyGyromeanX: originally labeled tBodyGyro-mean()-X 
        - tBodyGyromeanY: originally labeled tBodyGyro-mean()-Y 
        - tBodyGyromeanZ: originally labeled tBodyGyro-mean()-Z 
        - tBodyGyroJerkmeanX: originally labeled tBodyGyroJerk-mean()-X
        - tBodyGyroJerkmeanY: originally labeled tBodyGyroJerk-mean()-Y 
        - tBodyGyroJerkmeanZ: originally labeled tBodyGyroJerk-mean()-Z 
        - tBodyAccMagmean: originally labeled tBodyAccMag-mean() 
        - tGravityAccMagmean: originally labeled tGravityAccMag-mean()
        - tBodyAccJerkMagmean: originally labeled tBodyAccJerkMag-mean() 
        - tBodyGyroMagmean: originally labeled tBodyGyroMag-mean() 
        - tBodyGyroJerkMagmean: originally labeled tBodyGyroJerkMag-mean() 
        - fBodyAccmeanX: originally labeled fBodyAcc-mean()-X 
        - fBodyAccmeanY: originally labeled fBodyAcc-mean()-Y 
        - fBodyAccmeanZ: originally labeled fBodyAcc-mean()-Z 
        - fBodyAccmeanFreqX: originally labeled fBodyAcc-meanFreq()-X 
        - fBodyAccmeanFreqY: originally labeled fBodyAcc-meanFreq()-Y 
        - fBodyAccmeanFreqZ: originally labeled fBodyAcc-meanFreq()-Z 
        - fBodyAccJerkmeanX: originally labeled fBodyAccJerk-mean()-X
        - fBodyAccJerkmeanY: originally labeled fBodyAccJerk-mean()-Y 
        - fBodyAccJerkmeanZ: originally labeled fBodyAccJerk-mean()-Z 
        - fBodyAccJerkmeanFreqX: originally labeled fBodyAccJerk-meanFreq()-X 
        - fBodyAccJerkmeanFreqY: originally labeled fBodyAccJerk-meanFreq()-Y 
        - fBodyAccJerkmeanFreqZ: originally labeled fBodyAccJerk-meanFreq()-Z 
        - fBodyGyromeanX: originally labeled fBodyGyro-mean()-X 
        - fBodyGyromeanY: originally labeled fBodyGyro-mean()-Y 
        - fBodyGyromeanZ: originally labeled fBodyGyro-mean()-Z 
        - fBodyGyromeanFreqX: originally labeled fBodyGyro-meanFreq()-X 
        - fBodyGyromeanFreqY: originally labeled fBodyGyro-meanFreq()-Y 
        - fBodyGyromeanFreqZ: originally labeled fBodyGyro-meanFreq()-Z 
        - fBodyAccMagmean: originally labeled fBodyAccMag-mean() 
        - fBodyAccMagmeanFreq: originally labeled fBodyAccMag-meanFreq() 
        - fBodyBodyAccJerkMagmean: originally labeled fBodyBodyAccJerkMag-mean() 
        - fBodyBodyAccJerkMagmeanFreq: originally labeled fBodyBodyAccJerkMag-meanFreq() 
        - fBodyBodyGyroMagmean: originally labeled fBodyBodyGyroMag-mean()
        - fBodyBodyGyroMagmeanFreq: originally labeled fBodyBodyGyroMag-meanFreq() 
        - fBodyBodyGyroJerkMagmean: originally labeled fBodyBodyGyroJerkMag-mean() 
        - fBodyBodyGyroJerkMagmeanFreq: originally labeled fBodyBodyGyroJerkMag-meanFreq() 
        - angletBodyAccMeangravity: originally labeled angle(tBodyAccMean,gravity) 
        - angletBodyAccJerkMeangravityMean: originally labeled angle(tBodyAccJerkMean),gravityMean) 
        - angletBodyGyroMeangravityMean: originally labeled angle(tBodyGyroMean,gravityMean)
        - angletBodyGyroJerkMeangravityMean: originally labeled angle(tBodyGyroJerkMean,gravityMean) 
        - angleXgravityMean: originally labeled angle(X,gravityMean) 
        - angleYgravityMean: originally labeled angle(Y,gravityMean) 
        - angleZgravityMean: originally labeled angle(Z,gravityMean)
    - standard deviation variable names extracted from raw data set
        - tBodyAccstdX: originally labeled tBodyAcc-std()-X 
        - tBodyAccstdY: originally labeled tBodyAcc-std()-Y 
        - tBodyAccstdZ: originally labeled tBodyAcc-std()-Z 
        - tGravityAccstdX: originally labeled tGravityAcc-std()-X 
        - tGravityAccstdY: originally labeled tGravityAcc-std()-Y 
        - tGravityAccstdZ: originally labeled tGravityAcc-std()-Z 
        - tBodyAccJerkstdX: originally labeled tBodyAccJerk-std()-X 
        - tBodyAccJerkstdY: originally labeled tBodyAccJerk-std()-Y 
        - tBodyAccJerkstdZ: originally labeled tBodyAccJerk-std()-Z 
        - tBodyGyrostdX: originally labeled tBodyGyro-std()-X 
        - tBodyGyrostdY: originally labeled tBodyGyro-std()-Y 
        - tBodyGyrostdZ: originally labeled tBodyGyro-std()-Z 
        - tBodyGyroJerkstdX: originally labeled tBodyGyroJerk-std()-X 
        - tBodyGyroJerkstdY: originally labeled tBodyGyroJerk-std()-Y
        - tBodyGyroJerkstdZ: originally labeled tBodyGyroJerk-std()-Z 
        - tBodyAccMagstd: originally labeled tBodyAccMag-std() 
        - tGravityAccMagstd: originally labeled tGravityAccMag-std() 
        - tBodyAccJerkMagstd: originally labeled tBodyAccJerkMag-std() 
        - tBodyGyroMagstd: originally labeled tBodyGyroMag-std() 
        - tBodyGyroJerkMagstd: originally labeled tBodyGyroJerkMag-std() 
        - fBodyAccstdX: originally labeled fBodyAcc-std()-X 
        - fBodyAccstdY: originally labeled fBodyAcc-std()-Y 
        - fBodyAccstdZ: originally labeled fBodyAcc-std()-Z 
        - fBodyAccJerkstdX: originally labeled fBodyAccJerk-std()-X 
        - fBodyAccJerkstdY: originally labeled fBodyAccJerk-std()-Y 
        - fBodyAccJerkstdZ: originally labeled fBodyAccJerk-std()-Z 
        - fBodyGyrostdX: originally labeled fBodyGyro-std()-X 
        - fBodyGyrostdY: originally labeled fBodyGyro-std()-Y 
        - fBodyGyrostdZ: originally labeled fBodyGyro-std()-Z 
        - fBodyAccMagstd: originally labeled fBodyAccMag-std() 
        - fBodyBodyAccJerkMagstd: originally labeled fBodyBodyAccJerkMag-std() 
        - fBodyBodyGyroMagstd: originally labeled fBodyBodyGyroMag-std()
        - fBodyBodyGyroJerkMagstd: originally labeled fBodyBodyGyroJerkMag-std()
 - **measurementMeanValues** – the mean of each variable for each activity and each subject.