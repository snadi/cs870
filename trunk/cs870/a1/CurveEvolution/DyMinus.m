% DyMinus: calculate the backward differencing value along the y-axis
%
% Output parameters:
%   dym = the backward differencing term (DyMinus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.
%   grid = the grid used for approximation

function dym = DyMinus(phi_i_j, grid)

% To be able to use the matrix form to calculate DyMinus we need to get a
% matrix that is equivalent to phi_i_j_minus_1. This is basically shifting
% all columns in phi_i_j to the left by 1.
phi_i_j_minus_1 = circshift(phi_i_j, [0 -1]);
phi_i_j_minus_1(:, end) = 2 * phi_i_j(:, end) - phi_i_j(:, end - 1);

dym = (phi_i_j - phi_i_j_minus_1) ./ grid.step(2);