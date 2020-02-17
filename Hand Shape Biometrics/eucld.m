function [distance] = eucld(x, y)
    summ = 0;
    for i=1:size(x,2)
       summ = summ + (y(i) - x(i)).^2;
    end
    distance = sqrt(summ);
end