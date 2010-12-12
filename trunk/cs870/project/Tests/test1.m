% test1: testing the implementation of the Chan-Vese model

function test1()

startTime = cputime;

iterations = 100;

image = readGSImage('grouping3.jpg');
imageSize = size(image, 1);

phi0 = cone(floor(imageSize/4), [floor(imageSize/2) floor(imageSize/2)], size(image));

mu = 0.1;

nu = 0;

lambda = 1;

doReinit = false;

evolveCurve(iterations, image, phi0, mu, nu, lambda, doReinit);

timeTaken = cputime - startTime;

display(strcat('Time taken = ', num2str(timeTaken), 'seconds'));