% constructGrid(m) : construct a grid of (m+1)x(m+1) cells and populate the
% related values of the grid based on the value of m.
%
% Output parameters:
%   grid = the output grid with all its populated fields
%
% Input parameters:
%   lowerLeftCorner = the lower left corner of the grid, i.e. a vector of
%   values representing where the domain of omega starts. That would be (0,0) 
%   for the purpose of this assignment.
%
%   upperRightCorner = the upper right corner of the grid, i.e. a vector of
%   values representing where the domain of omega ends. That would be (1,1) 
%   for the purpose of this assignment.
%
%   m = the size of the matrix of phi what will be contained in the grid.


function grid = constructGrid(lowerLeftCorner, upperRightCorner, m)

% The grid size is always one more than the size of the matrix (m).
grid.gridSize = m + 1;

% Calculate dx (step in x direction), and dy (step in y direction)
grid.step = (upperRightCorner - lowerLeftCorner) ./ (grid.gridSize - 1);

% Assign the values along both the x-axis and y-axis. We're getting the
% transpose here so that we get a nice one-column vector instead of a one-row 
% vector.
grid.cells = cell(2, 1);
grid.cells{1} = (lowerLeftCorner(1) : grid.step(1) : upperRightCorner(1))';
grid.cells{2} = (lowerLeftCorner(2) : grid.step(2) : upperRightCorner(2))';

% Now generate the x-axis and y-axis. The values in grid.axes will
% determine the values that will be used for the grid lines along both
% axes.
grid.axes = cell(2, 1);
[ grid.axes{:} ] = ndgrid(grid.cells{:});