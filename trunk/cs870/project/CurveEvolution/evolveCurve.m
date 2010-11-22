% evolveCurve: evlove the given shape
%
% Input parameters:
%   shape = the shape to be evolved. It can be any value of ('circle',
%   'dumbbell').
%   speed = constant speed
%   t0 = initial time
%   tMax = final time
%   m = matrix size
function [phi grid phi0] = evolveCurve(iterations)

%---------------------------------------------------------------------------
% Initialize evolution parameters
plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image = rgb2gray(imread('data/donut.jpg'));


grid = constructGrid(size(image,1));
phi0 =  cone(20, [50 50], 300);

figure();
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); contour(flipud(phi0), [0 0], 'r','LineWidth',1); title('initial contour');

image = double(image);

% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = 0.0001;% (grid.upperRightCorner(1) - grid.lowerLeftCorner(1)) / grid.gridSize;



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
    phi_new = finiteDifference(phi, image, deltaT, 0.1, 0);  
    
    phi = phi_new;
    t = t + deltaT;    
end

%display final contour
seg = phi>0;
subplot(2,2,4); imshow(seg); title('Final Segmentation');


% Release the hold on the plot
hold off;
