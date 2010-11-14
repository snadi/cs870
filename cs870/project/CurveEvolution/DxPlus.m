% DxPlus: calculate the forward differencing value along the x-axis
%
% Output parameters:
%   dxp = the forward differencing term (DxPlus) as a 2D matrix.
%
% Input parameters:
%   phi_i_j = the original function phi as a 2D matrix.
%   grid = the grid used for approximation

function dxp = DxPlus(phi_i_j, grid)

% To be able to use the matrix form to calculate DxPlus we need to get a
% matrix that is equivalent to phi_i_Plus_1_j. This is basically shifting
% all rows in phi_i_j up by 1.
phi_i_plus_1_j = circshift(phi_i_j, [-1 0]);
phi_i_plus_1_j(end, :) = 2 * phi_i_j(end, :) - phi_i_j(end - 1, :);

dxp = (phi_i_plus_1_j - phi_i_j) ./ grid.step(1);