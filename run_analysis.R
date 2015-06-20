## Getting and Cleaning Data - Course Project
## Check if the directory called "data" exists under the home directory
if (!file.exists("data")) { 
    dir.create("data")  
}

## Check if the files have been downloaded before 
if (!file.exists("data/dataset.zip")) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile="data/dataset.zip", mode="wb")
    unzip("data/dataset.zip", exdir="data")
}

## Read the sample data from the file to datafames
testX <- read.table("data/UCI HAR Dataset/test/X_test.txt")
testA <- read.table("data/UCI HAR Dataset/test/Y_test.txt")
testS <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

trainX <- read.table("data/UCI HAR Dataset/train/X_train.txt")
trainA <- read.table("data/UCI HAR Dataset/train/Y_train.txt")
trainS <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

activity <- read.table("data/UCI HAR Dataset/activity_labels.txt")
feature <- read.table("data/UCI HAR Dataset/features.txt")

## Step 1: Combine individual dataframes into a single data frame
test <- cbind(testX, testS, testA)
train <- cbind(trainX, trainS, trainA)
TT <- rbind(train, test)

## Step 2: Obtain the column headers 
features <- c(as.character(feature$V2), "Subject","Activity")
colnames(TT) <- features

## Step 3: Filter the data for mean() and std()
d1 <- grepl("Subject|Activity|mean()|std()", features)
d2 <- grepl("meanFreq", features)
drop <- d1 & !d2
tt <- TT[,drop]

## Step 4: Substitute the Activity numbers to the text
tta <- merge(tt, activity, by.x="Activity", by.y="V1")
ttb <- subset(tta, select = -c(Activity))
names(ttb)[68] <- "Activity"

## Step 5: Calculate the average for all columns per a combination of Subject + Activity
trainTest = aggregate(. ~ Subject + Activity, data=ttb, mean)

## Step 6: Write the data to the file
write.table(trainTest, file ="tidydataset.txt", row.name=FALSE)

tab <- read.table("tidydataset.txt", header=TRUE)
View(tab)

