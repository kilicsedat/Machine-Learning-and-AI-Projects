function [EuclDistance_Matrix] = Main()
    
    filename = ["hand1.jpg", "hand2.jpg", "hand3.jpg", "hand4.jpg", "hand5.jpg"];
    
    X = zeros(5,14);
    
    for i=1:5
        X(i,:) = Fcalculate(filename(i));
        
    end
    
    EuclDistance_Matrix = zeros(5, 5);
    for k=1:5
        for m=1:5
            if k ~= m
                EuclDistance_Matrix(k,m) = eucld(X(k), X(m));
            end
        end
    end
end