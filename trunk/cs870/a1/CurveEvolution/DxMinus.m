% DxMinus: calculate the backward differencing value
%
% Output parameters:
%   resultingPhi = phi_n_plus_1
%
% Input parameters:
%   phi = phi_n
%   speed = constant speed
%   deltaT = time step

function dxm = DxMinus(phi, i, j)

% delta x
dx = 1 / size(phi, 1);

% Boundary condition
if(i == 1)
    phi_i_j = 0;
    phi_i_minus_1_j = 0;
elseif(i == size(phi, 1))
    phi_i_j = 0;
else
    phi_i_j = phi(i, j);
    phi_i_minus_1_j = phi(i - 1, j);
end

dxm = (phi_i_j - phi_i_minus_1_j) / dx;
