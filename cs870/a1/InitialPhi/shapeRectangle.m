function initialPhi = shapeCuboid(m)
% shapeCone: create a level set function phi for a cuboid. Therefore, when we 
% visualize the zero level of phi it will give us a rectangle.
% 
% Output parameters:
%   initialPhi = the (m+2)x(m+2) matrix that holds the initial values for phi.
% 
% Input parameters:
%   radius = the radius of the circle (i.e. the zero level set of phi).
%   center = [x y] vector for the center of the circle.
%   m = the number of cells in the grid.

% h = deltaX
h = 1 / (m + 1);

% Given an mxm grid we should get (m+1)x(m+1) matrix for phi. Since Matlab is 
% 1-based, we'll create an (m+2)x(m+2) matrix for phi.
initialPhi = ones(m+2, m+2);


%
% Note: (i-1) and (j-1) are used instead of (i) and (j) respectively. This
% is to count for the fact that Matlab is 1-based. So instead of having the
% domain from (1) to (m+2), we want it to be (0) to (m+1) (given that omega
% is defines as (0,1)x(0,1).
for i = 1 : m + 2
    for j = 1 : m + 2
        initialPhi(i, j) = ;
    end
end
