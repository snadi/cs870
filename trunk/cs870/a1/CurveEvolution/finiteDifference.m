% finiteDifference: calculate the value of phi_n_plus_1 based on the finite
% difference method.
%
% Output parameters:
%   resultingPhi = phi_n_plus_1
%
% Input parameters:
%   phi = phi_n
%   speed = constant speed
%   deltaT = time step

function resultingPhi = finiteDifference(phi, speed, deltaT)

%resultingPhi = zeros(size(phi, 1), size(phi, 2));

% Initialize the g-terms to zero. This way we avoid doing that in the
% if-statement inside the nested loop every time we check the sign of the
% speed. In addition, if the speed is zero, both terms will be zero which
% should yield the desired effect: phi_n_plus_1 = phi_n.


% Calculate gplus only if speed > 0, gminus only if speed < 0. Both are
% zero otherwise.
if(speed > 0)
    gplus = (max(DxMinus(phi), 0).^2 + min(DxPlus(phi), 0).^2 + ...
            max(DyMinus(phi), 0).^2 + min(DyPlus(phi), 0).^2)^0.5;
    gminus = 0;    
elseif(speed < 0)
    gplus = 0;
    gminus = (max(DxPlus(phi), 0).^2 + min(DxMinus(phi), 0).^2 + ...
             max(DyPlus(phi), 0).^2 + min(DyMinus(phi), 0).^2)^0.5;
else
    gplus = 0;
    gminus = 0;
end

resultingPhi = phi - deltaT * (max(speed, 0) * gplus + min(speed, 0) * gminus);

% Loop over all elements of the matrix of phi
% for i = 1 : size(phi, 1)
%     for j = 1 : size(phi, 2)
%         % A shortcut to avoid calculating both gplus and gminus
%         if(speed > 0)
%             gplus = (max(DxMinus(phi, i, j), 0)^2 + min(DxPlus(phi, i, j), 0)^2 + ...
%                     max(DyMinus(phi, i, j), 0)^2 + min(DyPlus(phi, i, j), 0)^2) ^ 0.5;
%         elseif(speed < 0)
%             gminus = (max(DxPlus(phi, i, j), 0)^2 + min(DxMinus(phi, i, j), 0)^2 + ...
%                     max(DyPlus(phi, i, j), 0)^2 + min(DyMinus(phi, i, j), 0)^2) ^ 0.5;
%         end
%         resultingPhi(i, j) = phi(i, j) - deltaT * (max(speed, 0) * gplus + min(speed, 0) * gminus);
%     end
% end