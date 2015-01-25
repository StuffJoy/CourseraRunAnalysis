# CourseraRunAnalysis
The run_analysis script works by first reading the data from the Samsung data which should have been made placed into your working everyday. 

The data to be loaded are in two folders, train and test.
The read.table script is used to read the data from these files innto R.

Following this, the rbind function is used to merge the relating data sets together.
Thus the creation of X_merged, y_merged and subject_merged dataframes.

The feature file containing the function now comes into play.
it is first given more meaningful column names(feature_id, feature_name) tith the names() function, following which, the feature_name column is passed to the grep() function, to extract all mean and standardardd deviation(std) functions, and this is stored as grep_features.

This is used to filter X-Merged previously created, leaving only the matched values(means and std).
The names in X-merged are then made more readable by removing the "\\(|\\)" with gsub.

the activity_labels text is then read in, and given more friendly column names.
It is then passed to y_merged.

The new tidy data set is created from a column bind(cbind) on (subject_merged, y_merged, X_merged) dataframes.

#grep_features holds ids for all std and mean
