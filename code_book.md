The script run_analysis.R performs the 5 steps described in the course project's definition:
1.) Merges the training and the test sets to create one data set.
2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
3.) Uses descriptive activity names to name the activities in the data set
4.) Appropriately labels the data set with descriptive variable names. 
5.) From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.


1 - Binds similar data together using the rbind() function.  
x_train + x_test = total.Data
y_train + y_test = total.Labels
subject_train + subject_test = total.Subject

2 - Extracts the mean and std (standard Deviation) from the total.data file

3 -  Passes usable Activity names to the data set.  

4 - Passes usable Subject names to the data set.

In both steps 3 and 4 the names were generated from the activities_labels.txt file.

5 - A new .txt file is created for each subject and activity called TDS_Average.txt.  


Actual functions used:
rbind() - used multiple times to combine different sets of data into one group

grep() - uused to retur an interger vector of the indices of the elements of x 
        that yielded a match
        
tolower() - used to convert character case from upper to lower

read.table - used to read a set of data into R

gsub() - used to replace all occurances off a specific string of text

cbind() - used to combine multiple columns together into one usable data set.

write.table - creates an output file from some group of data

aggregate() - collapses data together
