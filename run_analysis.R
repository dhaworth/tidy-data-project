#Load activity and feature names to apply to data sets
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("activity_id","activity_name"))
features <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")
feature_names <- features[,2]

#Load training data, activities and subjects, applying feature names to data columns
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=feature_names,check.names=FALSE)
train_activities <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, col.names="activity")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="subject")

#Combine training subject, activity and data columns
train_full <- cbind(train_subjects,train_activities,train_data)

#Load test data, activities and subjects, applying feature names to data columns
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=feature_names,check.names=FALSE)
test_activities <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, col.names="activity")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="subject")

#Combining test subject, activity and data columns
test_full <- cbind(test_subjects,test_activities,test_data)

#Merge the training and the test sets to create one data set
all_data <- rbind(train_full,test_full)

#Extract only the measurements for mean and standard deviation for each measurement, while also retaining subjects and activities
mean_std_data <- all_data[,grepl("subject|activity|std\\(\\)|mean\\(\\)",names(all_data))]

#Replace activity ids with corresponding activity label
mean_std_data$activity <- factor(mean_std_data$activity, activity_labels$activity_id, activity_labels$activity_name)

#Create a second, independant tidy data set with the average of each variable for each activity and each subject
output <- mean_std_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))
