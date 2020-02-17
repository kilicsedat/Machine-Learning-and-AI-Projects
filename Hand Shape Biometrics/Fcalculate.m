function [F] = Fcalculate(filenam)
    
    RGB = imread(filenam);
    Gray = rgb2gray(RGB);
   
    imshow(Gray);
    hold on
    
    F = zeros(size(14));
    for i=1:8
        [cx, cy, c] = Intensity(Gray);
        F(i) = PsPe(cx, cy, c);
    end
    
    for i=9:12
        [cx, cy, c] = Intensity(Gray);
        F(i) = PsPe2(cx, cy, c);
    end
    
    for i=13:14
        [cx, cy, c] = Intensity(Gray);
        F(i) = PsPe(cx, cy, c);
    end
    
    
end