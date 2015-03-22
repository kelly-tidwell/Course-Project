#The source of data for this project is: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#1. Merges the training and the test sets to create one data set.
#set of data called full.Data respectively.

train.Data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test.Data <- read.table("./UCI HAR Dataset/test/X_test.txt")
total.Data <- rbind(train.Data, test.Data)

train.Labels <- read.table("./UCI HAR Dataset./train/y_train.txt")
test.Labels <- read.table("./UCI HAR Dataset./test/y_test.txt")
total.Labels <- rbind(train.Labels, test.Labels)

train.Subject <- read.table("./UCI HAR Dataset./train/subject_train.txt")
test.Subject <- read.table("./UCI HAR Dataset./test/subject_test.txt")
total.Subject <- rbind(train.Subject, test.Subject)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt")
indices_features <- grep("-mean\\(\\)|-std\\(\\)", tolower(features[, 2]), value=FALSE)
total.Data <- total.Data[, indices_features]
names(total.Data) <- tolower(features[indices_features, 2])


#3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
total.Labels[,1] = activities[total.Labels[,1], 2]
names(total.Labels) <-"Activity"


# 4. Appropriately labels the data set with descriptive variable names. 
names(total.Subject) <- "Subject"
TidyDataSet <- cbind(total.Subject, total.Labels, total.Data)
write.table(TidyDataSet, "./UCI HAR Dataset/activity_labels.txt")


# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
Independent <- TidyDataSet[, 3:dim(TidyDataSet)[2]]
TDS_Average <- aggregate(Independent, list(TidyDataSet$Subject, TidyDataSet$Activity), mean)
names(TDS_Average)[1] <- "Subject"
names(TDS_Average)[2] <- "Activity"
write.table(TDS_Average, file = "TDS_Average.txt", row.names = FALSE)
