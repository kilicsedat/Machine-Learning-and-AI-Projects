function [] = ExtractIris()
    % Demo of "Region Based Active Contours"
    %
    % Example:
    % seg_demo
    %
    % Coded by: Shawn Lankton (www.shawnlankton.com)
    I = imread('iris3.jpg');  %-- load the image
    %m = zeros(size(I,1),size(I,2));          %-- create initial mask
    %m(193:304,231:342) = 1;
    %m(228:269,266:307) = 1;
    %I = imresize(I,.5);  %-- make image smaller 
    %m = imresize(m,.5);  %     for fast computation
    subplot(3,2,1); imshow(I); title('Main Image');
    %c = ginput(1)
    c = [283,241];
    radii =30;
    m = createCirclesMask(I, c, radii);
    %subplot(2,2,2); imshow(m); title('Starting point of the mask');
    subplot(3,2,2); title('Segmentation');
    seg1 = region_seg(I, m, 165); %-- Run segmentation
    subplot(3,2,3); imshow(seg1); title('Pupils Mask' );
    
    subplot(3,2,4); title('Segmentation');
    seg2 = region_seg(I, m, 670); %-- Run segmentation
    subplot(3,2,5); imshow(seg2); title('Iris Mask' );
    c = round(c);
    irisregion = rubberSheetNormalisation( I, c, seg1, seg2);
    subplot(3,2,6); imshow(irisregion); title('Iris Region' );
end