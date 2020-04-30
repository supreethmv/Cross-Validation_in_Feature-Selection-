function [error] = subset_error(index,Y,X,k,Subsets)

error=0;

for i = 1:k
    
    trainSet = find(index ~= i);
    
    
    
    %%%%%%%%%%%%%%%%%% Least Squares Classifier %%%%%%%%%%%%%%
    DesignMatrix = X(trainSet, Subsets);
    
    y_label = Y(trainSet);
    
    w = (DesignMatrix'*DesignMatrix)\DesignMatrix'*y_label;
    
    
    
    
    testSet = find(index == i);
    %%%%%%%%%%%%%%% Classification Error %%%%%%%%%
    for j = 1:length(testSet)
        ith = testSet(j);
        error = error + 1/2 * abs(Y(ith)- sign(dot(w,X(ith, Subsets))));
    end
    
    
    
end

error = error / length(Y);
end

