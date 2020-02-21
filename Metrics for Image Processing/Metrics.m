function returnedMetrics = Metrics(Obj,gr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
TP= 0;
FP= 0;
TN= 0;
FN= 0;


for i=1:556
        for j=1:720
            if Obj(i,j)==1 && Obj(i,j)==gr(i,j)
                TP = TP + 1;
            end
            
            if Obj(i,j)==0 && Obj(i,j)==gr(i,j)
                TN = TN + 1;
            end
            
            if Obj(i,j)==1 && Obj(i,j)~= gr(i,j)
                FP = FP + 1;
            end
            
            if Obj(i,j)==0 && Obj(i,j)~= gr(i,j)
                FN = FN + 1;
            end
        end
    
end

Accuracy = (TP + TN)/(TP+ TN + FP + FN);
Precision = TP /(TP + FP);
Recall = TP /(TP + FN);
F1_Score = 2 * (Precision* Recall) /(Precision + Recall);
returnedMetrics = [TP TN FP FN Accuracy Precision Recall F1_Score];