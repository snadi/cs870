% finiteDifference: calculate the value of phi_n_plus_1 based on the finite
% difference method.
%
% Output parameters:
%   resultingPhi = phi_n_plus_1
%
% Input parameters:
%   phi = phi_n
%   image = the original image
%   deltaT = time step
%   grid = the grid used for approximation
%   lambda = weights for inside and outside energy
%   mu = weight for length of the curve
%   nu = weight for area of the curve

function resultingPhi = finiteDifference(phi, image, deltaT, grid, lambda, mu, nu)

gradPhi = gradient(phi);
c1 = mean(image(phi>=0));
c2 = mean(image(phi<0));


%a = mydirac(phi);
%a(131,131) = 0;
b = (image - c2).^2 - (image - c1).^2;
b = double(b);

phi_t = b;

resultingPhi = phi + phi_t*deltaT;

