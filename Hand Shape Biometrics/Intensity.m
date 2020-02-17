function [cx, cy, c] = Intensity(Gray)

    [x,y] = ginput(2); 
    plot(x,y)
    
    [cx, cy, c] = improfile(Gray, x, y);

end