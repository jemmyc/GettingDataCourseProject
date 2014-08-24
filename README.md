GettingDataCourseProject
========================

Published data from the Human Activity Recognition Using Smartphones study [1] were recombined, extracted and summarized into a tidy dataset using the procedures outlined below. The original study recorded accelerometer and gyroscope signals from a smartphone worn by volunteers perfoming 6 different activities. A total of 561 features from the signals were measured. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the download for the source dataset:

https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip

See the README.txt file in the download for further details about the study and the dataset, including the license for using dataset.

This project extracts only the measurements on the mean and standard deviation for each measurement and their average for each subject and activity.


Data Processing Methods
=======================
The source dataset archive was downloaded and unzipped into the R working directory.
An R script named run_analysis.R was written to perform the following steps on the dataset placed in the working directory:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement, which are the variables with -mean() and -std() in their names. 
3. Use descriptive activity names to name the activities in the data set by cross-referencing the activity codes with their corresponding names in the given activity_labels.txt file.
4. Appropriately label the data set with descriptive variable names, using the same names for the extracted features as given in the original dataset for consistency. The only exception was the replacement of dashes and parenthesis with underscores for portability to other programming languages and environments. This intermediate tidy dataset is written to the working directory as a space-delimited text file named HAR_tidy_data1.txt.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. This dataset is written to the working directory as a space-delimited text file named HAR_tidy_data1_avgs.txt.

See the codebook.txt file for a description of the variables in the final tidy dataset.


References
==========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
