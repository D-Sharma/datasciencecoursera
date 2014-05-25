
#Step 1: Merge the training and the test sets to create one data set.

#Read dataset for x,y, and subject from train and test folders
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = 'numeric')
testx <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = 'numeric')
trainy <- read.table("./UCI HAR Dataset/train/Y_train.txt", colClasses = "numeric")
testy <- read.table("./UCI HAR Dataset/test/Y_test.txt", colClasses = "numeric")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = 'numeric')
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = 'numeric')

#Combine train and test data for x,y, and subject files respectively. For example: combine all rows from X_train with X_test into one dataset
allx <- rbind(trainx, testx)  #Merges train and test dataset of X into one dataset
ally <- rbind(trainy, testy)  #Merges train and test dataset of Y into one dataset
allsub <- rbind(trainsub, testsub)  #Merges train and test dataset of Subject into one dataset

#Load features data
allfeatures <- read.table("./UCI HAR Dataset/features.txt")

#Set variable names for datasets
colnames(allx) <- c(tolower(as.character(allfeatures$V2)))
colnames(ally) <- c("actcode")
colnames(allsub) <- c("subid")

#Combine Subject, X, and Y data into one dataset. 
#Using cbind function combine all data horizontally.
alldata <- cbind(allsub, allx, ally)




#Step 2: Extracts measurements on the mean and standard deviation for each measurement.

#Get column names for variables/feature on mean and standard deviation
ext <- c("subid", "actcode")
ext <- c(ext, colnames(alldata[,grep("mean\\(\\)", colnames(alldata))]))  #Get 
ext <- c(ext, colnames(alldata[,grep("std\\(\\)", colnames(alldata))]))

#Extract measurements on mean and standard deviation
data <- alldata[,ext]     #Get all observations for mean and std variables




#Step 3: Uses descriptive activity names to name the activities in the data set

#Load activity descriptions to use meaningful names for activities
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity) <- c("actcode", "act")

#Add descriptive activity names to activities, merge data dataset with activity.
data <- merge(data, activity, by.x = "actcode", by.y = "actcode", all = TRUE)




#Step 4: Appropriately labels the data set with descriptive activity names

#Rename column names to give descriptive activity names
colnames(data)[3] <- "body accelaration time mean() x"
colnames(data)[4] <- "body accelaration time mean() y"
colnames(data)[5] <- "body accelaration time mean() z"
colnames(data)[6] <- "gravity accelaration time mean() x"
colnames(data)[7] <- "gravity accelaration time mean() y"
colnames(data)[8] <- "gravity accelaration time mean() z"
colnames(data)[9] <- "body accelaration jerk time mean() x"
colnames(data)[10] <- "body accelaration jerk time mean() y"
colnames(data)[11] <- "body accelaration jerk time mean() z"
colnames(data)[12] <- "body gyroscope time mean() x"
colnames(data)[13] <- "body gyroscope time mean() y"
colnames(data)[14] <- "body gyroscope time mean() z"
colnames(data)[15] <- "body gyroscope jerk time mean() x"
colnames(data)[16] <- "body gyroscope jerk time mean() y"
colnames(data)[17] <- "body gyroscope jerk time mean() z"
colnames(data)[18] <- "body accelaration magnitude jerk time mean()"

colnames(data)[19] <- "gravity accelaration magnitude time mean()"
colnames(data)[20] <- "body accelaration jerk magnitude time mean()"
colnames(data)[21] <- "body gyroscope magnitude time mean()"
colnames(data)[22] <- "body gyroscope jerk magnitude time mean()"
colnames(data)[23] <- "body accelaration frequence mean() x"
colnames(data)[24] <- "body accelaration frequence mean() y"
colnames(data)[25] <- "body accelaration frequence mean() z"
colnames(data)[26] <- "body accelaration jerk frequence mean() x"
colnames(data)[27] <- "body accelaration jerk frequence mean() y"
colnames(data)[28] <- "body accelaration jerk frequence mean() z"

colnames(data)[29] <- "body gyroscope frequence mean() x"
colnames(data)[30] <- "body gyroscope frequence mean() y"
colnames(data)[31] <- "body gyroscope frequence mean() z"
colnames(data)[32] <- "body accelaration magnitude frequence mean()"
colnames(data)[33] <- "body accelaration jerk magnitude frequence mean()"
colnames(data)[34] <- "body gyroscope magnitude frequence mean()"
colnames(data)[35] <- "body gyroscope jerk magnitude frequence mean()"
colnames(data)[36] <- "body accelaration time std() x"
colnames(data)[37] <- "body accelaration time std() y"
colnames(data)[38] <- "body accelaration time std() z"

colnames(data)[39] <- "gravity accelaration time std() x"
colnames(data)[40] <- "gravity accelaration time std() y"
colnames(data)[41] <- "gravity accelaration time std() z"
colnames(data)[42] <- "body accelaration jerk time std() x"
colnames(data)[43] <- "body accelaration jerk time std() y"
colnames(data)[44] <- "body accelaration jerk time std() z"
colnames(data)[45] <- "body gyroscope time std() x"
colnames(data)[46] <- "body gyroscope time std() y"
colnames(data)[47] <- "body gyroscope time std() z"
colnames(data)[48] <- "body gyroscope jerk time std() x"

colnames(data)[49] <- "body gyroscope jerk time std() y"
colnames(data)[50] <- "body gyroscope jerk time std() z"
colnames(data)[51] <- "body accelaration magnitude jerk time std()"
colnames(data)[52] <- "gravity accelaration magnitude time std()"
colnames(data)[53] <- "body accelaration jerk magnitude time std()"
colnames(data)[54] <- "body gyroscope magnitude time std()"
colnames(data)[55] <- "body gyroscope jerk magnitude time std()"
colnames(data)[56] <- "body accelaration frequence std() x"
colnames(data)[57] <- "body accelaration frequence std() y"
colnames(data)[58] <- "body accelaration frequence std() z"

colnames(data)[59] <- "body accelaration jerk frequence std() x"
colnames(data)[60] <- "body accelaration jerk frequence std() y"
colnames(data)[61] <- "body accelaration jerk frequence std() z"
colnames(data)[62] <- "body gyroscope frequence std() x"
colnames(data)[63] <- "body gyroscope frequence std() y"
colnames(data)[64] <- "body gyroscope frequence std() z"
colnames(data)[65] <- "body accelaration magnitude frequence std()"
colnames(data)[66] <- "body accelaration jerk magnitude frequence std()"
colnames(data)[67] <- "body gyroscope magnitude frequence std()"
colnames(data)[68] <- "body gyroscope jerk magnitude frequence std()"


#Make the cases of column names consistant
colnames(data) <- tolower(colnames(data))




#Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(reshape2)

# Reshape the data
datamelt <- melt(data, id = c("subid", "act"), measure.vars=(colnames(data[,3:68])))

#Get average for each activity and each subject
tidy <-dcast(datamelt, subid + act  ~ variable,fun.aggregate = mean)
write.csv(tidy,file='tidy_data.txt')
