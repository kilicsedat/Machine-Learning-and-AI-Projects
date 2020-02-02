function [SLL] = GetPixel(img, C, P,  n, k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    figure;
    imshow(img);
    [x,y] = ginput(n);
    v = round([x,y]);
    S = zeros([n, 3]);
    for i=1:size(v,1)
        S(i,:) = img(v(i,1),v(i,1),:);
    end
    S = mean(S);
    A = C-S(1,:);
    A = A.^2;
    A = sum(A,2);
    A =sqrt(A);
    [~,SLL] = min(A, [], 2);
    [~,mappp] = sort(sum(C,2));
    for j=1:k
        if SLL==mappp(j)
            SLL=j;
        end
    end
    figure;
    imshow(P(:,:,SLL))
end