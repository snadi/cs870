% readRGBImage: read any image as 3 components (R, G, B)
%
% Output parameters:
%   [r g b] = the r, g, and b components of the image
%
% Input parameters:
%   fileName = the file name of the image, it's assumed all images are in
%   the data folder

function [r g b] = readRGBImage(fileName)

[image] = imread(strcat('data/', fileName));
image = double(image);

% Separate the components
r = image(:, :, 1);
g = image(:, :, 2);
b = image(:, :, 3);