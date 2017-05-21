# Getting and Cleaning Data - Code book #

The data set that this code book refers to is located in the tidy_data.txt file of this repository.

## Data ##
- - -

tidy_data.txt is a test file whose values are space-separated.
The first row reports the names of the variables and the following rows contain the values of these variables.

## Variables ##
- - -

Each row contains 79 averaged signal measurements.

### Identifiers ###

* subject
integer, ranges from 1 to 30.

* activity
string with 6 possible values:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

### Average of measurements ###

All measurements are floating-point values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing Accelerometer) were made in g's (9.81 m.s⁻²) and gyroscope measurements (variables containing Gyroscope) were made in radians per second (rad.s⁻¹).
Magnitudes of three-dimensional signals (variables containing Magnitude) were calculated using the Euclidean norm.

The measurements are classified in two domains:

* Time-domain signals (variables prefixed by timeDomain), resulting from the capture of accelerometer and gyroscope raw signals.

* Frequency-domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

#### Time domain signals ####

* timeDomainBodyAccelerometerMeanX
* timeDomainBodyAccelerometerMeanY
* timeDomainBodyAccelerometerMeanZ

* timeDomainBodyAccelerometerStandardDeviationX
* timeDomainBodyAccelerometerStandardDeviationY
* timeDomainBodyAccelerometerStandardDeviationZ

* timeDomainGravityAccelerometerMeanX
* timeDomainGravityAccelerometerMeanY
* timeDomainGravityAccelerometerMeanZ

* timeDomainGravityAccelerometerStandardDeviationX
* timeDomainGravityAccelerometerStandardDeviationY
* timeDomainGravityAccelerometerStandardDeviationZ

* timeDomainBodyAccelerometerJerkMeanX
* timeDomainBodyAccelerometerJerkMeanY
* timeDomainBodyAccelerometerJerkMeanZ

* timeDomainBodyAccelerometerJerkStandardDeviationX
* timeDomainBodyAccelerometerJerkStandardDeviationY
* timeDomainBodyAccelerometerJerkStandardDeviationZ

* timeDomainBodyGyroscopeMeanX
* timeDomainBodyGyroscopeMeanY
* timeDomainBodyGyroscopeMeanZ

* timeDomainBodyGyroscopeStandardDeviationX
* timeDomainBodyGyroscopeStandardDeviationY
* timeDomainBodyGyroscopeStandardDeviationZ

* timeDomainBodyGyroscopeJerkMeanX
* timeDomainBodyGyroscopeJerkMeanY
* timeDomainBodyGyroscopeJerkMeanZ

* timeDomainBodyGyroscopeJerkStandardDeviationX
* timeDomainBodyGyroscopeJerkStandardDeviationY
* timeDomainBodyGyroscopeJerkStandardDeviationZ

* timeDomainBodyAccelerometerMagnitudeMean
* timeDomainBodyAccelerometerMagnitudeStandardDeviation
Average and standard deviation of the time-domain magnitude of gravity acceleration:

* timeDomainGravityAccelerometerMagnitudeMean
* timeDomainGravityAccelerometerMagnitudeStandardDeviation

* timeDomainBodyAccelerometerJerkMagnitudeMean
* timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation

* timeDomainBodyGyroscopeMagnitudeMean
* timeDomainBodyGyroscopeMagnitudeStandardDeviation

* timeDomainBodyGyroscopeJerkMagnitudeMean
* timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

#### Frequency domain signals ####

* frequencyDomainBodyAccelerometerMeanX
* frequencyDomainBodyAccelerometerMeanY
* frequencyDomainBodyAccelerometerMeanZ

* frequencyDomainBodyAccelerometerStandardDeviationX
* frequencyDomainBodyAccelerometerStandardDeviationY
* frequencyDomainBodyAccelerometerStandardDeviationZ

* frequencyDomainBodyAccelerometerMeanFrequencyX
* frequencyDomainBodyAccelerometerMeanFrequencyY
* frequencyDomainBodyAccelerometerMeanFrequencyZ

* frequencyDomainBodyAccelerometerJerkMeanX
* frequencyDomainBodyAccelerometerJerkMeanY
* frequencyDomainBodyAccelerometerJerkMeanZ

* frequencyDomainBodyAccelerometerJerkStandardDeviationX
* frequencyDomainBodyAccelerometerJerkStandardDeviationY
* frequencyDomainBodyAccelerometerJerkStandardDeviationZ

* frequencyDomainBodyAccelerometerJerkMeanFrequencyX
* frequencyDomainBodyAccelerometerJerkMeanFrequencyY
* frequencyDomainBodyAccelerometerJerkMeanFrequencyZ

* frequencyDomainBodyGyroscopeMeanX
* frequencyDomainBodyGyroscopeMeanY
* frequencyDomainBodyGyroscopeMeanZ

* frequencyDomainBodyGyroscopeStandardDeviationX
* frequencyDomainBodyGyroscopeStandardDeviationY
* frequencyDomainBodyGyroscopeStandardDeviationZ

* frequencyDomainBodyGyroscopeMeanFrequencyX
* frequencyDomainBodyGyroscopeMeanFrequencyY
* frequencyDomainBodyGyroscopeMeanFrequencyZ

* frequencyDomainBodyAccelerometerMagnitudeMean
* frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerMagnitudeMeanFrequency

* frequencyDomainBodyAccelerometerJerkMagnitudeMean
* frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency

* frequencyDomainBodyGyroscopeMagnitudeMean
* frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeMagnitudeMeanFrequency

* frequencyDomainBodyGyroscopeJerkMagnitudeMean
* frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

## Transformations ##
- - -

The following transformations were applied to the source data mentioned in README.md.

1. The training and test sets were merged.
2. The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement.
3. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names.
4. The variable names were replaced with descriptive variable names, using the following set of rules:
  * Special characters (i.e. (, ), and -) were removed
  * The initial f and t were changed into frequencyDomain and timeDomain respectively.
  * Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively.
  * Replaced BodyBody with Body.
5. From the data set the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the run_analysis.R.