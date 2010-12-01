function evolveChannels(iterations)

plotStep = 1;               
t0 = 0;                      % Start at time t = 0

image1 = rgb2gray(imread('data/donuttopright.jpg'));
image2 = rgb2gray(imread('data/donutbottomleft.jpg'));
image3 = rgb2gray(imread('data/donutbottomright.jpg'));

objective = rgb2gray(imread('data/donut.jpg'));

display('in evolve channels');
imageSize = size(image1,1); % either image should work since they are the same size


phi0 =   cone(80, [100 100], imageSize);

figure();
numOfSubplots = 3;
subplot(2,numOfSubplots,1); imshow(image1); title('Input Image 1');
subplot(2,numOfSubplots,2); imshow(image2); title('Input Image 2');
subplot(2,numOfSubplots,3); contour(flipud(phi0), [0 0], 'r','LineWidth',1); title('initial contour');

image1 = double(image1);
image2 = double(image2);
image3 = double(image3);


% Initialize phi with phi0
phi = phi0;

%---------------------------------------------------------------------------
% Evolve the curve
t = t0;
deltaT = (1/(imageSize))^2;

        display('starting iterations');
for n=1:iterations
    if(mod(n, plotStep) == 0) 
        subplot(2,numOfSubplots,4);
        imshow(objective, 'initialmagnification','fit','displayrange',[0 255]);     
        hold on;
        contour(phi, [0 0], 'r','LineWidth',1);      title(strcat('iteration: ',num2str(n)));
        drawnow;
        seg = phi>=0;
        subplot(2,numOfSubplots,5); imshow(seg); title('Segmentation');            
    end
    lambda = 255*255;
    phi_new = finitediffchannels(phi,deltaT, 0.1, lambda,  'intersection',image1,image2, image3);
    %phi_new = reinit(phi_new);
    
    if(checkstop(image1, phi, phi_new))
        display(strcat('stopped at iteration : ', num2str(n)));
        break;
    end
    
    phi = phi_new;
    t = t + deltaT;      
end

%display final contour
seg = phi>0;
subplot(2,numOfSubplots,5); imshow(seg); title(strcat('Final Segmentation at iteration:' ,num2str(n)));


% Release the hold on the plot
hold off;

end
