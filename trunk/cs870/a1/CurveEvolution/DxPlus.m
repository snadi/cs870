% DxPlus: calculate the forward differencing value along the x-axis
%
% Output parameters:
%   dxp = the forward differencing term (DxPlus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.

function dxp = DxPlus(phi_i_j)

% To be able to use the matrix form to calculate DxPlus we need to get a
% matrix that is equivalent to phi_i_Plus_1_j. This is basically shifting
% all columns in phi_i_j by 1 to the left. Then, we set the last column in
% the resulting matrix to Zero since this is our boundary condition.
phi_i_plus_1_j = circshift(phi_i_j, [0 -1]);
phi_i_plus_1_j(:, end) = 0;

dxp = (phi_i_plus_1_j - phi_i_j) ./ (1 / size(phi_i_j, 1));