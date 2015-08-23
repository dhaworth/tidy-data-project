# tidy-data-project
Repository for the course project of Getting and Cleaning Data on Coursera

All scripts for the tidying of the _UCI - Human Activity Recognition Using Smartphones Dataset_ are contained within the run_analysis.R script file. It is assumed that all files from the zipped dataset have been extracted into the workspace with the directory structure maintained.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The following steps are performed on the data to produce the tidy data set:

1. Activity labels and feature names are loaded from files (activity_labels.txt, features.txt).
2. Training data, activities and subjects are loaded from files (train/X_train.txt, train/Y_train.txt, train/subject_train.txt). Previously loaded feature names are applied as column names during data load.
3. Training subject, activity and data columns are combined.
4. Test data, activities and subjects are loaded from files (test/X_test.txt, test/Y_test.txt, test/subject_test.txt). Previously loaded feature names are applied as column names during data load.
5. Test subject, activity and data columns are combined.
6. Training and test data sets are combined into a single data set.
7. Full data set is reduced to only include mean and standard deviation measurements. Mean frequency and angle mean measurements are not included, only the mean of the individual signals.
8. Activity ids are replaced by the corresponding activity label.
9. The mean is calculated for each grouping combination of subject and activity, forming the final wide tidy data set.

Please see the CodeBook.md for a further explanation of the work performed and the resulting data set
