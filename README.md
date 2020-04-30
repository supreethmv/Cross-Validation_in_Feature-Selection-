# Cross-Validation_in_Feature-Selection

We are given a dataset from some biological experiment - the features represent some physiological parameters of some person and the label is 1 if the person is ill and −1 otherwise. The biologists claim that using least squares together with feature selection they can solve the problem with around 85% accuracy and only a small number of features.


Your task is to check if the biologists have done a good job in the data analysis. Check their claim by implementing an exhaustive search for the best feature subset. As a classiﬁer use least squares, that is the weight vector is given as
w = (XTX)−1XTY
where X is the design matrix and Y the label vector. 

Classiﬁcation of a new test instance x is done via f(x) = sign(hw,xi). As error measure use the classiﬁcation error
L(Yi,f(Xi)) = (0.5)*|Yi −sign(hw,Xii)|

1. There are in total 15 features in the training data. Use 5-fold cross-validation (use the ordering of the data as it is provided) for the linear least squares classiﬁer in order to determine the best feature subset among all possible 215 −1 = 32767 possible feature subsets by minimizing the 5-fold cross validation error on the training data (Xtrain,Ytrain). 


