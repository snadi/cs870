% shapeRectangle: create a level set function phi whose zero level gives
% a rectangle.
% 
% Output parameters:
%   initialPhi = the (m+2)x(m+2) matrix that holds the initial values for phi.
% 
% Input parameters:
%   m = the number of cells in the grid.

function initialPhi = shapeRectangle(m)

% Given an mxm grid we should get (m+1)x(m+1) matrix for phi. Since Matlab is 
% 1-based, we'll create an (m+2)x(m+2) matrix for phi.
initialPhi = ones(m, m);


%
% Note: (i-1) and (j-1) are used instead of (i) and (j) respectively. This
% is to count for the fact that Matlab is 1-based. So instead of having the
% domain from (1) to (m+2), we want it to be (0) to (m+1) (given that omega
% is defines as (0,1)x(0,1).
for i = 1 : m
    for j = 1 : m
        initialPhi(i, j) = ;
    end
end
