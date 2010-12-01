% evolveCurve: evlove the given shape
%
% Input parameters:
%   iterations = number of iterations
function [phi phi0] = evolveCurve(iterations)

%---------------------------------------------------------------------------
% Initialize evolution parameters
plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image = rgb2gray(imread('data/brain.jpg'));

imageSize = size(image,1);

phi0 =  cone(20, [50 50], imageSize);

figure();
subplot(2,2,1); imshow(image); title('Input Image');
subplot(2,2,2); contour(flipud(phi0), [0 0], 'r','LineWidth',1); title('initial contour');

image = double(image);

% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (1/(imageSize))^2;
display(deltaT);

% Just a dummy value to initalize the error
%oldError = 5;

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
    
    %newError = calculateError(phi, phi_new);
    
    %phi is from the previous iteration. phi_new is after finite
    %differencing
    if(checkstop(image, phi, phi_new))
        display(strcat('stopped at iteration : ', num2str(n)));
        break;
    end
    
    %oldError = newError;
    
    phi = phi_new;
    t = t + deltaT;    
end

%display final contour
seg = phi>0;
subplot(2,2,4);  imshow(seg);  title(strcat('Final Segmentation at iteration:' ,num2str(n)));


% Release the hold on the plot
hold off;
