% DyPlus: calculate the forward differencing value along the y-axis
%
% Output parameters:
%   dyp = the forward differencing term (DyPlus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.

function dyp = DyPlus(phi_i_j)

% To be able to use the matrix form to calculate DyPlus we need to get a
% matrix that is equivalent to phi_i_j_plus_1. This is basically shifting
% all rows in phi_i_j by 1 upwards. Then, we set the last row in
% the resulting matrix to Zero since this is our boundary condition.
phi_i_j_plus_1 = circshift(phi_i_j, [-1 0]);
phi_i_j_plus_1(end, :) = 0;

dyp = (phi_i_j_plus_1 - phi_i_j) ./ (1 / size(phi_i_j, 2));