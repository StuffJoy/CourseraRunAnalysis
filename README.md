# CourseraRunAnalysis

The run_analysis.R script works by first reading the data from the Samsung data which should have been made placed into your working directory. 

The data to be loaded are in two folders, train and test.
The read.table script is used to read the data from these files innto R.

Following this, the row bind(rbind) function is used to merge the relating data sets together by rows.
Thus the creation of X_merged, y_merged and subject_merged dataframes.

The feature.txt file containing the function now comes into play.
it is first given more meaningful column names(feature_id, feature_name) with the names() function, following which, the feature_name column is passed to the grep() function, to extract all the mean and standard deviation(std) functions, and this is stored as grep_features.

This is used to filter the previously created X-Merged, leaving only the matched values(means and std).
The columns names in X-merged are then made more readable by replacing them with the corresponding feature names.

The activity_labels text is then read in, and given more friendly column names.
It is then passed to y_merged, following which the y_merge and subject merged are given meaningful column names

The new tidy data set is created from a column bind(cbind) done on (subject_merged, y_merged, X_merged) dataframes.
Finally, the aggregate function is used to provide the average(mean) of each variable for each activity and each subject.
