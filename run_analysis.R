download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','HAR_dataset.zip')
unzip('HAR_dataset.zip')

#add combined, the "dataset" location. IE I'm appending all of the files and saving to disk as a 
#combined dataset. Rather than simply cbind everything in R. 
dir.create("UCI HAR Dataset/Combined")

#append files one by one... this is gross... and dull to code.

features <- read.table("UCI HAR Dataset/features.txt",header=F,stringsAsFactors=F)

subjects_test<-read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
subjects_train<-read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
subject <- rbind(subjects_test,subjects_train)

x_test<-read.table("UCI HAR Dataset/test/X_test.txt",header=F)
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",header=F)
x <- rbind(x_test,x_train)

y_test<-read.table("UCI HAR Dataset/test/y_test.txt",header=F)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",header=F)
y <- rbind(y_test,y_train)

body_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=F)
body_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=F)
body_acc_x <- rbind(body_acc_x_test,body_acc_x_train)

body_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=F)
body_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=F)
body_acc_y <- rbind(body_acc_y_test,body_acc_y_train)

body_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=F)
body_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=F)
body_acc_z <- rbind(body_acc_z_test,body_acc_z_train)

body_gyro_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=F)
body_gyro_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=F)
body_gyro_x <- rbind(body_gyro_x_test,body_gyro_x_train)

body_gyro_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=F)
body_gyro_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=F)
body_gyro_y <- rbind(body_gyro_y_test,body_gyro_y_train)

body_gyro_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=F)
body_gyro_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=F)
body_gyro_z <- rbind(body_gyro_z_test,body_gyro_z_train)

total_acc_x_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=F)
total_acc_x_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=F)
total_acc_x <- rbind(total_acc_x_test,total_acc_x_train)

total_acc_y_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=F)
total_acc_y_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header=F)
total_acc_y <- rbind(total_acc_y_test,total_acc_y_train)

total_acc_z_test<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=F)
total_acc_z_train<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=F)
total_acc_z <- rbind(total_acc_z_test,total_acc_z_train)

#write to combined dataset Basically we're mimicing the structure of the other datasets
#inside this "Combined" folder.

write.table(x,"UCI HAR Dataset/Combined/x.txt", row.name=F,col.name=F)
write.table(y,"UCI HAR Dataset/Combined/y.txt", row.name=F,col.name=F)
write.table(subject,file="UCI HAR Dataset/Combined/subject.txt",row.name=F,col.name=F)


dir.create("UCI HAR Dataset/Combined/Inertial Signals")
write.table(body_acc_x,"UCI HAR Dataset/Combined/body_acc_x.txt", row.name=F,col.name=F)
write.table(body_acc_y,"UCI HAR Dataset/Combined/body_acc_y.txt", row.name=F,col.name=F)
write.table(body_acc_z,"UCI HAR Dataset/Combined/body_acc_z.txt", row.name=F,col.name=F)

write.table(body_gyro_x,"UCI HAR Dataset/Combined/body_gyro_x.txt", row.name=F,col.name=F)
write.table(body_gyro_y,"UCI HAR Dataset/Combined/body_gyro_y.txt", row.name=F,col.name=F)
write.table(body_gyro_z,"UCI HAR Dataset/Combined/body_gyro_z.txt", row.name=F,col.name=F)

write.table(total_acc_x,"UCI HAR Dataset/Combined/total_acc_x.txt", row.name=F,col.name=F)
write.table(total_acc_y,"UCI HAR Dataset/Combined/total_acc_y.txt", row.name=F,col.name=F)
write.table(total_acc_z,"UCI HAR Dataset/Combined/total_acc_z.txt", row.name=F,col.name=F)

#I feel the statement behind #2 is ambiguous in some regard: 'Extracts only the measurements 
#on the mean and standard deviation for each measurement.'
#since there are features described as "mean" and "std" in the x portion of the feature set, I
#believe we're intended to extract these columns... so far so good, use the feature file to create 
#names for our x's and extract those columns with a regex'ed which

#first, since #3 is using the activities (these are in Y) I'll cbind that first...
#Should probably cbind the subjects in while we're at it

x_y <- cbind(y,x)
x_y <- cbind(subject,x_y)

#and now we'll give them names

names(x_y) <- c("subjects","activity",features[2][[1]])

#now the gross part...

means<-x_y[,agrep(".mean()",names(x_y))]
std<-x_y[,agrep(".std()",names(x_y))]

filtered <- cbind(x_y$subjects,x_y$activity)
filtered <- cbind(filtered,means)
filtered <- cbind(filtered,std)

#hmm stripped first two names

names(filtered)[1]<-"subjects"
names(filtered)[2]<-"activity"

#ok, so filtered holds a dataset that has names, and means and stds only. And now we need to change the
#coding in filtered$activity to be in string format to fulfil #3

#hardcoding this in a boring ugly way because why not.


for (i in 1:length(filtered$activity)){
  if (filtered$activity[i]==1) filtered$activity[i]<-"WALKING"
  if (filtered$activity[i]==2) filtered$activity[i]<-"WALKING_UPSTAIRS"
  if (filtered$activity[i]==3) filtered$activity[i]<-"WALKING_DOWNSTAIRS"
  if (filtered$activity[i]==4) filtered$activity[i]<-"SITTING"
  if (filtered$activity[i]==5) filtered$activity[i]<-"STANDING"
  if (filtered$activity[i]==6) filtered$activity[i]<-"LAYING"
  
}


#so the activities have pretty string names... woo

#If you check names(filtered at this point you see we have pretty var names already so #4 is done

#so for 5. seems like we take just again the Xs and group by unique combinations of subject||activity
#then take colmeans and append... so a split. Actually, this will be easier if we temporarily add
#a column that is subject||activity

uniqueSubAct <- paste(filtered$subject,filtered$activity,sep="")
filtered <-cbind(uniqueSubAct,filtered)
names(filtered)[1]<-"uniqueSubAct"

splits <- split(filtered,filtered$uniqueSubAct)
means<-colMeans(splits[1][[1]][,sapply(splits[1][[1]], is.numeric)])
final <-c()
for (i in 1:length(splits)){
  means <- colMeans(splits[i][[1]][,sapply(splits[i][[1]], is.numeric)])
  means <- c(names(splits)[i],means)
  final <- rbind(final,means)
}
final<data.frame(final)
names(final)[1]<-"Subject and Activity"
final
write.table(final,"final.txt",row.names=F)

#Note, I've left off the data in the Inertial signals folder. This seems to be unaggregated versions
#of the summary stats in X. As such they could be included, but our aggregation would seem to suggest
#that we'd end up with redundant data. In any case... we could add them in the same way as the other
#data... simple rbind to combine test and train and cbind to the rest



