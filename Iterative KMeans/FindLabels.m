function [L] = FindLabels(X, C, k)

D = zeros(length(X), k, 'double');
    for i =1:k
        A = (X - C(i,:));
        A = A.^2 ;
        A = sum(A,2);
        D(:,i) = sqrt(A);     
    end
[~, L] = min(D, [], 2);
end
