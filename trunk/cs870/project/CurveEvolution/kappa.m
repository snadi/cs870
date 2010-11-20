function curvature = kappa(phi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

phi = double(phi);
temp = gradient(phi)./(norm(gradient(phi)));

curvature = divergence(temp, temp);

end

