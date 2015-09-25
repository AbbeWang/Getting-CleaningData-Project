#reading and extracting data sets
features = read.table("./UCI HAR Dataset/features.txt")
xtest = read.table("./UCI HAR Dataset/test/x_test.txt",col.names = features$V2)
xtrain = read.table("./UCI HAR Dataset/train/x_train.txt",col.names = features$V2)

means = agrep("mean()", features$V2)
std = agrep("std()", features$V2)
features = features[sort(c(means,std)),]

xtest = xtest[,features$V1]
xtrain = xtrain[,features$V1]


#adding attributes
ytest = read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest = read.table("./UCI HAR Dataset/test/subject_test.txt")

xtest$act_lable = ytest$V1
xtest$subject = subjecttest$V1

ytrain = read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain = read.table("./UCI HAR Dataset/train/subject_train.txt")

xtrain$act_lable = ytrain$V1
xtrain$subject = subjecttrain$V1


#combing test sets and training sets
whole = rbind(xtest, xtrain)


# adding descriptive activity names
whole$activity = activity_labels[whole$act_lable,2]


#creating a new frame with the average of each variable for each activity and each subject
library(reshape2)
meltdata = melt(whole, id = c("subject", "activity"), measure.vars = names(whole)[c(68,1:66)])

meltdata$subject = factor(meltdata$subject)
splitData = split(meltdata, meltdata$subject)
for(i in as.numeric(levels(meltdata$subject))){
  splitData[[i]] = dcast(splitData[[i]], activity~variable,mean)
}

tidyData = splitData[[1]]
for(i in 2:30){
  tidyData = rbind(tidyData, splitData[[i]])
}


# write tidyData to a .txt
write.table(tidyData,"./tidyData.txt", row.names = FALSE)
