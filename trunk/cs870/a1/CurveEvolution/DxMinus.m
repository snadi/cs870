% DxMinus: calculate the backward differencing value along the x-axis
%
% Output parameters:
%   dxm = the backward differencing term (DxMinus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.

% function dxm = DxMinus(phi, i, j)
% 
% % delta x
% dx = 1 / size(phi, 1);
% 
% % Boundary condition
% if(i == 1)
%     phi_i_j = 0;
%     phi_i_minus_1_j = 0;
% elseif(i == size(phi, 1))
%     phi_i_j = 0;
% else
%     phi_i_j = phi(i, j);
%     phi_i_minus_1_j = phi(i - 1, j);
% end
% 
% dxm = (phi_i_j - phi_i_minus_1_j) / dx;

function dxm = DxMinus(phi_i_j)

% To be able to use the matrix form to calculate DxMinus we need to get a
% matrix that is equivalent to phi_i_minus_1_j. This is basically shifting
% all columns in phi_i_j by 1 to the right. Then, we set the first column in
% the resulting matrix to Zero since this is our boundary condition.
phi_i_minus_1_j = circshift(phi_i_j, [0 1]);
phi_i_minus_1_j(:, 1) = 0;

dxm = (phi_i_j - phi_i_minus_1_j) ./ (1 / size(phi_i_j, 1));