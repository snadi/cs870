% stop: checks whether phi is stationary or not
%
% Output parameters:
%   indicator = stop or not ?
%
% Input parameters:
%   image = the original image
%   old = old phi
%   new = new phi

function indicator = stop(old, new)

% Basically, what we're trying to do here is to detect if the new phi
% introduces new points inside the curve or not.
indicator = isequal(old > 0, new > 0);