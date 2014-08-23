run_analysis <- function() {
    ## This script produces tidy versions of the UCI HAR dataset using the
    ## following steps and intermediate tidy dataset.
    ## 1. Merges the training and the test sets to create one data set.
    ## 2. Extracts only the measurements on the mean and standard deviation
    ##    for each measurement. 
    ## 3. Uses descriptive activity names to name the activities in the data set
    ## 4. Appropriately labels the data set with descriptive variable names.
    ## 5. Creates a second, independent tidy data set with the average of each
    ##    variable for each activity and each subject.

    ## Each row in the 3 files corresponds with 1 observation,
    ## so just combine the columns from each file.
    train <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
                   read.table("UCI HAR Dataset/train/y_train.txt"),
                   read.table("UCI HAR Dataset/train/X_train.txt"))

    test <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt"),
                  read.table("UCI HAR Dataset/test/y_test.txt"),
                  read.table("UCI HAR Dataset/test/X_test.txt"))

    ## Combine the rows from both groups into 1 table.
    tidy1 <- rbind(train, test)

    ## Get the column names for the resulting tidy dataset.
    features <- read.table("UCI HAR Dataset/features.txt",
                           stringsAsFactors=FALSE)
    colnames(tidy1) <- c("Subject", "ActivityCode", features[,2])

    ## Convert activity code to corresponding label.
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    colnames(activity_labels) <- c("ActivityCode", "ActivityName")
    tidy1 <- merge(activity_labels, tidy1)
    tidy1 <- tidy1[, c("Subject", "ActivityName",
                       grep("mean[(]|std[(]",colnames(tidy1),value=TRUE))]

    ## Clean up dependent variable labels, replacing punctuation with
    ## single underscores, an accepted naming convention for multi-word
    ## variables in other environments or programming languages.
    colnames(tidy1) <- gsub("[-]", "_", gsub("[()]+", "", colnames(tidy1)))

    ## Write the intermediate table to a file.
    write.table(tidy1, "HAR_tidy_data1.txt", row.names=FALSE)

    ## Get tidy dataset 2:
    ## the mean of the selected dependent variables from previous step
    ## grouped by subject and activity name.
    tidy2 <- aggregate(tidy1[,3:ncol(tidy1)],
                       by=list(Subject=tidy1$Subject,
                               ActivityName=tidy1$ActivityName),
                       mean)
    write.table(tidy2, "HAR_tidy_data1_avgs.txt", row.name=FALSE)
    return(tidy2)
}