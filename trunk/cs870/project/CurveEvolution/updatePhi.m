% updatePhi: update phi for the Chan-Vese model
%
% Output parameters:
%   resultingPhi = updated phi
%
% Input parameters:
%   phi = the current value of phi
%   image = the original image
%   deltaT = time step
%   mu = weight for the length of the curve
%   nu = weight for the area of the curve
%   lambda = weight for the inside and outside energies

function resultingPhi = updatePhi(phi, image, deltaT, mu, nu, lambda)

% cin: average inside curve
% cout: average outside curve
cin = mean(image(phi>0));
cout = mean(image(phi<0));

% |gradient(phi)| is used instead of the dirac delta function. This was an
% option stated in the paper.
normOfGradient = norm(gradient(phi));

% Difference of intensities outside - inside
force =  lambda(2)*(image - cout).^2 - lambda(1)*(image - cin).^2;

% Calculate the curvature term in the PDE
curvature = mu * kappa(phi);

% Calculate phi_t according to the PDE in the paper
phi_t =  normOfGradient * (curvature - nu + force);

% Update phi
resultingPhi = phi + deltaT * phi_t;