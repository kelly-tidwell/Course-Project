The script run_analysis.R performs the 5 steps described in the course project's definition:
1.) Merges the training and the test sets to create one data set.
2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
3.) Uses descriptive activity names to name the activities in the data set
4.) Appropriately labels the data set with descriptive variable names. 
5.) From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.


1 - Binds similar data together using the rbind() function.  
x_train + x_test = total.Data:
	V1	        V2	        V3	        V4	        V5
1	0.28858451	-2.03E-02	-1.33E-01	-9.95E-01	-0.98311061
2	0.27841883	-1.64E-02	-1.24E-01	-9.98E-01	-0.97530022
3	0.27965306	-1.95E-02	-1.13E-01	-9.95E-01	-0.96718701
4	0.27917394	-2.62E-02	-1.23E-01	-9.96E-01	-0.9834027
5	0.27662877	-1.66E-02	-1.15E-01	-9.98E-01	-0.98081727

y_train + y_test = total.Labels:
 	V1
1	5
2	5
3	5
4	5
5	5

subject_train + subject_test = total.Subject:
        V1
1	1
2	1
3	1
4	1
5	1

2 - Extracts the mean and std (standard Deviation) from the total.data file
features:
        V1	V2
1	1	tBodyAcc-mean()-X
2	2	tBodyAcc-mean()-Y
3	3	tBodyAcc-mean()-Z
4	4	tBodyAcc-std()-X
5	5	tBodyAcc-std()-Y

indices_features:
[1:66] 1, 2, 3, 4, 5, 6, 41, 42, 43, 44, ...

Total Data:
	V1	V2	V3	V4	V5
1	0.28858451	-2.03E-02	-1.33E-01	-9.95E-01	-0.98311061
2	0.27841883	-1.64E-02	-1.24E-01	-9.98E-01	-0.97530022
3	0.27965306	-1.95E-02	-1.13E-01	-9.95E-01	-0.96718701
4	0.27917394	-2.62E-02	-1.23E-01	-9.96E-01	-0.9834027
5	0.27662877	-1.66E-02	-1.15E-01	-9.98E-01	-0.98081727


3 -  Passes usable Activity names to the data set.  
Activities:
        Subject	Activity	tbodyacc.mean...x	tbodyacc.mean...y	tbodyacc.mean...z
1	1	standing	0.28858451	-2.03E-02	-1.33E-01
2	1	standing	0.27841883	-1.64E-02	-1.24E-01
3	1	standing	0.27965306	-1.95E-02	-1.13E-01
4	1	standing	0.27917394	-2.62E-02	-1.23E-01
5	1	standing	0.27662877	-1.66E-02	-1.15E-01


4 - Passes usable Subject names to the data set.
TidyDataSet:
   Subject	Activity	tbodyacc.mean...x	tbodyacc.mean...y	tbodyacc.mean...z
1	1	standing	0.28858451	-2.03E-02	-1.33E-01
2	1	standing	0.27841883	-1.64E-02	-1.24E-01
3	1	standing	0.27965306	-1.95E-02	-1.13E-01
4	1	standing	0.27917394	-2.62E-02	-1.23E-01
5	1	standing	0.27662877	-1.66E-02	-1.15E-01


In both steps 3 and 4 the names were generated from the activities_labels.txt file.

5 - A new .txt file is created for each subject and activity called TDS_Average.txt.  
Independent:
	tbodyacc-mean()-x	tbodyacc-mean()-y	tbodyacc-mean()-z	tbodyacc-std()-x	tbodyacc-std()-y
1	0.28858451	-2.03E-02	-1.33E-01	-9.95E-01	-0.98311061
2	0.27841883	-1.64E-02	-1.24E-01	-9.98E-01	-0.97530022
3	0.27965306	-1.95E-02	-1.13E-01	-9.95E-01	-0.96718701
4	0.27917394	-2.62E-02	-1.23E-01	-9.96E-01	-0.9834027
5	0.27662877	-1.66E-02	-1.15E-01	-9.98E-01	-0.98081727

TDS_Average:
	Group.1	Group.2	tbodyacc-mean()-x	tbodyacc-mean()-y	tbodyacc-mean()-z
1	1	standing	0.2656969	-0.01829817	-0.1078457
2	2	standing	0.2731131	-0.01913232	-0.11565
3	3	standing	0.2734287	-0.01785607	-0.1064926
4	4	standing	0.2741831	-0.01480815	-0.1075214
5	5	standing	0.279178	-0.01548335	-0.1056617


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
