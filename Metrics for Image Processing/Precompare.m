function [Obj1,Obj2,Back,gr1,gr2,gr3,img] = Precompare()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
img = imread('image.jpg');
img2 = rgb2gray(img);
gr1 = imread("GrTr1.jpg");
gr1 = rgb2gray(gr1);
gr1 = imbinarize(gr1);
gr2 = imread("GrTr2.jpg");
gr2 = rgb2gray(gr2);
gr2 = imbinarize(gr2);
gr3 = imread("GrTr3.jpg");
gr3 = rgb2gray(gr3);
gr3 = imbinarize(gr3);

L = imsegkmeans(img,3);
figure();
imshow(L,[]);
% Object1
Obj1 = zeros(size(img2));
    for i=1:size(img2,1)
        for j=1:size(img2,2)
            if L(i,j)==3
                Obj1(i,j)=1;        
            end
        end
    end
figure();
Ob1 = imshow(Obj1);

% Object2
Obj2 = zeros(size(img2));
    for i=1:size(img2,1)
        for j=1:size(img2,2)
            if L(i,j)==2
                Obj2(i,j)=1;        
            end
        end
    end
figure();
Ob2 = imshow(Obj2);

% Object3
Back = zeros(size(img2));
    for i=1:size(img2,1)
        for j=1:size(img2,2)
            if L(i,j)==1
                Back(i,j)=1;        
            end
        end
    end
figure();
backg =  imshow(Back);

end