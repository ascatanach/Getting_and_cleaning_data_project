The file tidy_data_set.txt contains the means of accelerometer and gyroscope data, subsetted for columns containing mean() and std(), and grouped by subject and activity. Original data (see https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) were concatenated (merged). 


The script run_analysis.R takes data from two directories (./train and ./test) and writes concatenated data in a newly created directory (./merged) using a for loop, resulting in three new files: a data file X_merged.txt, y_merged.txt and subject_merged.txt. For each file in ./test, a filename abbreviation using substr() was generated and (with concatenated text) used to match the corresponding file in the ./train directory, enabling the two matched files to be concatenated using cat().

A vector of TRUE or FALSE values is generated based on features in ./merged/features_merged.txt containing the expressions "mean()" or "std()" using grepl(). This vector was then used to extract the corresponding features from the feature file and columns from the data file.

Meaningful variable names were generated using repeated calls of gsub() as appropriate for the subsetted features. The guidelines of Hadley Wickham's publication were used (prefering all lowercase with underscores for filenames and variables).

Merged subject and activity data were read and activity data were converted into their respective descriptive activity names according to the file features_info.txt. These were then added as columns using cbind, having the same number of rows as the subsetted data file.

Column names were added with colnames() using "subject", "activity" and the subsetted features vector.

group_by() was used to group the data according to subject and activity and summarise_each() was used to find the means of each subject/activty group.

write.table() was used to write the summarised data to tidy_data_set.txt.

For details of variables see CodeBook.md.