% readGSImage: read any image as a grayscale double image
%
% Output parameters:
%   image = the image as a grayscale double matrix
%
% Input parameters:
%   fileName = the file name of the image, it's assumed all images are in
%   the data folder
%   addNoise = flag to add noise or not

function image = readGSImage(fileName, addNoise)

if(addNoise)
    image = imread(strcat('data/', fileName));
    image = imnoise(image,'gaussian');
    image = rgb2gray(image);   
else      
    image = rgb2gray(imread(strcat('data/', fileName)));   
end

 image = double(image);  