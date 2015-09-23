
Coursera: Getting and Cleaning Data Course Project
===================================================

Alex Gascoigne

agascoig@yahoo.com

September 22nd, 2015

Summary
-------

This project is based on data from the UCI Machine Learning Repository,
"Human Activity Recognition Using Smartphones Dataset" Version 1.0.
30 volunteers perform six different activities (WALKING, WALKING_UPSTAIRS,
SITTING,STANDING,LAYING) wearing a Samsung Galaxy S II.  Data is taken
using the embedded accelerometer and gyroscope.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

My script uses the *dplyr* R package to group by activity and person,
and create summary statistics.

### Processing to Be Done

All of the processing is done by the run_analysis.R script file.  The
assignment steps are repeated below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This is saved in
a file named summary.txt in the output directory.

Data Files Used
---------------

### UCI HAR Dataset/train/X_train.txt

This contains thousands of rows of 561 feature variables.

### UCI HAR Dataset/train/y_train.txt

This contains thousands of rows of one variable, which are the
activity labels from 1 to 6.

### UCI HAR Dataset/test/X_test.txt

This contains thousands of rows of 561 feature variables.

### UCI HAR Dataset/test/y_test.txt

This contains thousands of rows of one variable, which are the
activity labels from 1 to 6.

### UCI HAR Dataset/features.txt

This contains the 561 feature descriptions.  We care only about
the means and standard deviations.

### UCI HAR Dataset/activity_labels.txt

This file translates the 6 activities to english names:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### UCI HAR Dataset/test/subject_test.txt

This contains the person (1-30) number corresponding to each row in the
X_test.txt file.

### UCI HAR Dataset/train/subject_train.txt

This contains the person (1-30) number corresponding to each row in the
X_train.txt file.

Data Files Not Used
-------------------

The files in the directory UCI HAR Dataset/test/Inertial Signals and
UCI HAR Dataset/train/Inertial Signals were not used in this project
because they are the raw sensor signals.  This raw data does not
have noise removed (by a lowpass filter) and is based on sliding
windows of 2.56 sec and 50% overlap.

Relevant Features
-----------------

The script run_analysis.R searches for case-insensitive mean
and std (for standard deviation) in the features.txt
description file.

The units are in standard units 'g' for the acceleration.  Features
are normalized and bounded within [-1,1].

The prefix *t* is used to denote time in the feature names.

The prefix *f* is used to indicate frequency domain signals obtained
using an FFT.

XYZ is used to denote 3-axial signals in the X, Y, and Z directions.

The features extracted are reproduced here:

1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tBodyAcc-std()-X
5. tBodyAcc-std()-Y
6. tBodyAcc-std()-Z
7. tGravityAcc-mean()-X
8. tGravityAcc-mean()-Y
9. tGravityAcc-mean()-Z
10. tGravityAcc-std()-X
11. tGravityAcc-std()-Y
12. tGravityAcc-std()-Z
13. tBodyAccJerk-mean()-X
14. tBodyAccJerk-mean()-Y
15. tBodyAccJerk-mean()-Z
16. tBodyAccJerk-std()-X
17. tBodyAccJerk-std()-Y
18. tBodyAccJerk-std()-Z
19. tBodyGyro-mean()-X
20. tBodyGyro-mean()-Y
21. tBodyGyro-mean()-Z
22. tBodyGyro-std()-X
23. tBodyGyro-std()-Y
24. tBodyGyro-std()-Z
25. tBodyGyroJerk-mean()-X
26. tBodyGyroJerk-mean()-Y
27. tBodyGyroJerk-mean()-Z
28. tBodyGyroJerk-std()-X
29. tBodyGyroJerk-std()-Y
30. tBodyGyroJerk-std()-Z
31. tBodyAccMag-mean()
32. tBodyAccMag-std()
33. tGravityAccMag-mean()
34. tGravityAccMag-std()
35. tBodyAccJerkMag-mean()
36. tBodyAccJerkMag-std()
37. tBodyGyroMag-mean()
38. tBodyGyroMag-std()
39. tBodyGyroJerkMag-mean()
40. tBodyGyroJerkMag-std()
41. fBodyAcc-mean()-X
42. fBodyAcc-mean()-Y
43. fBodyAcc-mean()-Z
44. fBodyAcc-std()-X
45. fBodyAcc-std()-Y
46. fBodyAcc-std()-Z
47. fBodyAcc-meanFreq()-X
48. fBodyAcc-meanFreq()-Y
49. fBodyAcc-meanFreq()-Z
50. fBodyAccJerk-mean()-X
51. fBodyAccJerk-mean()-Y
52. fBodyAccJerk-mean()-Z
53. fBodyAccJerk-std()-X
54. fBodyAccJerk-std()-Y
55. fBodyAccJerk-std()-Z
56. fBodyAccJerk-meanFreq()-X
57. fBodyAccJerk-meanFreq()-Y
58. fBodyAccJerk-meanFreq()-Z
59. fBodyGyro-mean()-X
60. fBodyGyro-mean()-Y
61. fBodyGyro-mean()-Z
62. fBodyGyro-std()-X
63. fBodyGyro-std()-Y
64. fBodyGyro-std()-Z
65. fBodyGyro-meanFreq()-X
66. fBodyGyro-meanFreq()-Y
67. fBodyGyro-meanFreq()-Z
68. fBodyAccMag-mean()
69. fBodyAccMag-std()
70. fBodyAccMag-meanFreq()
71. fBodyBodyAccJerkMag-mean()
72. fBodyBodyAccJerkMag-std()
73. fBodyBodyAccJerkMag-meanFreq()
74. fBodyBodyGyroMag-mean()
75. fBodyBodyGyroMag-std()
76. fBodyBodyGyroMag-meanFreq()
77. fBodyBodyGyroJerkMag-mean()
78. fBodyBodyGyroJerkMag-std()
79. fBodyBodyGyroJerkMag-meanFreq()
80. angle(tBodyAccMean,gravity)
81. angle(tBodyAccJerkMean),gravityMean)
82. angle(tBodyGyroMean,gravityMean)
83. angle(tBodyGyroJerkMean,gravityMean)
84. angle(X,gravityMean)
85. angle(Y,gravityMean)
86. angle(Z,gravityMean)

Important Variables the Script Generates
----------------------------------------

*tidy* is the result of steps 1-4.

*tidysum* is the result of step 5.  This gets saved into summary.txt.

Summary Created
---------------

The summary.txt file creates the mean and standard deviation averages
for each person (1-30) and each activity.  The column names are included
in the generated output file.



