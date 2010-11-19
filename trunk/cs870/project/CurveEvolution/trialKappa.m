function curvature = trialKappa(phi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

phi_x = diff(phi,1,1);

display(phi_x);
phi_y = diff(phi,1,2);

phi_xx = diff(phi_x,1,1);

phi_yy = diff(phi_y,1,2);

phi_xy = diff(phi_x,1,2);


phi_x = padarray(phi_x, [1 0], 0, 'post');

display(phi_x);
phi_y = padarray(phi_y, [0 1], 0, 'post');
phi_xx = padarray(phi_xx, [2 0], 0, 'post');
phi_yy = padarray(phi_yy, [0 2], 0, 'post');
phi_xy = padarray(phi_xy, [1 1], 0, 'post');

norm_phi_cubed = abs(phi_x.*phi_x.*phi_x + phi_y.*phi_y.*phi_y);

norm_phi_cubed(norm_phi_cubed == 0) = 1;

%curvature equation given in class but ignoring all derivitives wrt z
curvature = (phi_x.^2*phi_yy - 2*phi_x*phi_y*phi_xy + phi_y.^2*phi_xx)./norm_phi_cubed;


end

