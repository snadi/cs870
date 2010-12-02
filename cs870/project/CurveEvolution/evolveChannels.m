% evolveChannels: evlove the curve along multiple channels
%
% Input parameters:
%   iterations = number of iterations
%   phi0 = the intial contour
%   mu = weight for the length of the curve
%   lambda = weight for the inside and outside energies
%   logicop = the logical operator to be applied
%   image = the original image
%   doReinit = reinitializing phi is optional
%   varargin = multiple input channels, each channel is a 2D matrix

function evolveChannels(iterations, phi0, mu, lambda, logicop, ...
                        image, doReinit, varargin)

%---------------------------------------------------------------------------
% Initializing some parameters

% Get the image size, any channel should work since they have the same size
imageSize = size(varargin{1}, 1);

% Set some parameters to be used to organize the subplots
subPlotColumns = size(varargin, 2) + 1;
subPlotRows = 2;

% Plot the input channels
figure();
for n=1:size(varargin, 2)
    subplot(subPlotRows, subPlotColumns, n);
    imshow(varargin{n});
    title(strcat('Input Channel ', num2str(n)));
end

% Plot the initial contour
subplot(subPlotRows, subPlotColumns, subPlotColumns);
contour(flipud(phi0), [0 0], 'r', 'LineWidth', 1);
title('Initial Contour');

% Initialize phi with phi0
phi = phi0;

% deltaT should satisfy the stability condition: deltaT <= 1/h^2
deltaT = (1 / (imageSize))^2;

%---------------------------------------------------------------------------
% Evolve the curve now!       
for n=1:iterations
    % Draw the original image
    subplot(subPlotRows, subPlotColumns, subPlotColumns + 1);
    imshow(image, 'initialmagnification', 'fit', 'displayrange', [0 255]);
    title('Segmentation');
    hold on;

    % Plot the contour on the image
    contour(phi, [0 0], 'r', 'LineWidth', 1);
    title(strcat('Iteration: ', num2str(n)));
    drawnow;
    
    % Plot the segmentation
    seg = phi >= 0;
    subplot(subPlotRows, subPlotColumns, subPlotColumns + 2);
    imshow(seg);
    title(strcat('Segmentation at iteration: ', num2str(n)));
    
    % Update phi
    phi_new = updatePhiChannels(phi, deltaT, mu, lambda, logicop, varargin{:});
    
    % Reinitialization is optional
    phi_new = vif(doReinit, reinit(phi_new), phi_new);
    
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
subplot(subPlotRows, subPlotColumns, subPlotColumns + 2);
imshow(seg);
title(strcat('Final segmentation at iteration: ', num2str(n)));

% Release the hold on the plot
hold off;