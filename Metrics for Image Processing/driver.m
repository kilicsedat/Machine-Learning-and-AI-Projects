function auc = driver()

    [object1, object2, background, gt1, gt2, gt3, img] = Precompare();
    
    objects = {object1, object2, background};
    groundTruths = {gt1, gt2, gt3};
    baseMetrics = zeros(length(objects), 8); % 8 is the number of metrics we want to store for the base image
    returnedMetrics = zeros(8);
 
    for n=1 : length(objects)
        returnedMetrics = Metrics(cell2mat(objects(n)),cell2mat(groundTruths(n)));
        for k=1 : length(returnedMetrics)
            baseMetrics(n,k) = returnedMetrics(k);
        end    
    end
    
    filteredObjects = zeros(556,720, 3, 7);
    for i=7 :2:19
        h = fspecial('gaussian', [i i], 1.6);
        [FObj1, FObj2, FBack] = FilterandCompute(img,h);
        filteredObjects(:,:,1,i) = FObj1;
        filteredObjects(:,:,2,i) = FObj2;
        filteredObjects(:,:,3,i) = FBack;
    end
    
    auc =0;
    object1sum = zeros(556, 720);
    grSum = 0;
    for j=1 : 2 
        for i=1 : 7
            object1sum = object1sum + filteredObjects(:,:,j,i);
        end  
        
        gr = reshape(cell2mat(groundTruths(j)), 556 * 720, 1);
        grSum = grSum + gr;
    end
    
    object1sum = reshape(object1sum, 556 * 720, 1);
    auc = ROCPlot(gr, object1sum);
end

