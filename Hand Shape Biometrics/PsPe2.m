function [f] = PsPe2(cx, cy, c)
    Ps = 0;
    

    
    for i=1:5:size(c)
        
        if i + 4 > size(c)
            x = c(i:end);
        else
            x = c(i:i+4);
        end
        
        maxval = max(x);
        maxind = argmax(x);
        
        minval = min(x);
        minind = argmin(x);
        
        if minind > maxind && (maxval -minval) > Ps
            Ps = maxind + (i-1);
            ps_x = cx(i);
            ps_y = cy(i);
        end
 
    end
    Pe = c(end);
    pe_x = cx(end);
    pe_y = cy(end);
    plot(ps_x, ps_y, 'r*')
    plot(pe_x, pe_y, 'r*')
    f = eucld([cx(Ps), cy(Ps)], [cx(Pe), cy(Pe)]);
end