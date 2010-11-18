% evolveCurve: evlove the given shape
%
% Input parameters:
%   shape = the shape to be evolved. It can be any value of ('circle',
%   'dumbbell').
%   speed = constant speed
%   t0 = initial time
%   tMax = final time
%   m = matrix size
function [phi grid phi0] = evolveCurve(iterations, k)

%---------------------------------------------------------------------------
% Initialize evolution parameters
plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image = rgb2gray(imread('brain2.jpg'));

grid = constructGrid(size(image,1));
phi0 = zeros(size(image, 1), size(image, 2));
phi0(10:15, 10:15) = 1;

figure();
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); contour(flipud(phi0), [0 0], 'r','LineWidth',1); title('initial contour');

%phi0 = bwdist(phi0)-bwdist(1-phi0)+im2double(phi0)-.5; %produces slightly
%diff results but not sure of intuition behind it


% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (grid.upperRightCorner(1) - grid.lowerLeftCorner(1)) / grid.gridSize;



subplot(2,2,3); title('Segmentation');
        
for n=1:iterations
    if(mod(n, plotStep) == 0) 
        subplot(2,2,3);
        imshow(image, 'initialmagnification','fit','displayrange',[0 255]);
        hold on;
        contour(phi, [0 0], 'r','LineWidth',1);      title(strcat('iteration: ',num2str(n)));
        drawnow;
        seg = phi>0;
        subplot(2,2,4); imshow(seg);              
    end
    phi= finiteDifference(phi, image, deltaT, grid, [1 1], 0.1, 0, k);   
    
    t = t + deltaT;    
end

%display final contour
seg = phi>0;
subplot(2,2,4); imshow(seg); title('Global Region-Based Segmentation');


% Release the hold on the plot
hold off;
