% evolveCurve: evlove the given shape
%
% Input parameters:
%   shape = the shape to be evolved. It can be any value of ('circle',
%   'dumbbell').
%   speed = constant speed
%   t0 = initial time
%   tMax = final time
%   m = matrix size
function [phi grid phi0] = evolveCurve(iterations, m)

%---------------------------------------------------------------------------
% Initialize evolution parameters
plotStep = 10;               
t0 = 0;                      % Start at time t = 0

image = rgb2gray(imread('flowers.jpg'));
grid = constructGrid(m);

%phi0 = shapeCone(0.15, [0.5 0.5], grid);
phi0 = ones(size(image, 1), size(image, 2)) * -1;
phi0(40:80, 40:80) = 1;
%phi0 = bwdist(mask) - bwdist(1 - mask) + im2double(mask) - 0.5; 

% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (grid.upperRightCorner(1) - grid.lowerLeftCorner(1)) / m;

imshow(image, 'initialmagnification','fit','displayrange',[0 255]);
hold on;
        
for n=1:iterations
    if(mod(n, plotStep) == 0)
        display(n);
        contour(phi, [0 0], 'r','LineWidth',4);
        hold on;
        % Draw on the same plot
        drawnow;
    end
    phi = finiteDifference(phi, image, deltaT, grid, [1 1], 0.1 * 255 ^2, 0);
    t = t + deltaT;
end

hold off;

imshow(image, 'initialmagnification','fit','displayrange',[0 255]);
hold on;
contour(phi, [0 0], 'r','LineWidth',4);

% Release the hold on the plot
hold off;