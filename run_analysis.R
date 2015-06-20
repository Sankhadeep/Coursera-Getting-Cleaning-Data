library(plyr)

#**************************************
#Start: Merges the training and the test sets to create one data set.

#Extract the test and train data sets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Combine the data sets using rbind
data_x <- rbind(x_test, x_train)
data_y <- rbind(y_test, y_train)
data_subject <- rbind(subject_test, subject_train)
# End: Merges the training and the test sets to create one data set.
#**************************************

#**************************************
#Start:Extracts only the measurements on the mean and standard deviation for each measurement.

#Read features
features_data <- read.table("features.txt")

#Get ony the mean and SD features
mean_SD <- grep("-(mean|std)\\(\\)", features_data[, 2])

#Set the correct names for the columns
data_x <- data_x[,mean_SD]
names(data_x) <- features_data[mean_SD,2]
#End: Extracts only the measurements on the mean and standard deviation for each measurement.
#**************************************

#**************************************
#Start:Use descriptive activity names to name the activities in the data set
act <- read.table("activity_labels.txt")
data_y[,1] <- act[data_y[, 1], 2]
names(data_y) <- "Activity"
#End:Use descriptive activity names to name the activities in the data set
#**************************************

#**************************************
#Start:Appropriately labels the data set with descriptive variable names.
names(data_subject) <- "Subject"
combined_data <- cbind(data_x, data_y, data_subject)
#End:Appropriately labels the data set with descriptive variable names.
#**************************************

#**************************************
#Start: creates a second, independent tidy data set with the average of each variable for each activity and each subject

data_avg <- ddply(combined_data, .(Subject, Activity), function(x) colMeans(x[, -c(67,68)]))
write.table(data_avg, "data_avg.txt", row.name=FALSE)

#End:  creates a second, independent tidy data set with the average of each variable for each activity and each subject
#**************************************

