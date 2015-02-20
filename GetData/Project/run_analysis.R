# Loading data assuming the zip file was unzipped into working directory
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Merging all necessary data
testdata <- cbind(xtest, subjecttest, ytest)
traindata <- cbind(xtrain, subjecttrain, ytrain)
alldata <- rbind(traindata, testdata)

# Produce a vector, containing names for columns of loaded data sets
x <- vector()
x <- append(x, as.character(features[, 2]))
x <- append(x, c("subject", "Activity"))

# Renaming
names(alldata) <- x

# Adding descriptive activity names
alldata$Activity[alldata$Activity == 1] <- "Walking"
alldata$Activity[alldata$Activity == 2] <- "Walking Upstairs"
alldata$Activity[alldata$Activity == 3] <- "Walking Downstairs"
alldata$Activity[alldata$Activity == 4] <- "Sitting"
alldata$Activity[alldata$Activity == 5] <- "Standing"
alldata$Activity[alldata$Activity == 6] <- "Laying"

# Getting indices of columns necessary for the following analysis
y <- grep("mean", names(alldata))
z <- grep("std", names(alldata))

# Subsetting
subsetdata <- alldata[, y]
subsetdata <- cbind(subsetdata, alldata[, z])
subsetdata <- cbind(subsetdata, alldata[, c("subject", "Activity")])

library(reshape2)
library(plyr)

# Melting columns corresponding to each feature. Put all columns except "subject" and
# "Activity" into one column
melted <- melt(subsetdata, id.vars = c("subject", "Activity"))

# Applying summarise function to calculate mean for each variable per subject and
# activity
tidyset <- ddply(melted, c("subject", "Activity", "variable"), summarise, mean = mean(value))

# Uncomment next prior the script run if you want to write dataset into file
# write.table(tidyset, file = "tidyset.txt")
# File will be saved in the working directory