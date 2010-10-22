% DyMinus: calculate the backward differencing value along the y-axis
%
% Output parameters:
%   dym = the backward differencing term (DyMinus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.

function dym = DyMinus(phi_i_j)

% To be able to use the matrix form to calculate DyMinus we need to get a
% matrix that is equivalent to phi_i_j_minus_1. This is basically shifting
% all columns in phi_i_j by 1 downwards. Then, we set the first row in
% the resulting matrix to Zero since this is our boundary condition.
phi_i_j_minus_1 = circshift(phi_i_j, [1 0]);
phi_i_j_minus_1(1, :) = 0;

dym = (phi_i_j - phi_i_j_minus_1) ./ (1 / size(phi_i_j, 2));