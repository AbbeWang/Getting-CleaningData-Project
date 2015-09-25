# Getting-CleaningData-Project
This project is based on Human Activity Recognition Using Smartphones Data Set, following these steps:

1. Downloading and reading in data sets:
"./UCI HAR Dataset/test/x_test.txt"
"./UCI HAR Dataset/train/x_train.txt"
And labeling each column with descriptive variable names in "./UCI HAR Dataset/features.txt".

2. Extracting only the mean and standard deviation for each measurement using "agrep" function

3. Adding attributes of activity_label(1-6) and subject(1-30)

4. Combining test dataset and training dataset using "rbind" function into a whole dataset

5. Adding attribute of activity names according to activity labels

6. Merging the whole dataset by subject and activity, and calculating average number of each variable for each activity and each subject by first spliting the merged dataset by subject then using a for loop of "dcast" function to each data frame in the splited list.

7. Writing tidyData out into "./tidyData.txt"