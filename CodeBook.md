#Introduction
run_anaalysis.R performs the following functions:
* Using It reads the test and the train data and stores it in respective data frames.
* Using rbind(), similar data is combined and then stored in respective data frames.
* It then extracts only the measurements on the mean and standard deviation for each measurement.
* Data is updated with the proper activity name from the file activity_labels.txt
* The data is then combined.
* A new dataset is generated with average means for each subject and activity type.

#Variables
* x_test, y_test, subject_test, x_train, y_train and subject_train holds data from the downloaded files.
* data_x, data_y and data_subject are used to hold the combined data.
* features_data holds data for features. mean_SD holds only the mean and standard deviation features.
* act holds data for activities.
* combined_data is used to hold the combined data of data_x, data_y and data_subject.
* data_avg holds the average of each variable for each activity and each subject.
