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

function resultingPhi = finiteDifference(phi, image, deltaT, mu, nu)

%c1: average inside curve
%c2: average outside curve

c1 = mean(image(phi>0));
c2 = mean(image(phi<0));

%we used |gradient(phi)| instead of the delta dirac function. This was an
%option stated in the paper
a = norm(gradient(phi));

%difference of intensities outside - difference of intensities inside
%lamda1 & lamda2 are always set to be equal to one so we ignore them in our
%solution


b = double((image - c2).^2) - double( (image - c1).^2);
%b = (image - c2).^2 - (image - c1).^2;


%convert difference to double
b = double(b);


%calculating the curvature term in the PDE
curvature = kappa(phi);

%calculation phi_t according to the PDE in the paper.
phi_t =  a*(mu*curvature - nu + b);

%calculating the new phi after deltaT
resultingPhi = phi + phi_t*deltaT;


