install.packages("dplyr")
library(dplyr)


#Download and unzip the data

getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        destfile = "./dataset.zip", method = "curl")
unzip(zipfile = "./dataset.zip", exdir = getwd())

# Load and Merges the training and the test sets to create one data set

features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")

xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")


xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)

# Generar objeto (indic) que recoga sola los registros que contengan mean() y std()
# Extracts only the measurements on the mean and standard deviation for each measurement.

indic <- grep("mean\\(\\)|std\\(\\)", features[,2]) 
xdata <- xdata[,indic]

# Uses descriptive activity names to name the activities in the data set

head(activity)
head(ydata)
ydata[,1] <- activity[ydata[,1],2]
ydata

# Appropriately labels the data set with descriptive variable names.

head(xdata)
head(features)

nomb <- features[indic, 2]
names(xdata) <- nomb
head(xdata)
names(subject) <- "IdSubject"
names(ydata) <- "Activity"

cleandata <- cbind(subject, ydata, xdata)
head(cleandata)

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

finaldata <- cleandata %>% 
        group_by(IdSubject, Activity) %>% 
        summarise_all(mean)
head(finaldata)
str(finaldata)
write.table(finaldata, "finaldata.txt", row.names = F)



