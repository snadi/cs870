% reinit: reinitialize phi
%
% Output parameters:
%   signedPhi = reinitialized SDF phi
%
% Input parameters:
%   phi = current value of phi to be reinitialized

function signedPhi = reinit(phi)

% dx
dx = 1 / size(phi, 1);

% Per our class notes.
signedPhi = phi ./ sqrt(phi.^2 + dx^2);