function [C] = RecomputeCenters(X, L, k)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    for i=1:k
        l = L==i;
        C(i,:) = sum(X(l,:),1)/sum(l);       
    end
end