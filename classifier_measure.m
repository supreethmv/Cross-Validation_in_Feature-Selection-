function [error] = classifier_measure(X,y_label,Subsets)
error = 0;
DesignMatrix = X(:, Subsets);   

w = (DesignMatrix'*DesignMatrix)\DesignMatrix'*y_label;

for i = 1:length(y_label)
    error = error + 1/2 * abs(y_label(i)-sign(dot(w,X(i, Subsets))));
end
error = error / length(y_label);
end

