% evolveCurve: evlove the curve to get the segmentation
%
% Input parameters:
%   iterations = number of iterations
%   image = a grayscale double image
%   phi0 = the intial contour
%   mu = weight for the length of the curve
%   nu = weight for the area of the curve
%   lambda = weight for the inside and outside energies
%   doReinit = reinitializing phi is optional

function evolveCurve(iterations, image, phi0, mu, nu, lambda, doReinit)

%---------------------------------------------------------------------------
% Initializing some parameters

% Get the image size
imageSize = size(image,1);

% Plot the input image
figure();
subplot(2, 2, 1);
imshow(image, 'initialmagnification','fit','displayrange',[0 255]);
title('Input Image');

% Plot the initial contour
subplot(2, 2, 2);
contour(flipud(phi0) ,[0 0], 'r', 'LineWidth', 1);
title('Initial Contour');

% Initialize phi with phi0
phi = phi0;

% deltaT should satisfy the stability condition: deltaT <= 1/h^2
deltaT = (1 / (imageSize))^2;    
    
%---------------------------------------------------------------------------
% Evolve the curve now!
for n=1:iterations
    % Draw the original image
    subplot(2, 2, 3);
    imshow(image ,'initialmagnification', 'fit', 'displayrange', [0 255]);
    title('Segmentation');
    hold on;

    % Plot the contour on the image
    contour(phi, [0 0], 'r','LineWidth', 1);
    title(strcat('Iteration: ', num2str(n)));
    drawnow;
    
    % Plot the segmentation
    seg = phi >= 0;
    subplot(2, 2, 4);
    imshow(seg);
    title(strcat('Segmentation at iteration: ', num2str(n)));
    
    % Update phi
    phi_new = updatePhi(phi, image, deltaT, mu, nu, lambda);
    
    % Reinitialization is optional
    if(doReinit)
        phi_new = reinit(phi_new);
    end
    
    % Is the solution stationary ?
    if(stop(image, phi, phi_new))
        display(strcat('Stopped at iteration: ', num2str(n)));
        break;
    end
    
    % The new phi will be used as phi for the next iteration
    phi = phi_new;
end

% Display the final segmentation
seg = phi >= 0;
subplot(2, 2, 4);
imshow(seg);
title(strcat('Final segmentation at iteration: ', num2str(n)));

% Release the hold on the plot
hold off;