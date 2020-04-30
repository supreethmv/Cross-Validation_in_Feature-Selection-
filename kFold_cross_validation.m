function [err,feature_set] = kFold_cross_validation(X,Y,k,num_final_subset_eval)

[total_samples,total_features] = size(X);

% The following matlab code generates together with the function
% allsets.m a cell array of all possible subsets of 15 variables.

Subsets = cell(1,2^total_features-1);
%counter=1;
BinCodes = allsets(total_features);
numbers=1:total_features;
for i=2:size(BinCodes,1)
    Subsets{i-1}=numbers(BinCodes(i,:)==1);
end


indexes = crossvalind('Kfold',total_samples,k);




%errors of subsets
for i = 1:size(Subsets, 2)
    errors(i) = subset_error(indexes, Y, X, k, Subsets{i});
end

[err, features_id] = sort(errors);
err = err(1:num_final_subset_eval);
feature_set = Subsets(features_id(1:num_final_subset_eval));

end

