function [SLL] = Main(filename, k, numofexec, n)

img = imread(filename);
X = reshape(img, size(img,1)*size(img,2), 3);
X = double(X);
[M, C] = IterKmeans(X, numofexec, k);
P = Probmap(X, M, img, k);
SLL = GetPixel(img, C, P,  n, k);

end
