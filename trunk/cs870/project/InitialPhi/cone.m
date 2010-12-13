% cone: create a level set function phi for a cone. Therefore, when we 
% visualize the zero level of phi it will give us a circle.
% 
% Output parameters:
%   phi = the level set function for a cirlce given in matrix form
% 
% Input parameters:
%   radius = the radius of the circle (i.e. the zero level set of phi).
%   center = [x y] vector for the center of the circle.
%   imagedDims = a vector of the dimensions of the image.

function phi = cone(radius, center, imageDims)

% Since we're allowed to analytically initialize phi, we can use the equation 
% given in class to fill out the matrix.
% General formula => phi = sqrt((x - centerX)^2 + (y - centerY)^2) - radius
xy = cell(2, 1);
xy{1} = 1 : 1 : imageDims(1);
xy{2} = 1 : 1 : imageDims(2);

axes = cell(2, 1);
[ axes{:} ] = ndgrid(xy{:});

% The equation is flipped because phi should be positive inside, and negative
% outside.
phi = radius - sqrt( (axes{1} - center(1)).^2 + (axes{2} - center(2)).^2 );
% phi = sqrt( (axes{1} - center(1)).^2 + (axes{2} - center(2)).^2 ) - radius;