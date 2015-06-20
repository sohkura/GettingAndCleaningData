# gettingcleaningdata
Getting and Cleaning Data - Course Project

The script **run_analysis.R** is to prepare tidy data set for later analysis of wearable computing and activity tracking.
The data used for this script was collected from the accelerometers from Samsung Galaxy S smartphone, which was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This is the zipped file that contains the following files: 'Train data', 'Train activity', 'Train subject', 'Train raw data - not used by the script', 'Test data', 'Test activity', 'Test subject', 'Test raw data - not used by the script', 'Activity', 'Feature'.

### Steps performed by the script

##### Prepare and Download the files:

   - Create a subdirectory called "./data"
   - Download the zip file from the website
   - Unzip the text files downloaded

##### Read the data into data frames and create tidy dataset:

   1. Read the text files into data frame R objects:
      * Read the test data into textX data frame
	  * Read the corresponding test activity data into testA data frame
	  * Read the corresponding test subject data into testS data frame
	  * Read the training data into trainX data frame
	  * Read the corresponding training activity data into trainA data frame
	  * Read the corresponding training subject data into trainS data frame
	  * Read the activity definition data into activity data frame
	  * Read the feature definition data into feature data frame
   
1. Step 1: Combine the data into a single data frame

    1. Combine the test data and its corresponding activity and subject data into test data frame
	2. Combine the training data and its corresponding activity and subject data into train data frame
	3. Combine test and training data into a single TT data frame

1. Step 2: Obtain and populate the column headers

    1. Extract the features from the feature data frame
	2. Add "Subject" and "Activity" in this order to the end of the features
	3. Populate the column headers created from feature to the combined TT data frame

1. Step 3: Remove the data except those represented for mean() and std()

    1. Extract features that contain the words "Subject", "Activity", "mean()", and "std()"
	2. Extract special features that contain the words "meanFreq"
	3. Remove the columns that are not represented for mean() and std() from TT data frame and create tt data frame

1. Step 4: Substitute Activity number to Activity text

    1. Merge tt data frame and activity data frame using activity number as a key and store it to the tta data frame
	2. Remove the activity number column and rename activity text column and store it to the ttb data frame

1. Step 5: Calculate the average for all columns for each combination of subject and activity 

	Calculate the average for all columns of ttb dara frame based on the combination of subject and activity 

1. Step 6: Store the averages calculated to the file

    Store the averages calculated to **tidydataset.txt** file under the same directory as the script






