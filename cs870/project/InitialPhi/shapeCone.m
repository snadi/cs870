% shapeCone: create a level set function phi for a cone. Therefore, when we 
% visualize the zero level of phi it will give us a circle.
% 
% Output parameters:
%   phi = the level set function for a cirlce given in matrix form
% 
% Input parameters:
%   radius = the radius of the circle (i.e. the zero level set of phi).
%   center = [x y] vector for the center of the circle.
%   grid = the grid that will be used for approximation.

function phi = shapeCone(radius, center, grid)

% Since we're allowed to analytically initialize phi, we can use the equation 
% given in class to fill out the matrix.
% General formula => phi = sqrt((x - centerX)^2 + (y - centerY)^2) - radius
phi = sqrt( (grid.axes{1} - center(1)).^2 + (grid.axes{2} - center(2)).^2 ) - radius;