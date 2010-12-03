% readGSImage: read any image as a grayscale double image
%
% Output parameters:
%   image = the image as a grayscale double matrix
%
% Input parameters:
%   fileName = the file name of the image, it's assumed all images are in
%   the data folder

function image = readGSImage(fileName)

image = rgb2gray(imread(strcat('data/', fileName)));
image = double(image);