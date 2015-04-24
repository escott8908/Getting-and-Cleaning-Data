#loading libraries
library("dplyr")
library("reshape2")


# Determine if this script is being executed in the correct directory
if(!file.exists("UCI HAR Dataset")){
  stop("I could not find the directory 'UCI HAR Dataset'.  
  Please execute me in the parent directory of 'UCI HAR Dataset'.
  I need access to 'UCI HAR Dataset' so that I can find the files I need to create my tidy data.")
}

# Load raw data from UCI HAR Dataset directory
features = read.table("./UCI HAR Dataset/features.txt")
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")
activity = as.character(activity_labels$V2)

######################################################################################
# creating a data frame of the test data set named 'test'
######################################################################################

# read in files y_test.txt, subject_test.txt, and X_test.txt into data frames y_test, subject_test, and X_test
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")

# correlating the activities with their numeric id in y_test
y_test = mutate(y_test, activity = activity[y_test$V1])

# merge the data frames into dataframe named test
test = data.frame(subject_test, y_test$activity, X_test)

# provide column names to dataframe test
names(test) = c("subject", "activity", as.character(features[[2]]))

######################################################################################
# creating a data frame of the training data set named 'training'
######################################################################################

# read in files y_train.txt, subject_train.txt, and X_train.txt into data frames y_train, subject_train, and X_train
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")

# correlating the activities with their numeric id in y_test
y_train = mutate(y_train, activity = activity[y_train$V1])

# merge the data frames into dataframe named train
train = data.frame(subject_train, y_train$activity, X_train)

# provide column names to dataframe train
names(train) = c("subject", "activity", as.character(features[[2]]))

######################################################################################
# going to join data frames 'test' and 'train' into data frame 'data_set' and then 
# extract "only the measurements on the mean and standard deviation for each measurement"
######################################################################################

data_set = rbind(train, test)
mean_columns = grep("mean", names(data_set), ignore.case=T, value=T)
std_columns = grep("std", names(data_set), ignore.case=T, value=T)
filtered = data_set[, c("subject", "activity", mean_columns, std_columns)]

# cleaning the column names 
edited_column_names = names(filtered)
edited_column_names = gsub("\\(","",edited_column_names)
edited_column_names = gsub("\\)","",edited_column_names)
edited_column_names = gsub("\\-","",edited_column_names)
edited_column_names = gsub("\\,","",edited_column_names)
names(filtered) = edited_column_names

#melting data set to create tidy data per Hadley Wickham paper
melted = melt(filtered, id=c("subject", "activity"), variable.name = "measurementVariables", value.name = "values")
melted_group = group_by(melted, subject, activity, measurementVariables)
group_means = summarize(melted_group, measurementMeanValues = mean(values))

write.table(group_means, file="tidy_data.txt", row.names=F, sep=",")
