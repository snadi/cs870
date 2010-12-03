% zout: compute value of the logic variable for the outside of the curve
% 
% Output parameters:
%   output = the logic value for the outside of the curve
% 
% Input parameters:
%   image = the original image
%   phi = current phi

function output = zout(image, phi)

cout = mean(image(phi < 0));

numerator = (image - cout).^2;

denomenator = max(max(image))^2;

output = double(numerator) / double(denomenator);