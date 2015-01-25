# Reads in Test and Train DataSets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Merges Test and Train DataSets
X_merged <- rbind(X_train, X_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# Extract measurements on mean and standard deviation measurements.

features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c('feature_id', 'feature_name')

# Search for matches to argument mean or standard deviation (sd)  within each element of character vector
grep_features <- grep("-mean\\(\\)|-std\\(\\)", features$feature_name) 
X_merged <- X_merged[, grep_features] 
names(X_merged) <- (features[grep_features, 2])

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c('activity_id', 'activity_name')
y_merged[, 1] = activity_labels[y_merged[, 1], 2]
names(y_merged) <- "Activities"
names(subject_merged) <- "Subjects"

# Combines data table by columns
tidyDataSet <- cbind(subject_merged, y_merged, X_merged)


# Creates independent tidy data set with the average of each variable for each activity and each subject
tidySetObject <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataSet_final <- aggregate(tidySetObject,list(tidyDataSet$Subjects, tidyDataSet$Activities), mean)
  
# Name activity and subject columns 
names(tidyDataSet_final)[1] <- "Subjects"
names(tidyDataSet_final)[2] <- "Activities"

#Writes out file as txt
write.table(tidyDataSet_final, file = "tidyDataSet_final.txt", row.names = FALSE)
