function [theta,rho] = c2pol(seg1, seg2)   
    iris = seg2-seg1;
    [row,col] = find(iris>0);
    [x,y] = meshgrid(1:size(col), 1:size(row));
    c = [(col+1)/2,(row+1)/2];
    [theta,rho] = cart2pol(x-c,y-c);
end
