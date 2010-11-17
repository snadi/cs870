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

%gradPhi = mygrad(phi);
c1 = mean(image(phi>=0));
c2 = mean(image(phi<0));

display(phi);
a = mydirac(phi);
a(size(a,1) + 1,size(a,1) + 1) = 0;
display(a);
pause;
b = (image - c2).^2 - (image - c1).^2;
b = double(b);

%phi_t = mu*divergence(gradPhi,abs(gradPhi)) + b;
%phi_t =gradPhi*(mu*kappa(phi)./max(max(abs(kappa(phi)))) + b);
%phi_t = mu*kappa(phi)./max(max(abs(kappa(phi))))+b; % copied
phi_t =  a*(mu*kappa(phi) + b);
resultingPhi = phi + phi_t*deltaT;

