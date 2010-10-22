% DyPlus: calculate the forward differencing value along the y-axis
%
% Output parameters:
%   dyp = the forward differencing term (DyPlus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.
%   grid = the grid used for approximation

function dyp = DyPlus(phi_i_j, grid)

% To be able to use the matrix form to calculate DyPlus we need to get a
% matrix that is equivalent to phi_i_j_plus_1. This is basically shifting
% all columns in phi_i_j to the right by 1.
phi_i_j_plus_1 = circshift(phi_i_j, [0 1]);
phi_i_j_plus_1(:, 1) = 2 * phi_i_j(:, 1) - phi_i_j(:, 2);

dyp = (phi_i_j_plus_1 - phi_i_j) ./ grid.step(2);