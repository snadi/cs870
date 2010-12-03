% test2: testing the implementation of the Sandberg-Chan model

function test2()

iterations = 100;

image = imread('flowers.jpg');
imageSize = size(image, 1);

[r g b] = readRGBImage('flowers.jpg');

%image1 = readGSImage('image1.jpg');
%image2 = readGSImage('image2.jpg');
%image3 = readGSImage('image3.jpg');

phi0 = cone(imageSize/4, [imageSize/2 imageSize/2], size(image));

mu = 0.01;

lambda = 255*255;

logicop = 'union';

doReinit = false;

evolveChannels(iterations, phi0, mu, lambda, logicop, image, doReinit, r, g, b);