function evolveChannels(iterations)

plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image2 = rgb2gray(imread('data/donuttopright.jpg'));
image1 = rgb2gray(imread('data/donutbottomleft.jpg'));
objective = rgb2gray(imread('data/donut.jpg'));

display('in evolve channels');


grid = constructGrid(size(image1,1));
phi0 =  cone(50, [80 80], 300);

figure();
subplot(2,3,1); imshow(image1); title('Input Image 1');
subplot(2,3,2); imshow(image2); title('Input Image 2');
subplot(2,3,3); contour(flipud(phi0), [0 0], 'r','LineWidth',1); title('initial contour');

image1 = double(image1);
image2 = double(image2);

% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = 0.05;% (grid.upperRightCorner(1) - grid.lowerLeftCorner(1)) / grid.gridSize;

        display('starting iterations');
for n=1:iterations
    if(mod(n, plotStep) == 0) 
        subplot(2,3,4);
        imshow(objective, 'initialmagnification','fit','displayrange',[0 255]);     
        hold on;
        contour(phi, [0 0], 'r','LineWidth',1);      title(strcat('iteration: ',num2str(n)));
        drawnow;
        seg = phi>=0;
        subplot(2,3,5); imshow(seg); title('Segmentation');             
    end
    lambda = 100;
    phi_new = finitediffchannels(image1,image2,phi,deltaT, 0.01, lambda, 'union');
    phi_new = reinit(phi_new);
    
    phi = phi_new;
    t = t + deltaT;      
end

%display final contour
seg = phi>0;
subplot(2,3,5); imshow(seg); title('Final Segmentation');


% Release the hold on the plot
hold off;

end

