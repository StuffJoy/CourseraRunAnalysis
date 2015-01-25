###X_train 
data set read into R from the X_train.txt file in the train folder

y_train - data set read into R from the y_train.txt file in the train folder
subject_train - data set read into R from the subject_train.txt file in the train folder

X_test - data set read into R from the X_test.txt file in the test folder
y_test - data set read into R from the y_test.txt file in the test folder
subject_test - data set read into R from the subject_test.txt file in the test folder

X_merged - data frame created after X_train is merged by row with X_test
y_merged - data frame created after y_train is merged by row with y_test
subject_merged - data frame created after subject_train is merged by row with subject_test


features - data frame created from features.txt file
Columns in this file are also renamed to feature_id and feature_name for readability

grep_features - variable stores all functions in features dealing with mean() or std()

X_merged - updated to only display values relating to mean/std. Column names are also updated to more readable values.

activity_labels - data frame created from activity_labels.txt file
Columns in this file are also renamed to activity_id and activity_name for readability

tidyDataSet - data frame created from a column bind ()cbind of the subject_merged, y_merged and X_merged dataframes.

tidyDataSet_final - data frame showing average of each variable for each activity and each subject


