% test1: testing the implementation of the Chan-Vese model

function test1()

startTime = cputime;

iterations = 100;

image = readGSImage('flowers.jpg');
imageSize = size(image, 1);

phi0 = cone(imageSize/4, [imageSize/2 imageSize/2], size(image));

mu = 0.01;

nu = 0;

lambda = 1;

doReinit = false;

evolveCurve(iterations, image, phi0, mu, nu, lambda, doReinit);

timeTaken = cputime - startTime;

display(strcat('Time taken = ', num2str(timeTaken), 'seconds'));