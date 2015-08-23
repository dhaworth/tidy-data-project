# tidy-data-project
Repository for the course project of Getting and Cleaning Data on Coursera

This repository is for the course project of Getting and Cleaning Data course of the Johns Hopkins University Data Science specialization offered through Coursera. The object of the project is to produce a tidy data set from the _UCI - Human Activity Recognition Using Smartphones Dataset_ linked below. The final data set includes the mean of all mean and standard deviation variables for every combination of study participant (subject) and activity. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

All scripts for the tidying of the original data set are contained within the run_analysis.R script file. It is assumed that all files from the zipped dataset have been extracted into the workspace with the directory structure maintained.

The inertial signals data from the original data set is not included due to lack of variable definition and bearing on final project output.<sup>1</sup>

The following steps are performed on the data to produce the tidy data set:

1. Activity labels and feature names are loaded from files (activity_labels.txt, features.txt).
2. Training data, activities and subjects are loaded from files (train/X_train.txt, train/Y_train.txt, train/subject_train.txt). Previously loaded feature names are applied as column names during data load.
3. Training subject, activity and data columns are combined.
4. Test data, activities and subjects are loaded from files (test/X_test.txt, test/Y_test.txt, test/subject_test.txt). Previously loaded feature names are applied as column names during data load.
5. Test subject, activity and data columns are combined.
6. Training and test data sets are combined into a single data set.
7. Full data set is reduced to only include mean and standard deviation measurements. Mean frequency and angle mean measurements are not included as they are from derived or combined sources, only the mean of the individual signals is included.
8. Activity ids are replaced by the corresponding activity label.
9. The mean is calculated for each grouping combination of subject and activity, forming the final wide tidy data set.

Please see the CodeBook.md or CodeBook.pdf for a further explanation of the work performed and the resulting data set

<sup>1</sup> - David Hood - "Do we need the inertial folder" section: https://class.coursera.org/getdata-031/forum/thread?thread_id=28
