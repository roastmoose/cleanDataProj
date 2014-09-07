#Code book for Getting and cleaning Data

## The Data

The data are collected from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Conveniently a description of the dataset is included in the README.txt. However, for completeness sake a short summary:

The data is made up of output and summarizing statistics from cell phone based accelerometers worn by subjects during an experiment period over which the subjects engaged in a number of activities. Various filters have been utilized to arrive at the values contained in the x_train.txt and x_test.txt files, and are described in full at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data are split into test and training datasets in the folders /test/ and /train/ metadata are available in the files in the main directory

## Procedure

1) The data are downloaded directly and unzipped, and a "combined" directory is created within the unzipped data directory to house a combined dataset consisting of all available observations. (I combine across like data files, ie x_train is combined with x_test. In this way the original dataset storage format is preserved while combining the two datasets. Pulling it all together in R is accomplished via liberal use of rbind and cbind)

2) names in the features dataset are used to clarify the variable observations contained in the combined 

2) Mean and std deviation observations are selected from the data in x (the assignment appeared ambiguous, but including more data is simply less filtering... so six of one... comment out a few lines the other) and the means across each subject and activity type are collected and presented as the final result "final.txt"