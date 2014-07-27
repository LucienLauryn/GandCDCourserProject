features = read.table("UCI HAR Dataset/features.txt")
Xtest = read.table("UCI HAR Dataset/test/X_test.txt")
Ytest = read.table("UCI HAR Dataset/test/Y_test.txt")
features = read.table("UCI HAR Dataset/features.txt")
Xtrain = read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain = read.table("UCI HAR Dataset/train/Y_train.txt")
activity = read.table("UCI HAR Dataset/activity_labels.txt")

names(Xtest) = features$V2
names(Xtrain) = features$V2

meanval = grep("mean\\(\\)",features$V2, invert = TRUE)
stdval = grep("std\\(\\)",features$V2, invert = TRUE)

Xteststd = Xtest[,(-1*stdval)]
Xtrainstd = Xtrain[,(-1*stdval)]

Xtestmean = Xtest[,(-1*meanval)]
Xtrainmean = Xtrain[,(-1*meanval)]

Xcombmean = rbind(Xtrainmean,Xtestmean)
Xcombstd = rbind(Xtrainstd,Xteststd)

Ytestlab = Ytest
Ytrainlab = Ytrain

Ytrainlab[Ytrainlab == 1] = as.character(activity$V2[1])
Ytrainlab[Ytrainlab == 2] = as.character(activity$V2[2])
Ytrainlab[Ytrainlab == 3] = as.character(activity$V2[3])
Ytrainlab[Ytrainlab == 4] = as.character(activity$V2[4])
Ytrainlab[Ytrainlab == 5] = as.character(activity$V2[5])
Ytrainlab[Ytrainlab == 6] = as.character(activity$V2[6])

Ytestlab[Ytestlab == 1] = as.character(activity$V2[1])
Ytestlab[Ytestlab == 2] = as.character(activity$V2[2])
Ytestlab[Ytestlab == 3] = as.character(activity$V2[3])
Ytestlab[Ytestlab == 4] = as.character(activity$V2[4])
Ytestlab[Ytestlab == 5] = as.character(activity$V2[5])
Ytestlab[Ytestlab == 6] = as.character(activity$V2[6])

Ycomblab = rbind(Ytrainlab,Ytestlab)


XYcombmean = cbind(Ycomblab,Xcombmean)
colnames(XYcombmean)[grepl("V1", colnames(XYcombmean))] <- "Activity"

XYcombstd = cbind(Ycomblab,Xcombstd)
colnames(XYcombstd)[grepl("V1", colnames(XYcombstd))] <- "Activity"


subtrain = read.table("UCI HAR Dataset/train/subject_train.txt")
subtest = read.table("UCI HAR Dataset/test/subject_test.txt")
subcomb = rbind(subtrain,subtest)

alldatmean = cbind(subcomb,XYcombmean) 
colnames(alldatmean)[grepl("V1", colnames(alldatmean))] <- "Identifier"

alldatstd = cbind(subcomb,XYcombstd) 
colnames(alldatstd)[grepl("V1", colnames(alldatstd))] <- "Identifier"


all <- data.frame()
meandat  <- alldatmean[order(alldatmean$Identifier),]
a = split(meandat, list(meandat$Identifier,meandat$Activity))
s = names(meandat[3:35])

for(i in 1:180) {
z  = as.data.frame(a[i])
m = apply(z[,3:length(z)],2,mean)
b = t(m)
c = as.data.frame(b)
names(c) <- s
all<- rbind(all,c)
}


Identifier = 1:max(meandat$Identifier)

ident = data.frame()
for(i in 1:6) {
ident = rbind(ident,cbind(Identifier))
}

labe = data.frame()
Activity = 1:6
for(k in Activity)
for(i in 1:30) {
labe = rbind(labe,cbind(Activity[k]))
}

sortlab = sort(activity$V2)
labe[labe == 1] = sort(as.character(sortlab[1]))
labe[labe == 2] = sort(as.character(sortlab[2]))
labe[labe == 3] = sort(as.character(sortlab[3]))
labe[labe == 4] = sort(as.character(sortlab[4]))
labe[labe == 5] = sort(as.character(sortlab[5]))
labe[labe == 6] = sort(as.character(sortlab[6]))

names(labe) = c("Activity")
final = cbind(ident,labe)
final = cbind(final, all)
final










