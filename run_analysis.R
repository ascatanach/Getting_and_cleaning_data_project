library(dplyr)

#directories into variables
path_test <- paste(c(getwd(), "/test/"), sep = "", collapse = "")
path_train <- paste(c(getwd(), "/train/"), sep = "", collapse = "")

#Make a directory for the merged data
dir.create(paste(c(getwd(), "/merged"), sep = "", collapse = ""))

#merge the data for path_test and path_train directories
filenames_test <- dir(path_test, pattern =".txt")
for(test in filenames_test){
        
        #first get the common part of the two files
        filename_abbr <- substr(test, 1, nchar(test)-8)
        
        #filenames from the test and train directories into varaibles
        filename_test <- paste(c(path_test, test), sep = "", collapse = "")
        filename_train <- paste(c(path_train, "/", filename_abbr, "train.txt"), sep = "", collapse = "")
        
        #the data into objects
        test_data <- readLines(filename_test)
        train_data <- readLines(filename_train)
        
        #then concatenate into a file of the object merged
        merged <- paste(c(getwd(), "/merged/", filename_abbr, "merged.txt"), sep = "", collapse = "")
        cat(c(test_data, train_data), file=merged, sep="\n")
}

#subset for only those columns of mean() and std() features, vector of TRUE or FALSE values 
feature_file <- paste(c(getwd(), "/features.txt"), sep = "", collapse = "")
features <- read.table(feature_file)
features <- features[, 2]
features <- as.character(features)
rows_mean_or_std <- grepl("*mean\\(\\)*|*std\\(\\)*", features) #have our TRUE or FALSE vector

#subset the mean() or std() features out of features.txt:
features <- features[rows_mean_or_std]

#subset the merged data:
data <- read.table(paste(c(getwd(), "/merged/X_merged.txt"), sep = "", collapse = ""))
subsetted_data <- data[ ,rows_mean_or_std]

#meaningful variable names using Hadley Wickham's guide:
features <- gsub("tB", "time_B", features)
features <- gsub("tG", "time_G", features)
features <- gsub("fB", "fft_B", features)
features <- gsub("fG", "fft_G", features)
features <- gsub("Body", "body_", features)
features <- gsub("Gravity", "gravity_", features)
features <- gsub("Acc", "accelerometer_", features)
features <- gsub("Gyro", "gyroscope_", features)
features <- gsub("Mag", "magnitude_", features)
features <- gsub("Jerk", "jerk_", features)
features <- gsub("-mean", "mean", features)
features <- gsub("-std", "std", features)
features <- gsub("-X", "_x_axis", features)
features <- gsub("-Y", "_y_axis", features)
features <- gsub("-Z", "_z_axis", features)

#read merged data of subject and activities into objects
subjects <- read.table(paste(c(getwd(), "/merged/subject_merged.txt"), sep = "", collapse = ""))
activities <- read.table(paste(c(getwd(), "/merged/y_merged.txt"), sep = "", collapse = ""))

#convert activity numbers into names
activities[activities == 1] <- "WALKING"
activities[activities == 2] <- "WALKING_UPSTAIRS"
activities[activities == 3] <- "WALKING_DOWNSTAIRS"
activities[activities == 4] <- "SITTING"
activities[activities == 5] <- "STANDING"
activities[activities == 6] <- "LAYING"

#add columns of activities and subjects
subsetted_data <-cbind(subjects, activities, subsetted_data)

#make subjects and activities into ids
ids <- c("subject", "activity")

#add column names:
ids_and_features <- c(ids, features)
colnames(subsetted_data) <- ids_and_features

#find the means based on subject and activity
grouped_data <- group_by(subsetted_data, subject, activity)
summarised_data <- summarise_each(grouped_data, funs(mean))

#write to file
write.table(summarised_data, "tidy_data_set.txt", row.names = FALSE)