% shapeRectangle: create a level set function phi whose zero level gives
% a rectangle.
% 
% Output parameters:
%   initialPhi = mxm matrix that holds the initial values for phi.
% 
% Input parameters:
%   grid = the grid that will be used for approximation.
%   lowerLeftCorner = [x y] for the lower left corner of the rectangle.
%   upperRightCorner = [x y] for the upper right corner of the rectangle.

function initialPhi = shapeRectangle(grid, lowerLeftCorner, upperRightCorner)

% A rectangle can be thought of as the intersection of 4 planes.
% Plane 1 = is the plane along the x-axis and right until the upper right corner
% of the rectangle.
%
% Plane 2 = is the plane starting from the lower left corner of the
% rectangle and to the right along the x-axis.
%
% Plane 3 = is the plane along the y-axis and up until the upper right corner of
% the rectangle.
%
% Plane 4 = is the plane starting from the lower left corner of the
% rectangle and up along the y-axis.
plane1 = grid.axes{1} - upperRightCorner(1);
plane2 = lowerLeftCorner(1) - grid.axes{1};
plane3 = grid.axes{2} - upperRightCorner(2);
plane4 = lowerLeftCorner(2) - grid.axes{2};

initialPhi = shapeIntersection(plane1, plane2, plane3, plane4);
