function K = kappagrad(I)  

I = double(I);
g = gradient(I); g = g ./ norm(g);

K = divergence(g, g);
