#Really just a usage file for a single script

run_analysis.R downloads the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip unzips, builds a combined directory to build a "dataset" of combined data and produces the final file which is a somewhat awkward mean of means and stddevs for each unique subject||activity pair.

The building of the combined dataset actually doesn't take place "in memory" in R. I decided to preserve the original format of the test and train datasets and simply combine each file (x_test+x_train) into a combined file and save to the created combined directory. From that point, combining in R can be accomplished through a simple cbind statement, as the observation order appears preserved throughout the data.

The Colnames are populated for the data in x_train and x_test from the vector in features, mean and stddir are selected once the names are set using agrep... which seems to work well.

colMeans works following a spit statement to build the final dataset fairly simply. So there's just the 1 script. It's only 160 lines... why split it into multiple parts?