Feature Selection 
=================

(See Codebook update below)


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


Codebook update
===============

This codebook is based on the file features_info.txt included in data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Data of files X_train.txt and X_test.txt, and associated subject (subject_train.txt and subject_test.txt) and activity (y_train.txt and y_test.txt) files, were concatenated and written to files X_merged.txt, subject_merged.txt and  y_merged.txt. Data of the file X_merged.txt were transformed by subsetting only columns containing the text "mean()" or "std()". The data were grouped according to subject and activity (180 groups of 30 subjects X 6 activities), and means of values of each variable within the 180 groups were generated. 

The following feature names listed in the file features.txt were changed as follows, and used as descriptive variable names of the means:

tBodyAcc-mean()-X -> time_body_accelerometer_mean()_x_axis
tBodyAcc-mean()-Y -> time_body_accelerometer_mean()_y_axis
tBodyAcc-mean()-Z -> time_body_accelerometer_mean()_z_axis
tBodyAcc-std()-X -> time_body_accelerometer_std()_x_axis
tBodyAcc-std()-Y -> time_body_accelerometer_std()_y_axis
tBodyAcc-std()-Z -> time_body_accelerometer_std()_z_axis
tGravityAcc-mean()-X -> time_gravity_accelerometer_mean()_x_axis
tGravityAcc-mean()-Y -> time_gravity_accelerometer_mean()_y_axis
tGravityAcc-mean()-Z -> time_gravity_accelerometer_mean()_z_axis
tGravityAcc-std()-X -> time_gravity_accelerometer_std()_x_axis
tGravityAcc-std()-Y -> time_gravity_accelerometer_std()_y_axis
tGravityAcc-std()-Z -> time_gravity_accelerometer_std()_z_axis
tBodyAccJerk-mean()-X -> time_body_accelerometer_jerk_mean()_x_axis
tBodyAccJerk-mean()-Y -> time_body_accelerometer_jerk_mean()_y_axis
tBodyAccJerk-mean()-Z -> time_body_accelerometer_jerk_mean()_z_axis
tBodyAccJerk-std()-X -> time_body_accelerometer_jerk_std()_x_axis
tBodyAccJerk-std()-Y -> time_body_accelerometer_jerk_std()_y_axis
tBodyAccJerk-std()-Z -> time_body_accelerometer_jerk_std()_z_axis
tBodyGyro-mean()-X -> time_body_gyroscope_mean()_x_axis
tBodyGyro-mean()-Y -> time_body_gyroscope_mean()_y_axis
tBodyGyro-mean()-Z -> time_body_gyroscope_mean()_z_axis
tBodyGyro-std()-X -> time_body_gyroscope_std()_x_axis
tBodyGyro-std()-Y -> time_body_gyroscope_std()_y_axis
tBodyGyro-std()-Z -> time_body_gyroscope_std()_z_axis
tBodyGyroJerk-mean()-X -> time_body_gyroscope_jerk_mean()_x_axis
tBodyGyroJerk-mean()-Y -> time_body_gyroscope_jerk_mean()_y_axis
tBodyGyroJerk-mean()-Z -> time_body_gyroscope_jerk_mean()_z_axis
tBodyGyroJerk-std()-X -> time_body_gyroscope_jerk_std()_x_axis
tBodyGyroJerk-std()-Y -> time_body_gyroscope_jerk_std()_y_axis
tBodyGyroJerk-std()-Z -> time_body_gyroscope_jerk_std()_z_axis
tBodyAccMag-mean() -> time_body_accelerometer_magnitude_mean()
tBodyAccMag-std() -> time_body_accelerometer_magnitude_std()
tGravityAccMag-mean() -> time_gravity_accelerometer_magnitude_mean()
tGravityAccMag-std() -> time_gravity_accelerometer_magnitude_std()
tBodyAccJerkMag-mean() -> time_body_accelerometer_jerk_magnitude_mean()
tBodyAccJerkMag-std() -> time_body_accelerometer_jerk_magnitude_std()
tBodyGyroMag-mean() -> time_body_gyroscope_magnitude_mean()
tBodyGyroMag-std() -> time_body_gyroscope_magnitude_std()
tBodyGyroJerkMag-mean() -> time_body_gyroscope_jerk_magnitude_mean()
tBodyGyroJerkMag-std() -> time_body_gyroscope_jerk_magnitude_std()
fBodyAcc-mean()-X -> fft_body_accelerometer_mean()_x_axis
fBodyAcc-mean()-Y -> fft_body_accelerometer_mean()_y_axis
fBodyAcc-mean()-Z -> fft_body_accelerometer_mean()_z_axis
fBodyAcc-std()-X -> fft_body_accelerometer_std()_x_axis
fBodyAcc-std()-Y -> fft_body_accelerometer_std()_y_axis
fBodyAcc-std()-Z -> fft_body_accelerometer_std()_z_axis
fBodyAccJerk-mean()-X -> fft_body_accelerometer_jerk_mean()_x_axis
fBodyAccJerk-mean()-Y -> fft_body_accelerometer_jerk_mean()_y_axis
fBodyAccJerk-mean()-Z -> fft_body_accelerometer_jerk_mean()_z_axis
fBodyAccJerk-std()-X -> fft_body_accelerometer_jerk_std()_x_axis
fBodyAccJerk-std()-Y -> fft_body_accelerometer_jerk_std()_y_axis
fBodyAccJerk-std()-Z -> fft_body_accelerometer_jerk_std()_z_axis
fBodyGyro-mean()-X -> fft_body_gyroscope_mean()_x_axis
fBodyGyro-mean()-Y -> fft_body_gyroscope_mean()_y_axis
fBodyGyro-mean()-Z -> fft_body_gyroscope_mean()_z_axis
fBodyGyro-std()-X -> fft_body_gyroscope_std()_x_axis
fBodyGyro-std()-Y -> fft_body_gyroscope_std()_y_axis
fBodyGyro-std()-Z -> fft_body_gyroscope_std()_z_axis
fBodyAccMag-mean() -> fft_body_accelerometer_magnitude_mean()
fBodyAccMag-std() -> fft_body_accelerometer_magnitude_std()
fBodyBodyAccJerkMag-mean() -> fft_body_body_accelerometer_jerk_magnitude_mean()
fBodyBodyAccJerkMag-std() -> fft_body_body_accelerometer_jerk_magnitude_std()
fBodyBodyGyroMag-mean() -> fft_body_body_gyroscope_magnitude_mean()
fBodyBodyGyroMag-std() -> fft_body_body_gyroscope_magnitude_std()
fBodyBodyGyroJerkMag-mean() -> fft_body_body_gyroscope_jerk_magnitude_mean()
fBodyBodyGyroJerkMag-std() -> fft_body_body_gyroscope_jerk_magnitude_std()

Values of the variable activity were changed from integers to descriptive titles according to the file activity_labels.txt. The subject variable uses the same integers according the original data.

The data and variable transformations are the result of output of the script run.analysis.R (tidy_data_set.txt).