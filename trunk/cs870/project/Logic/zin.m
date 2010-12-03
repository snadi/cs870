% zin: compute value of the logic variable for the inside of the curve
% 
% Output parameters:
%   output = the logic value for the inside of the curve
% 
% Input parameters:
%   image = the original image
%   phi = current phi

function output = zin(image, phi)

cin = mean(image(phi > 0));

numerator = (image - cin).^2;

denomenator = max(max(image))^2;

output = double(numerator) / double(denomenator);