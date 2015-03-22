Requirments
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each 
variable for each activity and each subject.


*Course-Project
Getting and Cleaning Data Course Project
*The source of data for this project is: 
*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*1. Names and Merges data sets of Test and Train from Data, Labels, and Subject into 1 new 
*set of data called full.Data respectively.

*Combines the 2 data sets (train.Data and test.Data) into 1 (total.Data) using the rbind function.
train.Data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test.Data <- read.table("./UCI HAR Dataset/test/X_test.txt")
total.Data <- rbind(train.Data, test.Data)

*Combines the 2 data sets (train.Labels and test.Labels) into 1 (total.Labels) using the rbind function.
train.Labels <- read.table("./UCI HAR Dataset./train/y_train.txt")
test.Labels <- read.table("./UCI HAR Dataset./test/y_test.txt")
total.Labels <- rbind(train.Labels, test.Labels)

*Combines the 2 data sets (train.Subject and test.Subject) into 1 (total.Subject) using the rbind function.
train.Subject <- read.table("./UCI HAR Dataset./train/subject_train.txt")
test.Subject <- read.table("./UCI HAR Dataset./test/subject_test.txt")
total.Subject <- rbind(train.Subject, test.Subject)


*2. Extracts the measurements on the mean and standard deviation for each measurement.
*Uses function grep() which will retur an interger vector of the indices of the elements
*of x that yielded a match
*Also uses tolower() that converts upper-case characters in a character vector to lower-case while
*leaving number vectors unchanged.
features <- read.table("./UCI HAR Dataset/features.txt")
indices_features <- grep("-mean\\(\\)|-std\\(\\)", tolower(features[, 2]), value=FALSE)
total.Data <- total.Data[, indices_features]
names(total.Data) <- tolower(features[indices_features, 2])


*3. Uses descriptive activity names to name the activities in the data set
*Usees functionn gsub() which works much like the grep() function mentioned above however gsub() will 
*replace all occurrences of, in our case, "_" to "" (nothing). 
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
total.Labels[,1] = activities[total.Labels[,1], 2]
names(total.Labels) <-"Activity"


*4. Appropriately labels the data set with descriptive activity names. 
*cbind() is used here to combine multiple columns together into one data set.
names(total.Subject) <- "Subject"
TidyDataSet <- cbind(total.Subject, total.Labels, total.Data)
write.table(TidyDataSet, "./UCI HAR Dataset/activity_labels.txt")


*5. Creates a 2nd, independent tidy data set with the average of each variable 
*for each activity and each subject.
*aggregate() collapses data together to quickly collect a common theme, here the mean.
*write.table spits out the final .txt file with the averaged data needed.
Independent <- TidyDataSet[, 3:dim(TidyDataSet)[2]]
TDS_Average <- aggregate(Independent, list(TidyDataSet$Subject, TidyDataSet$Activity), mean)
names(TDS_Average)[1] <- "Subject"
names(TDS_Average)[2] <- "Activity"
write.table(TDS_Average, file = "TDS_Average.txt", row.names = FALSE)
