function [r] = calculateR(c, seg)
    i = 1;
    r = 0;
    while seg(c(1)+1, c(2)) == 1
        r = r+1;
        i = i +1;
        
    end
end