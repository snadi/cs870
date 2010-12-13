% test2: testing the implementation of the Sandberg-Chan model
function test2()

startTime = cputime;

iterations = 100;

image = readGSImage('donut.jpg', false);
imageSize = size(image, 1);

image1 = readGSImage('donut1.jpg', false);
image2 = readGSImage('donut2.jpg', false);

phi0 = cone(imageSize/4, [imageSize/2 imageSize/2], size(image));

mu = 0.01;

lambda = 255*255;

logicop = 'intersection';

doReinit = false;

complement = 0;

evolveChannels(iterations, phi0, mu, lambda, logicop, image, doReinit, complement, image1, image2);

timeTaken = cputime - startTime;

display(strcat('Time taken = ', num2str(timeTaken), 'seconds'));
