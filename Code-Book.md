Getting and Cleaning Data
-------------------------

In the run\_analysis.R script we try to prepare and clean the data for
future analysis and this document pretend to facilitate the
understanding of all the processes carried out.

        1.- Download the data set
        

Download and unzip the datasets in the UCI HAR Dataset folder

        2.-Load and Merges the training and the test sets to create one data set
        

First we create new objets with the information of the download dataset.

features = 561 rows and 2 columns. Basically is a table (txt) with the
name of all the messures variables activity = 6 rows and 2 columns. Is a
list of the diferents activites performed by the people.

xtest = 2947 rows and 561 columns. Is the table with the test recorded
data ytest = 2947 rows and 1 column. Contain the activities´code labels
subjecttest = 2974 rows and 1 column. Contain the volunteer ID subject

xtrain = 7352 rows and 561 columns. Idem but with the train data ytrain
= 7352 rows and 1 columns. Idem but wtih the train data subjecttrain =
7352 rows and 1 column. Idem but with the train data

After that we created new objects putting toggether the test and train
data sets

xdata = 10299 rows and 561 columns. Create by merging xtest and xtrain
with rbind() function ydata = 10299 rows and 1 column. Create by merging
ytest and ytrain with rbind() function subject = 10299 rows and 1 colum.
Create by merging subjecttest and subjecttrain with rbind() function

        3.-Extracts only the measurements on the mean and standard deviation for each measurement

indic = Is a list with the numbers of the variables wich names are
conformed by mean and std xdata = 10299 rows and 66 columns. Is the same
dataframe than before but only with de variables that we were interested

        4.-Uses descriptive activity names to name the activities in the data set

ydata = 10299 and 1 column but with the names of the activities recorder
in the activity object

        5.-Appropriately labels the data set with descriptive variable names

subject = Change the name of the column to "IdSubject" ydata = Change
the name of the column to "Activity" nomb = features\[indic, 2\] Select
the names of the variables in features to put them into de xdata object
xdata = put all the names in nomb into the variable names in xdata

cleandata = 10299 rows and 68 columns. Is a merge between xdata, ydata
and subject to put the data selected all together

        6.-From the data set in step 4, creates a second, independent tidy data set with 
        the average of each variable for each activity and each subject.

We create with write.table() function a new dataset with the means of
all the columns grouped by subject and activity

finaldata = 180 rows and 68 columns. Mean of all columns group by
subject and activity created by sumarizing cleandata export finaldata
into finaldata.txt file.
