library(dplyr)

######################################################
# 0A - Obtain the data
######################################################

# Download the data set zip folder if not yet present
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR dataset.zip"

if(!file.exists(zipFile))
  download.file(url = zipURL,destfile = zipFile)

# Unzip the data set zip if not yet unzipped
mapFile <- "UCI HAR dataset"

if(!file.exists(mapFile))
  unzip(zipFile)

######################################################
# 0B - Read the data
######################################################

# Read training data
trainingSubjects <- read.table(file.path(mapFile,"train","subject_train.txt"))
trainingX <- read.table(file.path(mapFile,"train","X_train.txt"))
trainingY <- read.table(file.path(mapFile,"train","y_train.txt"))

# Read test data
testSubjects <- read.table(file.path(mapFile,"test","subject_test.txt"))
testX <- read.table(file.path(mapFile,"test","X_test.txt"))
testY <- read.table(file.path(mapFile,"test","y_test.txt"))

# Read features
features <- read.table(file.path(mapFile,"features.txt"), as.is = T)

# Read activities
activities <- read.table(file.path(mapFile,"activity_labels.txt"))

######################################################
# 1 - Merge the data
######################################################

# Merge all the data tables to make single data table
completeActivities <- rbind(
  cbind(trainingSubjects,trainingX,trainingY),
  cbind(testSubjects,testX,testY)
)

# Assign the column names based on the features description
colnames(completeActivities) <- c("subject",features[,2],"activity")

# Remove the single data frames to save memory space
rm(
  trainingSubjects,trainingX,trainingY,
  testSubjects,testX,testY,
  features
)

######################################################
# 2 - Extract the measurements on the mean and standard deviation
#     for each measurement.
######################################################

# Determine the column to keep based on their names
columns2keep <- grepl("subject|activity|mean|std", colnames(completeActivities))

# Keep only the column of interest
completeActivities <- completeActivities[,columns2keep]

######################################################
# 3 - Uses descriptive activity names to name the activities in 
#     the data set.
######################################################

# Replace the activity number with factors levels
completeActivities$activity <- factor(completeActivities$activity,
                                      levels = activities[,1], labels = activities[,2])
######################################################
# 4 - Appropriately labels the data set with descriptive variable names.
######################################################

# Obtain column names
completeActivitiescol <- colnames(completeActivities)

# Correct column names
completeActivitiescol <- gsub("[()-]","", completeActivitiescol)

completeActivitiescol <- gsub("^f", "frequencyDomain", completeActivitiescol)
completeActivitiescol <- gsub("^t", "timeDomain", completeActivitiescol)
completeActivitiescol <- gsub("Acc", "Accelerometer", completeActivitiescol)
completeActivitiescol <- gsub("Gyro", "Gyroscope", completeActivitiescol)
completeActivitiescol <- gsub("Mag", "Magnitude", completeActivitiescol)
completeActivitiescol <- gsub("Freq", "Frequency", completeActivitiescol)
completeActivitiescol <- gsub("mean", "Mean", completeActivitiescol)
completeActivitiescol <- gsub("std", "StandardDeviation", completeActivitiescol)

completeActivitiescol <- gsub("BodyBody","Body", completeActivitiescol)

# Attach the new labels to the column names
colnames(completeActivities) <- completeActivitiescol

######################################################
# 5 - Creates a second independent tidy data set with the average
#     of each variable for each activity and each subject.
######################################################

# Group by subject and activity and compute the mean
completeActivitiesmean <- completeActivities %>%
  group_by(subject,activity) %>%
  summarise_each(funs(mean))

# Create the file tidy_data.txt
write.table(completeActivitiesmean, file = "tidy_data.txt")