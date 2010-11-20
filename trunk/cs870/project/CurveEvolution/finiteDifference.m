% finiteDifference: calculate the value of phi_n_plus_1 based on the finite
% difference method.
%
% Output parameters:
%   resultingPhi = phi_n_plus_1
%
% Input parameters:
%   phi = phi_n
%   image = the original image
%   deltaT = time step
%   grid = the grid used for approximation
%   lambda = weights for inside and outside energy
%   mu = weight for length of the curve
%   nu = weight for area of the curve

function resultingPhi = finiteDifference(phi, image, deltaT, grid, lambda, mu, nu, k)
display(phi);
display(image);
%gradPhi = mygrad(phi);
c1 = mean(image(phi>=0));
c2 = mean(image(phi<0));


%display(phi);
a = norm(gradient(phi));%mydirac(phi);

%pause;
%a = 1;
b = (image - c2).^2 - (image - c1).^2;

b = double(b);

ic = kappa(phi);


% switch lower(k)
%     case 'none'
%         ic = 0;
%     case 'kappa'
%         ic = kappa(phi);
%     case 'mykappa'
%         ic = mykappa(phi);
%     case 'kappagrad'
%         ic = kappagrad(phi);
%     case 'curvature'
%         ic = curvature(phi, 1, 1); % very bad ! has holes in the middle!
% end


phi_t =  a*(mu*ic + b);
resultingPhi = phi + phi_t*deltaT;

