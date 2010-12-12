% test2: testing the implementation of the Sandberg-Chan model
function test2()

startTime = cputime;

iterations = 10;

image = imread('flowers.jpg');
% image = readGSImage('image.jpg');
imageSize = size(image, 1);

[r g b] = readRGBImage('flowers.jpg');

% image1 = readGSImage('image1.jpg');
% image2 = readGSImage('image2.jpg');
% image3 = readGSImage('image3.jpg');

phi0 = cone(imageSize/4, [imageSize/2 imageSize/2], size(image));

mu = 0.01;

lambda = 255*255;

logicop = 'union';

doReinit = false;

complement = 0;

% evolveChannels(iterations, phi0, mu, lambda, logicop, image, doReinit, complement, image1, image2, image3);
evolveChannels(iterations, phi0, mu, lambda, logicop, image, doReinit, complement, r, g, b);

timeTaken = cputime - startTime;

display(strcat('Time taken = ', num2str(timeTaken), 'seconds'));
