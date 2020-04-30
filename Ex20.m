clear all;
close all
clc

kfold = 5;
load('DataFeatSel1.mat');

total_permutation = 2^size(Xtrain,2)-1;
steps = round(total_permutation/100)
for num_final_subset_eval = steps:steps:total_permutation
    disp(num_final_subset_eval)
    
    
    % 1. There are in total 15 features in the training data. Use 5-fold
    % cross-validation (use the ordering of the data as it is provided) for
    % the linear least squares classifier in order to determine the best
    % feature subset among all possible 215 − 1 = 32767 possible feature
    % subsets by minimizing the 5-fold cross validation error on the
    % training data (Xtrain,Ytrain).
    % # of folds = 5
    
    
    [KfoldTrainError, Features] = kFold_cross_validation(Xtrain,Ytrain,kfold,num_final_subset_eval);
    
    % Performance Evaluation on test set using num_final_subset_eval
    TestError=zeros(num_final_subset_eval,1);
    parfor id = 1:num_final_subset_eval
        TestError(id)= classifier_measure(Xtest, Ytest, Features{id});
    end
    
    [TestError, idx]=sort(TestError);
    
    if KfoldTrainError(1)<0.176
        break;
    end
    
    
end
% we have found a min score lets keep this
Performance = struct;
for ii=1:5
    Performance(ii).Features=Features(idx(ii));
    Performance(ii).KfoldTrainError=KfoldTrainError(idx(ii));
    Performance(ii).TestError = TestError(ii);
end
Performance = struct2table(Performance)
open Performance
keyboard