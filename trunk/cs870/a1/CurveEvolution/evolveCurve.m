% evolveCurve: evlove the given shape
%
% Input parameters:
%   shape = the shape to be evolved. It can be any value of ('circle',
%   'dumbbell').
%   speed = constant speed
%   t0 = initial time
%   tMax = final time
%   m = matrix size
function [phi grid phi0] = evolveCurve(shape, lowerLeftCorner, rightUpperCorner, speed, tMax, m)

%---------------------------------------------------------------------------
% Initialize evolution parameters
plotStep = 0.05;             % plot at t = 0, 0.05, 0.1, 0.15, 0.2, and 0.25
t0 = 0;                      % Start at time t = 0

%---------------------------------------------------------------------------
% Determine which curve to evolve
if(strcmpi(shape, 'circle'))
    grid = constructGrid(m);
    phi0 = shapeCone(0.15, [0.5 0.5], grid);
elseif(strcmpi(shape, 'dumbbell'))
    grid = constructGrid(m);
    circle1 = shapeCone(0.15, [0.25 0.5], grid);
    circle2 = shapeCone(0.15, [0.75 0.5], grid);
    rectangle = shapeRectangle(grid);
    phi0 = shapeUnion(circle1, shapeUnion(circle2, rectangle));
else
    error('??? Error. Unknown shape.');
end

phi = phi0;


%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (rightUpperCorner(1) - lowerLeftCorner(1)) / m;

while(t <= tMax)
    contour(grid.axes{1}, grid.axes{2}, phi, [0 0], 'b');
    hold on;
    phi = finiteDifference(phi, speed, deltaT);
    t = t + deltaT;
end