% reinit: reinitialize phi
%
% Output parameters:
%   signedPhi = reinitialized SDF phi
%
% Input parameters:
%   phi = current value of phi to be reinitialized

function signedPhi = reinit(phi)

% Per our class notes.
signedPhi = phi ./ sqrt(phi.^2 + 1);