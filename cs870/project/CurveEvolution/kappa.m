% kappa: calculate the curvature of phi
%
% Output parameters:
%   curvature = the curvature of the given phi
%
% Input parameters:
%   phi = current value of phi

function curvature = kappa(phi)

temp = gradient(phi)./(norm(gradient(phi)));
curvature = divergence(temp, temp);