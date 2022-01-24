function [FObj1,FObj2, FBack] = FilterandCompute(img,h)
%UNTITLED2 Summary of this function goes here
% details
imgf = imfilter(img, h);
figure();
imshow(imgf);
imgf2 = rgb2gray(imgf);
LL = imsegkmeans(imgf,3);
figure();
imshow(LL,[]);
% Object1
FObj1 = zeros(size(imgf2));
    for i=1:size(imgf2,1)
        for j=1:size(imgf2,2)
            if LL(i,j)==3
                FObj1(i,j)=1;        
            end
        end
    end
figure();
FOb1 = imshow(FObj1);

% Object2
FObj2 = zeros(size(imgf2));
    for i=1:size(imgf2,1)
        for j=1:size(imgf2,2)
            if LL(i,j)==2
                FObj2(i,j)=1;        
            end
        end
    end
figure();
FOb2 = imshow(FObj2);

% Object3
FBack = zeros(size(imgf2));
    for i=1:size(imgf2,1)
        for j=1:size(imgf2,2)
            if LL(i,j)==1
                FBack(i,j)=1;        
            end
        end
    end
figure();
Fbackg =  imshow(FBack);
end
