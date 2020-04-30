clear all;
close all
clc

load('DataFeatSel1.mat');
kfold = 5;
num_of_perms = 1000;
Selected_X = Xtrain(:,1:6);

rand('state',1);
num_final_subset_eval=10;
% For performance reasons restrict yourself now to the best feature
% subset selection among the first 6 features (discard features 7 to
% 15)
[KfoldTrainError, ~] = kFold_cross_validation(Selected_X,Ytrain,kfold,num_final_subset_eval);

bestErr = KfoldTrainError(1);


% Permutations of the labels and compute with the obtained distribution of
% values of the test statistic the p-value
p_value = 0;
% vector of computed test statistics
T=zeros(num_of_perms,1);
for perm = 1:num_of_perms
    
    Ypermute = Ytrain(randperm(length(Ytrain)));
    [ith_error, ~] = kFold_cross_validation(Selected_X,Ypermute,kfold,10);
    T(perm) = ith_error(1);
    if (T(perm) < bestErr)
        p_value = p_value + 1;
    end
    
    
end

%normalize to get p-value
p_value = p_value / num_of_perms

%Generate a histogram of the test statistic
hist(T, 20)