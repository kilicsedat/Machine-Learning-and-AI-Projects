function [P] = Probmap(X, M, img, k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
P = zeros(length(X), k, 'double');
    for i=1:length(X)
        for j=1:k
            P(i,j)= sum(M(i,:)==j) / length(M(1,:));
        end 
    end
    P = reshape(P, [size(img,1), size(img,2), k]);

    for m=1:k
        figure, imshow(P(:,:,m));
    end
end
