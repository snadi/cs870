% stop: checks whether phi is stationary or not
%
% Output parameters:
%   indicator = stop or not ?
%
% Input parameters:
%   image = the original image
%   old = old phi
%   new = new phi

function indicator = stop(image, old, new)

% Basically, what we're trying to do here is to detect if the new phi
% introduces new points inside the curve or not.
error = size(image(old >= 0), 1) - size(image(new >=0), 1);

indicator = vif(error == 0, 1, 0);