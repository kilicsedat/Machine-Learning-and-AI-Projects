function AUC = ROCPlot(gr, scores)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[X,Y,T,AUC] = perfcurve(gr,scores,1);
figure();
plot(X,Y);
xlabel('False positive rate'); 
ylabel('True positive rate');
title('ROC for Image Segmentation by KMeans');
end