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
plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image = rgb2gray(imread('brain.jpg'));

grid = constructGrid(m);

phi0 = ones(size(image, 1), size(image, 2)) * -1;
phi0(40:80, 40:80) = 1;

% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (grid.upperRightCorner(1) - grid.lowerLeftCorner(1)) / m;


figure();
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); contour(phi, [0 0], 'r','LineWidth',1); title('initial contour');
subplot(2,2,3); title('Segmentation');
        
for n=1:iterations
    if(mod(n, plotStep) == 0) 
        imshow(image, 'initialmagnification','fit','displayrange',[0 255]);
        hold on;
        contour(phi, [0 0], 'r','LineWidth',1);      
        drawnow;
    end
    phi = finiteDifference(phi, image, deltaT, grid, [1 1], 0.1 * 255 ^2, 0);
    t = t + deltaT;
 
end

%display final contour
subplot(2,2,4); contour(phi, [0 0], 'r', 'LineWidth', 1); title('Global Region-Based Segmentation');
display(phi);


% Release the hold on the plot
hold off;