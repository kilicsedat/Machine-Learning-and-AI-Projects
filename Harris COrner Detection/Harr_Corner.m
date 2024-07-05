function [har] = Harr_Corner(filename)
    %-Harris Corner Detection-Sedat Kilic
    %% part 0 - Read images
    im=imread(filename);    % Read Image
    if (ndims(im) == 4)
      im = rgb2gray(im);
    end
        % Parameters for Harris Corner Detection
    sigma = 1.45;
        %Masks for Derivation
    [dx,dy] = meshgrid(-1:1, -1:1);

    %% part 1- Compute the Derivatives (The M matrix)
    Ix = conv2(im, dx, 'same');
    Iy = conv2(im, dy, 'same');
    Ixy = Ix.*Iy;   
    %% part 2- Smoothing with Gaussian Filter.
    g = fspecial('gaussian', 5, sigma);
    Ix2 = conv2(Ix.*Ix, g,'same');
    Iy2 = conv2(Iy.*Iy, g,'same');
    Ixy = conv2(Ixy, g,'same');
    %% Part 3 - Computing the Harris Matrix
    har = Ix2.*Iy2 - Ixy.^2 - 0.06*((Ix2 + Iy2).^2);
    %% Part 4 - Non-maxima Suppression
    NMaxima = ordfilt2(har, 25, ones(5));
    %% Part 5 - Find the corners
    threshold = 0.1*max(har);
    corners = (har==NMaxima)&(har>threshold);    
    %% Part 6 - Comparing the Matlab Function with My Function
    [r,c] = find(corners);
    c2 = corner(im);
    
    %Showing the Results
    figure()
    subplot(3, 2, 1), imshow(Ix, [])
    title('Derivative in x direction');
    subplot(3, 2, 2), imshow(Iy, [])
    title('Derivative in y direction');
    subplot(3, 2, 3), imshow(Ix2, []);
    title('Square of Ix');
    subplot(3, 2, 4), imshow(Iy2, []);
    title('Square of Iy');
    subplot(3, 2, 5), imshow(Ixy, []);
    title('Ixy');
    subplot(3, 2, 6), imshow(im, []), hold on;
    plot(c,r, 'r*');
    plot(c2(:,1),c2(:,2),'b*');
    title('Corners: My Implementation=RED, Matlab=BLUE');
 
end
