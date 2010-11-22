function K = mykappa(I)
% get curvature information of input image
% input: 2D image I
% output: curvature matrix KG

% Copyright (c) 2009, 
% Yue Wu @ ECE Department, Tufts University
% All Rights Reserved  

I = double(I);
[m,n] = size(I);
P = padarray(I,[1,1],1,'pre');
P = padarray(P,[1,1],1,'post');

% central difference
fy = P(3:end, 2:n+1) - P(1:m, 2:n+1);
fx = P(2:m+1, 3:end) - P(2:m+1, 1:n);
fyy = P(3:end, 2:n+1) + P(1:m, 2:n+1) - 2*I;
fxx = P(2:m+1, 3:end) + P(2:m+1, 1:n) - 2*I;
fxy = 0.25.*(P(3:end, 3:end) - P(1:m,3:end) + P(3:end,1:n) - P(1:m,1:n));

% http://mathworld.wolfram.com/Curvature.html, equation 17
K = (fxx.*fy.^2 - 2*fxy.*fx.*fy + fyy.*fx.^2)./((fx.^2 + fy.^2 + eps).^(1.5));


% the double max here is just to get the all-max element, since max(matrix)
% will return a vector with the max element in each row. I think this is
% done for normalization ?
K = K./max(max(abs(K)));
