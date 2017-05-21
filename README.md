# Getting and Cleaning Data - Assignment #

## Introduction to case study ##
 - - -
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Content of the repository ##
 - - -
This GitHub repository contains the following files:

*   README.md, that gives an overview of the data set and how it was created.
*   tidy_data.txt, which is the data set.
*   CodeBook.md, that gives an overview of the data set and describes data, variables and transformations used to generate the data.
*   run_analysis.R, the R script that was used to create the data set.

## Data set of raw data ##
   - - -
A complete description of the raw data set is part of the study [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), where it is described how the data were collected:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Creation of the data set ##
   - - -
The R script   run_analysis.R   creates the tidy data set. In particular it retrieves the source data set and transforms it to produce the final data set. It implements the following steps, which are further described inside   CodeBook.md  :

1. Download and unzip source data. The data set itself can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It comes as a zipped folder.
2. Read the data.
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Software version ##
 - - -
The   tidy_data.txt   in this repo was created by running   run_analysis.R   script using R version 3.3.1 (2016-06-21) on Mac OS X El Capitan version 10.11.16.
This script requires the dplyr package (version 0.5.0 was used).