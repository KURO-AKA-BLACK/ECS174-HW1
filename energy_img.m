function energyImg = energy_img(im)
    gray_img = rgb2gray(im);
    My = fspecial('sobel');
    Mx = -fspecial('sobel')';
    energyImg = abs(imfilter(double(gray_img),My))+ abs(imfilter(double(gray_img),Mx));
end