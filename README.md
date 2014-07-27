The run_analysis.R script reads the files from the text documents and names the training and testing data as features.
The std and mean are filtered into another dataset and the training and testing datasets are combined for both.
The activities are filtered, parsed, and matched to correspond with each feature.
The identities of the participants, from the subject_test/train files, are read.
Everything is combined into a huge data frame, but unorganized.

Then, for the second dataset, I average all the feature means corresponding for each subject for each activity,
and put it back into a neat data frame so that each activity can be seen compared with every patient. 