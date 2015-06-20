# Coursera-Getting-Cleaning-Data
run_analysis.R performs the following functions:
* Using It reads the test and the train data and stores it in respective data frames.
* Using rbind(), similar data is combined and then stored in respective data frames.
* It then extracts only the measurements on the mean and standard deviation for each measurement.
* Data is updated with the proper activity name from the file activity_labels.txt
* The data is then combined.
* A new dataset is generated with average means for each subject and activity type.
