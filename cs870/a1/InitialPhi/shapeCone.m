% shapeCone: create a level set function phi for a cone. Therefore, when we 
% visualize the zero level of phi it will give us a circle.
% 
% Output parameters:
%   initialPhi = the (m+2)x(m+2) matrix that holds the initial values for phi.
% 
% Input parameters:
%   radius = the radius of the circle (i.e. the zero level set of phi).
%   center = [x y] vector for the center of the circle.
%   m = the number of cells in the grid.

function initialPhi = shapeCone(radius, center, m)

% h = grid size (i.e. size of one cell in the grid)
h = 1 / (m + 1);

% Given an mxm grid we should get (m+1)x(m+1) matrix for phi. Since Matlab is 
% 1-based, we'll create an (m+2)x(m+2) matrix for phi.
initialPhi = zeros(m, m);

% Since we're allowed to analytically initialize phi, we can use the equation 
% given in class to fill out the matrix.
% General formula => phi = sqrt((x - centerX)^2 + (y - centerY)^2) - radius
%
% Note: (i-1) and (j-1) are used instead of (i) and (j) respectively. This
% is to count for the fact that Matlab is 1-based. So instead of having the
% domain from (1) to (m+2), we want it to be (0) to (m+1) (given that omega
% is defined as (0,1)x(0,1) ).
for i = 1 : m
    for j = 1 : m
        initialPhi(i, j) = sqrt( ((i * h) - center(1))^2 + ((j * h) - center(2))^2 ) - radius;
    end
end
