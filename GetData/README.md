
## README.md


1. Load the data. Paths in script are preset for the case when zip file was unzipped into working directory

2. Files to be read: X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt

3. Merge data from files: *_text.txt and *_train.txt are combined be columns, resulting data sets are combined into one by rows.

4. Renaming procedures. Name for each column is taken from features.txt and two additional names are also added.

5. Change activity ID number with descriptive names.

6. With grep function get indices of columns which contains patterns "mean" and "std".

7. Subset data based on obtained indices.

8. With melt function from reshape2 package put all columns except "subject" and "Activity" into one column.

9. Apply ddply function from plyr package to get mean for each feature per subject and activity.

10. ??????

11. PROFIT! :)