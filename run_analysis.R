# run_analysis.R - Alex Gascoigne - September 8th, 2015

# This script assumes unix path names.  Also, the dplyr package is used
# to generate summarized data.

# Import the "dplyr" package.
library(dplyr)

# Set input and output directory paths

datadir <- "./UCI HAR Dataset/"
outputdir <- "./tmp/"

# Check directories and create output directory if necessary.

if (!file.exists(datadir))
{
        stop("Dataset directory does not exist.")
}
if (!file.exists(outputdir))
{
        dir.create(outputdir)
}


## 1. Merge training and test sets to create one data set
# These are in train/X_train.txt and test/X_test.txt
# Activity labels are in train/y_train.txt and test/y_test.txt
# Subject labels are in train/subject_train.txt and test/subject_test.txt

if (!exists("xdata")) {
        xtrain<-read.table(paste(datadir,"train/X_train.txt",sep=""))
        xtest<-read.table(paste(datadir,"test/X_test.txt",sep=""))
        xdata<-rbind(xtrain,xtest)
}

if (!exists("ydata")) {
        ytrain<-read.table(paste(datadir,"train/y_train.txt",sep=""))
        ytest<-read.table(paste(datadir,"test/y_test.txt",sep=""))
        ydata<-rbind(ytrain,ytest)
}

if (!exists("sdata")) {
        strain<-read.table(paste(datadir,"train/subject_train.txt",sep=""))
        stest<-read.table(paste(datadir,"test/subject_test.txt",sep=""))
        sdata<-rbind(strain,stest)
}

## 2. Extract only measurements on the mean and standard deviation
# for each measurement.
#
# From features.txt, we have to get all the mean and std values.
#

# read the feature descriptions
featurefile<-file(paste(datadir,"features.txt",sep=""),open="r")
featurelines<-readLines(featurefile)
close(featurefile)

# find all the mean and std dev lines
meanv<-grepl("mean",featurelines,ignore.case=TRUE)
stdv<-grepl("std",featurelines,ignore.case=TRUE)
featurev<-meanv|stdv

# read the names into 'features'
f<-read.table(header=FALSE,text=featurelines,stringsAsFactors=FALSE)
features<-f[featurev,2]

# Get only the means and stds in variable 'data'
data<-xdata[,c(featurev)]

## 3. Uses descriptive activity names to name the activities in
# the data set.  This will involve manipulation of the variable 'ydata'.
activitynames<-read.table(paste(datadir,"activity_labels.txt",sep=""),
                          header=FALSE,stringsAsFactors=FALSE)
activities<-sapply(ydata[,1],function(x)activitynames[x,2])
ydata<-data.frame(activities)

## 4. Appropriately labels the data set with descriptive variable
# names.

colnames(data) <- features
colnames(sdata) <- "SubjectID"
colnames(ydata) <- "Activity"

# Add the activity and subject to the data frame.  This completes the
# tidy data frame.
data<-cbind(sdata,ydata,data)

## 5. From the data set in step 4, creates a second, independent
# tidy data set with the average of each variable for each
# activity and each subject.

# Group by Activity and SubjectID
tidy<-group_by(data,Activity,SubjectID)

# Use summarize_each() to calculate the average for each variable
# for each activity and each subject.
tidysum<-summarize_each(tidy,funs(mean))

## Save the data set as a txt file created with write.table
# using row.name=FALSE
write.table(tidysum,paste(outputdir,"summary.txt",sep=""),row.names=FALSE)
