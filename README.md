---
title: "README: Getting and Cleaning Data Course Project"
author: "Edgar Scott"
date: "4/22/2015"
output: html_document
---

### Summary
This document descrbes how to execute **run_analysis.R**.  In summary, this script will read in the necessary files from the directory ***UCI HAR Dataset*** of this unzipped file <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and 
then output a tidy data set into a file named **tidy_data.txt**.

### Dependencies and Execution
- **run_analysis.R** uses the following packages: **dplyr** and **reshape2**.  If you don't have these packages installed, please install these dependencies with the following commands.
```
install.packages(c("dplyr", "reshape2"))
```
- The data needed for **run_annalysis.R** can be downloaded from here <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  Please download this zipped file and unzip it.  It can be unzipped in R with the following command.
```
unzip("UCI HAR Dataset.zip")
```
- **run_analysis.R** needs to be executed in R where the directory is set to the parent directory of ***UCI HAR Dataset***.  This is going to be the same directory that **UCI HAR Dataset.zip** was unzipped in.
- Once these dependences have been installed, file downloaded and unzipped, and the correct directory set, **run_analysis.R** can then be executed by simply sourcing it with the following command
```
source("run_analysis.R")
```
- Upon completion, **run_analysis.R** will write the tidy data to a comma separated file named **tidy_data.txt** in the parent directory of ***UCI HAR Dataset***.  You can open the file in R with the following command
```
tidy_data <- read.csv("tidy_data.txt")
```

### References
README - this file

CodeBook <http://www.github.com/escott8908>

description of experiment here <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

download data here <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
